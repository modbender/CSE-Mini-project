<%
    session = request.getSession(false);
    if (session.getAttribute("type")=="admin") {
%>
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-2 border-right">
                        <i class="fas fa-6x fa-database"></i>
                    </div>
                    <div class="col-md-8 border-right">
                        <span class="display-4">Delete and Recreate DB</span>
                    </div>
                    <div class="col-md-2">
                        <button type="button" class="btn btn-primary btn-lg" onclick="confirm('Doing this will erase all your data!') ? location.href = 'reset.jsp' : console.log('Reset Cancelled!');">
                            <i class="fab fa-rev"></i>
                            Reset DB
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<% } else { %>
Not logged in
<% }%>