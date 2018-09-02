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
                background-color: rgba(200,200,200,0.1);
                background-image: url('/CS121/res/img/ajax-loader.gif');
                background-repeat: no-repeat;
                background-position: center;
                width: 500px;
                height: 500px;
            }
            .rep-box:before{
                content: "";
                background-color: rgba(200,200,200,0.6);
                position: absolute;
                top:0;
                left:0;
                bottom: 0;
                width: 100%;
                height: 100%;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="rep-box">
                <div class="gif">  </div>
                <div class="msg">
                    
                </div>
            </div>
        </div>
    </body>
</html>