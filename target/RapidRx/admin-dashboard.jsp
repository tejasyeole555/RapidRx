<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    String adminName =
            (String) session.getAttribute("adminName");

    Integer totalMedicines =
            (Integer) request.getAttribute("totalMedicines");

    Integer totalOrders =
            (Integer) request.getAttribute("totalOrders");

    Integer totalUsers =
            (Integer) request.getAttribute("totalUsers");

    Integer lowStockCount =
            (Integer) request.getAttribute("lowStockCount");

    if (totalMedicines == null) totalMedicines = 0;
    if (totalOrders == null) totalOrders = 0;
    if (totalUsers == null) totalUsers = 0;
    if (lowStockCount == null) lowStockCount = 0;
%>

<!DOCTYPE html>
<html>
<head>
    <title>RapidRx - Admin Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">

    <h1>Welcome Admin, <%= adminName %>!</h1>

    <h2>Admin Dashboard</h2>

    <!-- Dashboard Statistics -->
    <h3>Dashboard Statistics</h3>

    <div class="stats-container">

        <div class="stat-card">
            <h3>💊 Total Medicines</h3>
            <div class="number">
                <%= totalMedicines %>
            </div>
        </div>

        <div class="stat-card">
            <h3>📦 Total Orders</h3>
            <div class="number">
                <%= totalOrders %>
            </div>
        </div>

        <div class="stat-card">
            <h3>👥 Total Users</h3>
            <div class="number">
                <%= totalUsers %>
            </div>
        </div>

        <div class="stat-card">
            <h3>⚠ Low Stock</h3>
            <div class="number">
                <%= lowStockCount %>
            </div>
        </div>

    </div>

    <!-- Admin Features -->
    <h3>Admin Features</h3>

    <ul class="admin-menu">

        <li>
            <a href="admin-medicines">
                💊 Manage Medicines
            </a>
        </li>

        <li>
            <a href="admin-orders">
                📦 View All Orders
            </a>
        </li>

        <li>
            <a href="low-stock">
                ⚠ Low Stock Alert
            </a>
        </li>

        <li>
            <a href="admin-logout">
                🚪 Logout
            </a>
        </li>

    </ul>

</div>

</body>
</html>