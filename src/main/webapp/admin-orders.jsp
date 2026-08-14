<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.rapidrx.model.Order" %>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    List<Order> orders =
            (List<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>
    <title>RapidRx - All Orders</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<div class="container">
    <body>

    <h1>All Customer Orders</h1>

    <a href="admin-dashboard.jsp">Back to Dashboard</a>

    <br><br>

    <table border="1" cellpadding="10">

        <tr>
            <th>Order ID</th>
            <th>User ID</th>
            <th>Total Amount</th>
            <th>Delivery Address</th>
            <th>Order Status</th>
            <th>Payment Method</th>
            <th>Payment Status</th>
        </tr>

        <%
            if (orders != null && !orders.isEmpty()) {
                for (Order order : orders) {
        %>

        <tr>
            <td><%= order.getId() %></td>
            <td><%= order.getUserId() %></td>
            <td>₹<%= order.getTotalAmount() %></td>
            <td><%= order.getAddress() %></td>
            <td><%= order.getStatus() %></td>
            <td><%= order.getPaymentMethod() %></td>
            <td><%= order.getPaymentStatus() %></td>
        </tr>

        <%
                }
            } else {
        %>

        <tr>
            <td colspan="7">No orders found.</td>
        </tr>

        <%
            }
        %>

    </table>

    </body>
</div>
</html>