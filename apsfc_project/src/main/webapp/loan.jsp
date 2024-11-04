<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Finance Cooperation Network Ltd</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column; /* Stack elements vertically */
            height: 100vh; /* Full viewport height */
            background-color: #E3F9E5; /* Lightest green shade */
        }

        header {
            width: 100%;
            box-sizing: border-box;
        }

        .top-navbar {
            display: flex;
            align-items: center;
            background-color: #A8D5BA; /* Light green shade */
            color: #333; /* Darker text color for contrast */
            padding: 10px 20px;
            box-sizing: border-box;
        }

        .top-navbar .logo {
            margin-right: auto;
            height: 40px;
            width: auto;
        }

        .top-navbar .user-icon {
            margin-left: auto;
            height: 40px;
            width: auto;
        }

        .top-navbar h2 {
            margin: 0;
            text-align: center;
            flex-grow: 1;
            color: #333; /* Darker text color for contrast */
        }

        .top-nav {
            display: flex;
            justify-content: center;
            background-color: #333; /* Darker green shade */
            color: white;
            padding: 10px;
            width: 100%;
            box-sizing: border-box;
        }

        .top-nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 18px;
        }

        .top-nav a:hover {
            text-decoration: underline;
        }

        .center-box {
            width: 900px; /* Width of the box */
            background-color: #FFFFFF; /* White background */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border-radius: 30px; /* Curved edges */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Box shadow */
            padding: 20px;
            box-sizing: border-box;
            text-align: center;
            margin: 20px auto; /* Center the box and add space above/below */
        }

        .container {
            text-align: left; /* Align text to the left */
            overflow-y: auto; /* Enable scrolling if content overflows */
        }
        
        h1 {
            text-align: center; /* Center the h1 element */
            color: #333;
        }

        h2 {
            color: #333;
        }

        h3 {
            color: #333;
            text-align: left; /* Left align h3 elements */
        }

        p {
            color: #666;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
            color: #333;
        }

        td {
            color: #666;
        }

        footer {
            background-color: #4d4d4d; /* Different green shade */
            color: white;
            text-align: center;
            padding: 10px;
            width: 100%; /* Full width footer */
            box-sizing: border-box;
            margin-top: auto; /* Push footer to the bottom */
        }

        .bottom-nav {
            display: flex;
            justify-content: center; /* Center align the navigation items */
            align-items: center;
            width: 100%; /* Full width */
            box-sizing: border-box;
        }

        .bottom-nav a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
        }

        .bottom-nav a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <div class="top-navbar">
            <img src="images/logo.png" alt="Logo" class="logo" />
            <h2>Andhra Pradesh State Finance Corporation</h2>
            <img src="images/user.png" alt="User" class="user-icon" />
        </div>
        
        <nav class="top-nav">
            <a href="index.xhtml">Home</a>
            <a href="products.jsp">Products</a>
            <a href="services.jsp">Services</a>
            <a href="auction.jsp">Auction</a>
            <a href="contactus.jsp">Contact Us</a>
            <a href="login.jsp">Login</a>
        </nav>
    </header>
    
    <div class="center-box">
        <div class="container">
            <h1>Limits of Financial Assistance</h1>
            <table>
                <thead>
                    <tr>
                        <th>Constitution</th>
                        <th>Max. Limit per project</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Proprietary & Partnership Joint Hindu families</td>
                        <td>Rs.800 Lakhs</td>
                    </tr>
                    <tr>
                        <td>Limited companies Co-operative societies</td>
                        <td>Rs.2000 Lakhs</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <footer>
        <nav class="bottom-nav">
            <a href="#">©2024 Kl, Inc all rights reserved</a>
        </nav>
    </footer>
</body>
</html>
