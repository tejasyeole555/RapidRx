<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.rapidrx.model.CartItem" %>

<%
    String userName = (String) session.getAttribute("userName");

    if (userName == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<CartItem> cart =
        (List<CartItem>) session.getAttribute("cart");

    double grandTotal = 0;
%>

<!DOCTYPE html>
<html>

<head>
    <title>RapidRx - Cart</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<div class="container">
    <body>

    <h2>RapidRx - Shopping Cart</h2>

    <p>Welcome, <%= userName %></p>

    <%
        if (cart == null || cart.isEmpty()) {
    %>

        <h3>Your cart is empty.</h3>

        <a href="medicines">Continue Shopping</a>

    <%
        } else {
    %>

    <table border="1" cellpadding="10">

        <tr>
            <th>Medicine</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
            <th>Action</th>
        </tr>

    <%
            for (CartItem item : cart) {

                double total = item.getTotal();
                grandTotal += total;
    %>

        <tr>

            <td>
                <%= item.getMedicineName() %>
            </td>

            <td>
                ₹ <%= item.getPrice() %>
            </td>

            <td>

                <form action="cart" method="get">

                    <input type="hidden"
                        name="action"
                        value="update">

                    <input type="hidden"
                        name="id"
                        value="<%= item.getMedicineId() %>">

                    <input type="number"
                        name="quantity"
                        value="<%= item.getQuantity() %>"
                        min="1">

                    <button type="submit">
                        Update
                    </button>

                </form>

            </td>

            <td>
                ₹ <%= total %>
            </td>

            <td>

                <a href="cart?action=remove&id=<%= item.getMedicineId() %>">
                    Remove
                </a>

            </td>

        </tr>

    <%
            }
    %>

    </table>

    <h3>
        Grand Total: ₹ <%= grandTotal %>
    </h3>

    <a href="medicines">Continue Shopping</a>

    <br><br>

    <button>
        <a href="checkout.jsp">Proceed to Checkout</a>
    </button>

    <%
        }
    %>

    <br><br>

    <a href="dashboard.jsp">Back to Dashboard</a>

    </body>
</div>
</html>