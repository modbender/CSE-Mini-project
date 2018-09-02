/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var reg = $("#regForm"), log = $("#logForm");
var pass = $("#pass"), cpass = $("#rpass");

function formError(error) {
    if (error === true) {
        $(".form-container").addClass("error");
    } else {
        $(".form-container").removeClass("error");
    }
}

$(document).ready(function () {
    $("form input").keyup(function () {
        if (pass.val() !== cpass.val()) {
            cpass.get(0).setCustomValidity("Passwords Don't Match");
        } else {
            cpass.get(0).setCustomValidity('');
        }
        if ($(this).is(":invalid") === true) {
            formError(true);
            console.log("Error, input:invalid is" + $(this).toString());
        } else {
            formError(false);
        }
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
});