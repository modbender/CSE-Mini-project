<%@page import="java.util.Date"%>
<%@page import="def.Misc,java.sql.ResultSet,static dbconn.Connect.st"%>
<%
    session = request.getSession(false);
    if (session.getAttribute("name") != null) {
        String name, type, email, dob = null, phno = null, date;
        dbconn.Connect.main(null);
        ResultSet rs = st.executeQuery("select * from users where uid=" + session.getAttribute("uid") + ";");
        if (rs.next()) {
            name = rs.getString("uname");
            type = rs.getString("utype");
            email = rs.getString("uemail");
            date = rs.getString("udate");

%>


<div class="jumbotron">

    <div class="display-4 text-center">Profile</div>
    <hr class="my-4"/>
    <div class="row">
        <div class="col-sm-2">
            <img class="img-fluid rounded-circle" src="<%=Misc.res("profile.png")%>"/>
        </div>
        <div class="col-sm-10">
            <div style="font-size:18px">
                <p><b>Name :</b> <%=name%></p>
                <p><b>Type :</b> <%=type%></p>
                <p><b>Status :</b> <span class="text-success">Online</span> from <%=new Date(session.getCreationTime()).toString()%></p>
                <p><b>Email :</b> <%=email%></p>
                <% if(dob!=null) {%>
                <p><b>Date of Birth :</b> <%=dob%></p>
                <% } %>
                <% if(phno!=null) {%>
                <p><b>Phone Number :</b> <%=phno%></p>
                <% } %>
                <p><b>Joined on :</b> <%=date%></p>
            </div>
        </div>
    </div>

</div>



<% } else { %>
<h1> No users with your name found</h1>
<% } %>
<% } else { %>
Not Logged in!
<% }%>