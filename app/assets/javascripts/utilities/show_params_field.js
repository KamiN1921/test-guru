$(document).ready(function () {
    var control = $('#badge_rule')

    if(control) {
        control.addEventListener('click', CheckType)
    }
});

function CheckType() {
    let rule = $("#badge_rule")[0].selectedOptions[0].value
    let forms = $('.params')
    switch (rule){
        case 'completed_first_try':
            forms[0].hide();
            forms[1].hide();
            break;

        case 'completed_category':
            forms[0].show();
            forms[1].hide();
            break;

        case 'completed_level':
            forms[0].hide();
            forms[1].show();
            break;
    }

}