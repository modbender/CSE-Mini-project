<% String uri = def.Misc.uri(request.getRequestURI()); %>
<header class="navbar flash-bg">
    <div class="nav-logo">
        <a class="" href="/CS121/"> Quiz </a>
    </div>
    <div class="nav-tabs-container">
        <ul class="inline-list nav-tabs">
            <li class="nav-tab"> <a class="nav-link <% if(uri.equals("")) { %>active<% } %>" href="/CS121/"> <i class="fas fa-home"></i> Home</a> </li>
            <li class="nav-tab"> <a class="nav-link <% if(uri.equals("login")) { %>active<% } %>" href="/CS121/user/login"> <i class="fas fa-sign-in-alt"></i> Login</a> </li>
            <li class="nav-tab"> <a class="nav-link <% if(uri.equals("signup")) { %>active<% } %>" href="/CS121/user/signup"> <i class="fas fa-user-plus"></i> Sign Up</a> </li>
        </ul>
    </div>
</header>