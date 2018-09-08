/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const formError = (error) => error===true ? $(".form-container").addClass("error") : $(".form-container").removeClass("error");

$(document).ready(function () {
    if ($("#logForm").length) {
        var log = $("#logForm"), lcb = $("#lpass");
    }
    if ($("#regForm").length) {
        var reg = $("#regForm"), pass = $("#pass"), cpass = $("#rpass");
        rpass = $("#pass,#rpass");
    }
    $("#showlpass").change(function () {
        $(this).is(":checked") ? lcb.attr("type", "text") : lcb.attr("type", "password");
    });
    $("#showrpass").change(function () {
        $(this).is(":checked") ? rpass.attr("type", "text") : rpass.attr("type", "password");
    });
    $("form input").keyup(function () {
        if ($("#regForm").length) {
            pass.val() !== cpass.val() ? cpass.get(0).setCustomValidity("Passwords Don't Match") : cpass.get(0).setCustomValidity('');
        }
        if ($(this).is(":invalid") === true) {
            formError(true);
        } else {
            formError(false);
        }
    });
    if ($("#logForm").length) {
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