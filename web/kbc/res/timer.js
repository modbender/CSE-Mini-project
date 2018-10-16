/* global pause */
var bar, val, time, steps;
bar = $(".bar");
val = $(".progress-text");
time = parseInt(45);
steps = 221;
function pTimer() {
    bar.css({
        transform: "rotate(" + (steps) + "deg)" // 100%=180° so: ° = % * 1.8
                // 45 is to add the needed rotation to have the green borders at the bottom
    });
    steps -= 4;
    time -= 1;
    val.text(time);
}
function getT() {
    setTimeout(function () {
        if (time > 0 && pause !== true) {
            pTimer();
            getT();
        }
    }, 1000);
}
function startT() {
    val.text(45);
    getT();
}