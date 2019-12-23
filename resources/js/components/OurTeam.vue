<template>
    <div class="section our-team" id="ourTeam">
        <div class="graph">
            <div class="width-1">
                <div class="for-tit">
                    <div class="tit">Наша команда специалистов</div>
                    <div class="for-ln">
                        <div class="ln yellow"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        
                        <div id="owlOurTeam" class="owl-carousel owl-theme"> 
                            <div v-for="n in 10">
                                <div class="for-itm">
                                    <div class="itm">
                                        <div class="photo"></div>
                                        <div class="position">Директор</div>
                                        <div class="name">Светлана Анатольевна</div>
                                        <div class="txt">
                                            Lorem Ipsum is simply dummy text of the
                                            printing and typesetting industry.
                                            Lorem Ipsum has been the industry's standard
                                            dummy text ever since the 1500s, when an unknown
                                            printer took a galley of type and scrambled
                                            it to make a type specimen book. 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.')
            this.initSlider();
            this.regOnResize();
        },
        data: function(){
            return {
                carousel: null
            }
        },
        methods: {
            initSlider: function(){
                let windowWidth = $( window ).width();
                let items;
                if(windowWidth >= 1000){
                    items = 3;
                }else if(windowWidth >= 600){
                    items = 2;
                }else{
                    items = 1;
                }
                this.carousel = $('#owlOurTeam').owlCarousel({
                    items: items
                });
            },
            regOnResize: function(){
                $(window).resize((el) => {
                    let windowWidth = $( window ).width()
                    if(windowWidth >= 1000){
                        this.carousel.data('owl.carousel').options.items = 3;
                    }else if(windowWidth >= 600){
                        this.carousel.data('owl.carousel').options.items = 2;
                    }else{
                        this.carousel.data('owl.carousel').options.items = 1;
                    }
                });
            }
        }
    }
</script>


<style scoped>

.our-team {
  /* background-color: #053251;  */
  color: white;
  padding-bottom: 0px;
background: #063659; /* Old browsers */
background: -moz-linear-gradient(top,  #063659 0%, #05111a 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top,  #063659 0%,#05111a 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom,  #063659 0%,#05111a 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#063659', endColorstr='#05111a',GradientType=0 ); /* IE6-9 */
}
.our-team .graph{
    background-image: url(/img/our_team_graph-2.png);
    background-position: center bottom;
    background-size: 1100px;
    background-repeat: no-repeat;
    padding-bottom: 80px;
}
/* .our-team .for-itm{
    padding: 0px 30px;
} */
.our-team .itm{
    max-width: 250px;
    margin: auto;
}
.our-team .itm .photo{
    width: 100%;
    height: 270px;
    background-color: #ccc;
}
.our-team .itm .position{
    text-align: center;
    color: #fa9d47;
    padding: 10px 0px;
}
.our-team .itm .name{
    text-align: center;
    padding: 0px 0px 10px;
}

</style>