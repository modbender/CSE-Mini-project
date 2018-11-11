<%-- 
    Document   : index
    Created on : 21 Aug, 2018, 9:25:15 PM
    Author     : Yashas Hr
--%>

<%@page import="def.Misc"%>
<%Misc.checkCon();%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/head"/>
        <link rel="stylesheet" type="text/css" href="res/css/home.css"/>
        <title>Home</title>
    </head>
    <body>
        <jsp:include page="/header"/>

        <div class="container">
            <img class="lg-stretch" style="object-fit: cover" src="<%=Misc.res("kbc-b.jpg")%>"/>
            <video id="kbc-vid" class="lg-stretch" onerror="this.onerror=null;this.style.display='none';" autoplay muted loop>
                <source src="<%=Misc.kres("kbcep.MP4")%>"/>
            </video>
            <div class="lg-overlay"></div>
            <div class="panel">
                <div class="lg-panel"></div>

                <div class="panel-content">

                    <div class="panel-items">
                        <div class="panel-item">
                            <h1 class="panel-title font-mont">Kaun Banega Crorepati</h1>
                        </div>
                        <div class="panel-item font-mont start">
                            <a class="btn-white-green" href="kbc/main"> START KBC 
                                <i id="btn-start" class="fas fa-play"></i> 
                            </a>
                        </div>
                    </div>

                </div>
            </div>

        </div>

        <jsp:include page="/footer"/>
    </body>
</html>
