<template>
    <div>
        <top-main />
        <top-menu v-bind:aloneStand="true" /> 
        
        <div class="blog-view width-1">
            <div class="columns">
                <div class="left-column">
                    <blog-index />
                </div>
                
                <div class="right-column"> 
                    <search comp-id="one" />
                    <div class="sepp"></div>
                    <blog-categories />
                    <div class="sepp"></div>
                    <call-back id-callback="first" />
                    <!-- <div class="sepp"></div>
                    <last-posts /> -->
                    
                </div>
                <!-- <div class="clearfix"></div> -->
            </div>
            <div class="clearfix"></div>
        </div>
        <!-- <div class="clearfix"></div> -->
        
        <Footer />
    </div>
</template>

<script>
    import TopMain from './TopMain' 
    import TopMenu from './TopMenu'
    import BlogIndex from './BlogIndex'
    import BlogCategories from './BlogCategories'
    import Footer from './Footer'
    import CallBack2 from './CallBack2'
    import BlogSearch from './BlogSearch'
    // import LastPosts from './LastPosts'
    // import pagination from 'vue-bootstrap-pagination'

    export default {
        mounted() {
            console.log('Component mounted.');
        },
        props: ['bg'],
        components: {
            "top-main": TopMain,
            "top-menu": TopMenu,
            "blog-index": BlogIndex,
            "blog-categories": BlogCategories,
            "call-back": CallBack2,
            "search": BlogSearch,
            // "last-posts": LastPosts,
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