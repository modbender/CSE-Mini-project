<%-- 
    Document   : start
    Created on : 10 Sep, 2018, 11:03:45 PM
    Author     : Yashas Hr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/khead"/>
        <title>Welcome</title>
        <script>
            $(document).ready(function () {
                var optc = ["q-opt select", "q-opt lock", "q-opt"];
                $(".container .bg").addClass("full");
                setTimeout(function () {
                    $(".q").addClass("open");
                }, 1000);
                setTimeout(function () {
                    $(".opt").addClass("open");
                }, 1000);
                $(".q-opt").click(function () {
                    if ((!$(this).hasClass("lock") && $(".q-opt.lock").length) || ($(this).hasClass("lock"))) {
                        return;
                    }
                    ($(this).hasClass("select")) ? $(this).find("#lock").addClass("fa-lock") : undefined;
                    (!$(this).hasClass("select") && $(".q-opt.select").length) ? $(".q-opt.select").removeClass("select") : undefined;
                    $(this).each(function () {
                        cClass(this, optc);
                    });
                });
                function cClass(el, optc) {
                    el.className = optc[($.inArray(el.className, optc) + 1) % optc.length];
                }
            });
        </script>
    </head>
    <body>

        <div class="container">
            <div class="bg"></div>

            <div class="content">

                <div class="top-bar">
                    Hi
                </div>

                <div class="q-box">
                    <div class="q-timer-container">
                        <div class="timer-container">

                        </div>
                    </div>

                    <div class="q-box-container">
                        <div class="q-container">
                            <span class="l-tr"></span>
                            <div class="q">
                                <span id="q"></span>
                            </div>
                            <span class="r-tr"></span>
                        </div>
                        <div class="q-opt-row">
                            <div class="q-opt">
                                <span class="l-opt-tr"></span>
                                <div class="opt">
                                    <table id="opt-1">
                                        <tr>
                                            <td>
                                                A
                                            </td>
                                            <td>
                                                Option 1
                                            </td>
                                            <td>
                                                <i id="lock" class="fas"></i>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <span class="r-opt-tr"></span>
                            </div>
                            <div class="q-opt">
                                <span class="l-opt-tr"></span>
                                <div class="opt">
                                    <table id="opt-2">
                                        <tr>
                                            <td>
                                                B
                                            </td>
                                            <td>
                                                Option 2
                                            </td>
                                            <td>
                                                <i id="lock" class="fas"></i>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <span class="r-opt-tr"></span>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>

        <jsp:include page="/kfooter"/>
    </body>
</html>
