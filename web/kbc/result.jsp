<%-- 
    Document   : result
    Created on : 10 Nov, 2018, 10:13:55 AM
    Author     : Yashas Hr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/khead"/>
        <title>Result</title>
    </head>
    <body>
        <div class="container">
            <div class="bg"></div>
            <div class="content">
                <%
                    String quit = request.getParameter("quit");
                    if (quit != null) {
                    
                    } else {
                    String win = request.getParameter("win");
                    if (win != null) {

                %>
                <h1>Congrats on Winning!</h1>
                <% } %>
                <h1></h1>
                <% }
                    %>
            </div>
        </div>
        <script src="/CS121/kbc/res/main.js"></script>
    </body>
</html>
