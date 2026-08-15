<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="com.rapidrx.model.Medicine" %>

<%
    Medicine medicine = (Medicine) request.getAttribute("medicine");

    if (medicine == null) {
        response.sendRedirect("admin-medicines.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Medicine - RapidRx</title>
</head>

<body>

<h2>Edit Medicine</h2>

<%
    String error = request.getParameter("error");

    if ("failed".equals(error)) {
%>
    <p style="color:red;">
        Failed to update medicine!
    </p>
<%
    }
%>

<form action="edit-medicine" method="post">

    <input type="hidden" name="id"
           value="<%= medicine.getId() %>">

    <label>Medicine Name:</label><br>
    <input type="text" name="name"
           value="<%= medicine.getName() %>"
           required>

    <br><br>

    <label>Category:</label><br>
    <input type="text" name="category"
           value="<%= medicine.getCategory() %>"
           required>

    <br><br>

    <label>Price:</label><br>
    <input type="number" name="price"
           value="<%= medicine.getPrice() %>"
           step="0.01" min="0" required>

    <br><br>

    <label>Stock:</label><br>
    <input type="number" name="stock"
           value="<%= medicine.getStock() %>"
           min="0" required>

    <br><br>

    <button type="submit">Update Medicine</button>

</form>

<br>

<a href="admin-medicines.jsp">← Back to Medicines</a>

</body>
</html>