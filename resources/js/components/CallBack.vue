<template>
    <div class="call-back">
        <button type="button"
                class="btnn"
                @click.prevent="showModal">{{ btnText }}</button>

    </div>
</template>

<script>
    export default {
        props: ['btnText','closeModals'],
        mounted() {
            console.log('call-back mounted.');
            this.addModal();
            this.regValidation();
            this.regOnModalClose();
            this.$root.regPhoneMask("#phoneMaskCallBack");
        },
        data() {
            return {
                validator: null
            }
        },
        methods: {
            regOnModalClose: function(){
                $('#callBackModal').on('hidden.bs.modal', () => {
                    $('.modal-body').removeClass("success");
                    $('#callBack').trigger('reset');
                    this.validator.resetForm();
                    console.log('removeClass');
                });
            },
            addModal: function(){
                $("body").append(` 
                    <!-- The Modal -->
                    <div class="modal" id="callBackModal">
                        <div class="modal-dialog">
                            <div class="modal-content">

                            <!-- Modal body -->
                            <div class="modal-body">

                                <div class="on_send">
                                    <button type="button" class="close" data-dismiss="modal"></button>
                                    <div class="tit">
                                        <h2>Заказать обратный звонок</h2> 
                                        <div class="for-lnn">
                                            <div class="lnn"></div>
                                        </div>
                                    </div>
                                    <form action="#" id="callBack" novalidate>
                                        <div class="form-group">
                                            <input class="form-control" required type="text" name="name" placeholder="Ваше Имя">
                                            <div class="ic usr"></div>
                                        </div>
                                        <div class="form-group">
                                            <input id="phoneMaskCallBack" class="form-control phone-mask" required type="text" name="phone" placeholder="Номер телефона">
                                            <div class="ic phone"></div>
                                        </div>
                                        <div class="form-group text-center pt-2 pb-1">
                                            <button class="btnn lighter-shadow">Заказать обратный звонок</button>
                                        </div>
                                    </form>
                                </div>

                                <div class="preloader">
                                    <div class="lds-roller"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>
                                </div>

                                <div class="on_success">
                                    <button type="button" class="close" data-dismiss="modal"></button>
                                    <div class="tit">
                                        <h2>Ваш запрос успешно принят</h2> 
                                        <div class="for-ln">
                                            <div class="ln blue"></div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <p>В ближайшее время мы с Вами свяжемся.</p> 
                                    </div>
                                </div>

                            </div>

                            </div>
                        </div>
                    </div>
                `);
            },
            clModals: function(){
                this.closeModals.forEach(function(modalId){
                    $(modalId).modal('hide');
                });
            },
            showModal: function(){
                if(this.closeModals){
                    this.clModals();
                }
                $("#callBackModal").modal('show');
                console.log(this.closeModals);
            },
            regValidation: function(){
                this.validator = $("#callBack").validate({
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
                        // some other code
                        // maybe disabling submit button
                        // then:
                        // $(form).submit();
                        // console.log('submited')
                        $('#callBackModal .modal-body .preloader').show();
                        axios.put('/add-message-api', {
                                logs: {
                                    "name": $("#callBackModal input[name=name]").val(),
                                    "phone": $("#callBackModal input[name=phone]").val(),
                                    "type": "callback",
                                    "response": "phone"
                                }
                            }).then((response) => {
                                $('#callBackModal .modal-body').addClass("success");
                                console.log(response.data);
                            })
                            .catch((error) => {
                                console.log(error); 
                            }).finally(() => {
                                $('#callBackModal .modal-body .preloader').hide();
                            });
                    }
                });
            }
        }
    }
</script>


<style scoped>
@media(max-width: 500px){
    .btnn{
        padding: 0px 10px;
    }
}
.call-back{
    color: black;
}

.call-back .tit{
    text-align: center;
}
.call-back .close{
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
.call-back .close:hover,
.call-back .close:focus{
    opacity: 1;
}
.call-back .modal-body{
    background-color: #f8f8f8;
    border-radius: 5px;
    padding: 20px 50px;
}
.call-back .modal-dialog{
    -webkit-box-shadow: 0px 0px 5px 0px rgba(255,255,255,1);
    -moz-box-shadow: 0px 0px 5px 0px rgba(255,255,255,1);
    box-shadow: 0px 0px 5px 0px rgba(255,255,255,1); 
    border-radius: 5px;
}
.call-back input::-webkit-input-placeholder,
.call-back input::-ms-input-placeholder,
.call-back input::placeholder{
    color: #999;
}
.call-back input{
    border: 1px solid #ededed;
    padding: 0px!important;
    margin: 0px!important;
}
.call-back .form-group{
    position: relative;
    margin-bottom: 20px;
}
.call-back .form-control{
    height: 40px;
    line-height: 40px;
    padding-left: 55px!important;
    padding-right: 10px!important;
}
.call-back .form-control.response{
    padding-left: 10px!important;
}
.call-back .ic{
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
.call-back .ic.usr{
    background-image: url('/img/usr.png'); 
}
.call-back .ic.phone{
    background-image: url('/img/phone.png');
}
.call-back .ic.letter{
    background-image: url('/img/letter.png');
    background-size: 15px auto;
}
</style>