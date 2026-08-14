<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>RapidRx - Admin Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<div class="container">
    <body>

    <h1>RapidRx Admin Login</h1>

    <%
        String error = request.getParameter("error");

        if ("invalid".equals(error)) {
    %>
        <p style="color:red;">Invalid Username or Password!</p>
    <%
        }
    %>

    <form action="admin-login" method="post">

        <label>Username:</label>
        <input type="text" name="username" required>

        <br><br>

        <label>Password:</label>
        <input type="password" name="password" required>

        <br><br>

        <button type="submit">Login</button>

    </form>

    <br>

    <a href="login.jsp">User Login</a>

    </body>
</div>
</html>