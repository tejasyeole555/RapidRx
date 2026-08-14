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
    <title>RapidRx - Payment</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<div class="container">
    <body>

    <h1>Payment</h1>

    <h3>
        Total Amount: ₹<%= total %>
    </h3>

    <form action="payment" method="post">

        <h3>Select Payment Method</h3>

        <input type="radio"
            name="paymentMethod"
            value="COD"
            checked>
        Cash on Delivery

        <br><br>

        <input type="radio"
            name="paymentMethod"
            value="ONLINE">
        Online Payment

        <br><br>

        <button type="submit">
            Continue Payment
        </button>

    </form>

    <br>

    <a href="cart">Back to Cart</a>

    </body>
</div>
</html>