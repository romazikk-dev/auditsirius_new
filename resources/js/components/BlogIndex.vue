<template>
    <div class="section">

        <div class="for-tit">
            <div class="tit">Полезные материалы</div>
            <div class="for-ln">
                <div class="ln blue"></div>
            </div>
            <div class="for-mobiles">
                <blog-categories :without-header="true" />
                <!-- <search /> -->
            </div>
        </div>

        <div v-if="!posts" class="row itms">
            <div class="lds-roller"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>
        </div>

        <div v-else>
            <div v-if="pageOfItems.length > 0" class="row itms">
                
                <div v-for="post in pageOfItems" class="col-4 coll"> 
                    <div class="itm" :style="{backgroundImage: 'url(' + post.img + ')'}"> 
                        <div class="cont">
                            <div class="tit font-weight-bold">{{ post.title }}</div>
                            <div class="for-line">
                                <div class="line"></div>
                            </div>
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
            <div v-else class="row itms">
                <div class="empty">
                    Эта категория пуста
                </div>
            </div>

            <pagination ref="paginationDetails" :items="posts" @changePage="onChangePage" :pageSize="6" :maxPages="5" :initialPage="initialPage"  :labels="paginationLabels"></pagination> 

        </div>

        <div class="for-mobiles callbackkk">
            <call-back id-callback="second" />
        </div>

    </div>
</template>

<script>
    import JwPagination from 'jw-vue-pagination'
    import BlogCategories from './BlogCategories'
    import CallBack2 from './CallBack2'
    import BlogSearch from './BlogSearch'

    export default {
        mounted() {
            // console.log(this.$root.posts);
            // this.fetchPosts(); 
            this.posts = this.$root.posts;
            this.setInitialPage();
            this.filterPosts();
        },
        create () {
            // fetch the data when the view is created and the data is
            // already being observed
            // this.fetchPosts()
        },
        data: function(){
            return {
                posts: null,
                pageOfItems: [],
                currentPage: null,
                initialPage: 1,
                paginationLabels: {
                    first: '<<',
                    last: '>>',
                    previous: '<',
                    next: '>'
                }
            }
        },
        methods: {
            // pageLinkClick: function(){
            //     $(".page-link").click(function(){
            //         console.log('clicked');
            //     });
            // },
            fetchPosts: function(){
                axios.get('blog/main')
                    .then((response) => {
                        // handle success
                        // console.log(response.data);
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
            onChangePage: function(pageOfItems) {
                // update page of items
                this.pageOfItems = pageOfItems;

                console.log(555);

                // if(this.$refs.paginationDetails){
                //     console.log(this.$refs.paginationDetails.pager.currentPage);
                // }

                if(this.$refs.paginationDetails != undefined){ 
                    // console.log(this.$refs.paginationDetails.pager.currentPage);
                    let q = {};
                    if(this.$route.query.category != undefined){
                        q.category = this.$route.query.category;
                        //     page: this.$refs.paginationDetails.pager.currentPage,
                        //     category: this.$route.query.category
                        // };
                    }
                    // if(this.$route.query.page != undefined){
                    //     this.$refs.paginationDetails.pager.currentPage = this.$route.query.page;
                    //     // q.page = this.$refs.paginationDetails.pager.currentPage;
                    // }
                    if(this.$refs.paginationDetails.pager.currentPage > 1){
                        q.page = this.$refs.paginationDetails.pager.currentPage;
                    }
                    this.$router.push({ query: q }).catch(err => {}); 
                }
            },
            setInitialPage: function(){
                if(this.$route.query.page){
                    // console.log("p" + this.$route.query.page);
                    this.initialPage = parseInt(this.$route.query.page);
                }
            },
            filterPosts: function(){
                if(!this.$root.posts){
                    return false;
                }

                // if(this.$refs.paginationDetails){
                //     this.$refs.paginationDetails.setPage(1);
                //     // this.$router.push({ query: { page: 1 } }).catch(err => {});
                //     // console.log(this.$refs.paginationDetails.pager.currentPage);
                //     // console.log(this.$route.query.page );
                //     // if(this.$route.query.page == undefined){
                //     //     this.$refs.paginationDetails.pager.currentPage = 1;
                //     // }
                // }

                if(this.$route.query.category != undefined){
                    let queryCategoryId = this.$route.query.category;
                    let postsLength = this.$root.posts.length;
                    let posts = this.$root.posts;

                    this.posts = []; 
                    for(let i = 0; i < postsLength; i++){
                        if(posts[i].hasOwnProperty("categories")){
                            for(let ii = 0; ii < posts[i].categories.length; ii++){
                                if(posts[i].categories[ii].id == queryCategoryId){
                                    this.posts.push(posts[i]);
                                }
                            }

                        }
                    }
                }else{
                    this.posts = this.$root.posts;
                }
            }
        },
        watch: {
            '$root.posts': function(val) {
                // console.log(this.my);
                // putPosts();
                this.posts = val;
                this.filterPosts();
                // console.log(val);
            },
            '$route': function(){
                // console.log(6666);
                this.filterPosts();
            }
        },
        components: {
            "pagination": JwPagination,
            "blog-categories": BlogCategories,
            "call-back": CallBack2,
            "search": BlogSearch,
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
.for-tit{
    padding-bottom: 40px;
}
.coll{
    padding-bottom: 40px;
}
.itm {
  background-color: #ccc; 
  height: 280px;
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
.for-line{
    padding: 10px 0px;
}
.line{
    width: 60px;
    height: 3px;
    background-color: #fa9d47;
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
    /* text-decoration: none; */
}

.blog-view .itms{
    /* padding: 0px 0px 30px; */
}
.blog-view .itms .empty{
    padding: 0px 15px;
}

@media(max-width: 1000px){
    .blog-view .itms .coll{
        /* width: 49.9%!important; */
        flex: 0 0 49.9%;
        max-width: 49.9%;
    }
}
@media(max-width: 850px){
    .blog-view .itms .coll{
        /* width: 49.9%!important; */
        flex: 0 0 100%;
        max-width: 100%;
    }
    .cont{
        width: 100%;
    }
}
@media(max-width: 800px){
    .blog-view .itms .coll{
        /* width: 49.9%!important; */
        flex: 0 0 49.9%;
        max-width: 49.9%;
    }
    /* .cont{
        width: 100%;
    } */
}
@media(max-width: 600px){
    .blog-view .itms .coll{
        /* width: 49.9%!important; */
        flex: 0 0 100%;
        max-width: 100%;
    }
    /* .cont{
        width: 100%;
    } */
}

.for-mobiles{
    display: none;
}
.for-mobiles.callbackkk{
    padding-top: 30px;
}
@media(max-width: 800px){
    .for-mobiles{
        display: block;
    }
}
</style>