

document.addEventListener('DOMContentLoaded', function() {

    let announcement = document.querySelectorAll('.footer1_announcement > a');
    let idx = 0;

    setInterval(function() {
        announcement[idx].classList.remove('footer1_active');
        idx++;
        if(idx == announcement.length) {
            idx = 0;
        }
        announcement[idx].classList.add('footer1_active');

    }, 2000);
})