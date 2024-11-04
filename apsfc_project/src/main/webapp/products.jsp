<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Products</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            height: 100vh;
            background-color: #E3F9E5; /* Lightest green shade */
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #A8D5BA; /* Light green shade */
            color: #333; /* Darker text color for contrast */
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
            color: #333; /* Darker text color for contrast */
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
            background-color: #333; /* Darker green shade */
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

        .content-box {
            flex-grow: 1; /* Take up remaining space */
            margin: 20px;
            padding: 20px;
            background-color: white;
            border-radius: 15px; /* Curved edges */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            display: flex;
            gap: 20px;
        }

        .left-box {
            width: 30%; /* Adjust width of left box */
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .left-box button {
            padding: 10px;
            font-size: 16px;
            text-align: left; /* Align text to the left */
            border: none;
            border-radius: 5px; /* Curved edges */
            background-color: #A8D5BA; /* Light green shade */
            color: #333; /* Darker text color for contrast */
            cursor: pointer;
            width: 100%; /* Ensure buttons use full width of the left box */
        }

        .left-box button:hover {
            background-color: #86c2a1; /* Slightly darker green for hover effect */
        }

        .right-box {
            flex-grow: 1;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px; /* Curved edges */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            overflow-y: auto; /* Add scroll if content overflows */
            max-height: calc(100vh - 160px); /* Adjust max-height to fit within viewport */
        }

        footer {
            background-color: #4d4d4d; /* Different green shade */
            color: white;
            text-align: center;
            padding: 10px;
            margin-top: auto; /* Push footer to the bottom */
        }

        footer a {
            color: white;
            text-decoration: none;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        .scrollable {
            max-height: 600px; /* Adjust height as needed */
            overflow-y: auto;
        }
    </style>
    <script>
        function displayGeneralLoanScheme() {
            const content = `
                <table>
                    <tr>
                        <th>Purpose</th>
                        <td>To provide financial assistance for acquiring fixed assets / equipment / construction of buildings for:
                        <ul>
                            <li>establishing a new unit / enterprise</li>
                            <li>expansion</li>
                            <li>modernisation</li>
                            <li>diversification</li>
                            <li>backward or forward integration</li>
                        </ul>
                        </td>
                    </tr>
                    <tr>
                        <th>Eligibility</th>
                        <td>Borrowers: All Corporations, Companies, Co-Operative Societies, Firms, Individuals and other legal entities eligible U/s 26 of SFCs Act.<br>
                        Activities: All industrial and service activities defined U/s 2 (c) of SFCs Act.</td>
                    </tr>
                    <tr>
                        <th>Quantum of loan</th>
                        <td>Upto 75% of cost of identifiable fixed assets</td>
                    </tr>
                    <tr>
                        <th>Margin</th>
                        <td>Micro & Small enterprises: Minimum 22.5%<br>
                        Others: Minimum 25%</td>
                    </tr>
                    <tr>
                        <th>Interest Rate</th>
                        <td>Interest rate: 10.00% - 11.00% (Net) depending upon Internal Credit Rating<br>
                        Processing fee: 0.5% of the loan amount + GST</td>
                    </tr>
                    <tr>
                        <th>Tenure of Loan</th>
                        <td>Upto 8 years with moratorium upto 2 years</td>
                    </tr>
                </table>
            `;
            document.getElementById('right-box-content').innerHTML = content;
            document.getElementById('right-box-content').classList.remove('scrollable'); // Ensure no scrolling for General Loan Scheme
        }

        function displayMarketingAssistanceScheme() {
            const content = `
                <table>
                    <tr>
                        <th>Purpose</th>
                        <td>To provide financial assistance for acquiring fixed assets / equipment / construction of buildings for:
                        <ul>
                            <li>For undertaking various marketing related activities by Small Scale Enterprises.</li>
                            <li>For setting up new show rooms and/or renovation of existing show rooms for marketing predominantly small scale / village / cottage industry products show rooms set up within country or abroad.</li>
                            <li>Development of infrastructure like setting up of permanent exhibition centres, industrial parks etc.</li>
                            <li>Setting up of facilities for providing marketing support to SSI units.</li>
                            <li>Assistance for setting up Super Bazaars for Marketing of SSI & Other Products.</li>
                        </ul>
                        </td>
                    </tr>
                    <tr>
                        <th>Eligibility</th>
                        <td>Borrowers: Companies, Registered Co-operative Societies, Corporations, Firms, LLPs and Proprietary concerns/Individuals with good track record and sound financial position.<br>
                        Activities: Industrial and service activities covered under Sec.2 (c) of SFCs Act.</td>
                    </tr>
                    <tr>
                        <th>Quantum of loan</th>
                        <td>65% cost of eligible components including core working capital.<br>
                        a) The applicant concern shall be in operation for at least 1 year.<br>
                        b) The loan amount limited to Rs. 15.00 lakhs in respect of proposals received from new entrepreneurs / new concerns.<br>
                        c) The loan amount is up to 25% of the previous year turnover after deducting for the existing working capital limits.</td>
                    </tr>
                    <tr>
                        <th>Margin</th>
                        <td>Minimum of 35% of tangible assets considered for financial assistance including working capital requirement.</td>
                    </tr>
                    <tr>
                        <th>Interest Rate</th>
                        <td>10.00 - 11.50% p.a.(Net).<br>
                        Special Interest concession up to 1.50%p.a. will be allowed depending upon Internal Credit Rating.</td>
                    </tr>
                    <tr>
                        <th>Collateral Security</th>
                        <td>Term loan: 25% of loan on land, buildings, civil works, 100% to 150% of loan on rocks, furniture, computers.<br>
                        Working Capital: 150% of loan amount.</td>
                    </tr>
                    <tr>
                        <th>Charges</th>
                        <td>Processing fee: 0.5% of the loan amount + GST<br>
                        Upfront fee: 0.5% of the loan amount + GST</td>
                    </tr>
                    <tr>
                        <th>Tenure of Loan</th>
                        <td>From 3 to 5 years with moratorium up to 1 year in cases involving</td>
                    </tr>
                </table>
            `;
            document.getElementById('right-box-content').innerHTML = content;
            document.getElementById('right-box-content').classList.add('scrollable'); // Add scrolling for Marketing Assistance Scheme
        }

        function displayYoungEntrepreneursScheme() {
            const content = `
                <table>
                    <tr>
                        <th>Purpose</th>
                        <td>To provide financial assistance for acquiring fixed assets for establishing a new unit / enterprise and for expansion, modernization, diversification of Micro and Small enterprises requiring term loan and working capital.</td>
                    </tr>
                    <tr>
                        <th>Eligibility</th>
                        <td>Borrowers: Private limited Companies, Registered Co-operative Societies, Corporations, Firms, LLPs and Proprietary concerns/Individuals.<br>
                        The promoters preferably shall have minimum qualification of Graduation and 51% of the stake in the enterprise shall be held by partners / directors (preferably not more than 3), whose age does not exceed 40 years, as on the date of sanction.<br>
                        Activities: Industrial and service activities covered under Sec.2 (c) of SFCs Act.</td>
                    </tr>
                    <tr>
                        <th>Quantum of loan</th>
                        <td>75% of the cost of eligible components including core working capital requirement subject to minimum loan amount of Rs.5.00 lakhs and maximum up to Rs.40.00 lakhs.<br>
                        The loan amount on working capital component shall not exceed 20% of the total project cost subject to maximum amount of Rs.8.00 lakhs.</td>
                    </tr>
                    <tr>
                        <th>Interest Rate</th>
                        <td>10.00 - 11.50% p.a.</td>
                    </tr>
                    <tr>
                        <th>Collateral Security</th>
                        <td>Collateral security shall be provided at 50% of the loan amount by way of urban / rural / agricultural immovable properties.<br>
                        Or<br>
                        The 3rd party guarantee from one or two guarantors whose combined solvency by way of immovable properties is twice the total loan amount.<br>
                        Or<br>
                        Guarantee from one Government / Public Sector employee, who has left over service covering the loan period plus 2 years to the satisfaction of the Corporation commensurate with the loan amount.</td>
                    </tr>
                    <tr>
                        <th>Charges</th>
                        <td>Processing fee: 0.5% of the loan amount + GST</td>
                    </tr>
                    <tr>
                        <th>Tenure of Loan</th>
                        <td>8 years including moratorium period of 2 years.</td>
                    </tr>
                </table>
            `;
            document.getElementById('right-box-content').innerHTML = content;
            document.getElementById('right-box-content').classList.remove('scrollable'); // Ensure no scrolling for Young Entrepreneurs Scheme
        }
    </script>
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

    <div class="content-box">
        <div class="left-box">
            <button onclick="displayGeneralLoanScheme()">General Loan Scheme</button>
            <button onclick="displayMarketingAssistanceScheme()">Marketing Assistance Scheme</button>
            <button onclick="displayYoungEntrepreneursScheme()">Young Entrepreneurs Scheme</button>

        </div>
        <div class="right-box" id="right-box-content">
            <p>Welcome to our Products & Services page!</p>
            <!-- Add more content here as needed -->
        </div>
    </div>

    <footer>
        <a href="#">©2024 Kl, Inc all rights reserved</a>
    </footer>
</body>
</html>
