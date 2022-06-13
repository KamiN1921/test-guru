$(document).ready(function () {
    var control =  document.querySelector('#badge_rule')

    if(control) {
        control.addEventListener('click', CheckType)
    }
});

function CheckType() {
    let rule = $("#badge_rule")[0].selectedOptions[0].value
    let formCategory = $('.params-category')
    let formLevel = $('.params-level')
    switch (rule){
        case 'completed_first_try':
            formCategory.hide();
            formLevel.hide();
            break;

        case 'completed_category':
            formCategory.show();
            formLevel.hide();
            break;

        case 'completed_level':
            formCategory.hide();
            formLevel.show();
            break;
    }

}

function beforeSend(){
    let rule = $("#badge_rule")[0].selectedOptions[0].value
    let userparam = $('.final-param>#badge_param')
    let formCategory = $('.params-category>#badge_options')
    let formLevel = $('.params-level>#badge_options')
    switch (rule){
        case 'completed_first_try':
            userparam.val(0)
            break

        case 'completed_category':
            userparam.val(formCategory.val())
            break

        case 'completed_level':
            userparam.val(formLevel.val())
            break;
    }
}