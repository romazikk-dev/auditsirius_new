<template>
    <div class="blog-comments">
        <div class="itms">
            <h2>Комментарии</h2>
            <div class="for-ln">
                <div class="ln blue left"></div>
            </div>

            <div v-if="post.comments.length > 0">
                <div v-for="comment in pageOfItems" class="itm">
                    <div class="name">
                        {{ comment.author_name }}
                    </div>
                    <div class="date">
                        <i class="far fa-calendar-alt"></i>
                        {{ comment.created_at }}
                    </div>
                    <div class="comment">
                        {{ comment.comment }} 
                    </div> 
                </div>

                <div v-if="showPagination">
                    <pagination :items="comments" @changePage="onChangePage" :pageSize="2" :maxPages="3"  :labels="paginationLabels"></pagination>
                </div>
            </div>
            <div v-else>
                У этого поста нет комментариев
            </div>
        
        </div>

        <div class="added-comment">
            <h2>Ваш комментарий</h2>
            <div class="for-ln">
                <div class="ln blue left"></div>
            </div>
            <div class="cont">
                <div class="name">
                    Name
                </div>
                <div class="date">
                    <i class="far fa-calendar-alt"></i>
                    <span>2019-12-12 11:21:00</span> 
                </div>
                <div class="comment">
                    Quod qui consectetur ipsum numquam esse. Blanditiis delectus animi tempore deleniti et.
                    Et facere voluptatem ipsum veritatis. Aspernatur quia quia eveniet non.
                    Odit illo consequatur et sit repellat voluptates. Tempora voluptas quidem quas
                    illum nulla exercitationem est. Deserunt illum dolorum quos aut aliquid.
                    Ducimus voluptatem ipsam rem eveniet necessitatibus veritatis.
                    Harum quo praesentium neque. Explicabo at minima numquam doloribus
                    sint dolor. Ducimus aut eveniet sed. 
                </div> 
                <div class="check">
                    Комментарий появиться на сайте после проверки админом
                </div>
            </div>
        </div>

        <div class="leave-comment">
            <h2>Оставить комментарий</h2>
            <div class="for-ln">
                <div class="ln blue left"></div>
            </div>
            <form action="#" id="blogComments" novalidate>
                <div class="preloader">
                    <div class="lds-roller"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>
                </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="name" placeholder="Имя">
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="email" placeholder="E-mail">
                </div>
                <div class="form-group">
                    <textarea class="form-control" name="comment" placeholder="Напишите Ваш комментарий здесь"></textarea>
                </div>
                <div class="form-group">
                    <label>
                        Противоположный к белому:
                    </label>
                    <input class="form-control" type="text" name="captcha" placeholder="Captcha">
                </div>
                <div class="form-group text-center pt-2 pb-1 for-btnn">
                    <button class="btnn lighter-shadow">Отправить</button>
                </div>
            </form>
        </div>

    </div>
</template>

