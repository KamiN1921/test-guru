document.addEventListener('turbolinks:load',function () {
    var control = document.querySelector('#user_password_confirmation')
    var control2 = document.querySelector('#user_password')

    if(control) {
        control.addEventListener('input', comparePasswords)
        control2.addEventListener('input', comparePasswords)
    }
});

function comparePasswords() {
    var password = $('#user_password')
    var confirmation = $('#user_password_confirmation')

    if((confirmation.val()!=='')){
        if (password.val() !== confirmation.val()) {
            confirmation.addClass('alert-danger')
            confirmation.removeClass('alert-success')
            password.addClass('alert-danger')
            password.removeClass('alert-success')
        } else {
            confirmation.removeClass('alert-danger')
            confirmation.addClass('alert-success')
            password.removeClass('alert-danger')
            password.addClass('alert-success')
        }
    }else {
        confirmation.removeClass('alert-success')
        password.removeClass('alert-success')

        confirmation.removeClass('alert-danger')
        password.removeClass('alert-danger')
    }

}