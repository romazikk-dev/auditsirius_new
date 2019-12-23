<template>
    <div class="contact-us">
        <button type="button"
                :class="{btnn: true, mobile: isIdForModal()}"
                @click.prevent="showModal">{{ btnText }}</button>

        <!-- The Modal -->
        <div class="modal" :id="idForModal">
            <div class="modal-dialog">
                <div class="modal-content">

                <!-- Modal Header -->
                <!-- <div class="modal-header">
                    <h2>Получить консультацию</h2> 
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div> -->

                <!-- Modal body -->
                <div class="modal-body">

                    <div class="on_send">
                        <button type="button" class="close" data-dismiss="modal"></button>
                        <div class="tit">
                            <h2>Запрос бесплатной консультации</h2> 
                            <div class="for-ln">
                                <div class="ln blue"></div>
                            </div>
                        </div>
                        <form action="#" id="getConsultation" novalidate> 
                            <div class="form-group">
                                <input class="form-control" type="text" name="name" placeholder="Ваше Имя">
                                <div class="ic usr"></div>
                            </div>
                            <div class="form-group">
                                <input id="phoneMaskContactUs" class="form-control phone-mask" type="text" name="phone" placeholder="Номер телефона">
                                <div class="ic phone"></div>
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="email" name="email" placeholder="Электронная почта">
                                <div class="ic letter"></div>
                            </div>
                            <div class="form-group">
                                Получить ответ на:
                                <select class="form-control response" name="response">
                                    <option value="email">Электронную почту</option>
                                    <option value="phone">Телефон</option>
                                </select>
                            </div>
                            <div class="form-group text-center pt-2 pb-1">
                                <button class="btnn lighter-shadow">Запросить</button>
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

    </div>
</template>

<script>
    export default {
        props: ['btnText','closeModals','idForModal'],
        mounted() {
            console.log('contact-us mounted.')
            this.regValidation();
            this.regOnModalClose();
            this.$root.regPhoneMask(".contact-us .phone-mask");
        },
        data() {
            return {
                validator: null
            }
        },
        methods: {
            isIdForModal: function(){
                if(this.idForModal == 'modalContactUs_2'){
                    return true;
                }
                return false;
            },
            clModals: function(){
                this.closeModals.forEach(function(modalId){
                    $(modalId).modal('hide');
                });
            },
            regOnModalClose: function(){
                $('#'+this.idForModal).on('hidden.bs.modal', () => {
                    $('.modal-body').removeClass("success");
                    $('#'+this.idForModal+' form').trigger('reset');
                    this.validator.resetForm();
                    console.log('removeClass');
                });
            },
            showModal: function(){
                if(this.closeModals){
                    this.clModals();
                }
                $('#'+this.idForModal).modal('show');
            },
            regValidation: function(){
                this.validator = $('#'+this.idForModal+' form').validate({
                    rules: {
                        name: {
                            required: true,
                        },
                        phone: {
                            required: true,
                            phone: true,
                        },
                        email: {
                            required: true
                        },
                    },
                    messages: {
                        name: {
                            required: "Обязательное поле",
                        },
                        phone: {
                            required: "Обязательное поле",
                        },
                        email: {
                            required: "Обязательное поле",
                        },
                    },
                    submitHandler: function(form) {
                        $('#'+this.idForModal+' .modal-body .preloader').show();
                        axios.put('/add-message-api', {
                                logs: {
                                    "name": $('#'+this.idForModal+" input[name=name]").val(),
                                    "phone": $('#'+this.idForModal+" input[name=phone]").val(),
                                    "email": $('#'+this.idForModal+" input[name=email]").val(),
                                    "response": $('#'+this.idForModal+" select[name=response]").val(),
                                    "type": "free_consultation" 
                                }
                            }).then((response) => {
                                $('#'+this.idForModal+' .modal-body').addClass("success");
                                console.log(response.data);
                            })
                            .catch((error) => {
                                console.log(error); 
                            }).finally(() => {
                                $('#'+this.idForModal+' .modal-body .preloader').hide();
                            });
                    }
                });
            }
        }
    }
</script>


<style scoped>
.contact-us{
    color: black;
}

.modal h2{
    padding: 0px;
    margin: 0px;
    font-weight: bold;
    color: #484848;
}
.contact-us .tit{
    text-align: center;
}
.contact-us .close{
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
@media(max-width: 767px){
    .contact-us .close{
        top: 10px;
        right: 10px;
        background-image: url(/img/close-dark.png);
    }
}
.contact-us .close:hover,
.contact-us .close:focus{
    opacity: 1;
}
.contact-us .modal{
    padding-right: 0px!important; 
}
.contact-us .modal-body{
    background-color: #f8f8f8;
    border-radius: 5px;
    padding: 20px 50px;
    position: relative;
}
@media(max-width: 400px){
    .contact-us .modal-body{
        padding: 20px 20px;
    }
}
.contact-us .modal-dialog{
    -webkit-box-shadow: 0px 0px 5px 0px rgba(255,255,255,1);
    -moz-box-shadow: 0px 0px 5px 0px rgba(255,255,255,1);
    box-shadow: 0px 0px 5px 0px rgba(255,255,255,1); 
    border-radius: 5px;
}
.contact-us input::-webkit-input-placeholder,
.contact-us input::-ms-input-placeholder,
.contact-us input::placeholder{
    color: #999;
}
.contact-us input{
    border: 1px solid #ededed;
    padding: 0px!important;
    margin: 0px!important;
}
.contact-us .form-group{
    position: relative;
    margin-bottom: 20px;
}
.contact-us .form-control{
    height: 40px;
    line-height: 40px;
    padding-left: 55px!important;
    padding-right: 10px!important;
}
.contact-us .form-control.response{
    padding-left: 10px!important;
}
.contact-us .ic{
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
.contact-us .ic.usr{
    background-image: url('/img/usr.png'); 
}
.contact-us .ic.phone{
    background-image: url('/img/phone.png');
}
.contact-us .ic.letter{
    background-image: url('/img/letter.png');
    background-size: 15px auto;
}
.on_success{
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
    background-color: #f8f8f8;
    border-radius: 5px;
    display: none;
    padding: 20px;
}
.on_success p{
    font-size: 18px;
    line-height: 1.4em;
    font-weight: bold;
}
.modal-body.success .on_success{
    display: block;
}
.modal-body.success .on_send{
    display: none;
}

.modal-body .preloader{
    height: 100%;
    width: 100%;
    position: absolute;
    top: 0px;
    left: 0px;
    background-color: rgba(1,89,153, 0.1);
    display: none; 
}
.modal-body .preloader .lds-roller{
    margin: auto;
    margin-top: 40%;
}
</style>