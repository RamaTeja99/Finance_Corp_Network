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
            background-color: #FFFFFF;
            display: flex;
            flex-direction: column;
            border-radius: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            padding: 20px;
            box-sizing: border-box;
            margin: 20px auto;
            overflow-y: auto; /* Enable scrolling if content overflows */
        }

        .heading {
            text-align: center;
            margin: 0;
            margin-bottom: 20px; /* Space between heading and boxes */
        }

        .box-container {
            display: flex;
            flex-direction: column;
            gap: 20px; /* Space between boxes */
        }

        .box {
            display: flex;
            background-color: #F9F9F9;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
            box-sizing: border-box;
        }

        .box .left-box, .box .right-box {
            flex: 1;
            padding: 20px;
        }

        .box .left-box {
            border-right: 2px solid #E3F9E5; /* Light green border between boxes */
        }

        .box .left-box h1 {
            margin-top: 0;
        }

        .box .left-box p {
            margin: 0;
            line-height: 1.6;
        }

        .box .left-box .contact-info {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .box .left-box .contact-info img {
            height: 20px; /* Adjust size as needed */
            margin-right: 10px;
        }

        .box .left-box .contact-info a {
            color: #333;
            text-decoration: none;
        }

        .box .left-box .contact-info a:hover {
            text-decoration: underline;
        }

        .box .right-box img {
            max-width: 100%;
            border-radius: 15px; /* Optional: rounded corners for the image */
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
        <h2 class="heading">Nation Division Offices</h2>
        <div class="box-container">
            <!-- First Box -->
            <div class="box">
                <div class="left-box">
                    <p>
                    <h3 class="heading">Andhra Division Offices</h3>
                        <span class="contact-info">
                            Andhra State Financial Corporation<br>
                            Green Fields, Vaddeswaram<br>
                            Andhra Pradesh 522302
                        </span>
                        <span class="contact-info">
                            <img src="images/landline.png" alt="Landline" />
                            +9140-23201646,23202550
                        </span>
                        <span class="contact-info">
                            <img src="images/mobile.png" alt="Mobile" />
                            +91 9866512503/502/501
                        </span>
                        <span class="contact-info">
                            <img src="images/mail.png" alt="Email" />
                            <a href="mailto:ho@apsfc.com">ho[at]apsfc[dot]com</a>
                        </span>
                    </p>
                </div>
                <div class="right-box">
                    <img src="images/headoffice=.png" alt="Head Office" />
                </div>
            </div>
            
            <!-- Second Box -->
            <div class="box">
                <div class="left-box">
                    <p>
                    <h3 class="heading">Telengana Division Offices</h3>
                        <span class="contact-info">
                            Telengana State Financial Corporation<br>
                            Aziznagar, Hyderabad<br>
                            Telangana 500075
                        </span>
                        <span class="contact-info">
                            <img src="images/landline.png" alt="Landline" />
                            +9140-23201647,23202551
                        </span>
                        <span class="contact-info">
                            <img src="images/mobile.png" alt="Mobile" />
                            +91 9866512504/503/502
                        </span>
                        <span class="contact-info">
                            <img src="images/mail.png" alt="Email" />
                            <a href="mailto:info@apsfc.com">info[at]apsfc[dot]com</a>
                        </span>
                    </p>
                </div>
                <div class="right-box">
                    <img src="images/anotheroffice.png" alt="Another Office" />
                </div>
            </div>
        </div>
    </div>

    <footer>
        <a href="#">©2024 Kl, Inc all rights reserved</a>
    </footer>
</body>
</html>
