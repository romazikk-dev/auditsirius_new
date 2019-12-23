<template>
    <div class="section services" id="services">

        <div class="width-1">
            <!-- <div class="container"> -->
                <div class="for-tit">
                    <div class="tit">Услуги и цены</div>
                    <div class="for-ln">
                        <div class="ln blue"></div>
                    </div>
                </div>
                <ul class="itm-switch">
                    <li><a v-on:click.prevent="showItems()" :class="{'active': isItemActive('all')}" href="">Все услуги</a></li>
                    <li><a v-on:click.prevent="showItems('accountingSupport')" :class="{'active': isItemActive('accountingSupport')}" href="">Бухгалтторское сопровождение</a></li>
                    <li><a v-on:click.prevent="showItems('auditingServices')" :class="{'active': isItemActive('auditingServices')}" href="">Аудиторские услуги</a></li>
                    <li><a v-on:click.prevent="showItems('consulting')" :class="{'active': isItemActive('consulting')}" href="">Консалтинг</a></li>
                </ul>
                <div class="clearfix"></div>
                <div class="checkbxs">
                    <div class="checkbx">
                        <div @click.prevent="accountingSupport?accountingSupport = false:accountingSupport = true" :class="{checker: true, active: accountingSupport}"><div class="ico"></div></div>
                        <input @change="check($event)" :checked="accountingSupport" type="checkbox" id="accountingSupport">
                        <label for="accountingSupport">Бухгалтторское сопровождение</label>
                    </div>
                    <div class="checkbx">
                        <div @click.prevent="auditingServices?auditingServices = false:auditingServices = true" :class="{checker: true, active: auditingServices}"><div class="ico"></div></div>
                        <input @change="check($event)" :checked="auditingServices" type="checkbox" id="auditingServices">
                        <label for="auditingServices">Аудиторские услуги</label>
                    </div>
                    <div class="checkbx">
                        <div @click.prevent="consulting?consulting = false:consulting = true" :class="{checker: true, active: consulting}"><div class="ico"></div></div>
                        <input @change="check($event)" :checked="consulting" type="checkbox" id="consulting">
                        <label for="consulting">Консалтинг</label>
                    </div>
                </div>
                <div class="row itms">


                    <transition v-for="(service, index) in services" name="coll-trans" :duration="{ enter: 600, leave: 0 }" :key="index"> 
                        <div class="col-md-6 coll" v-if="type(service.type)" :key="genKey()"> 
                            <div class="itm">  
                                <table>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="img"></div> 
                                            </td>
                                            <td>
                                                <div class="wr">
                                                    <div class="title">
                                                        {{service.title}}
                                                    </div>
                                                    <div class="for-ln pp15">
                                                        <div class="ln blue left"></div>
                                                    </div>
                                                    <div class="for-txt">
                                                        {{service.desc_short}}
                                                    </div>
                                                    <div class="bottom">
                                                        <div class="price float-left">от {{service.price}} грн</div>
                                                        <div class="float-right">
                                                            <button class="btnn lighter-shadow"
                                                                    :data-ind="index"
                                                                    @click="showModal(index)"> 
                                                                Подробнее
                                                                <i class="fas fa-chevron-right"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </transition>

                </div>
            <!-- </div> -->
        </div>

        <!-- The Modal -->
        <div class="modal" id="serviceModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                <!-- Modal Header -->
                <!-- <div class="modal-header">
                    <h2>Получить консультацию</h2> 
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div> -->

                <!-- Modal body -->
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal"></button>
                    <div class="tit">
                        <h2 id="tit"></h2> 
                        <div class="for-ln">
                            <div class="ln blue"></div>
                        </div>
                    </div>
                    
                    <div class="for_whom sec">
                        <h6>Для кого эта услуга</h6>
                        <div id="forWhom"></div>
                    </div>

                    <div class="terms sec">
                        <h6>Сроки оказания</h6>
                        <div id="terms"></div>
                    </div>

                    <div class="price sec">
                        <h6>Стоимость</h6>
                        <div id="price"></div>
                    </div>

                    <div class="txt sec">
                        <h6>Общее описание</h6>
                        <div id="txt"></div>
                    </div>

                    <div class="sec icos">
                        <div class="row">
                            <div v-for="n in 4" class="col-3">
                                <div class="for-ico">
                                    <div class="ico"></div>
                                </div>
                                <div class="ico-tit">Выезд курьера</div>
                            </div>
                        </div>
                    </div>

                    <div class="sec for-consulting">
                        <div class="consulting">
                            <div class="titt">
                                Проконсультируйтесь со специалистом
                            </div>
                            <div class="d-table">
                                <div  class="d-table-row">
                                    <div  class="d-table-cell">
                                        <div class="imgg"></div>
                                    </div>
                                    <div  class="d-table-cell">
                                        <div class="name">Светлана Анатольевна</div>
                                        <div class="desc">
                                            Директор АудитСириус Плюс<br>
                                            эксперт в области бухгалтерского учета
                                        </div>
                                        <call-back btn-text="Заказать обратный звонок"
                                                    :close-modals="['#serviceModal']" />
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
    import CallBack from './CallBack'

    export default {
        mounted() {
            console.log('Component TopMain mounted.');
            this.addItmBorderBottom();
            this.services = this.$root.services;
            // console.log(this.genKey());
        },
        updated() {
            // setTimeout(() => {
                this.addItmBorderBottom();
            // }, 100);
        },
        data: function(){
            return {
                accountingSupport: true,
                auditingServices: true,
                consulting: true,
                services: null,
            }
        },
        watch: {
            '$root.services': function(val) {
                // console.log(this.my);
                // putPosts();
                this.services = val;
            }
        },
        components: {
            "call-back": CallBack
        },
        methods: {
            check: function(event){
                this[event.currentTarget.id] = event.target.checked;
                // console.log(event.currentTarget.id + " - " + event.target.checked);
            },
            genKey: function(){
                return parseInt(Math.floor(Math.random() * 1000));
            },
            onHiddenModal: function(){
                $("#serviceModal").on('hidden.bs.modal', function(){
                    $("#serviceModal #tit").text('');
                    $("#serviceModal #forWhom").text('');
                    $("#serviceModal #terms").text('');
                    $("#serviceModal #price").text('');
                    $("#serviceModal #txt").text('');
                });
            },
            showModal: function(index){
                // this.resetModal();
                $("#serviceModal #tit").text(this.services[index].title);
                $("#serviceModal #forWhom").text(this.services[index].for_whom);
                $("#serviceModal #terms").text(this.services[index].terms);
                $("#serviceModal #price").text(this.services[index].price);
                $("#serviceModal #txt").text(this.services[index].txt);

                // console.log(this.services[index].for_whom);
                
                $("#serviceModal").modal('show');
            },
            type: function(type){
                switch(type){
                    case 'accounting_support':
                        return this.accountingSupport;
                        break;
                    case 'auditing_services':
                        return this.auditingServices;
                        break;
                    case 'consulting':
                        return this.consulting;
                        break;
                }
            },
            addItmBorderBottom: function(){
                $('.services .itms').find('.coll').removeClass('bor-bot');
                setTimeout(() => {
                    let colls = $('.services .itms').find('.coll');
                    console.log(colls.length);
                    if(colls.length > 2){
                        if(colls.length%2 == 0){
                            for(let i = 0; i < colls.length - 2; i++){
                                $(colls[i]).find('.itm').addClass('bor-bot');
                            }
                        }else{
                            for(let i = 0; i < colls.length - 1; i++){
                                $(colls[i]).find('.itm').addClass('bor-bot');
                            }
                        }
                    }
                }, 200);
            },
            showItems: function(type = 'all'){
                this.accountingSupport = false;
                this.auditingServices = false;
                this.consulting = false;

                // return false;

                // this.accountingSupport = true;
                // this.auditingServices = true;
                // this.consulting = true;

                // return false;

                switch(type){
                    case 'all':
                        this.accountingSupport = true;
                        this.auditingServices = true;
                        this.consulting = true;
                        break;
                    case 'accountingSupport':
                        this.accountingSupport = true;
                        break;
                    case 'auditingServices':
                        this.auditingServices = true;
                        break;
                    case 'consulting':
                        this.consulting = true;
                        break;
                }
            },
            isItemActive: function(type = 'all'){
                switch(type){
                    case 'all':
                        if(this.accountingSupport &&
                            this.auditingServices &&
                            this.consulting){
                            return true;
                        }else{
                            return false;
                        }
                        break;
                    case 'accountingSupport':
                        if(this.accountingSupport &&
                            !this.auditingServices &&
                            !this.consulting){
                            return true;
                        }else{
                            return false;
                        }
                        break;
                    case 'auditingServices':
                        if(!this.accountingSupport &&
                            this.auditingServices &&
                            !this.consulting){
                            return true;
                        }else{
                            return false;
                        }
                        break;
                    case 'consulting':
                        if(!this.accountingSupport &&
                            !this.auditingServices &&
                            this.consulting){
                            return true;
                        }else{
                            return false;
                        }
                        break;
                }
            }
        }
    }
