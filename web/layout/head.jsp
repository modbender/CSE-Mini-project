<%@page import="dbconn.Connect,static dbconn.Connect.con" %>

<%
    if (con == null || con.isClosed()) {
        dbconn.Connect.main(null);
    }
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="shortcut icon" href="/CS121/res/img/favicon.ico" type="image/x-icon"/>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/CS121/res/css/basic.css"/>

<script src="res/js/jquery-3.3.1.min.js"></script>