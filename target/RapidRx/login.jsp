<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>RapidRx - Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<div class="container">
    <body>

    <h2>RapidRx - Login</h2>

    <%
        String message = request.getParameter("message");
        String error = request.getParameter("error");

        if ("registered".equals(message)) {
    %>
        <p style="color:green;">
            Registration successful! Please login.
        </p>
    <%
        }

        if ("invalid".equals(error)) {
    %>
        <p style="color:red;">
            Invalid Email or Password!
        </p>
    <%
        }
    %>

    <form action="login" method="post">

        <label>Email:</label>
        <input type="email" name="email" required>

        <br><br>

        <label>Password:</label>
        <input type="password" name="password" required>

        <br><br>

        <button type="submit">Login</button>

    </form>

    <br>

    <p>
        Don't have an account?
        <a href="register.jsp">Register Here</a>
    </p>

    </body>
</div>
</html>