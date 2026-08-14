<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Object total = session.getAttribute("orderTotal");
    String paymentMethod =
            (String) session.getAttribute("paymentMethod");
    String paymentStatus =
            (String) session.getAttribute("paymentStatus");
%>

<!DOCTYPE html>
<html>
<head>
    <title>RapidRx - Order Confirmation</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<div class="container">
    <body>

    <h1>Order Placed Successfully! 🎉</h1>

    <p>
        <strong>Total Amount:</strong>
        ₹<%= total %>
    </p>

    <p>
        <strong>Payment Method:</strong>
        <%= paymentMethod %>
    </p>

    <p>
        <strong>Payment Status:</strong>
        <%= paymentStatus %>
    </p>

    <p>
        <strong>Order Status:</strong>
        Placed
    </p>

    <br>

    <a href="dashboard.jsp">Back to Dashboard</a>

    </body>
</div>
</html>