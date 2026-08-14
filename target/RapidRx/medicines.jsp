<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.rapidrx.model.Medicine" %>

<%
    String userName = (String) session.getAttribute("userName");

    if (userName == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Medicine> medicines =
        (List<Medicine>) request.getAttribute("medicines");
%>

<!DOCTYPE html>
<html>
<head>
    <title>RapidRx - Medicines</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<div class="container">
    <body>

    <h2>RapidRx Medicine Store</h2>

    <h3>Welcome, <%= userName %></h3>

    <table border="1" cellpadding="10">

        <tr>
            <th>ID</th>
            <th>Medicine Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Action</th>
        </tr>

        <%
            if (medicines != null) {
                for (Medicine medicine : medicines) {
        %>

        <tr>
            <td><%= medicine.getId() %></td>
            <td><%= medicine.getName() %></td>
            <td><%= medicine.getCategory() %></td>
            <td>₹ <%= medicine.getPrice() %></td>
            <td><%= medicine.getStock() %></td>

            <td>
                <a href="cart?action=add&id=<%= medicine.getId() %>">Add to Cart</a>
            </td>
        </tr>

        <%
                }
            }
        %>

    </table>

    <br>

    <a href="dashboard.jsp">Back to Dashboard</a>

    </body>
</div>
</html>