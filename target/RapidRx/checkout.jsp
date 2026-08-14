<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>
    <title>RapidRx - Checkout</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<div class="container">
    <body>

    <h2>RapidRx - Checkout</h2>

    <form action="place-order" method="post">

        <label>Delivery Address:</label>

        <br>

        <textarea name="address"
                rows="5"
                cols="50"
                required></textarea>

        <br><br>

        <button type="submit">
            Place Order
        </button>

    </form>

    <br>

    <a href="cart.jsp">
        Back to Cart
    </a>

    </body>
</div>
</html>