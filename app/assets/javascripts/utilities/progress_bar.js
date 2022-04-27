document.addEventListener('turbolinks:load',function () {
    var control = document.querySelector('.progress-scale')

    control.style.width = control.dataset.progress+'%'
});
