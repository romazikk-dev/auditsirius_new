<template>
    <div class="top-main">

        <div class="width-1">
            <!-- <div class="container"> -->
                <div class="itm float-right">
                    <div class="ic float-left phone"></div>
                    <div class="tx float-left">+38 (044) 391 51 44</div>
                </div>
                <div class="itm float-right">
                    <div class="ic float-left location"></div>
                    <div class="tx float-left">г. Киев, проспект Победы 22, оф 38</div>
                </div>
            <!-- </div> -->
        </div>
        
    </div>
</template>

<script>
    export default {
        mounted() {
            console.log('Component TopMain mounted.')
        }
    }
</script>


<style scoped>
    .top-main{
        height: 36px;
        line-height: 26px;
        background-color: #051724;
        color: white;
        font-size: 14px;
        padding-top: 5px;
        margin-bottom: 80px;
    }
    .top-main .itm{
        padding-right: 20px;
        line-height: 26px;
        height: 26px;
    }
    .top-main .itm:first-child{
        padding: 0px;
    }
    .top-main .itm .ic{
        width: 24px;
        height: 24px;
        border-radius: 12px;
        background-color: #fa9d47;
        border: 3px solid #7f5a36;
        background-position: center;
        background-repeat: no-repeat; 
    }
    .top-main .itm .tx{
        padding-left: 6px;
    }
    .top-main .itm .ic.location{
        background-image: url(/img/map-location.png);
        background-size: 9px;
    }
    .top-main .itm .ic.phone{
        background-image: url(/img/phone2.png);
        background-size: 11px;
    }

    @media(max-width: 768px){
        .top-main{
            display: none!important;
        }
    }
</style>