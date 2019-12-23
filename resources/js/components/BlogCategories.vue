<template>
    <div class="blog-categories">
        <div v-if="!categs" :class="{tit: true, 'without-header': withoutHeader}">
            <h2>Категории</h2>  
            <div class="for-ln pp15">
                <div class="ln left blue"></div>
            </div>
        </div>

        <ul v-if="categories">
            <li v-if="!categs"><a :class="{active: !$route.query.category }" href="#" @click.prevent="$router.push({ query: { page: 1, category: undefined } }).catch(err => {})">Все</a></li> 
            <li v-for="category in categories"><a :class="{active: $route.query.category == category.id }" href="#" @click.prevent="$router.push({ path: '/bl' ,query: { page: undefined, category: category.id } }).catch(err => {})">{{category.title}}</a></li>
            <!-- <li v-for="category in categories"><a href="#">323</a></li> -->
        </ul>

    </div>
</template>

<script>
    export default {
        props: ['withoutHeader','categs'],
        mounted() {
            // console.log(this.$router.push({name: 'nameOfRoute'}));
            // this.clModals();
            // console.log(this.$route.query.category);
            // console.log(777);
            // console.log(this.categories);
            if(!this.categs){
                this.categories = this.$root.postsCategories;
            }else{ 
                this.categories = this.categs;
            }

            console.log(this.categories);
        },
        data() {
            return {
                // validator: null
                categories: null
            }
        },
        methods: {
            
        },
        watch: {
            '$root.postsCategories': function(val) {
                // console.log(this.my);
                // putPosts();
                if(!this.categories){
                    this.categories = val;
                }
                
                // console.log(this.categories);
                // console.log(this.categories);
            },
            'categs':  function(val) {
                this.categories = val;
            },
        },
    }
</script>


<style scoped>
    .blog-categories{
        
    }
    .tit.without-header{
        display: none;
    }
    .blog-categories h2{
        font-size: 16px;
        font-weight: bold;
        margin: 0px;
        padding: 0px;
    }
    .blog-categories ul{
        padding: 0px;
        margin: 0px;
    }
    .blog-categories ul li{
        list-style: none;
        /* float: left; */
        display: inline-block;
        margin-right: 6px;
        margin-bottom: 6px;
    }
    .blog-categories ul li a{
        padding: 0px;
        margin: 0px;
        padding: 0px 10px;
        line-height: 30px;
        height: 30px;
        border: none;
        outline: none;
        background-color: #ccc;
        color: black;
        border-radius: 3px;
        transition: box-shadow 0.3s ease;
        text-decoration: none !important;
        display: inline-block;
    }
    .blog-categories ul li a.active {
        color: white;
        background-color: #015999;
        box-shadow: 0px 0px 10px 2px rgba(1, 90, 153, 0.2);
        -webkit-transition: box-shadow 0.3s ease;
        color: white;
    }
</style>