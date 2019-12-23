<template>
    <div class="section reviews" id="reviews">
        <div class="graph">
            <div class="width-1">
                <div class="for-tit">
                    <div class="tit">Отзывы наших клиентов</div>
                    <div class="for-ln">
                        <div class="ln yellow"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        
                        <div id="owlReviews" class="owl-carousel owl-theme">
                            <div v-for="n in 10">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <i class="fas fa-quote-left"></i>
                                            </td>
                                            <td>
                                                <div class='doc'></div>
                                            </td>
                                            <td class="review_desk">
                                                <div class='headd'>
                                                    <div class='name float-left'>
                                                        Светлана Анатольевна
                                                    </div>
                                                    <div class='date float-right'>
                                                        12.07.2019
                                                    </div>
                                                </div>
                                                <div class='clearfix'></div>
                                                <div class='company'>
                                                    Компания Аист
                                                </div>
                                                <div class='txt'>
                                                    Lorem Ipsum is simply dummy text of the printing and
                                                    typesetting industry. Lorem Ipsum has been the
                                                    industry's standard dummy text ever since the 1500s,
                                                    when an unknown printer took a galley of type and
                                                    scrambled it to make a type specimen book.
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                                <div class="review_mob">
                                    <div class='headd'>
                                        <div class='name float-left'>
                                            Светлана Анатольевна
                                        </div>
                                        <div class='date float-right'>
                                            12.07.2019
                                        </div>
                                    </div>
                                    <div class='clearfix'></div>
                                    <div class='company'>
                                        Компания Аист
                                    </div>
                                    <div class='txt'>
                                        Lorem Ipsum is simply dummy text of the printing and
                                        typesetting industry. Lorem Ipsum has been the
                                        industry's standard dummy text ever since the 1500s,
                                        when an unknown printer took a galley of type and
                                        scrambled it to make a type specimen book.
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
        },
        methods: {
            initSlider: function(){
                $('#owlReviews').owlCarousel({
                    items: 1
                });
            }
        }
    }
</script>


<style scoped>

.review_mob{
    display: none;
}

.reviews {
  background-color: #122431; 
  color: white;
  background-image: url(/img/reviews-2.png);
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  padding-bottom: 0px;
  padding-top: 0px;
}
.reviews .graph{
    background-image: url(/img/reviews_graph_2.png);
    background-position: center;
    background-size: 1100px;
    background-repeat: repeat-y;
    padding-bottom: 80px;
    padding-top: 80px;
}
table{
    width: 100%;
}
td{
    vertical-align: top;
    padding-top: 50px;
}
td:nth-child(1){
    width: 80px;
    font-size: 54px;
    /* background-color: azure; */
}
td:nth-child(1) i{
    position: relative;
    top: -50px;
}
td:nth-child(2){
    width: 240px;
}
td:nth-child(3){
    width: auto;
}
@media(max-width: 767px){
    .review_mob{
        display: block;
    }
    .review_desk{
        display: none;
    }
    table{
        width: 320px;
        margin: auto;
    }
    td{
        padding-bottom: 40px;
    }
}
@media(max-width: 500px){
    td:nth-child(1){
        display: none;
    }
    td:nth-child(2){
        width: auto;
    }
    /* table,
    tbody,
    tr,
    td{
        display: block;
    } */
    td:nth-child(1),
    td:nth-child(3){
        width: 0px;
        position: absolute;
    }
    .headd>div{
        float: none!important;
    }
    td:nth-child(2) .doc{
        width: auto!important;
        margin: 0px;
        padding: 0px;

    }
    table{
        width: 250px;
        margin: auto;
    }
}
.doc{
    width: 200px;
    height: 240px;
    margin: auto;
    background-color: #ccc;
}
.headd{

}
.headd .name{
    font-weight: bold;
}
.headd .date{
    float: right;
}
.company{
    padding: 10px 0px;
}

</style>