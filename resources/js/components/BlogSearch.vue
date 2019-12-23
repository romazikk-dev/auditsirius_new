<template>
    <div class="blog-search">

        <div class="srch-boxx">
            <h2>Поиск</h2>
            <div class="for-ln pp15">
                <div class="ln blue left"></div> 
            </div>

            <div class="boxx" :class="{active: active}">
                <form :id="getId">
                    <div class="form-group">
                        <input autocomplete="off" @focus="focused" @keydown="keyDown" @keyup="keyUp" class="form-control" type="text" name="search" placeholder="Что искать ...">
                    </div>
                </form>
                <div class="res">
                    <div v-if="result.length > 0" class="itms">
                        <div v-for="item in result" class="itm">
                            <a href="#" @click.prevent="$router.push({ path: `/bl/${item.slug}` }).catch(err => {})">{{item.title}}</a>
                        </div>
                    </div>
                    <div v-else class="itms">
                        Нету результатов
                    </div>
                </div>
            </div>

        </div>

    </div>
</template>

<script>
    export default {
        props: ['compId'],
        mounted() {
            this.regClickOutOfEl();
            // this.disableFormSubmit();
        },
        data() {
            return {
                // validator: null
                result: [],
                active: false,
            }
        },
        computed: {
            getId: function(){
                return this.compId + "BlogSearch";
            },
        },
        methods: {
            focused: function(event){
                console.log('focused');
                // console.log('focused');
                if(event.currentTarget.value.length > 0){
                    this.active = true;
                }
            },
            regClickOutOfEl: function(){
                $(document).click((e) => {
                    // console.log(e.target);
                    // if($(e.target).hasClass('res')){
                    //     console.log('hasClass');
                    //     return false;
                    // }
                    if($(e.target).attr('name') == "search" &&
                            $(e.target).closest('.blog-search').length > 0){
                        // console.log('closest');
                        return false;
                    }
                    if($(e.target).closest('.res').length > 0){
                        // console.log('closest');
                        return false;
                    }
                    this.active = false;
                });
                // console.log('blured');
                // this.active = false;
            },
            keyDown: function(event){
                var keycode = (event.keyCode ? event.keyCode : event.which);
                if(keycode == '13'){
                    event.preventDefault();	
                    return false;
                }

                // console.log(event.currentTarget.value);
            },
            keyUp: function(event){
                // var keycode = (event.keyCode ? event.keyCode : event.which);
                // if(keycode == '13'){
                //     event.preventDefault();	
                //     return false;
                // }
                // this.search();
                // console.log(event.currentTarget.value);
                if(event.currentTarget.value.length > 0){
                    this.active = true;
                }else{
                    this.active = false;
                }
                this.result = [];
                this.search(event.currentTarget.value);
            },
            search: function(value){
                // this.$root.posts
                // console.log(111);
                // return false;
                
                this.result = this.$root.posts.filter(post => {
                    // console.log(post.title.search(value));
                    // console.log(post.post_body);
                    // return false;
                    if(post.post_body.search(new RegExp(value, "i")) >= 0 || post.title.search(new RegExp(value, "i")) >= 0){
                        return true;
                    }
                    return false;
                });
                console.log(this.result);
            },
            disableFormSubmit: function(event){
                var keycode = (event.keyCode ? event.keyCode : event.which);
                if(keycode == '13'){
                    event.preventDefault();	
                }

                console.log(event);
                // event.preventDefault();
                // return false;
                // $(`#${this.getId}`).submit((event) => {
                //     event.preventDefault();
                //     return false;
                // });
                // $(`#${this.getId} input`).keydown(function(event){
                //     if(event.keyCode == 13) {
                //         event.preventDefault();
                //         return false;
                //     }
                // });
            }
        },
        watch: {
            // result: function(val) {
            //     console.log(val);
            // }
        },
        components: {
            // "pagination": JwPagination,
        }
    }
</script>


<style scoped>
    input::-webkit-input-placeholder,
    input::-ms-input-placeholder,
    input::placeholder{
        color: #999;
    }
    h2{
        font-size: 16px;
        font-weight: bold;
        margin: 0px;
        padding: 0px;
    }
    .form-group{
        margin-bottom: 0px;
    }
    .boxx{
        position: relative;
    }
    .boxx .res{
        display: none;
    }
    .boxx.active .res{
        display: block;
        position: absolute;
        width: 100%;
        background-color: white;
        margin-top: 3px;
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
        z-index: 10;
    }
</style>