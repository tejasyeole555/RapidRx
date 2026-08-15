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
    <title>RapidRx - Manage Medicines</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">

    <h1>Manage Medicines</h1>

    <a href="admin-dashboard.jsp">Back to Dashboard</a>

    <br><br>

    <a href="add-medicine.jsp">
        <button>Add New Medicine</button>
    </a>

    <br><br>

    <%
        String message = request.getParameter("message");

        if ("updated".equals(message)) {
    %>
        <p style="color:green;">
            Medicine updated successfully!
        </p>
    <%
        }
    %>

    <table border="1" cellpadding="10">

        <tr>
            <th>ID</th>
            <th>Name</th>
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
            <td>₹<%= medicine.getPrice() %></td>
            <td><%= medicine.getStock() %></td>

            <td>

                <!-- EDIT -->
                <a href="edit-medicine?id=<%= medicine.getId() %>">
                    Edit
                </a>

                &nbsp; | &nbsp;

                <!-- DELETE -->
                <a href="delete-medicine?id=<%= medicine.getId() %>"
                   onclick="return confirm('Delete this medicine?')">
                    Delete
                </a>

            </td>
        </tr>

        <%
                }
            }
        %>

    </table>

</div>

</body>
</html>