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
<!--        <meta http-equiv="refresh" content="6; url=/CS121/" />-->
        <title><%=type%> <%=rep%></title>
        <style>
            body{
                margin: 0;
            }
            .container, .rep-box{
                display: flex;
                flex-flow: column nowrap;
                align-items: center;
                justify-content: center;
            }
            .container{
                background: radial-gradient(circle, red, greenyellow, red);
                width: 100%;
                height: 100vh;
                margin: 0;
                padding: 0;
            }
            .rep-box{
                position: relative;
                background-repeat: no-repeat;
                background-position: center;
                width: 500px;
                height: 500px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="rep-box">
                <div class="gif">  </div>
                <div class="msg">
                    <h1 style="font-size:85px;white-space: nowrap"><%=type%> 
                        <% if(rep.equals("Fail")){ %>
                        <span style="color:red"><%=rep%></span>
                        <% }else{ %>
                        <span style="color:greenyellow"><%=rep%></span>
                        <% } %>
                    </h1>
                </div>
            </div>
        </div>
    </body>
</html>