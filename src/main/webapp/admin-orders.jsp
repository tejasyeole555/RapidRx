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

    String message = request.getParameter("message");
    String error = request.getParameter("error");
%>

<!DOCTYPE html>
<html>
<head>
    <title>RapidRx - All Orders</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">

    <h1>All Customer Orders</h1>

    <a href="admin-dashboard.jsp">Back to Dashboard</a>

    <br><br>

    <% if ("statusUpdated".equals(message)) { %>
        <p style="color:green;">
            Order status updated successfully!
        </p>
    <% } %>

    <% if ("updateFailed".equals(error)) { %>
        <p style="color:red;">
            Failed to update order status.
        </p>
    <% } %>

    <% if ("invalid".equals(error)) { %>
        <p style="color:red;">
            Invalid order update request.
        </p>
    <% } %>

    <table border="1" cellpadding="10">

        <tr>
            <th>Order ID</th>
            <th>User ID</th>
            <th>Total Amount</th>
            <th>Delivery Address</th>
            <th>Order Status</th>
            <th>Payment Method</th>
            <th>Payment Status</th>
            <th>Update Status</th>
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

            <td>
                <form action="update-order-status" method="post">

                    <input type="hidden"
                           name="orderId"
                           value="<%= order.getId() %>">

                    <select name="status">

                        <option value="PLACED"
                            <%= "PLACED".equalsIgnoreCase(order.getStatus())
                                ? "selected" : "" %>>
                            PLACED
                        </option>

                        <option value="CONFIRMED"
                            <%= "CONFIRMED".equalsIgnoreCase(order.getStatus())
                                ? "selected" : "" %>>
                            CONFIRMED
                        </option>

                        <option value="PROCESSING"
                            <%= "PROCESSING".equalsIgnoreCase(order.getStatus())
                                ? "selected" : "" %>>
                            PROCESSING
                        </option>

                        <option value="OUT FOR DELIVERY"
                            <%= "OUT FOR DELIVERY".equalsIgnoreCase(order.getStatus())
                                ? "selected" : "" %>>
                            OUT FOR DELIVERY
                        </option>

                        <option value="DELIVERED"
                            <%= "DELIVERED".equalsIgnoreCase(order.getStatus())
                                ? "selected" : "" %>>
                            DELIVERED
                        </option>

                    </select>

                    <br><br>

                    <button type="submit">
                        Update
                    </button>

                </form>
            </td>

        </tr>

        <%
                }
            } else {
        %>

        <tr>
            <td colspan="8">No orders found.</td>
        </tr>

        <%
            }
        %>

    </table>

</div>

</body>
</html>