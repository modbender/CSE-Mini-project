/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function formError(error) {
    if (error === true) {
        $(".form-container").addClass("error");
    } else {
        $(".form-container").removeClass("error");
    }
}

function valReg() {

}

$(document).ready(function () {
    $("form input").keyup(function(){
        if ($(this).is(":invalid") === true) {
            formError(true);
        } else {
            formError(false);
        }
    });
    $("#logForm").on("submit", function (e) {
        e.preventDefault();
        var i = 0;
        $("#logForm").find("input:invalid").each(function () {
            i++;
        });
        if (i >= 0) {
            formError(true);
        } else {
            formError(false);
            this.submit;
        }
    });
    $("#regForm").on("submit", function (e) {
        e.preventDefault();
        var i=0;
        var pass = $("#pass"), cpass = $("#rpass");
        if (pass.val() !== cpass.val()) {
            cpass.get(0).setCustomValidity("Passwords Don't Match");
        } else {
            cpass.get(0).setCustomValidity('');
        }
        $("#regForm").find("input:invalid").each(function () {
            i++;
        });
        if (i >= 0) {
            formError(true);
        } else {
            formError(false);
            this.submit;
        }
    });
    
});