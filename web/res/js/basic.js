/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    window.onload = function () {
        var context = new AudioContext();
    };
    setTimeout(function () {
        $("input[type='text'],input[type='password'],input[type='email'],input[type='tel']").attr('readonly', false);
        $("input[type='text'],input[type='password'],input[type='email'],input[type='tel']").focus();
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
    document.getElementById("main").style.marginLeft= "0";
}
