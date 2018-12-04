<%-- 
    Document   : result
    Created on : 10 Nov, 2018, 10:13:55 AM
    Author     : Yashas Hr
--%>

<%@page import="static dbconn.Connect.st"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/khead"/>
        <meta http-equiv="refresh" content="20; url=/CS121/" />
        <script src="<%=def.Misc.res("Chart.bundle.min.js")%>"></script>
        <title>Result</title>
    </head>
    <body>
        <div class="container">
            <div class="bg"></div>
            <div class="content" style="color:white;font-size:25px;">
                <%
                    session = request.getSession(false);
                    if (session.getAttribute("uid") != null) {
                        String timeout = request.getParameter("timeout");
                        if (timeout == null) {
                            String win = request.getParameter("win");
                            if (win != null) {
                %>
                <h1>Congrats on Winning!</h1>
                <h1 style="color:greenyellow">You have answered all questions correctly!</h1>
                <% } else {
                    int corr = Integer.parseInt(request.getParameter("correct"));
                %>
                <h1>
                    You have got <%=corr%> answers correctly out of 15 questions.
                </h1>
                <div style="width:650px;height:650px;background:rgba(255,255,255,0.1)">
                    <canvas id="myChart"></canvas>
                </div>
                <script>
                    var ctx = document.getElementById("myChart").getContext('2d');
                    var data = {
                        datasets: [{
                                data: [<%=corr%>, <%=(15 - corr)%>],
                                backgroundColor: [
                                    'rgba(10, 135, 84,0.6)',
                                    'rgba(184, 12, 9,0.6)'
                                ],
                                hoverBackgroundColor: [
                                    'rgba(10, 135, 84,0.9)',
                                    'rgba(184, 12, 9,0.9)'
                                ],
                                borderColor: [
                                    'green',
                                    'red'
                                ],
                                borderWidth: 2
                            }],
                        labels: ['correct', 'wrong'],
                    };
                    var myPieChart = new Chart(ctx, {
                        type: 'pie',
                        data: data,
                        options: {
                            responsive: true,
                            maintainAspectRatio: true,
                            aspectRatio: 1
                        }
                    });
                </script>
                <%}%>
                <%} else {
                    try {
                        dbconn.Connect.main(null);
                        st.executeUpdate("delete from feeds where uid=" + session.getAttribute("uid").toString() + ";");
                    } catch (Exception e) {
                        System.out.println("Result.jsp\nError: " + e);
                    }
                %>
                <h1>You timed out, Better luck next time!</h1>
                <%}%>
                <%}%>
                <h1>You will be redirected in 20 seconds</h1>
            </div>
        </div>
        <script src="/CS121/kbc/res/main.js"></script>
    </body>
</html>
