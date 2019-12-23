<template>
    <div class="footer">
        
        <div class="width-1">
            <div class="footer-contacts">
                <h3>Контакты</h3>
                <div class="for-ln">
                    <div class="ln yellow"></div>
                </div>
                <div class="d-table">
                    <div class="d-table-row">
                        <div class="d-table-cell">
                            <div class="circ location"></div>
                        </div>
                        <div class="d-table-cell">
                            03055, Украина, г.Киев<br>
                            проспект Победы 22, оф 38
                        </div>
                    </div>
                    <div class="d-table-row">
                        <div class="d-table-cell">
                            <div class="circ phone"></div>
                        </div>
                        <div class="d-table-cell">
                            +38 (044) 391 51 07
                        </div>
                    </div>
                    <div class="d-table-row">
                        <div class="d-table-cell">
                            <div class="circ mail"></div>
                        </div>
                        <div class="d-table-cell">
                            auditsirius@gmail.com
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
    export default {
        props: ['btnText','closeModals'],
        mounted() {
            console.log('Footer mounted.');
            // this.clModals();
            // console.log(this.closeModals);
        },
        data() {
            return {
                // validator: null
            }
        },
        methods: {
            
        }
    }
</script>


<style scoped>
    .footer{
        height: 280px;
        position: absolute;
        width: 100%;
        bottom: 0px;
        left: 0px;
        /* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#2f5470+0,071a27+100 */
        background: #2f5470; /* Old browsers */
        background: -moz-linear-gradient(top,  #2f5470 0%, #071a27 100%); /* FF3.6-15 */
        background: -webkit-linear-gradient(top,  #2f5470 0%,#071a27 100%); /* Chrome10-25,Safari5.1-6 */
        background: linear-gradient(to bottom,  #2f5470 0%,#071a27 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#2f5470', endColorstr='#071a27',GradientType=0 ); /* IE6-9 */
    }
    .footer-contacts{
        background-color: #063454;
        color: white;
        padding: 20px 30px;
        display: inline-block;
        position: relative;
        top: -40px;
        border-radius: 4px;
        -webkit-box-shadow: 0px 0px 5px 0px rgba(129,127,127,0.2);
        -moz-box-shadow: 0px 0px 5px 0px rgba(129,127,127,0.2);
        box-shadow: 0px 0px 5px 0px rgba(129,127,127,0.2);
    }
    .footer-contacts .d-table{
        width: 100%;
    }
    
    .footer-contacts .d-table .d-table-cell{
        vertical-align: top;
        padding-bottom: 10px;
    }
    .footer-contacts .d-table .d-table-row:nth-child(2) .d-table-cell{
        padding-bottom: 15px;
    }
    .footer-contacts .d-table .d-table-cell:first-child{
        width: 50px;
    }
    .footer-contacts .d-table .d-table-cell:last-child{
        padding-top: 10px;
    }
    .footer-contacts .circ{
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background-color: #015999;
        border: 5px solid #034676;
    }
    .footer-contacts h3{
        text-align: center;
        font-weight: bold;
        margin: 0px;
        line-height: 1em;
    }
    .footer-contacts .circ{
        /* background-image: url(/img/logo.png); */
        background-position: center;
        background-repeat: no-repeat;
    }
    .footer-contacts .circ.location{
        background-image: url(/img/map-location.png);
        background-size: 10px;
    }
    .footer-contacts .circ.phone{
        background-image: url(/img/phone2.png);
        background-size: 12px;
    }
    .footer-contacts .circ.mail{
        background-image: url(/img/letter.png);
        background-size: 12px;
    }
    @media(max-width: 500px){
        .footer-contacts{
            position: static;
            width: 100%;
            height: 100%;
            border-radius: 0px;
            background: none;
            box-shadow: none;
        }
        .footer{
            background-color: #063454;
        }
    }
    @media(max-width: 400px){
        .footer-contacts{
            padding: 20px 0px;
        }
    }
</style>