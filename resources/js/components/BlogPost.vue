<template>
    <div class="section">
            
            <div v-if="!post" class="row itms">
                <div class="lds-roller"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>
            </div>
            <div v-else>
                <div class="for-tit">
                    <div class="tit">
                        <!-- <a href="#" @click.prevent="$router.push({ path: `/bl` }).catch(err => {})">Полезные материалы</a> -->
                        {{ post.title }}
                    </div>
                    <div class="for-ln">
                        <div class="ln blue"></div>
                    </div>
                </div>

                <div class="cont">
                    <categories :categs="post.categories" />
                    <div class="for-img">
                        <div class="imgg" :style="{backgroundImage: 'url(' + post.img + ')'}"></div>
                    </div>
                    <div class="info">
                        <div class="posted_at">
                            <i class="far fa-clock"></i>
                            {{post.posted_at}}
                        </div>
                        <div class="user">
                            <i class="fas fa-user"></i>
                            admin 
                        </div>
                    </div>
                    <div class="txtt" v-html="post.post_body">
                        <div class="desc">{{post.post_body}}</div>
                    </div>
                    <comments :post="post" />
                </div>

                <div class="for-callback">
                    <div class="sepp"></div>
                    <call-back id-callback="first" />
                    <div class="sepp"></div>
                    <last-posts />
                </div>

            </div>

    </div>
</template>

<script>
    import JwPagination from 'jw-vue-pagination'
    import CallBack2 from './CallBack2'
    import LastPosts from './LastPosts'
    import BlogComments from './BlogComments'
    import BlogCategories from './BlogCategories'

    export default {
        mounted() {
            // console.log(this.$root.posts);
            // this.fetchPosts(); 
            // this.posts = this.$root.posts;
            if(this.$root.posts){
                this.posts = this.$root.posts;
                this.setPost();
            }
            // $("html title").text('My title');
            // console.log(this.$route.params.id);
        },
        create () {
            // fetch the data when the view is created and the data is
            // already being observed
            // this.fetchPosts()
        },
        data: function(){
            return {
                post: null,
                posts: null
            }
        },
        methods: {
            // fetchPosts: function(){
            //     axios.get('blog/main')
            //         .then((response) => {
            //             // handle success
            //             // console.log(response.data);
            //             this.posts = response.data;
            //         })
            //         .catch((error) => { 
            //             // handle error
            //             // console.log(error);
            //         });
            //         // .finally(function () {
            //         //     // always executed
            //         // });
            // },
            // onChangePage: function(pageOfItems) {
            //     // update page of items
            //     this.pageOfItems = pageOfItems;
            // },
            setPost: function(){
                // console.log(posts);
                this.post = this.posts.find((post) => {
                    // return post.id == this.$route.params.id;
                    return post.slug == this.$route.params.slug;
                });
            }
        },
        watch: {
            '$root.posts': function(val) {
                // console.log(this.my);
                // putPosts();
                this.posts = val;
                this.setPost();
                // console.log(val);
            },
            '$route': function(){
                this.setPost();
                // console.log(444);
            },
            'post': function(val){
                $("html title").text(val.seo_title);
                
                if($("meta[name='description']").length > 0){
                    $("meta[name='description']").attr('content', val.meta_desc);
                }else{
                    $('head').append('<meta name="description" content="' + val.meta_desc + '">'); 
                } 
            },
        },
        components: {
            // "pagination": JwPagination,
            "call-back": CallBack2,
            "last-posts": LastPosts,
            "comments": BlogComments,
            "categories": BlogCategories
        }
        // beforeRouteEnter (to, from, next) {
        //     // getPost(to.params.id, (err, post) => {
        //     // next(vm => vm.setData(err, post))
        //     // })
        //     console.log('fhgfhgfhfhgfh');
        // },
    }
</script>


<style scoped>
.for-callback{
    display: none;
}
@media(max-width: 800px){
    .for-callback{
        display: block;
    }
}
table{
    width: 100%;
}
table td{
    vertical-align: top;
}
table td:first-child{
    width: 200px;
}
.for-img{

}
.posted_at{
    /* padding:  */
}
.imgg{
    width: 100%;
    max-width: 360px;
    height: 300px;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}
@media(max-width: 400px){
    .imgg{
        height: 240px;
    }
}
.info{
    padding: 20px 0px;
    font-weight: bold;
}
.info>div{
    display: inline-block;
}
.info>div.posted_at{
    padding-right: 20px;
}
.txtt{
    line-height: 1.6rem;
    font-size: 1em;
}
.sepp{
    height: 40px;
    clear: both;
}
</style>