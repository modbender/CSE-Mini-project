<%-- 
    Document   : login
    Created on : 23 Aug, 2018, 10:29:10 PM
    Author     : Yashas Hr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <jsp:include page="/head"/>
        <% String uri = def.Misc.uri(request.getRequestURI()); %>
        <link rel="stylesheet" type="text/css" href="/CS121/res/css/sign.css"/>
        <title><% if(uri.contains("admin")) { %>Admin <% } if (uri.contains("login")) { %>Login<% } else if (uri.contains("signup")) { %>Sign Up<% } %></title>
    </head>
    <body>
        <jsp:include page="/header"/>
        <%=uri%>
        <div class="sign-container">

            <div class="form-container">

                <% if (uri.contains("login")) { %>

                <form id="logForm" name="login" action="login_go" method="post">

                    <h2 class="form-title"> Login </h2>

                    <input type="text" name="type" value="<% if(uri.contains("admin")) { %>admin<% } else if(uri.contains("user")) { %>user<% } %>" hidden/>

                    <div class="s-group">
                        <label for="lemail">Email :</label>
                        <input id="lemail" type="email" name="uName" autocomplete="off" readonly autofocus required/>
                    </div>

                    <div class="s-group">
                        <label for="lpass">Password : </label>
                        <input id="lpass" type="password" name="uPass" autocomplete="off" readonly required/>
                    </div>

                    <div class="input-checkbox">
                        <input id="showlpass" type="checkbox" onclick=""/>
                        <label for="showlpass">Show Password</label>
                    </div>

                    <div class="form-block">
                        <a class="form-change" href="signup"> Register <i class="fas fa-arrow-right"></i> </a>
                        <button class="btn-csgo" type="submit">Login</button>
                    </div>

                </form>

                <% } else if (uri.contains("signup")) { %>

                <form id="regForm" name="register" class="form" action="register_go" method="post">

                    <h2 class="form-title"> Sign Up </h2>

                    <input type="text" name="type" value="<% if(uri.contains("admin")) { %>admin<% } else if(uri.contains("user")) { %>user<% } %>" hidden/>

                    <div class="s-group">
                        <label for="fname">Full Name : <span class="input-red" title="Required Field">*</span></label>
                        <input id="fname" type="text" name="fname" autocomplete="off" readonly autofocus required/>
                    </div>

                    <div class="s-group">
                        <label for="email">Email : <span class="input-red" title="Required Field">*</span></label>
                        <input id="email" type="email" placeholder="Used for login" name="email" autocomplete="off" readonly required/>
                    </div>

                    <div class="s-group">
                        <label for="dob">Date of Birth :</label>
                        <input id="dob" type="date" name="dob" autocomplete="off"/>
                    </div>

                    <div class="s-group">
                        <label for="phno">Phone Number :</label>
                        <input id="phno" type="tel" name="phno" autocomplete="off" readonly/>
                    </div>

                    <div class="s-group">
                        <label for="pass">Password : <span class="input-red" title="Required Field">*</span></label>
                        <input id="pass" type="password" placeholder="Used for login" name="pass" autocomplete="off" readonly required/>
                    </div>

                    <div class="s-group">
                        <label for="rpass"> Retype Password : <span class="input-red" title="Required Field">*</span></label>
                        <input id="rpass" type="password" placeholder="Retype your password" autocomplete="off" readonly required/>
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
