<%-- 
    Document   : login
    Created on : 23 Aug, 2018, 10:29:10 PM
    Author     : Yashas Hr
--%>

<%@page import="def.Misc,java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String uri = def.Misc.uri(request.getRequestURI());

%>
<html>
    <head>
        <jsp:include page="/head"/>
        <link rel="stylesheet" type="text/css" href="/CS121/res/css/sign.css"/>
        <title><% if (uri.contains("admin")) { %>Admin <% }
            if (uri.contains("login")) { %>Login<% } else if (uri.contains("signup")) { %>Sign Up<% }%></title>
    </head>
    <body>
        <jsp:include page="/header"/>

        <img class="lg-stretch" style="object-fit: cover" src="<%=Misc.res("kbc-b.jpg")%>"/>
        <video id="kbc-vid" class="lg-stretch" onerror="this.error=null;this.style.display='none';" autoplay muted loop>
            <source src="<%=Misc.kres("kbcep.MP4")%>"/>
        </video>
        <div class="lg-overlay"></div>

        <div class="sign-container">

            <div class="form-container">

                <% if (uri.contains("login")) { %>

                <form id="logForm" name="login" action="/CS121/login_go" method="post">

                    <h2 class="form-title"> Login </h2>

                    <input type="text" name="type" value="<% if (uri.contains("admin")) { %>admin<% } else if (uri.contains("user")) { %>user<% } %>" hidden/>

                    <div class="s-group">
                        <label for="lemail">Email :</label>
                        <input id="lemail" type="email" name="lemail" autocomplete="off" readonly autofocus required/>
                    </div>

                    <div class="s-group">
                        <label for="lpass">Password : </label>
                        <input id="lpass" type="password" name="lpass" autocomplete="off" readonly required/>
                    </div>

                    <div class="input-checkbox">
                        <input id="showlpass" type="checkbox"/>
                        <label for="showlpass">Show Password</label>
                    </div>

                    <div class="form-block">
                        <a class="form-change" href="signup"> Register <i class="fas fa-arrow-right"></i> </a>
                        <button class="btn-csgo" type="submit">Login</button>
                    </div>

                </form>
                <%
                } else if (uri.contains("signup")) {
                    String[] mails = Misc.umails().toArray(new String[0]);
                %>
                <script>
                    var mails = Array();
                    $(document).ready(function () {
                    <%
                            for (int i = 0; i < mails.length; i++) {
                    %>
                        mails[<%=i%>] = "<%=mails[i]%>";
                    <%
                                    }
                    %>
                    });
                </script>
                <form id="regForm" name="register" class="form" action="/CS121/register_go" method="post" style="z-index: 50">

                    <h2 class="form-title"> Sign Up </h2>

                    <input type="text" name="type" value="<% if (uri.contains("admin")) { %>admin<% } else if (uri.contains("user")) { %>user<% } %>" hidden/>

                    <div class="s-group">
                        <label for="fname">Full Name : <span class="input-red" title="Required Field">*</span></label>
                        <input id="fname" type="text" name="fname" autocomplete="off" readonly autofocus required/>
                    </div>

                    <div class="s-group">
                        <label for="email">Email : <span class="input-red" title="Required Field">*</span></label>
                        <input id="email" type="email" placeholder="Used for login" name="email" autocomplete="off" onkeyup="ncheck()" readonly required/>
                    </div>

                    <div class="s-group">
                        <label for="pass">Password : <span class="input-red" title="Required Field">*</span></label>
                        <input id="pass" type="password" placeholder="Used for login" name="pass" autocomplete="off" readonly required/>
                    </div>

                    <div class="s-group">
                        <label for="rpass"> Retype Password : <span class="input-red" title="Required Field">*</span></label>
                        <input id="rpass" type="password" placeholder="Retype your password" autocomplete="off" readonly required/>
                    </div>

                    <div class="input-checkbox">
                        <input id="showrpass" type="checkbox"/>
                        <label for="showlpass">Show Password</label>
                    </div>

                    <div class="form-block">
                        <a class="form-change" href="login"> <i class="fas fa-arrow-left"></i> Login </a>
                        <button class="btn-csgo" type="submit">Register</button>
                    </div>

                </form>

                <% }%>
            </div>

        </div>
        <script src="/CS121/res/js/sign.js"></script>
        <jsp:include page="/footer"/>
    </body>
</html>
