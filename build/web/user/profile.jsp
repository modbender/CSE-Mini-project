<%-- 
    Document   : profile
    Created on : 23 Aug, 2018, 10:29:39 PM
    Author     : Yashas Hr
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="static dbconn.Connect.st"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/head"/>
        <title>Profile</title>
    </head>
    <body>
        <jsp:include page="/header"/>
        <%
            session = request.getSession(false);
            if(session.getAttribute("name") != null){
                dbconn.Connect.main(null);
                ResultSet rs = st.executeQuery("select * from users where uname='"+session.getAttribute("name")+"';");
                rs.next();
                String name = "";
        %>
        <script>
            document.title = "<%=name%> | "+document.title;
        </script>
        <%=name%>
        <% } else { %>
        <h2>Not logged in</h2>
        <% } %>
        <jsp:include page="/footer"/>
    </body>
</html>
