<template>
    <div>
        <top-main />
        <header-main />
        <services />
        <our-team />
        <reviews />
        <blog-main />
        <Footer />
    </div>
</template>

<script>
    import TopMain from './TopMain'
    import HeaderMain from './HeaderMain'
    import BlogMain from './BlogMain'
    import Services from './Services'
    import OurTeam from './OurTeam'
    import Reviews from './Reviews'
    import Footer from './Footer'

    export default {
        mounted() {
            // console.log(this.$route);
        },
        created() {
            // console.log(this.$route);
        },
        data: function(){
            return {
                // scroll: "#services"
            }
        }, 
        components: {
            "top-main": TopMain,
            "header-main": HeaderMain,
            "services": Services,
            "our-team": OurTeam,
            "reviews": Reviews,
            "blog-main": BlogMain,
            Footer
        }
    }
</script>


<style scoped>

</style>