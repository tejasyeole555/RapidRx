<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>RapidRx - Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">

    <h1>💊 Welcome to RapidRx</h1>

    <p>Your online medicine management and shopping platform.</p>

    <hr>

    <h2>Quick Access</h2>

    <div class="dashboard-menu">

        <a href="medicines" class="dashboard-card">
            <h3>💊 Medicines</h3>
            <p>View and search available medicines.</p>
        </a>

        <a href="cart" class="dashboard-card">
            <h3>🛒 My Cart</h3>
            <p>View medicines added to your cart.</p>
        </a>

        <a href="order-history" class="dashboard-card">
            <h3>📦 My Orders</h3>
            <p>View your previous orders.</p>
        </a>

        <a href="uploadPrescription.jsp" class="dashboard-card">
            <h3>📄 Upload Prescription</h3>
            <p>Upload your doctor's prescription.</p>
        </a>

        <a href="logout" class="dashboard-card logout-card">
            <h3>🚪 Logout</h3>
            <p>Logout from your RapidRx account.</p>
        </a>

    </div>

</div>

</body>
</html>