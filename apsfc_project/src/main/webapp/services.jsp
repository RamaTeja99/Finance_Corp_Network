<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Services</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            height: 100vh;
            background-color: #E3F9E5;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #A8D5BA;
            color: #333;
            padding: 10px 20px;
            height: 60px;
        }

        header h2 {
            margin: 0;
        }

        .links {
            display: flex;
            align-items: center;
        }

        .links a {
            color: #333;
            text-decoration: none;
            margin-left: 20px;
        }

        .links a:hover {
            text-decoration: underline;
        }

        .logo {
            height: 40px;
            width: auto;
        }

        .nav-bar {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
        }

        .nav-bar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 18px;
        }

        .nav-bar a:hover {
            text-decoration: underline;
        }

        .center-box {
            width: 800px; /* Adjust width as needed */
            height: 500px; /* Adjust height as needed */
            background-color: #FFFFFF;
            display: flex;
            flex-direction: column;
            align-items: center;
            border-radius: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            padding: 20px;
            box-sizing: border-box;
            margin: 20px auto;
            overflow-y: auto; /* Enable scrolling if content overflows */
        }

        .center-box h1 {
            margin: 0;
            text-align: center; /* Center the heading */
        }

        .grid-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 10px;
            width: 100%;
            margin-top: 20px; /* Space between heading and grid items */
        }

        .grid-item {
            background-color: #D0E3D0;
            border: 1px solid #9CC09C;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            box-sizing: border-box;
            cursor: pointer;
            padding: 10px;
            text-decoration: none;
            color: #333;
            flex: 1 1 30%; /* Ensure items are evenly spaced */
            height: 100px; /* Set a fixed height for consistency */
        }

        footer {
            background-color: #4d4d4d;
            color: white;
            text-align: center;
            padding: 10px;
            margin-top: auto;
        }

        footer a {
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <header>
        <img src="images/logo.png" alt="Logo" class="logo" />
        <h2>Andhra Pradesh State Finance Corporation</h2>
        <nav class="links">
            <img src="images/user.png" alt="User" class="logo" />
        </nav>
    </header>

    <nav class="nav-bar">
        <a href="index.xhtml">Home</a>
        <a href="profile.jsp">About Us</a>
        <a href="products.jsp">Products</a>
        <a href="services.jsp">Services</a>
        <a href="loan.jsp">Loan Limit</a>
        <a href="contactus.jsp">Contact Us</a>
        <a href="login.jsp">Login</a>
    </nav>

    <div class="center-box">
        <h1>Our Services</h1>
        <div class="grid-container">
            <a class="grid-item" href="images/Loan Application For Term Loan.pdf" target="_blank">Loan Application For Term Loan</a>
            <a class="grid-item" href="images/Loan Application For Medium Term Loan.pdf" target="_blank">Loan Application For Medium Term Loan</a>
            <a class="grid-item" href="images/Loan Application For Doctors Loan.pdf" target="_blank">Loan Application For Doctors Loan</a>
        </div>
    </div>

    <footer>
        <a href="#">©2024 Kl, Inc all rights reserved</a>
    </footer>
</body>
</html>
