<%-- 
    Document   : start
    Created on : 18 Nov, 2018, 4:40:18 PM
    Author     : Yashas Hr
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="static dbconn.Connect.st"%>
<%@page import="static dbconn.Connect.con"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/khead"/>
        <title>Start</title>
        <style>
            .content{
                font-size: 34px;
                text-shadow : 1px 1px #bce;
                color: white;
            }
            h3,ol{
                margin: 0 0 20px 0;
                padding: 0 75px;
            }
            .start{
                display: flex;
                padding: 50px 0;
                align-items: center;
                justify-content: center;
            }
            .start > .btn-white-green{
                font-size: 64px;
                font-weight: 900;
            }
            .btn-white, .btn-white-green{
                display: inline-block;
                background-color: #eee;
                font-size: 30px;
                color: #222;
                border-radius: 30px;
                padding: 15px 40px;
                cursor: pointer;
                margin: 0 auto;
            }
            .btn-white-green:hover{
                background-color: #00b248;
                color: #eee;
            }
            a{
                text-decoration: none;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="bg"></div>
            <div class="content">
                <%
                    dbconn.Connect.main(null);
                    session = request.getSession(false);
                    ResultSet rs = st.executeQuery("select count(*) from qs;");
                    if (session.getAttribute("name") != null) {
                        dbconn.Connect.main(null);
                        ResultSet rs1 = st.executeQuery("select count(*) from feeds where uid=" + session.getAttribute("uid") + ";");
                        if (rs.next()) {
                            int n = rs.getInt(1);

                            if (n > 0) {
                                rs1.next();
                                int indb = rs1.getInt(1);
                                if (indb == 0) {
                %>
                <div>
                    <script>
                        $(document).ready(function () {
                            var time = 10;
                            const cont = `START 
                            <i id="btn-start" class="fas fa-play"></i>`,
                                    sbtn = document.getElementById("start-btn"),
                                    link = "/CS121/kbc/main",
                                    cls1 = "btn-white",
                                    cls2 = "btn-white-green";
                            const setBtn = () => {
                                sbtn.innerHTML = cont;
                                sbtn.classList.remove(cls1);
                                sbtn.classList.add(cls2);
                                sbtn.href = link;
                            };
                            const timer = () => {
                                setTimeout(function () {
                                    sbtn.innerHTML = --time;
                                    if (time === 0) {
                                        setBtn();
                                    } else {
                                        timer();
                                    }
                                }, 1000);
                            };
                            timer();
                        });
                    </script>
                    <h3>Instructions : </h3>
                    <ol>
                        <li>
                            15 question are randomly selected from database and shown to you.
                        </li>
                        <li>
                            After the questions and options finish loading 45 seconds will be given to answer the question.
                        </li>
                        <li>
                            First click on option is a temporary select, which means you can still change your selection of option but can't clear it.
                        </li>
                        <li>
                            A second click on a option which is selected means its locked, upon locking a option Submit button will become clickable.
                        </li>
                        <li>
                            Upon submitting answer you will automatically be shown the next question and timer will be reset.
                        </li>
                        <li>
                            Upon Timeout or Quit you will lose your progress in the quiz.
                        </li>
                        <li>
                            Once 15 questions are answered you will be sent to result page to review your results.
                        </li>
                    </ol>
                    <div class="start">
                        <a class="btn-white" id="start-btn" href="javascript:void(0)"> 10
                        </a>
                    </div>
                </div>
                <% } else { %>
                <div>
                    You have already answered 15 questions.
                </div>
                <% } %>
                <% } else { %>
                <div>
                    <h2>Add Questions to start!</h2>
                    <div class="start">
                        <a class="btn-white-green" href="/CS121/admin"> 
                            Add Questions <i id="btn-start" class="fas fa-play"></i>
                        </a>
                    </div>
                </div>
                <% } %>
                <% } else { %>
                <h1>Error</h1>
                <% }
                } else { %>
                <script>
                    location.href = "/CS121/user/login";
                </script>
                <% }%>
            </div>
        </div>

        <script src="/CS121/kbc/res/main.js"></script>
    </body>
</html>
<% con.close(); %>
