$( document ).ready(function () {
    let control = document.querySelector('.timer');

    if(control.dataset.needtime){
        StartTimer(control);
    }

});

function StartTimer(control){
    let time = control.dataset.time;
    let start = control.dataset.start*1000;


    var countDownDate = start + time * (1000 * 60);

    var x = setInterval(function() {

        var now = new Date().getTime();

        var distance = countDownDate - now;

        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        control.innerHTML = hours + ":" + minutes + ":" + seconds;

        if (distance < 0) {
            clearInterval(x);
            control.innerHTML = "EXPIRED";
            $('.form-group').submit();
        }
    }, 1000);



}