<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Registration</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h2>Customer Registration</h2>
    <form action="register" method="post">
        Name: <input type="text" name="name"><br>
        Email: <input type="text" name="email"><br>
        Customer Type: <input type="text" name="customerType"><br>
        Username: <input type="text" name="username"><br>
        Password: <input type="password" name="password"><br>
        <input type="submit" value="Register">
    </form>
</body>
</html>
