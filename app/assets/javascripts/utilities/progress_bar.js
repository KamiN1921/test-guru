
$(document).ready(function () {
    var control = document.querySelector('.progress-scale')
    if(control) {
        control.style.width = control.dataset.progress + '%'
    }
});
