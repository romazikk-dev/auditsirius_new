<template>
    <div class="section" id="blog">
        <div class="width-1">
            <div class="for-tit">
                <div class="tit">Полезные материалы</div>
                <div class="for-ln"><div class="ln blue"></div></div>
            </div>
            <div class="row itms">
                
                <div v-for="post in posts" class="col-lg-4 col-sm-6 coll">
                    <div class="itm" :style="{backgroundImage: 'url(' + post.img + ')'}"> 
                        <div class="cont">
                            <div class="tit font-weight-bold">{{ post.title }}</div>
                            <div class="for-ln"><div class="ln yellow left"></div></div>
                            <div class="txt">
                                {{ post.short_desc }}
                            </div>
                            <div class="more">
                                <!-- <a href="#">Подробнее</a> -->
                                <router-link :to="{path: '/bl/' + post.slug}">Подробнее</router-link>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="for-btn text-center">
                <router-link :class="['btnn', 'lighter-shadow']" to="/bl">Перейти в блог</router-link>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.');
            if(this.$root.posts){
                this.posts = this.$root.posts.slice(0, 6);  
            }
            // this.fetchPosts();
        },
        create () {
            // fetch the data when the view is created and the data is
            // already being observed
            // this.fetchPosts()
        },
        data: function(){
            return {
                posts: null,
                my: "my"
            }
        },
        methods: {
            fetchPosts: function(){
                axios.get('blog/main')
                    .then((response) => {
                        // handle success
                        console.log(response.data);
                        this.posts = response.data; 
                    })
                    .catch((error) => {
                        // handle error
                        console.log(error);
                    });
                    // .finally(function () {
                    //     // always executed
                    // });
            },
            putPosts: function() {
                console.log(111);
            }
        },
        watch: {
            '$root.posts': function(val) {
                // console.log(this.my);
                // putPosts();
                // this.posts = this.$root.posts.slice(1, 6);
                this.posts = val.slice(0, 6);
            }
        },
        // beforeRouteEnter (to, from, next) {
        //     // getPost(to.params.id, (err, post) => {
        //     // next(vm => vm.setData(err, post))
        //     // })
        //     console.log('fhgfhgfhfhgfh');
        // },
    }
</script>


<style scoped>
.coll{
    padding-bottom: 40px;
}
.itm {
  background-color: #ccc; 
  height: 350px;
  position: relative;
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
}
.cont{
    position: absolute;
    height: 60%;
    width: 95%;
    bottom: 0px;
    left: 0px;
    background-color: rgba(5, 42, 67, .9);
    color: white;
    padding: 15px;
}
.txt{
    font-size: 12px;
}
.more{
    position: absolute;
    bottom: 15px;
    left: 15px;
}
.more a{
    color: #fa9d47;
    font-size: 14px;
}
.for-btn .btnn{
    height: 34px;
    line-height: 34px;
    padding-left: 20px;
    padding-right: 20px;
}
@media(max-width: 500px){
    .cont{
        width: 100%;
    }
}
</style>