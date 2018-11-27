<%-- 
    Document   : loginS
    Created on : 2 Sep, 2018, 2:50:46 PM
    Author     : Yashas Hr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String type = request.getParameter("type");
    String rep = request.getParameter("signReport");
%>
<html>
    <head>
        <meta http-equiv="refresh" content="3; url=/CS121/" />
        <title><%=type%> <%=rep%></title>
        <style>
            body{
                margin: 0;
                background: black;
            }
            .container, .rep-box{
                display: flex;
                flex-flow: column nowrap;
                align-items: center;
                justify-content: center;
            }
            .rep-box{
                position: relative;
                background-repeat: no-repeat;
                background-position: center;
                width: 500px;
                height: 500px;
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="rep-box">
                <h1 style="font-size:85px;white-space: nowrap"><%=type%> 
                    <% if (rep.equals("Fail")) {%>
                    <span style="color:red"><%=rep%></span>
                    <% } else {%>
                    <span style="color:greenyellow"><%=rep%></span>
                    <% }%>
                </h1>
            </div>
        </div>
    </body>
</html>