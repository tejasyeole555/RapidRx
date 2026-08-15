<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.rapidrx.model.Medicine" %>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    List<Medicine> medicines =
            (List<Medicine>) request.getAttribute("medicines");
%>

<!DOCTYPE html>
<html>
<head>
    <title>RapidRx - Low Stock Alert</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">

    <h1>⚠ Low Stock Alert</h1>

    <a href="admin-dashboard.jsp">Back to Dashboard</a>

    <br><br>

    <table border="1" cellpadding="10">

        <tr>
            <th>ID</th>
            <th>Medicine Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Current Stock</th>
        </tr>

        <%
            if (medicines != null && !medicines.isEmpty()) {

                for (Medicine medicine : medicines) {
        %>

        <tr>
            <td><%= medicine.getId() %></td>
            <td><%= medicine.getName() %></td>
            <td><%= medicine.getCategory() %></td>
            <td>₹<%= medicine.getPrice() %></td>
            <td><%= medicine.getStock() %></td>
        </tr>

        <%
                }

            } else {
        %>

        <tr>
            <td colspan="5">
                No low stock medicines. All stock levels are good!
            </td>
        </tr>

        <%
            }
        %>

    </table>

</div>

</body>
</html>