</script>


<style scoped>
    .services{
        background-image: url(/img/header_graph_bottom-2.png);
        background-position: center top;
        background-size: 1100px;
        background-repeat: no-repeat;
    }
    .modal .modal-body{
        padding: 20px 20px 40px;
    }
    .modal .tit h2{
        text-align: center;
        font-weight: bold;
        padding: 0px;
        margin: 0px;
        line-height: 1em;
    }
    .modal h6{
        font-weight: bold;
    }
    .modal .icos{

    }
    @media(max-width: 500px){
        .modal .icos{
            display: none;
        }
    }
    .modal .icos .for-ico{
        width: 100%;
    }
    .modal .icos .for-ico .ico{
        width: 60px;
        height: 60px;
        background-position: center;
        background-repeat: no-repeat;
        background-size: contain;
        background-image: url(/img/service.png);
        margin: auto;
    }
    .modal .icos .ico-tit{
        text-align: center;
        font-size: 12px;
        font-weight: bold;
    }
    .modal #txt{
        max-height: 100px;
        overflow: auto;
    }
    .modal .sec{
        padding-bottom: 15px;
    }
    .modal .sec.for-consulting{
        padding: 0px 20px;
    }
    .modal .consulting{
        background-color: white;
        border-radius: 4px;
        padding: 30px;
        -webkit-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.2);
        -moz-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.2);
        box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.2);
    }
    @media(max-width: 500px){
        .modal .sec.for-consulting{
            padding: 0px 5px;
            margin: 0px -15px;
        }
        .modal .consulting{
            padding: 15px 5px;
        }
    }
    .modal .consulting .titt{
        text-align: center;
        font-size: 20px;
        font-weight: bold;
        padding-bottom: 30px;
    }
    .modal .consulting .d-table{
        width: 500px;
        margin: auto;
    }
    .modal .consulting .d-table .d-table-cell{
        vertical-align: top;
    }
    .modal .consulting .d-table .d-table-cell:first-child{
        width: 180px;
    }
    .modal .consulting .d-table .d-table-cell:last-child{
        width: auto;
    }
    .modal .consulting .imgg{
        width: 160px;
        height: 160px;
        border-radius: 50%;
        background-image: url(/img/director.png);
        background-position: center;
        background-size: contain;
        background-repeat: no-repeat;
    }
    @media(max-width: 767px){
        .modal .consulting .d-table,
        .modal .consulting .d-table-row,
        .modal .consulting .d-table-cell{
            display: block!important;
            width: 100%;
        }
        .modal .consulting .d-table-cell{
            text-align: center;
        }
        .modal .consulting .d-table .d-table-cell:first-child{
            width: 100%;
        }
        .modal .consulting .imgg{
            margin: auto!important;
        }
    }
    .modal .consulting .name{
        color: #5f5f5f;
        font-size: 16px;
        font-weight: bold;
        padding-top: 10px;
    }
    .modal .consulting .desc{
        color: #5f5f5f;
        padding: 10px 0px 20px;
    }
    .modal .close{
        display: block;
        width: 30px;
        height: 30px;
        border-radius: 15px;
        position: absolute;
        top: 0px;
        right: -40px;
        opacity: 1;
        color: white;
        outline: none;
        background-image: url(/img/close.png);
        background-position: center;
        background-size: contain;
        background-repeat: no-repeat;
    }
    .modal .close:hover,
    .modal .close:focus{
        opacity: 1;
    }

    
    .itm-switch{
        padding: 0px;
        margin: 0px;
    }
    .itm-switch li{
        list-style: none;
        float: left;
        padding-right: 90px;
    }
    .itm-switch li:last-child{
        padding-right: 0px;
    }
    .itm-switch li a{
        font-size: 18px;
        font-weight: bold;
        color: #053252;
        text-decoration: none;
        padding-bottom: 6px;
        display: inline-block;
        border-bottom: 2px solid #f8fafc;
        -webkit-transition: all .3s ease;
        transition: all .3s ease;
    }
    .itm-switch li a:hover,
    .itm-switch li a.active{
        border-color: #053252;
    }

    @media(max-width: 1100px){
        .itm-switch li{
            padding-right: 0px;
            width: 49%;
            text-align: center;
            padding-bottom: 20px; 
        }
    }

    .itms{
        padding-top: 50px;
    }
    .itms .coll{
        padding-bottom: 40px;
        /* transition: opacity .6s ease; */
    }

    .itms .coll-trans-enter{
        opacity: 0;
    }
    .itms .coll-trans-enter-active{
        transition: opacity .6s ease;
    }
    .itms .coll-trans-enter-to{
        opacity: 1;
    }

    /* .itms .coll-trans-leave{
        opacity: 1;
    }
    .itms .coll-trans-leave-active{
        transition: opacity .2s ease;
    }
    .itms .coll-trans-leave-to{
        opacity: 0;
    } */

    .btnn{
        padding-left: 20px;
        padding-right: 20px; 
        height: 34px;
        line-height: 34px;
    }
    .btnn i{
        font-size: 12px;
        margin-left: 8px;
    }


    .itms .coll.out-col{
        opacity: 1;
    }
    .itms .coll:nth-child(odd){
        padding-right: 40px;
    }
    .itms .coll:nth-child(even){
        padding-left: 40px;
    }
    @media(max-width: 1100px){
        .itms .coll:nth-child(odd){
            padding-right: 20px;
        }
        .itms .coll:nth-child(even){
            padding-left: 20px;
        }
    }
    
    .itms .itm.bor-bot{
        border-bottom: 1px solid #ccc;
    }
    .itms .itm .img{
        width: 60px;
        height: 60px;
        border-radius: 50%;
        background-position: center;
        background-repeat: no-repeat;
        background-size: contain;
        background-image: url(/img/service.png);
    }
    .itms .itm table{
        width: 100%;
    }
    .itms .itm table td{
        vertical-align: top;
        height: 180px;
        /* background-color: #f1f1f1; */
    }
    
    .itms .itm table td:first-child{
        width: 80px;
    }
    .itms .itm .title{
        font-size: 18px;
        font-weight: bold;
        padding: 0px;
        margin: 0px;
        line-height: 1em;
    }
    .itms .itm .wr{
        position: relative;
        height: 100%;
    }

    @media(max-width: 767px){
        /* .itms .itm table,
        .itms .itm table tbody,
        .itms .itm table tr{
            display: block;
            width: 100%;
            height: 100%;
        }
        .itms .itm table td{
            height: auto;
            padding-bottom: 70px;
            position: relative;
            display: block;
            float: left;
        }
        .itms .itm table td:first-child{
            width: 20%!important;
        }
        .itms .itm table td:last-child{
            width: 80%!important;
        } */
        .itms .itm table td{
            height: auto;
            padding-bottom: 70px;
        }
        .itms .itm table td{
            position: relative;
        }
        .itms .itm .wr{
            position: static;
        }
    }

    .itms .itm .bottom{
        height: 50px;
        width: 100%;
        position: absolute;
        left: 0px;
        bottom: 0px;
    }
    .itms .itm .bottom .price{
        line-height: 50px;
        font-weight: bold;
        font-size: 18px;
        line-height: 26px;
    }
    .itms .itm .bottom button{
        /* margin-right: 20px; */
    }

    .checkbxs{
        display: none;
    }
    .checkbxs label{
        display: inline-block;
        line-height: 22px;
        font-size: 16px;
        font-weight: bold;
        top: -3px;
        position: relative;
        margin-bottom: 20px;
    }
    .checkbxs .checkbx input[type=checkbox]{
        width: 20px;
        height: 20px;
        border: 1px solid black!important;
        display: none;
    }

    .checkbxs .checkbx .checker{
        width: 18px;
        height: 18px;
        border: 2px solid black!important;
        display: inline-block;
    }
    .checkbxs .checkbx .checker .ico{
        width: 120%;
        height: 120%;
        background-position: center;
        background-repeat: no-repeat;
        background-size: contain;
        background-image: url(/img/checker.png);
        margin-top: -4px;
        display: none;
    }
    .checkbxs .checkbx .checker.active .ico{
        display: block;
    }

    @media(max-width: 767px){
        .itms .coll:last-child{
            padding-bottom: 0px!important;
        }
    }

    @media(max-width: 500px){
        .checkbxs{
            display: block;
        }
        .itm-switch{
            display: none;
        }
        .itms .itm table td:first-child{
            display: none;
        }
        .itms .btnn{
            padding: 0px!important;
            font-size: 14px;
            font-weight: bold;
            height: auto!important;
            line-height: 1.2em!important;
            background: none;
            color: #015999;
            box-shadow: none;
            border-bottom: 1px dashed #015999;
        }
        .itms .btnn i{
            display: none;
        }
    }
    @media(max-width: 400px){
        .checkbxs label{
            line-height: 20px;
            font-size: 14px;
        }
    }

    @media(max-width: 1000px){
        #serviceModal .modal-dialog{
            max-width: 100%;
            margin: 10px 10px 10px 10px;
        }
        #serviceModal{
            padding-right: 0px !important;
        }
        #serviceModal.modal .close{
            top: 10px;
            right: 10px;
            background-image: url(/img/close-dark.png);
        }
    }

    

    /* .checkbxs .checkbx input[type="checkbox"]:checked + label::after {
        content: '';
        position: absolute;
        width: 1.2ex;
        height: 0.4ex;
        background: rgba(0, 0, 0, 0);
        top: 0.9ex;
        left: 0.4ex;
        border: 3px solid blue;
        border-top: none;
        border-right: none;
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        transform: rotate(-45deg);
    }

    .checkbxs .checkbx input[type="checkbox"] {
        line-height: 2.1ex;
    }

    .checkbxs .checkbx input[type="radio"],
    .checkbxs .checkbx input[type="checkbox"] {
            position: absolute;
            left: -999em;
    }

    .checkbxs .checkbx input[type="checkbox"] + label {
        position: relative;
        overflow: hidden;
        cursor: pointer;
    }

    .checkbxs .checkbx input[type="checkbox"] + label::before {
        content: "";
        display: inline-block;
        vertical-align: -25%;
        height: 2ex;
        width: 2ex;
        background-color: white;
        border: 1px solid rgb(166, 166, 166);
        border-radius: 4px;
        box-shadow: inset 0 2px 5px rgba(0,0,0,0.25);
        margin-right: 0.5em;
    } */

</style>