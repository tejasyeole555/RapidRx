<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>RapidRx - Upload Prescription</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<div class="container">
    <body>

    <h2>RapidRx - Upload Prescription</h2>

    <p>Select your prescription image:</p>

    <form action="upload-prescription"
        method="post"
        enctype="multipart/form-data">

        <input type="file"
            name="prescription"
            accept=".jpg,.jpeg,.png"
            required>

        <br><br>

        <button type="submit">Upload Prescription</button>

    </form>

    <br>

    <a href="dashboard.jsp">Back to Dashboard</a>

    </body>
</div>
</html>