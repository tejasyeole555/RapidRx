<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    String adminName =
            (String) session.getAttribute("adminName");
%>

<!DOCTYPE html>
<html>
<head>
    <title>RapidRx - Admin Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<div class="container">
    <body>

    <h1>Welcome Admin, <%= adminName %>!</h1>

    <h2>Admin Dashboard</h2>

    <ul>
        <li><a href="admin-medicines">💊 Manage Medicines</a></li>
        <li><a href="admin-orders">📦 View All Orders</a></li>
        <li><a href="admin-logout">🚪 Logout</a></li>
    </ul>

    </body>
</div>
</html>