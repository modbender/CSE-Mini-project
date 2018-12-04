<%-- 
    Document   : logout
    Created on : 11 Nov, 2018, 12:28:33 PM
    Author     : Yashas Hr
--%>

<%
    session = request.getSession(false);
    String msg = null;
    int type=0;
    if (session.getAttribute("name") == null) {
        msg = "Not Logged In!";
        type=1;
    } else {
        session.invalidate();
        msg = "Logout successful!";
    }
%>

<% if(request.getAttribute("html")==null) {%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="refresh" content="5; url=/CS121/" />
        <jsp:include page="/ahead"/>
        <title>Logout</title>
    </head>
    <body>
        <h1 class="text-center"><% if (msg != null) {%> <span class="<% if(type==1){ %>text-danger<% } else { %>text-success<% } %>">  <%=msg%> </span>  <% } %></h1>
    </body>
</html>
<% } %>