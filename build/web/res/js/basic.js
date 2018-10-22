/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//const changeColor = (elem) => {
//    var rand,color = "";
//    do{
//        rand = Math.floor(Math.random() * 90);
//        color = color + rand;
//    }while(color.length<6);
//    console.log(color);
//    elem.css('color',"#"+color);
//    setTimeout(function(){
//        changeColor(elem);
//    },500);
//};

$(document).ready(function () {
    var kvid = $("#kbc-vid").get(0),sbtn = $("#state-btn"),st = $("#state"), vbtn=$("#volume-btn"),vol = $("#volume"),
        inputs = $("input[type='text'],input[type='password'],input[type='email'],input[type='tel']"),
        title = $(".panel-title");
//    changeColor(title);
    kvid.currentTime = 25;
    sbtn.click(function(){
        st.toggleClass("fa-play fa-pause");
        kvid.paused ? kvid.play() : kvid.pause();
    });
    vbtn.click(function () {
        vol.toggleClass("fa-volume-mute fa-volume-up");
        kvid.muted = kvid.muted ? false : true ;
    });
    setTimeout(function () {
        inputs.attr('readonly', false);
        inputs.focus();
    }, 500);
    if ($(".flash-bg") !== null) {
        flashbg();
    } else if ($(".flash-bg.flash") !== null) {
        flashbg(true);
    }
});
function flashbg(reset = false) {
    if (reset === true) {
        $(".flash-bg").removeClass("flash");
    }
    setTimeout(function () {
        $(".flash-bg").addClass("flash");
        setTimeout(function () {
            $(".flash-bg").removeClass("flash");
        }, 600);
        flashbg();
    }, 5000);
}
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
}