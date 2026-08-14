<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String orderId = request.getParameter("orderId");
%>

<!DOCTYPE html>
<html>

<head>
    <title>RapidRx - Order Successful</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<div class="container">
    <body>

    <h2>🎉 Order Placed Successfully!</h2>

    <p>
        Thank you for shopping with RapidRx.
    </p>

    <p>
        Your Order ID is:
        <strong>#<%= orderId %></strong>
    </p>

    <p>
        <strong>Payment Method:</strong>
        <%= session.getAttribute("paymentMethod") %>
    </p>

    <p>
        <strong>Payment Status:</strong>
        <%= session.getAttribute("paymentStatus") %>
    </p>

    <br>

    <a href="medicines">
        Continue Shopping
    </a>

    <br><br>

    <a href="dashboard.jsp">
        Back to Dashboard
    </a>

    </body>
</div>
</html>