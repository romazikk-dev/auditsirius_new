<template>
    <div class="call-back-2">

        <div class="on_send"> 
            <div class="tit">
                <h2>Заказать обратный звонок</h2>  
                <div class="for-ln pp15">
                    <div class="ln left blue"></div>
                </div>
            </div>
            <form action="#" :id="formId" novalidate>
                <div class="form-group">
                    <input class="form-control" required type="text" name="name" placeholder="Ваше Имя">
                    <div class="ic usr"></div>
                </div>
                <div class="form-group">
                    <input class="form-control phone-mask" type="text" name="phone" placeholder="Номер телефона">
                    <div class="ic phone"></div>
                </div>
                <div class="form-group text-center pt-2 pb-1">
                    <button class="btnn lighter-shadow">Заказать</button>
                </div>
            </form>
        </div>

        <div class="preloader">
            <div class="lds-roller"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>
        </div>

        <div class="on_success">
            <div class="tit">
                <div class="for-check">
                    <i class="fas fa-check"></i>
                </div>
                <div class="clearfix"></div>
                <h2>Ваш запрос успешно принят</h2> 
                <p>В ближайшее время мы с Вами свяжемся.</p> 
                <a @click.prevent="hideComponent" href="#" class="btnn lighter-shadow">OK</a>
            </div>
        </div>

        <div class="clearfix"></div>

    </div>
</template>

<script>
    export default {
        props: ['idCallback'],
        mounted() {
            console.log('call-back mounted.');
            // this.addModal();
            this.regValidation();
            // this.regOnModalClose();
            this.$root.regPhoneMask("#" + this.formId + " .phone-mask");
            // console.log(this.formId);
        },
        data() {
            return {
                validator: null
            }
        },
        computed: {
            formId: function(){
                return this.idCallback + "-callback2";
            },
        },
        methods: {
            // getFormId: function(){
            //     return this.idCallback + "-callback2"
            // },
            // regOnModalClose: function(){
            //     $('#callBackModal').on('hidden.bs.modal', () => {
            //         $('.modal-body').removeClass("success");
            //         $('#callBack').trigger('reset');
            //         this.validator.resetForm();
            //         console.log('removeClass');
            //     });
            // },
            hideComponent: function(){
                $('.call-back-2').fadeOut(400);
            },
            regValidation: function(){
                let _this = this;
                this.validator = $("#" + this.formId).validate({
                    rules: {
                        name: {
                            required: true,
                        },
                        phone: {
                            required: true,
                            phone: true,
                        }
                    },
                    messages: {
                        name: {
                            required: "Обязательное поле",
                        },
                        phone: {
                            required: "Обязательное поле",
                        }
                    },
                    submitHandler: function(form) {
                        // $('.call-back-2 .preloader').show();

                        let data = {
                            "name": $("#" + _this.formId + " input[name=name]").val(),
                            "phone": $("#" + _this.formId + " input[name=phone]").val(),
                            "type": "callback",
                            "response": "phone"
                        }

                        axios.put('/add-message-api', {
                                logs: data
                            }).then((response) => {
                                $('.call-back-2').addClass("success");
                                console.log(response.data);
                            })
                            .catch((error) => {
                                console.log(error); 
                            }).finally(() => {
                                $('.call-back-2 .preloader').hide();
                            }); 
                    }
                });
            }
        }
    }
</script>


<style scoped>
.call-back-2{
    color: black;
    position: relative;
}
.call-back-2 h2{
    font-size: 16px;
    font-weight: bold;
    margin: 0px;
    padding: 0px;
}
.call-back-2 input::-webkit-input-placeholder,
.call-back-2 input::-ms-input-placeholder,
.call-back-2 input::placeholder{
    color: #999;
}
.call-back-2 input{
    border: 1px solid #ededed;
    padding: 0px!important;
    margin: 0px!important;
}
.call-back-2 .form-group{
    position: relative;
    margin-bottom: 20px;
}
.call-back-2 .form-control{
    height: 40px;
    line-height: 40px;
    padding-left: 55px!important;
    padding-right: 10px!important;
}
.call-back-2 .form-control.response{
    padding-left: 10px!important;
}
.call-back-2 .ic{
    width: 45px;
    height: 25px;
    position: absolute;
    border-right: 1px solid #aaaaaa;
    top: 8px;
    left: 0px;
    background-position: center;
    background-repeat: no-repeat;
    background-size: auto 17px;
}
.call-back-2 .ic.usr{
    background-image: url('/img/usr.png'); 
}
.call-back-2 .ic.phone{
    background-image: url('/img/phone.png');
}
.call-back-2 .ic.letter{
    background-image: url('/img/letter.png');
    background-size: 15px auto;
}
.call-back-2 .preloader{
    display: none;
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
    padding-top: 30%;
    background-color: rgba(255,255,255, .2);
}
.call-back-2 .on_success{
    text-align: center;
    display: none;
}
.call-back-2.success .on_send{
    display: none;
}

.call-back-2.success .on_success{
    display: block;
}
.call-back-2 .on_success .for-check{
    color: #28a745;
    font-size: 40px;
    text-align: center;
    padding: 10px 0px;
}
.call-back-2 .on_success p{
    padding-top: 10px;
}
</style>