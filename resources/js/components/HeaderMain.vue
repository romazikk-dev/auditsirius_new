<template>
    <div class="header-main">
        <top-menu />
        <div class="width-1">
            <div class="d-table header-cont">
                <div class="d-table-row">
                    <div class="d-table-cell">

                        <h1>
                            <span>Бухгалтерские</span> <span>и аудиторские</span> <span>услуги</span>
                        </h1>
                        <h3>
                            <span>для малого и среднего</span> <span>бизнеса</span> 
                        </h3>
                        <h6>
                            <div class="h6-1">
                                Решаем уникальные задачи связанные с<br>
                                бухгалтерским учетом наших клиентов
                            </div>
                            <div class="h6-2">
                                <span>Решаем уникальные задачи</span> <span>связанные с
                                бухгалтерским учетом</span> <span>наших клиентов</span>
                            </div>
                        </h6>
                        <div class="for-desktop-consulting">
                            <contact-us btn-text="Получить бесплатную консультацию" id-for-modal="modalContactUs_1" />
                        </div>

                    </div>
                    <div class="d-table-cell">
                        
                        <div class="for-director">
                            <div class="director">
                                <div class="name">Светлана Анатольевна</div>
                                <div class="for-lin">
                                    <div class="lin"></div>
                                </div>
                                <div class="more">
                                    Директор Аудит Сириус Плюс<br>
                                    Эксперт в области<br>
                                    бухгалтерского учета и аудита
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="for-mobile-consulting">
                <contact-us btn-text="Получить бесплатную консультацию"  id-for-modal="modalContactUs_2" />
            </div>
        </div>
    </div>
</template>

<script>
    import TopMenu from './TopMenu'
    import ContactUs from './ContactUs'

    export default {
        mounted() {
            // console.log('Header main mounted.')
            // console.log(this.$route);
        },
        components: {
            "top-menu": TopMenu,
            "contact-us": ContactUs
        }
    }
</script>


<style scoped>
.header-main {
    background-color: #0a1f2d;
    color: white;
    background-image: url(/img/header_graph-2.png);
    background-position: center bottom;
    background-size: 1100px;
    background-repeat: no-repeat;
}
.for-mobile-consulting{
    padding: 40px 0px 80px;
    display: none;
}

.header-main h1{
    text-transform: uppercase!important;
    font-weight: bold;
}
.header-main h3{
    padding: 10px 0px 20px;
}
.header-main h6{
    line-height: 1.4em;
    padding-bottom: 30px;
}
.header-main h6 .h6-2{
    display: none;
}
.d-table.header-cont{
    width: 100%;
    margin-top: 20px;
}
.d-table.header-cont .d-table-cell:first-child{
    width: auto;
    padding: 40px 0px 120px;
}
.d-table.header-cont .d-table-cell:last-child{
    width: 400px;
    background-image: url(/img/businesswoman2.png);
    background-position: center bottom;
    background-size: contain;
    background-repeat: no-repeat;
    position: relative;
}
.for-director{
    position: absolute;
    bottom: 0px;
    left: 0px;
    width: 100%;
    text-align: center;
}
.director{
    width: 320px;
    height: 100%;
    background-color: rgba(5, 23, 36, .9);
    margin: auto;
    padding: 15px 0px;
    -webkit-box-shadow: 0px 0px 10px 2px rgba(1,90,153, .2);
    -moz-box-shadow: 0px 0px 10px 2px rgba(1,90,153, .2);
    box-shadow: 0px 0px 10px 2px rgba(1,90,153, .2);
}
.director .name{
    font-weight: bold;
    font-size: 16px;
}
.director .for-lin{
    padding: 10px 0px 5px;
}
.director .lin{
    background-color: #FA9D47;
    height: 3px;
    width: 60px;
    margin: auto;
    border-radius: 4px;
}
.director .more{
    line-height: 24px;
}

@media(max-width: 950px){
    .header-cont h1 span{
        display: block;
    }
    .header-cont h3 span{
        display: block;
    }
    .header-cont .d-table-cell:first-child{
        padding: 40px 0px 60px!important;
    }
}
@media(max-width: 800px){
    .header-cont h1{
        text-align: center;
    }
    .header-cont h1 span{
        display: inline;
    }
    .header-cont h3{
        text-align: center;
    }
    .header-cont h3 span{
        display: inline;
    }
    .header-cont h6{
        text-align: center;
        padding-bottom: 0px;
    }
    .d-table.header-cont,
    .d-table-row,
    .d-table-cell{
        display: block!important;
        width: 100%;
    }
    .d-table.header-cont .d-table-cell:first-child{
        padding-bottom: 20px!important;
    }
    .d-table.header-cont .d-table-cell:last-child{
        width: 100%;
        height: 500px;
    }
    /* .d-table.header-cont{} */
    .for-mobile-consulting{
        display: block;
    }
    .for-desktop-consulting{
        display: none;
    }
}
@media(max-width: 500px){
    .header-cont h1 span{
        display: block!important;
    }
    .header-cont h1{
        text-align: left;
    }
    .header-cont h3 span{
        display: block!important;
    }
    .header-cont h3{
        text-align: left;
    }
    .header-cont h6{
        display: none;
    }
    .d-table.header-cont .d-table-cell:first-child{
        padding-left: 20px!important;
        padding-right:20px!important;
    }
    /* .header-cont .d-table-cell:first-child{
        padding: 40px 0px 60px!important;
    } */
    .width-1{
        padding: 0px;
    }
    .d-table.header-cont .d-table-cell:last-child{
        background-size: 440px;
    }
    .header-cont h1{
        font-size: 2rem;
    }
    .header-cont h3{
        font-size: 1.4rem;
    }
}
@media(max-width: 400px){
    .header-cont .director{
        width: 300px;
    }
}
@media(max-width: 350px){
    .header-cont h1{
        font-size: 1.6rem;
    }
    .header-cont h3{
        font-size: 1.2rem;
    }
}
</style>