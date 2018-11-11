<nav class="navbar navbar-expand-lg navbar-light bg-success shadow">
    <a class="navbar-brand" href="#"> <i class="fas fa-bolt"></i> Admin Panel</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/CS121/">
                    <i class="fas fa-home"></i>
                    Home
                </a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            
            <%
                session = request.getSession(false);
                if (session.getAttribute("name") != null) {
            %>
            <li class="nav-item">
                <a class="nav-link" href="/CS121/logout">
                    <i class="fas fa-sign-out-alt"></i>
                    Logout
                </a>
            </li>
            <% } else { %>
            Login to continue
            <% }%>
        </ul>
    </div>
</nav>