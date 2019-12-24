<?php

namespace WebDevEtc\BlogEtc\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Swis\LaravelFulltext\Search;
use WebDevEtc\BlogEtc\Captcha\UsesCaptcha;
use WebDevEtc\BlogEtc\Models\BlogEtcCategory;
use WebDevEtc\BlogEtc\Models\BlogEtcPost;

/**
 * Class BlogEtcReaderController
 * All of the main public facing methods for viewing blog content (index, single posts)
 * @package WebDevEtc\BlogEtc\Controllers
 */
class BlogEtcReaderController extends Controller
{
    use UsesCaptcha;

    /**
     * Show blog posts
     * If category_slug is set, then only show from that category
     *
     * @param null $category_slug
     * @return mixed
     */
    public function index($category_slug = null)
    {
        // the published_at + is_published are handled by BlogEtcPublishedScope, and don't take effect if the logged in user can manageb log posts
        $title = 'Viewing blog'; // default title...

        if ($category_slug) {
            $category = BlogEtcCategory::where("slug", $category_slug)->firstOrFail();
            $posts = $category->posts()->where("blog_etc_post_categories.blog_etc_category_id", $category->id);

            // at the moment we handle this special case (viewing a category) by hard coding in the following two lines.
            // You can easily override this in the view files.
            \View::share('blogetc_category', $category); // so the view can say "You are viewing $CATEGORYNAME category posts"
            $title = 'Viewing posts in ' . $category->category_name . " category"; // hardcode title here...
        } else {
            $posts = BlogEtcPost::query();
        }

        $posts = $posts->orderBy("posted_at", "desc")
            ->paginate(config("blogetc.per_page", 10));

        return view("blogetc::index", [
            'posts' => $posts,
            'title' => $title,
        ]);
    }


    public function main()
    {
        $posts = BlogEtcPost::orderBy("posted_at", "desc")
                    // ->take(6)
                    ->get();

        $posts_arr = [];
        foreach($posts as $post){
            // $posts_arr[$post->id] = [
            //     "title" => $post->title,
            //     "desc" => $post->short_description,
            //     "img" => $post->image_url($size = 'medium')
            // ];
            $post_categories_arr = [];
            foreach($post->categories as $post_category){
                array_push($post_categories_arr, [
                    "id" => $post_category->id,
                    "title" => $post_category->category_name,
                    "slug" => $post_category->slug,
                ]);
            }

            $post_comments_arr = [];
            foreach($post->comments as $post_comment){
                array_push($post_comments_arr, [
                    "id" => $post_comment->id,
                    "blog_etc_post_id" => $post_comment->blog_etc_post_id,
                    "author_name" => $post_comment->author_name,
                    "comment" => $post_comment->comment,
                    "approved" => $post_comment->approved,
                    "created_at" => date("Y-m-d H:s:i", strtotime($post_comment->created_at)),
                    "author_email" => $post_comment->author_email,
                ]); 
            }

            array_push($posts_arr, [
                "id" => $post->id,
                "title" => $post->title,
                "meta_desc" => $post->meta_desc,
                "seo_title" => $post->seo_title,
                "slug" => $post->slug,
                "post_body" => $post->post_body,
                "posted_at" => date("Y-m-d H:s:i", strtotime($post->posted_at)),
                "short_desc" => $post->short_description,
                "img" => $post->image_url($size = 'medium'),
                "categories" => count($post_categories_arr) > 0 ? $post_categories_arr : [],
                "comments" => count($post_comments_arr) > 0 ? $post_comments_arr : [],  
            ]);
        }

        $categories = BlogEtcCategory::orderBy("category_name", "desc")->get();

        $categories_arr = [];
        foreach($categories as $category){
            array_push($categories_arr, [
                "id" => $category->id,
                "title" => $category->category_name,
                "slug" => $category->slug,
            ]);
        }

        $data = [ 
            'posts' => $posts_arr,
            'categories' => $categories_arr
        ];
                    
        return response()->json($data);
    }

    /**
     * Show the search results for $_GET['s']
     *
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @throws \Exception
     */
    public function search(Request $request)
    {
        if (!config("blogetc.search.search_enabled")) {
            throw new \Exception("Search is disabled");
        }
        $query = $request->get("s");
        $search = new Search();
        $search_results = $search->run($query);

        \View::share("title", "Search results for " . e($query));

        return view("blogetc::search", ['query' => $query, 'search_results' => $search_results]);

    }




    /**
     * View all posts in $category_slug category
     *
     * @param Request $request
     * @param $category_slug
     * @return mixed
     */
    public function view_category($category_slug)
    {
        return $this->index($category_slug);
    }

    /**
     * View a single post and (if enabled) it's comments
     *
     * @param Request $request
     * @param $blogPostSlug
     * @return mixed
     */
    public function viewSinglePost(Request $request, $blogPostSlug)
    {
        // the published_at + is_published are handled by BlogEtcPublishedScope, and don't take effect if the logged in user can manage log posts
        $blog_post = BlogEtcPost::where("slug", $blogPostSlug)
            ->firstOrFail();

        if ($captcha = $this->getCaptchaObject()) {
            $captcha->runCaptchaBeforeShowingPosts($request, $blog_post);
        }

        return view("blogetc::single_post", [
            'post' => $blog_post,
            // the default scope only selects approved comments, ordered by id
            'comments' => $blog_post->comments()
                ->with("user")
                ->get(),
            'captcha' => $captcha,
        ]);
    }






}
