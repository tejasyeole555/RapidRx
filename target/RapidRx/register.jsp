<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>RapidRx - Register</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<div class="container">
    <body>

        <h2>RapidRx - Create Account</h2>

        <%
            String error = request.getParameter("error");

            if ("failed".equals(error)) {
        %>
            <p style="color:red;">
                Registration failed. Email may already exist.
            </p>
        <%
            }
        %>

        <form action="register" method="post">

            <label>Name:</label>
            <input type="text" name="name" required>

            <br><br>

            <label>Email:</label>
            <input type="email" name="email" required>

            <br><br>

            <label>Password:</label>
            <input type="password" name="password" required>

            <br><br>

            <button type="submit">Register</button>

        </form>

        <br>

        <p>
            Already have an account?
            <a href="login.jsp">Login Here</a>
        </p>

    </body>
</div>
</html>