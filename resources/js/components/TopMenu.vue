<template>
    <div class="top-menu" :class="{'alone-stand': aloneStand}">

        <div class="width-1">
            <nav class="navbar navbar-expand-md">

                
                
                <router-link :class="['navbar-brand']" to="/"></router-link>
                <div class="address">
                    <h6>+38 (044) 391 51 44</h6>
                    <div>
                        <span>г.Киев, проспект</span>
                        <span>Победы 22, оф 38</span> 
                    </div>
                </div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    
                </button>

                

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <router-link v-if="aloneStand" to="/#services">Услуги и цены</router-link>
                            <a v-else @click.prevent="scrollTo('#services')" href="#services">Услуги и цены</a>
                        </li>
                        <li class="nav-item">
                            <router-link v-if="aloneStand" to="/#ourTeam">Наша команда</router-link>
                            <a v-else @click.prevent="scrollTo('#ourTeam')" href="#ourTeam">Наша команда</a>
                        </li>
                        <li class="nav-item">
                            <a @click.prevent="$router.push({ path: `/bl` }).catch(err => {})" href="#blog">Полезные материалы</a>
                        </li>
                        <li class="nav-item">
                            <router-link v-if="aloneStand" to="/#reviews">Отзывы</router-link>
                            <a v-else @click.prevent="scrollTo('#reviews')" href="#reviews">Отзывы</a>
                        </li>
                        <li class="nav-item">
                            <router-link v-if="aloneStand" to="/">Контакты</router-link>
                            <a v-else @click.prevent="scrollTo('#contacts')" href="#contacts">Контакты</a>
                        </li>
                    </ul>
                </div>
                
            </nav>
        </div>

    </div>
</template>

<script>
    export default {
        mounted() {
            console.log('Header main mounted.');
            // this.scrollTo(scroll);
            if(this.$route.hash != ""){
                // console.log(this.$route);
                setTimeout(() => {
                    this.scrollTo(this.$route.hash);
                }, 200);
            }
            this.regApplyFix();
            // if(this.$route.hash)
        },
        props: ['aloneStand'],
        methods: {
            scrollTo: function(to){
                // console.log(to);
                $('.top-menu .collapse').collapse('hide');
                if($(to).length > 0){
                    $([document.documentElement, document.body]).animate({
                        scrollTop: $(to).offset().top - 60
                    }, 600); 
                }
            },
            regApplyFix: function(){
                $(document).scroll(function(e){
                    
                    let scrlTop = $(this).scrollTop();
                    let winWidth = window.innerWidth;
                    console.log(winWidth);
                    if(winWidth >= 768 && scrlTop > 50){
                        // console.log($(this).scrollTop());
                        $('.top-menu').addClass('fixedd');
                    }else if(winWidth < 768 && scrlTop > 1){
                        // console.log($(this).scrollTop());
                        $('.top-menu').addClass('fixedd');
                    }else{
                        $('.top-menu').removeClass('fixedd');
                    }
                });
            }
        }
    }
</script>


<style scoped>
.top-menu{
    background-color: #0a1f2d;
    /* background-color: #ccc; */
    /* top: 36px; */
    position: absolute;
    width: 100%;
    z-index: 99;
    margin-top: -80px;
}

.top-menu
.top-menu {
  color: white;
  padding: 0px;
  /* transition: all .3s ease; */
}

@media(max-width: 768px){
    .top-menu .width-1{
        padding: 0px;
    }
    .top-menu.alone-stand{
        margin-top: -60px; 
    }
}

.top-menu.fixedd{
    position: fixed;
    margin-top: 0px;
    top: 0px;
    left: 0px;
    -webkit-box-shadow: 0px 5px 3px 0px rgba(255,255,255,0.1);
    -moz-box-shadow: 0px 5px 3px 0px rgba(255,255,255,0.1);
    box-shadow: 0px 5px 3px 0px rgba(255,255,255,0.1);
}
/* .top-menu.fixedd{
  position: fixed;
  width: 100%;
  top: 0px;
  left: 0px;
  background-color: #0a1f2d;
} */
/* .top-menu .logo{
    width: 80px;
    height: 80px;
    background-image: url(/img/logo.png);
    background-position: center;
    background-repeat: no-repeat;
    background-size: contain;
    position: relative;
    top: -20px;
    display: inline-block;
    position: relative;
}
.top-menu .logo a{
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%; 
}
.top-menu ul{
    padding: 0px;
    margin: 0px;
    float: right;
    margin-top: 30px;
}
.top-menu ul li{
    list-style: none;
    float: left;
    padding-left: 30px;
}
.top-menu ul li:first-child{
    padding-left: 0px;
}
.top-menu ul li a{
    color: white;
    display: block;
    padding-bottom: 6px;
    text-decoration: none;
    border-bottom: 2px solid transparent;
    transition: all .3s ease;
}
.top-menu ul li a:hover{
    border-color: #fa9d47!important;
    color: #fa9d47;
} */

</style>