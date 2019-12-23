<template>
    <div>

        <top-main />
        <top-menu v-bind:aloneStand="true" /> 
        
        <div class="blog-view width-1">
            <div class="columns">
                <div class="left-column">
                    <blog-post />
                </div>

                <div class="right-column"> 
                    <last-posts />
                    <div class="sepp"></div>
                    <call-back />
                    <!-- <div class="sepp"></div>
                    <last-posts /> -->
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        
        <Footer /> 

    </div>
</template>

<script>
    import TopMain from './TopMain' 
    import TopMenu from './TopMenu'
    import BlogPost from './BlogPost'
    import Footer from './Footer'
    import LastPosts from './LastPosts'
    import CallBack2 from './CallBack2'
    // import pagination from 'vue-bootstrap-pagination'

    export default {
        mounted() {
            // console.log('Component mounted.') 
            // console.log(this.$root.my) 
        },
        props: ['bg'],
        components: {
            "top-main": TopMain,
            "top-menu": TopMenu,
            "blog-post": BlogPost,
            "last-posts": LastPosts,
            "call-back": CallBack2,
            Footer
        }
    }
</script>


<style scoped>
    .sepp{
        height: 40px;
        clear: both;
    }
</style>