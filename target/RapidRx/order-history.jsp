<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="com.rapidrx.model.Order" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Order> orders =
        (List<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>

<head>

    <title>RapidRx - Order History</title>
    <link rel="stylesheet" href="css/style.css">

</head>
<div class="container">
    <body>

    <h2>RapidRx - My Orders</h2>

    <%
        if (orders == null || orders.isEmpty()) {
    %>

        <p>You have not placed any orders yet.</p>

        <a href="medicines">
            Browse Medicines
        </a>

    <%
        } else {
    %>

    <table border="1" cellpadding="10">

        <tr>
            <th>Order ID</th>
            <th>Total Amount</th>
            <th>Address</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

    <%
        for (Order order : orders) {
    %>

        <tr>

            <td>
                #<%= order.getId() %>
            </td>

            <td>
                ₹<%= order.getTotalAmount() %>
            </td>

            <td>
                <%= order.getAddress() %>
            </td>

            <td>
                <%= order.getStatus() %>
            </td>

            <td>
                <a href="order-details?id=<%= order.getId() %>">
                    View Details
                </a>
            </td>

        </tr>

    <%
        }
    %>

    </table>

    <%
        }
    %>

    <br>

    <a href="dashboard.jsp">
        Back to Dashboard
    </a>

    </body>
</div>
</html>