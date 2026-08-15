<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Object total = session.getAttribute("orderTotal");

    if (total == null) {
        response.sendRedirect("cart");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>RapidRx - Online Payment</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<div class="container">
    <body>

    <h2>Simulated Online Payment</h2>

    <p>
        <strong>Total Amount:</strong>
        ₹<%= total %>
    </p>

    <p>This is a simulated payment for the RapidRx project.</p>

    <form action="online-payment" method="post">

        <label>Simulation ID:</label>
        <input type="text"
            name="simulationId"
            placeholder="TEST123"
            required>

        <br><br>

        <button type="submit">
            Pay Now
        </button>

    </form>

    <br>

    <a href="payment.jsp">Back to Payment</a>

    </body>
</div>
</html>