<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Message;
use App\Rules\messageResponse;
use App\Rules\messageType;
use App\Rules\BlogCaptcha;
use App\Service;

use WebDevEtc\BlogEtc\Captcha\CaptchaAbstract;
use WebDevEtc\BlogEtc\Captcha\UsesCaptcha;
use WebDevEtc\BlogEtc\Events\CommentAdded;
use WebDevEtc\BlogEtc\Models\BlogEtcComment;
use WebDevEtc\BlogEtc\Models\BlogEtcPost;
use WebDevEtc\BlogEtc\Requests\AddNewCommentRequest;

class ApiController extends Controller
{
    public function addMessage(){

        $message = new Message(request()->validate([
            'logs.name' => 'required',
            'logs.phone' => 'regex:/^[+]{1}38 \(([0-9]{3})\) [0-9]{3}(-[0-9]{2}){2}$/',
            'logs.email' => 'email',
            'logs.response' => [new messageResponse],
            'logs.type' => ['required', new messageType],
        ])['logs']);

        $message->save();

        return response()->json(["status" => "success"]); 
        // dd(request('logs'));
    }

    public function getServices(){
        $services = Service::orderBy('position', 'asc')->get();

        return response()->json($services);

        // echo 100;
    }

    public function addComment(){

        // dd(request('logs.captcha'));

        $validated = request()->validate([
            'logs.name' => 'required|min:3|max:100',
            'logs.email' => 'required|email|max:100',
            'logs.comment' => 'required|min:10|max:100',
            "logs.blog_etc_post_id" => 'required|numeric',
            'logs.captcha' => ['required', new BlogCaptcha],
        ])['logs'];

        // BlogEtcPost
        $blog_post = BlogEtcPost::findOrFail($validated['blog_etc_post_id']);

        // array_pop($validated);

        // dd($validated);
        
        $comment = new BlogEtcComment();
        $comment->author_name = $validated['name'];
        $comment->author_email = $validated['email'];
        $comment->comment = $validated['comment'];
        $comment->approved = 0;
        $comment->blog_etc_post_id = $validated['blog_etc_post_id'];
        $comment->save();

        // $comment

        // dd(request('captcha'));
    
        // echo 111; 
        // $services = Service::orderBy('position', 'asc')->get();

        return response()->json($comment);

        // echo 100;
    }
}
