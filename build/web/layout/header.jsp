<%
    String uri = def.Misc.uri(request.getRequestURI());
    session = request.getSession(false);
%>
<header class="navbar flash-bg">
    <div class="nav-logo">
        <a class="" href="/CS121/"> Quiz </a>
    </div>
    <div class="nav-tabs-container">
        <ul class="inline-list nav-tabs">
            <li class="nav-tab"> <a class="nav-link player-btn" id="state-btn" href="javascript:void(0);"><i id="state" class="fas fa-play"></i></a>
            <li class="nav-tab"> <a class="nav-link player-btn" id="volume-btn" href="javascript:void(0);"><i id="volume" class="fas fa-volume-mute"></i></a>
            <li class="nav-tab"> <a class="nav-link <% if (uri.equals("")) { %>active<% } %>" href="/CS121/"> <i class="fas fa-home"></i> Home</a> </li>
                <% if (session.getAttribute("name") != null && session.getAttribute("type").equals("admin")) { %>
            <li class="nav-tab"> <a class="nav-link <% if (uri.contains("login")) { %>active<% } %>" href="/CS121/user/login"> <i class="fas fa-bolt"></i> Admin</a> </li>
                <% } %>
                <% if (session.getAttribute("name") == null) { %>
            <li class="nav-tab"> <a class="nav-link <% if (uri.contains("login")) { %>active<% } %>" href="/CS121/user/login"> <i class="fas fa-sign-in-alt"></i> Login</a> </li>
            <li class="nav-tab"> <a class="nav-link <% if (uri.contains("signup")) { %>active<% }%>" href="/CS121/user/signup"> <i class="fas fa-user-plus"></i> Sign Up</a> </li>
                <% } else { %>
            <li class="nav-item">
                <a class="nav-link" href="/CS121/logout">
                    <i class="fas fa-sign-out-alt"></i>
                    Logout
                </a>
            </li>
            <% }%>
        </ul>
    </div>
</header>