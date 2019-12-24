/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

// const Foo = { template: '<div>foo</div>' }
// const Bar = { template: '<div>bar</div>' }
const mainPageComponent = Vue.component('main-page-component', require('./components/MainPageComponent.vue').default);
const blogPageComponent = Vue.component('blog-page-component', require('./components/BlogPageComponent.vue').default);
const postPageComponent = Vue.component('post-page-component', require('./components/postPageComponent.vue').default);
// Vue.component('example-component', require('./components/ExampleComponent.vue').default);

var vueRouter = require('vue-router').default; 
const router = new vueRouter({
    mode: 'history',
    routes: [
        { path: '/', component: mainPageComponent },
        { path: '/bl', component: blogPageComponent },
        // { path: '/bl/:id(\\d+)', component: postPageComponent } 
        // { path: '/bl/:id', component: postPageComponent } 
        { path: '/bl/:slug', component: postPageComponent } 
        // { path: '/blll', component: postPageComponent }
    ]
}); 

alert('test');
/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));

// Vue.component('example-component', require('./components/ExampleComponent.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({ 
    router,
    data: function(){
        return {
            posts: null,
            postsCategories: null,
            services: null,
            my: 100
        }
    },
    mounted() {
        // console.log('Component mounted.');
        this.fetchPosts(); 
        this.fetchServices(); 
        // this.regMask();
        this.addCustomValidationRules();
    }, 
    methods: {
        addCustomValidationRules: function(){
            jQuery.validator.addMethod("phone", function(value, element) {
                return this.optional(element) || /^[+]{1}38 \(([0-9]{3})\) [0-9]{3}(-[0-9]{2}){2}$/.test(value);
            }, "Неправильный формат телефона");
        },
        regPhoneMask: function(selectorId){
            // let phoneInput = $(body)
            Inputmask({"mask": "+38 (999) 999-99-99"}).mask(selectorId);
        },
        fetchPosts: function(){
            axios.get('/blog/main')
                .then((response) => {
                    // handle success
                    // console.log(response.data);
                    this.posts = response.data.posts;
                    this.postsCategories = response.data.categories;
                    console.log(response.data);
                })
                .catch((error) => {
                    // handle error
                    console.log(error);
                });
        },
        fetchServices: function(){
            axios.get('/services-api')
                .then((response) => {
                    // handle success
                    // console.log(response.data);
                    this.services = response.data;
                    console.log(response.data);
                })
                .catch((error) => {
                    // handle error
                    console.log(error);
                });
        },
        scrollToTopInstantly: function(){
            $([document.documentElement, document.body]).animate({
                scrollTop: 0
            }, 0);
        }
    },
    watch: {
        "$route": function(to, from){
            // this.show = false;
            if(to.path != '/'){
                this.scrollToTopInstantly();
            }
            // console.log(to.path);
        }
    } 
}).$mount('#app'); 
