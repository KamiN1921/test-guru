function formInlineHandler(test) {
    let link = $('.form-inline-link[data-test-id="'+test+'"]')
    let testTitle =$('.test-title[data-test-id="'+test+'"]')
    let formInline = $('.form-inline[data-test-id="'+test+'"]')


    testTitle.toggle()
    formInline.toggle()

    if(formInline.is(':visible')){
        link.text('Cancel')
    } else {
        link.text('Edit')
    }
}

function formInlineLinkHandler(event) {
    event.preventDefault()

    let testId = this.dataset.testId
    formInlineHandler(testId)

}

document.addEventListener('turbolinks:load',function () {
    var control = document.querySelectorAll('.form-inline-link')

    if (!control.length) {
        return 0;
    }
        for (var i = 0; i < control.length; i++) {
            control[i].addEventListener('click', formInlineLinkHandler)
        }


    var errors = $('.recource-errors')

    if (errors){
        var resourceId = errors.dataset.resourceId
        formInlineHandler(resourceId)
    }
});