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
        <meta http-equiv="refresh" content="6; url=http://example.com" />
        <title><%=type%> <%=rep%></title>
        <style>
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
                background-color: rgba(200,200,200,0.6);
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="rep-box">
                <div class="gif"> <img src="/CS121/res/img/ajax-loader.gif" width="50" height="50"/> </div>
                <div class="msg">

                </div>
            </div>
        </div>
    </body>
</html>