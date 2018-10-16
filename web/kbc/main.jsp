<%-- 
    Document   : start
    Created on : 10 Sep, 2018, 11:03:45 PM
    Author     : Yashas Hr
--%>

<%@page import="def.Misc"%>
<%@page import="java.sql.SQLException,java.sql.ResultSet,def.Kbc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/khead"/>
        <title>KBC Quiz</title>
        <script>
            var qid = [], q = [], options = [], pause = false;
            <%
                int i = 0;
//                int[] qids = new int[15];
//                String[] ques = new String[15];
//                String[] opts = new String[15];
                try {
                    ResultSet rs = Kbc.getQ();
                    while (rs.next()) {
            %>
            qid[<%=i%>] = parseInt(<%=rs.getString(1)%>);
            q[<%=i%>] = "<%=rs.getString(2)%>";
            options[<%=i%>] = eval("(<%=rs.getString(3)%>)");
            <%
                        i++;
                    }
                } catch (SQLException e) {
                    out.println(e);
                }
            %>
            var curQ = 0;
            var qelem = document.getElementById('q');
            var optelem = [
                document.getElementById("opt-cont-A"),
                document.getElementById("opt-cont-B"),
                document.getElementById("opt-cont-C"),
                document.getElementById("opt-cont-D")
            ];
            const setQuestions = () => {
                setTimout(function () {
                    qelem.innerHTML = q[curQ];
                }, 2000);
                setOptions();
            };
            const setOptions = () => {
                for (var i = 0; i < 4; i++) {
                    optelem[i].innerHTML = options[curQ][i];
                }
            };
            $(document).ready(function () {
//                Disable F5 or refresh
//                window.onbeforeunload = function () {
//                    if (true) {
//                        return "Reloading will make you lose your progress!";
//                    }
//                };
//                window.onblur = function() {
//                    if(true){
//                        alert("Closing tab will erase your progress");
//                    }
//                };
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
                const cClass = (el, optc) => {
                    el.className = optc[($.inArray(el.className, optc) + 1) % optc.length];
                };
                const getData = (cuid, qid, feed) => {
                    $.post("demo_test_post.asp",
                            {
                                url: window.location.href,
                                uid: cuid,
                                qid: currentQ,
                                feed: feedA
                            },
                            function (data, status) {
                                status === "success" ? console.log("Inserting Question " + qid + " successfull") : alert("Inserting question to the database failed");
                            });
                };
                startT();
            });
        </script>
    </head>
    <body>

        <div class="container">
            <div class="bg"></div>

            <div class="content">

                <div class="top-bar">

                </div>

                <div class="q-box">
                    <link rel="stylesheet" href="<%=Misc.kres("timer.css")%>">
                    <div class="q-timer">
                        <div class="progress">
                            <div class="barOverflow">
                                <div class="bar" style="transform:rotate(225deg)"></div>
                            </div>
                            <span class="progress-text"></span>
                        </div>
                    </div>
                    <script src="<%=Misc.kres("timer.js")%>"></script>
                    <div class="q-box-container">
                        <div class="q-container">
                            <span class="l-tr"></span>
                            <div class="q">
                                <span id="q">

                                </span>
                            </div>
                            <span class="r-tr"></span>
                        </div>
                        <%
                            for (int j = 0; j < 4; j++) {
                                if (j % 2 == 0) {
                        %>
                        <div class="q-opt-row">
                            <%
                                }
                            %>
                            <div class="q-opt" id="opt-<%=j%>">
                                <span class="l-opt-tr"></span>
                                <div class="opt">
                                    <table>
                                        <tr>
                                            <td>
                                                <%=Misc.opt(j)%>
                                            </td>
                                            <td id="opt-cont-<%=j%>">

                                            </td>
                                            <td>
                                                <i id="lock" class="fas"></i>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <span class="r-opt-tr"></span>
                            </div>
                            <%
                                if (j % 2 == 1) {
                            %>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>

                <div class="bottom-bar">
                    <button id="submit" class="kbc-btn hidden">
                        Submit Answer
                    </button>
                </div>

            </div>

        </div>

        <jsp:include page="/kfooter"/>
    </body>
</html>
