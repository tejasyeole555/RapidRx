<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>RapidRx - Add Medicine</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<div class="container">
    <body>

    <h1>Add New Medicine</h1>

    <form action="add-medicine" method="post">

        <label>Medicine Name:</label>
        <input type="text" name="name" required>

        <br><br>

        <label>Category:</label>
        <input type="text" name="category" required>

        <br><br>

        <label>Price:</label>
        <input type="number"
            name="price"
            step="0.01"
            min="0"
            required>

        <br><br>

        <label>Stock:</label>
        <input type="number"
            name="stock"
            min="0"
            required>

        <br><br>

        <button type="submit">Add Medicine</button>

    </form>

    <br>

    <a href="admin-medicines">Back</a>

    </body>
</div>
</html>