<script>
    import JwPagination from 'jw-vue-pagination'

    export default {
        props: ['post'],
        mounted() {
            // console.log(this.$router.push({name: 'nameOfRoute'}));
            // this.clModals();
            // console.log(this.$route.query.category);
            // console.log(777);
            // console.log(this.categories);
            // this.categories = this.$root.postsCategories;
            this.regValidation();
            // this.post.comments
            this.setComments();
            // this.comments = this.post.comments.sort( (c1, c2) => {
            //     return new Date(c1.created_at) - new Date(c2.created_at);
            // });
            // console.log(this.post.comments); 
        },
        data() {
            return {
                comments: [],
                pageOfItems: [],
                validator: null,
                // categories: null
                formId: "blogComments",
                paginationLabels: {
                    first: '<<',
                    last: '>>',
                    previous: '<',
                    next: '>'
                }
            }
        },
        computed: {
            showPagination: function(){
                console.log(this.post.comments.length);
                if(this.post.comments.length > 2){
                    return true;
                }
                this.pageOfItems = this.post.comments;
                return false;
            },
        },
        methods: {
            setComments: function(){
                this.comments = this.post.comments.sort( (c1, c2) => {
                    return new Date(c2.created_at) - new Date(c1.created_at);
                });
                // if(this.comments.length <= 2){
                //     this.pageOfItems = this.comments;
                // } 
            },
            afterAdd: function(responseData){
                // console.log(responseData);
                $(`#${this.formId}`).trigger('reset'); 
                this.validator.resetForm();
                $('.blog-comments .leave-comment').hide();
                $('.blog-comments .added-comment .name').text(responseData.author_name);
                $('.blog-comments .added-comment .date .span').text(responseData.name);
                $('.blog-comments .added-comment .comment').text(responseData.comment);
                $('.blog-comments .added-comment').show();
            },
            onChangePage: function(pageOfItems) {
                // update page of items
                this.pageOfItems = pageOfItems;
                // return false;
                // console.log(555);

                // // if(this.$refs.paginationDetails){
                // //     console.log(this.$refs.paginationDetails.pager.currentPage);
                // // }

                // if(this.$refs.paginationDetails != undefined){ 
                //     // console.log(this.$refs.paginationDetails.pager.currentPage);
                //     let q = {};
                //     if(this.$route.query.category != undefined){
                //         q.category = this.$route.query.category;
                //         //     page: this.$refs.paginationDetails.pager.currentPage,
                //         //     category: this.$route.query.category
                //         // };
                //     }
                //     // if(this.$route.query.page != undefined){
                //     //     this.$refs.paginationDetails.pager.currentPage = this.$route.query.page;
                //     //     // q.page = this.$refs.paginationDetails.pager.currentPage;
                //     // }
                //     if(this.$refs.paginationDetails.pager.currentPage > 1){
                //         q.page = this.$refs.paginationDetails.pager.currentPage;
                //     }
                //     this.$router.push({ query: q }).catch(err => {}); 
                // }
            },
            regValidation: function(){
                $.validator.addMethod("captcha", function(value, element) {
                    return this.optional(element) || value.toLowerCase() == "черный";
                }, "Неправильная каптча");

                this.validator = $(`#${this.formId}`).validate({
                    rules: {
                        name: {
                            required: true,
                            minlength: 3,
                            maxlength: 100
                        },
                        email: {
                            required: true,
                            email: true,
                            maxlength: 100
                        },
                        comment: {
                            required: true,
                            minlength: 10,
                            maxlength: 1000
                        },
                        captcha: {
                            required: true,
                            captcha: true
                        },
                    },
                    messages: {
                        name: {
                            required: "Обязательное поле",
                            minlength: "Минимум 3 символа",
                            maxlength: "Максимум 100 символов"
                        },
                        email: {
                            required: "Обязательное поле",
                            email: "Некоректный E-mail",
                            maxlength: "Максимум 100 символов"
                        },
                        comment: {
                            required: "Обязательное поле",
                            minlength: "Минимум 10 символа",
                            maxlength: "Максимум 1000 символов"
                        },
                        captcha: {
                            required: "Пожалуйства укажите каптчу",
                        }
                    },
                    submitHandler: (form) => {
                        $(`#${this.formId} .preloader`).show();

                        let data = {
                                    "name": $(`#${this.formId} input[name=name]`).val(),
                                    "email": $(`#${this.formId} input[name=email]`).val(),
                                    "comment": $(`#${this.formId} textarea[name=comment]`).val(),
                                    "blog_etc_post_id": this.post.id,  
                                    "captcha": $(`#${this.formId} input[name=captcha]`).val()
                                };

                        // console.log(data);
                        // return false;

                        axios.put('/add-comment-api', {
                                logs: data
                            }).then((response) => {
                                // $('#'+this.idForModal+' .modal-body').addClass("success");
                                this.afterAdd(response.data);
                            })
                            .catch((error) => {
                                console.log(error); 
                            }).finally(() => {
                                // $('#'+this.idForModal+' .modal-body .preloader').hide();
                                $(`#${this.formId} .preloader`).hide();
                            });
                    }
                });
            }
        },
        watch: {
            'post': function(val) {
                this.setComments();
                // console.log(this.my);
                // putPosts();
                // this.categories = val;
                // console.log(this.categories);
                // console.log(this.categories);
            }
        },
        components: {
            "pagination": JwPagination,
        }
    }
</script>


<style scoped>
    .preloader{
        position: absolute;
        top: 0px;
        left: 0px;
        z-index: 1;
        padding-top: 20%;
        width: 100%;
        height: 100%;
        background-color: rgba(255,255,255, .2);
        display: none;
    }
    /* .blog-comments.success .preloader{
        display: block;
    } */
    .preloader .lds-roller{
        margin: auto;
    }
    form{
        position: relative;
    }
    .form-group {
        position: relative;
        margin-bottom: 20px;
    }
    textarea{
        height: 160px;
    }
    input::-webkit-input-placeholder,
    input::-ms-input-placeholder,
    input::placeholder{
        color: #999;
    }

    h2 {
        font-size: 16px;
        font-weight: bold;
        margin: 0px;
        padding: 20px 0px 0px;
    }

    .for-btnn{
        /* text-align: right!important; */
    }

    .added-comment{
        display: none;
    }

    .cont,
    .itms .itm{
        /* background-color: #212529;
        border-radius: 4px;  */
        padding: 10px;
        /* border: 1px solid #ccc; */
    }
    .cont .name,
    .itms .itm .name{
        padding-bottom: 10px;
        font-size: 18px; 
    }
    .cont .date,
    .itms .itm .date{
        padding-bottom: 10px;
    }
    .cont .date i,
    .itms .itm .date i{
        color: #fa9d47;
        margin-right: 5px;
    }
    .cont .comment,
    .itms .itm .comment{
        line-height: 1.6rem;
    }

    .check{
        font-weight: bold;
    }

    
</style>