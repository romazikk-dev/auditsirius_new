<template>
    <div class="blog-last-posts">
        <div class="tit">
            <h2>Последние посты</h2>  
            <div class="for-ln pp15">
                <div class="ln left blue"></div>
            </div>
        </div>

        <ul v-if="posts">
            <li v-for="post in posts"><a href="#" :class="{active: getCurrentPostId == post.id}" @click.prevent="$router.push({ path: `/bl/${post.slug}` }).catch(err => {})">{{post.title}}</a></li>
        </ul> 

        <div class="clearfix"></div>

    </div>
</template>

<script>
    export default {
        // props: ['categoryId'],
        mounted() {
            // console.log(this.$router.push({name: 'nameOfRoute'}));
            // this.clModals();
            // console.log(this.$route.query.category);
            // console.log(777);
            // console.log(this.categories);
            // this.posts = this.$root.posts;
            if(this.$root.posts){
                this.posts = this.$root.posts.slice(1, 10); 
            } 
            // console.log(777); 
        },
        computed: {
            getCurrentPostId: function(){
                // console.log(posts);
                return this.$root.posts.find((post) => {
                    // return post.id == this.$route.params.id;
                    return post.slug == this.$route.params.slug;
                }).id;
            },
        },
        data() {
            return {
                posts: null
            }
        },
        methods: {
            // getLast10Posts: function(){
            //     list.sort((a, b) => (a.color > b.color) ? 1 : -1)
            // }
        },
        watch: {
            '$root.posts': function(val) {
                // console.log(this.my);
                // putPosts();
                this.posts = val.slice(1, 10); 
                // this.getLast10Posts();
                // console.log(this.categories);
                // console.log(this.categories);
            }
        },
    }
</script>


<style scoped>
    .blog-last-posts{
        
    }
    .blog-last-posts h2{
        font-size: 16px;
        font-weight: bold;
        margin: 0px;
        padding: 0px;
    }
    .blog-last-posts ul{
        padding: 0px;
        margin: 0px;
    }
    .blog-last-posts ul li{
        list-style: none;
        display: block;
        margin-right: 6px;
        margin-bottom: 6px;
        padding-left: 10px;
    }
    .blog-last-posts ul li a{
        padding: 0px;
        margin: 0px;
        padding: 4px 0px;
        line-height: 1rem;
        border: none;
        outline: none;
        background: none;
        color: black;
        border-radius: 3px;
        transition: box-shadow 0.3s ease;
        text-decoration: none !important; 
        display: inline-block;
    }
    .blog-last-posts ul li a.active{
        text-decoration: underline!important;
    }
    .blog-last-posts ul li a:hover{
        text-decoration: underline!important;
    }
</style>