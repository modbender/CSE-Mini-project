/* global pause */
var bar = $(".bar"), val = $(".progress-text"), time = parseInt(45), steps = 221;
const pTimer = () => {
    bar.css({
        transform: "rotate(" + (steps) + "deg)"
    });
    steps -= 4;
    time -= 1;
    val.text(time);
    if(time===0){
        prepFinish(true);
    }
    if(time===3){
        prepFinish(false);
    }
};
const getT = () => {
    setTimeout(function () {
        if (time > 0 && pause !== true) {
            pTimer();
            getT();
        }
    }, 1000);
};
const startT = () => {
    val.text(45);
    steps = 221;
    time = 45;
    pause = false;
    getT();
    bar.css({
        transform: "rotate(" + (225) + "deg)"
    });
};
const prepFinish = (fin) => {
    fin===false? val.addClass("end") : location.href = "/CS121/kbc/results?timeout=true";
};