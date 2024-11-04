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
            <h1>APSFC</h1>
            <h2>APSFC Profile</h2>
            <p>APSFC is a leading state level financial institution established in the year 1956 under the State Financial Corporations Act, 1951.</p>

            <h3>BOARD OF DIRECTORS</h3>
            <p>APSFC Board members include eminent individuals with a wealth of experience in administration & business, management consulting, banking, insurance and financial services.</p>

            <h3>SCOPE</h3>
            <p>APSFC is meeting the financial needs of micro, small and medium scale industries (MSMEs) for more than six decades.</p>
            <p>APSFC is making significant contribution for the development of micro, small and medium scale industries in the states by providing the need based credit in the form of medium / long term loans.</p>
            <p>The Corporation is playing predominantly a promotional and developmental role and acting as a catalyst for the growth of MSME sector, generation of direct and indirect employment in the state.</p>

            <h3>BRANCH NETWORK</h3>
            <p>The Corporation is having a network of 26 branch offices covering both the states i.e Telangana and Andhra Pradesh.</p>

            <h3>SHARE HOLDING PATTERN</h3>
            <p>The Government of Andhra Pradesh and SIDBI together are holding 99.87% of the shareholding in APSFC.</p>
        </div>
    </div>

    <footer>
        <nav class="bottom-nav">
            <a href="#">©2024 Kl, Inc all rights reserved</a>
        </nav>
    </footer>
</body>
</html>
