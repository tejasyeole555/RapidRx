<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="com.rapidrx.model.Order" %>
<%@ page import="com.rapidrx.model.CartItem" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Order order =
        (Order) request.getAttribute("order");

    List<CartItem> items =
        (List<CartItem>) request.getAttribute("orderItems");

    if (order == null) {
        response.sendRedirect("order-history");
        return;
    }
%>

<!DOCTYPE html>

<html>

<head>

    <title>RapidRx - Order Details</title>
    <link rel="stylesheet" href="css/style.css">

</head>
<div class="container">
    <body>

    <h2>RapidRx - Order Details</h2>

    <hr>

    <h3>
        Order #<%= order.getId() %>
    </h3>

    <p>
        <strong>Status:</strong>
        <%= order.getStatus() %>
    </p>

    <p>
        <strong>Delivery Address:</strong>
        <%= order.getAddress() %>
    </p>

    <hr>

    <h3>Medicines</h3>

    <table border="1" cellpadding="10">

        <tr>

            <th>Medicine</th>

            <th>Price</th>

            <th>Quantity</th>

            <th>Total</th>

        </tr>

    <%
        if (items != null) {

            for (CartItem item : items) {

                double itemTotal =
                        item.getPrice() * item.getQuantity();
    %>

        <tr>

            <td>
                <%= item.getMedicineName() %>
            </td>

            <td>
                ₹<%= item.getPrice() %>
            </td>

            <td>
                <%= item.getQuantity() %>
            </td>

            <td>
                ₹<%= itemTotal %>
            </td>

        </tr>

    <%
            }
        }
    %>

    </table>

    <br>

    <h3>
        Total Amount:
        ₹<%= order.getTotalAmount() %>
    </h3>

    <br>

    <a href="order-history">
        ← Back to Order History
    </a>

    <br><br>

    <a href="dashboard.jsp">
        Back to Dashboard
    </a>

    </body>
</div>
</html>