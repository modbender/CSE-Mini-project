/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global mails */

const formError = (error) => error === true ? $(".form-container").addClass("error") : $(".form-container").removeClass("error");

if ($("#logForm").length) {
    var log = $("#logForm"), lcb = $("#lpass");
}
if ($("#regForm").length) {
    var reg = $("#regForm"), pass = $("#pass"), cpass = $("#rpass"), rpass = $("#pass,#rpass"), em = $("#email");
}

function valcheck(ele) {
    if ($("#regForm").length) {
        pass.val() !== cpass.val() ? cpass.get(0).setCustomValidity("Passwords Don't Match") : cpass.get(0).setCustomValidity('');
    }
    var id = ele.getAttribute('id');
    if ($("#" + id).is(":invalid") === true) {
        formError(true);
    } else {
        formError(false);
    }
}

$(document).ready(function () {
    $("#showlpass").change(function () {
        $(this).is(":checked") ? lcb.attr("type", "text") : lcb.attr("type", "password");
    });
    $("#showrpass").change(function () {
        $(this).is(":checked") ? rpass.attr("type", "text") : rpass.attr("type", "password");
    });
    $("form input").keyup(function () {

    });
    if ($("#logForm").length) {
        $("#logForm input").each(function () {
            $(this).attr("onkeyup", "valcheck(this)");
        });
        log.on("submit", function (e) {
            e.preventDefault();
            var i = 0;
            log.find("input:invalid").each(function () {
                i++;
            });
            if (i > 0) {
                formError(true);
            } else {
                formError(false);
                this.submit();
            }
        });
    }
    if ($("#regForm").length) {
        $("#regForm input").each(function () {
            $(this).attr("onkeyup", "valcheck(this)");
        });
        reg.on("submit", function (e) {
            e.preventDefault();
            var i = 0;
            reg.find("input:invalid").each(function () {
                i++;
            });
            if (i > 0) {
                formError(true);
            } else {
                formError(false);
                console.log("Submitting");
                this.submit();
            }
        });
    }
});
$("#lemail").on("keyup", function () {
    console.log(this.value);
});
$("#email").on("keyup", function () {

});