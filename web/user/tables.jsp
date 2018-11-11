<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<%@page import="java.sql.ResultSet,static dbconn.Connect.st"%>
<%
    session = request.getSession(false);
    if (session.getAttribute("name") != null) {
        String name, type, email, dob, phno, date;
        dbconn.Connect.main(null);
        ResultSet rs1 = st.executeQuery("select * from users;");
        dbconn.Connect.main(null);
        ResultSet rs2 = st.executeQuery("select * from qs");
        dbconn.Connect.main(null);
        ResultSet rs3 = st.executeQuery("select uname,correct,wrong,percentage from results r,users u where r.uid = u.uid;");
        dbconn.Connect.main(null);
        ResultSet rs4 = st.executeQuery("select * from winners");
        rs1.last();
        int userLen = rs1.getRow();
        rs1.beforeFirst();
        rs2.last();
        int qsLen = rs2.getRow();
        rs2.beforeFirst();
        rs3.last();
        int resLen = rs3.getRow();
        rs3.beforeFirst();
        rs4.last();
        int winLen = rs4.getRow();
        rs4.beforeFirst();
%>


<div class="accordion" id="accordionTables">
    <% if (userLen != 0) {%>
    <div class="card">
        <div class="card-header bg-warning" id="headingOne">
            <h5 class="mb-0">
                <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                    <i class="fas fa-users"></i>
                    Users
                </button>
            </h5>
        </div>

        <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionTables">
            <div class="card-body">

                <table id="user-table" class="table table-striped table-bordered" width="100%">
                    <thead>
                        <tr>
                            <th>Type</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>D.O.B</th>
                            <th>Ph. No.</th>
                            <th>Created Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < userLen; i++) {
                                rs1.next();
                        %>
                        <tr>
                            <% for (int j = 2; j < 8; j++) {%>
                            <td>
                                <%=rs1.getString(j) != null ? rs1.getString(j) : "-"%>
                            </td>
                            <% } %>
                        </tr>
                        <% } %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Type</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>D.O.B</th>
                            <th>Ph. No.</th>
                            <th>Created Date</th>
                        </tr>
                    </tfoot>
                </table>
                <script>
                    $(document).ready(function () {
                        $("#user-table").DataTable();
                    });
                </script>

            </div>
        </div>
    </div>

    <% } else {%>
    <h6>No users added</h6>
    <% } %>

    <% if (qsLen != 0) {%>
    <div class="card">
        <div class="card-header bg-warning" id="headingTwo">
            <h5 class="mb-0">
                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    <i class="fas fa-question"></i>
                    Questions
                </button>
            </h5>
        </div>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionTables">
            <div class="card-body">

                <table id="ques-table" class="table table-striped table-bordered" width="100%">
                    <thead>
                        <tr>
                            <th>Question</th>
                            <th>Options</th>
                            <th>Answer</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < qsLen; i++) {
                                rs2.next();
                        %>
                        <tr>
                            <% for (int j = 2; j < 5; j++) {%>
                            <td>
                                <%=rs2.getString(j) != null ? rs2.getString(j) : "-"%>
                            </td>
                            <% } %>
                        </tr>
                        <% } %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Question</th>
                            <th>Options</th>
                            <th>Answer</th>
                        </tr>
                    </tfoot>
                </table>
                <script>
                    $(document).ready(function () {
                        $("#ques-table").DataTable();
                    });
                </script>

            </div>
        </div>
    </div>
    <% } else {%>
    <h6>No questions added</h6>
    <% } %>

    <% if (resLen != 0) {%>
    <div class="card">
        <div class="card-header bg-warning" id="headingThree">
            <h5 class="mb-0">
                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    <i class="fas fa-poll"></i>
                    Results
                </button>
            </h5>
        </div>
        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionTables">
            <div class="card-body">

                <table id="res-table" class="table table-striped table-bordered" width="100%">
                    <thead>
                        <tr>
                            <th>User</th>
                            <th>Correct</th>
                            <th>Wrong</th>
                            <th>Percentage</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < resLen; i++) {
                                rs3.next();
                        %>
                        <tr>
                            <% for (int j = 1; j < 4; j++) {%>
                            <td>
                                <%=rs3.getString(j) != null ? rs3.getString(j) : "-"%>
                            </td>
                            <% } %>
                        </tr>
                        <% } %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>User</th>
                            <th>Correct</th>
                            <th>Wrong</th>
                            <th>Percentage</th>
                        </tr>
                    </tfoot>
                </table>
                <script>
                    $(document).ready(function () {
                        $("#res-table").DataTable();
                    });
                </script>

            </div>
        </div>
    </div>
    <% } else {%>
    <h6>No results yet</h6>
    <% } %>

    <% if (winLen != 0) {%>
    <div class="card">
        <div class="card-header bg-warning" id="headingFour">
            <h5 class="mb-0">
                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                    <i class="fas fa-trophy"></i>
                    Winners
                </button>
            </h5>
        </div>
        <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionTables">
            <div class="card-body">

                <table id="win-table" class="table table-striped table-bordered" width="100%">
                    <thead>
                        <tr>
                            <th>User</th>
                            <th>Correct</th>
                            <th>Wrong</th>
                            <th>Percentage</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < winLen; i++) {
                                rs4.next();
                        %>
                        <tr>
                            <% for (int j = 1; j < 4; j++) {%>
                            <td>
                                <%=rs4.getString(j) != null ? rs4.getString(j) : "-"%>
                            </td>
                            <% } %>
                        </tr>
                        <% } %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>User</th>
                            <th>Correct</th>
                            <th>Wrong</th>
                            <th>Percentage</th>
                        </tr>
                    </tfoot>
                </table>
                <script>
                    $(document).ready(function () {
                        $("#win-table").DataTable();
                    });
                </script>

            </div>
        </div>
    </div>
    <% } else {%>
    <h6>No winners yet</h6>
    <% } %>

</div>







<% } else { %>
Not Logged in!
<% }%>