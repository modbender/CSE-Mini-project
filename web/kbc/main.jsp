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
        <jsp:include page="/khead"/>
        <title>KBC Quiz</title>
        <script>
            var qid = [], q = [], options = [], pause = false, chosen;
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
            options[<%=i%>] = eval(`(<%=rs.getString(3)%>)`);
            <%
                        i++;
                    }
                } catch (SQLException e) {
                    out.println(e);
                }
            %>
            var curQ = 0;
            document.title = "Q." + (curQ + 1) + "| KBC Quiz";
            const quit = () => {
                $.post("/CS121/kbc/quit", {

                }, function (data, status) {
                    if (status === "success") {
                        foEffect(true);
                    }
                }).fail(function () {
                    foEffect(false);
                });
            };
            $(document).ready(function () {
//                Disable F5 or refresh
                window.onbeforeunload = function () {
                    if (true) {
                      return "Reloading will make you lose your progress!";
                    }
                    if(curQ <= 15) {
                      
                    }
                };
                window.onblur = function() {
                    if(true){
                        alert("Closing tab will erase your progress");
                    }
                };
                var optc = ["q-opt select", "q-opt lock", "q-opt"];
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
                    if ($(this).hasClass("select")) {
                        $(this).find("#lock").addClass("fa-lock");
                        setSubmit(false);
                        chosen = parseInt(this.getAttribute("id").split("-")[1]);
                        pause = true;
                    }
                    (!$(this).hasClass("select") && $(".q-opt.select").length) ? $(".q-opt.select").removeClass("select") : undefined;
                    $(this).each(function () {
                        cClass(this, optc);
                    });
                });
                const cClass = (el, optc) => {
                    el.className = optc[($.inArray(el.className, optc) + 1) % optc.length];
                };
            });
            const getData = () => {
                $.post("/CS121/kbc/feed",
                        {
                            uid: "<%= session.getAttribute("uid")%>",
                            qid: qid[curQ],
                            feed: chosen
                        },
                        function (data, status) {
                            if (status === "success") {
                                foEffect(true);
                                setSubmit(true);
                                curQ++;
                                document.title = "Q." + (curQ + 1) + "| KBC Quiz";
                                setQuestions();
                            } else if (status !== "success") {
                                foEffect(false);
                            }
                        }).fail(function () {
                    foEffect(false);
                });
            };
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
                                <span id="q" class="no_select">

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
                                            <td id="opt-cont-<%=j%>" class="no_select">

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
                    <button id="submit" class="kbc-btn" onclick="getData()" disabled>
                        Submit Answer
                    </button>
                </div>

            </div>

        </div>
        <script>
            var qelem = document.getElementById('q'), sub;
            var optelem = [
                document.getElementById("opt-cont-0"),
                document.getElementById("opt-cont-1"),
                document.getElementById("opt-cont-2"),
                document.getElementById("opt-cont-3")
            ];
            const resetData = () => {
                qelem.innerHTML = "";
                for (j in optelem) {
                    optelem[j].innerHTML = "";
                }
                $(".q-opt.lock").find("#lock").removeClass("fa-lock");
                $(".q-opt.lock").removeClass("lock");
            };
            const setOptions = (i) => {
                if (i === 4) {
                    setTimeout(function () {
                        startT();
                    }, 300);
                }
                if (i < 4) {
                    setTimeout(function () {
                        optelem[i].innerHTML = options[curQ][i];
                        setOptions(i + 1);
                    }, 300);
                }
            };
            const setQuestions = () => {
//                history.pushState({curQ},"",location.href+"/"+(curQ+1));
                if (curQ === 16) {
                    location.href="/CS121/kbc/results";
                }
                if (curQ !== 0) {
                    resetData();
                }
                if (q[0] === undefined) {
                    foEffect(false);
                    alert("No questions in DB!");
                }
                setTimeout(function () {
                    qelem.innerHTML = q[curQ];
                }, curQ === 0 ? 1500 : 900);
                setOptions(0);
            };
            setTimeout(function () {
                setQuestions();
            }, 2000);
        </script>
        <div class="pop">
            <i id="pop-v" class="fas fa-2x fa-check-circle"></i>
            <i id="pop-x" class="fas fa-2x fa-times-circle"></i>
            <span class="pop-text"></span>
        </div>

        <script src="/CS121/kbc/res/main.js"></script>
    </body>
</html>
