<%-- 
    Document   : frame.jsp
    Created on : 10 Nov, 2018, 9:35:05 PM
    Author     : Yashas Hr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/ahead"/>
        <title>Admin Panel</title>
    </head>
    <body>
        <jsp:include page="/aheader"/>
        <%
            session = request.getSession(false);
            if (session.getAttribute("name") != null && session.getAttribute("type").equals("admin")) {
        %>

        <div class="m-3">
            <div class="row">
                <div class="col-2 border-right">
                    <div class="nav flex-column nav-pills nav-justified" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="nav-link active" id="v-pills-dashboard-tab" data-toggle="pill" href="#v-pills-dashboard" role="tab" aria-controls="v-pills-dashboard" aria-selected="true">
                            <i class="fas fa-tachometer-alt"></i>
                            Dashboard
                        </a>
                        <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">
                            <i class="fas fa-user"></i>
                            My Profile
                        </a>
                        <a class="nav-link" id="v-pills-add-tab" data-toggle="pill" href="#v-pills-add" role="tab" aria-controls="v-pills-add" aria-selected="false">
                            <i class="fas fa-cog"></i>
                            Add Questions
                        </a>
                        <a class="nav-link" id="v-pills-tables-tab" data-toggle="pill" href="#v-pills-tables" role="tab" aria-controls="v-pills-tables" aria-selected="false">
                            <i class="fas fa-th"></i>
                            Tables
                        </a>
                        <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">
                            <i class="fas fa-cog"></i>
                            Settings
                        </a>
                    </div>
                </div>
                <div class="col-10">
                    <div class="tab-content" id="v-pills-tabContent">
                        <div class="tab-pane fade show active" id="v-pills-dashboard" role="tabpanel" aria-labelledby="v-pills-dashboard-tab">
                            <jsp:include page="/dash"/>
                        </div>
                        <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                            <jsp:include page="/profile"/>
                        </div>
                        <div class="tab-pane fade" id="v-pills-add" role="tabpanel" aria-labelledby="v-pills-add-tab">
                            <jsp:include page="/addQ"/>
                        </div>
                        <div class="tab-pane fade" id="v-pills-tables" role="tabpanel" aria-labelledby="v-pills-tables-tab">
                            <jsp:include page="/tabs"/>
                        </div>
                        <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                            <jsp:include page="/tools"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <% } else { %>

        <div class="container">
            <h1 class="text-center">
                Login as ADMIN to access
            </h1>
        </div>

        <% }%>
        <%@page import="def.Misc"%>
        <script src="<%=Misc.res("bootstrap.bundle.min.js")%>"></script>
    </body>
</html>
