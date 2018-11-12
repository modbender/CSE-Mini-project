<%-- 
    Document   : result
    Created on : 10 Nov, 2018, 10:13:55 AM
    Author     : Yashas Hr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% if(request.getParameter("timeout")!=null){ %>
        <meta http-equiv="refresh" content="6; url=/CS121/" />
        <% } %>
        <title>Result</title>
    </head>
    <body>
        <% if(request.getParameter("timeout")!=null){ %>
        <h1>Your time ran out! Better luck next time! <br>Redirecting....</h1>
        <% } else { %>
        
        
        
        <% } %>
    </body>
</html>
