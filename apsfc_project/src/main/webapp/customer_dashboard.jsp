<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.apsfc.data.CustomerLoan" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #121212;
            color: #e0e0e0;
            transition: background-color 0.5s ease;
        }
        .navbar {
            background-color: #1e1e1e;
            display: flex;
            justify-content: space-around;
            padding: 14px 0;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            position: sticky;
            top: 0;
            z-index: 1000;
            transition: background-color 0.3s ease;
        }
        .navbar a {
            color: #ffffff;
            text-decoration: none;
            padding: 14px 20px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }
        .navbar a:hover {
            background-color: #3a3a3a;
            color: #1de9b6;
        }
        .container {
            padding: 20px;
            transition: opacity 0.5s ease;
        }
        h1, h2 {
            color: #ffffff;
            margin: 10px 0;
        }
        .section {
            display: none; /* Hide all sections by default */
            opacity: 0;
            transition: opacity 0.5s ease, transform 0.5s ease;
            transform: translateY(20px);
        }
        .active {
            display: block;
            opacity: 1;
            transform: translateY(0);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #1e1e1e;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
        }
        table, th, td {
            border: 1px solid #444;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #3a3a3a; /* Header background color */
            color: #1de9b6; /* Header text color */
            transition: background-color 0.3s;
        }
        th:hover {
            background-color: #1de9b6;
            color: #1e1e1e;
        }
        tr:hover {
            background-color: rgba(61, 90, 113, 0.3);
        }
        .logout-button {
            margin-top: 20px;
        }
        button {
            background-color: #1de9b6;
            color: #1e1e1e;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #1abc9c;
        }
        .loan-form {
            background-color: #1e1e1e;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
            transition: background-color 0.3s;
        }
        .loan-form div {
            margin-bottom: 15px;
        }
        .loan-form label {
            display: block;
            margin-bottom: 5px;
            color: #1de9b6;
        }
        .loan-form input[type="text"],
        .loan-form input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #444;
            border-radius: 5px;
            background-color: #333;
            color: #e0e0e0;
            transition: border-color 0.3s, background-color 0.3s;
        }
        .loan-form input[type="text"]:focus,
        .loan-form input[type="number"]:focus {
            border-color: #1de9b6;
            background-color: #444;
            outline: none;
        }
    </style>
    <script>
        function showSection(sectionId) {
            // Hide all sections
            document.querySelectorAll('.section').forEach(section => {
                section.classList.remove('active');
            });
            // Show the selected section
            document.getElementById(sectionId).classList.add('active');
        }

        // Set default section on load
        window.onload = function() {
            showSection('request-loan-section');
        };
    </script>
</head>
<body>
    <div class="navbar">
        <a href="#" onclick="showSection('request-loan-section')">Request a Loan</a>
        <a href="#" onclick="showSection('pending-loans-section')">Pending Loans</a>
        <a href="#" onclick="showSection('accepted-loans-section')">Accepted Loans</a>
        <a href="#" onclick="showSection('rejected-loans-section')">Rejected Loans</a>
        <a href="#" onclick="document.querySelector('.logout-button form').submit();">Logout</a>
    </div>

    <div class="container">
        <h1>Welcome, ${customer.name}</h1>
        <div class="logout-button">
            <form action="logout" method="post" style="display: none;">
                <button type="submit">Logout</button>
            </form>
        </div>

        <!-- Request a Loan Section -->
        <div id="request-loan-section" class="section active">
            <h2>Request a Loan</h2>
            <form action="CustomerLoanServlet" method="post" class="loan-form">
                <input type="hidden" name="action" value="requestLoan">
                <input type="hidden" name="customerId" value="${customer.customerId}">
                <div>
                    <label for="loanType">Loan Type:</label>
                    <input type="text" id="loanType" name="loanType" required>
                </div>
                <div>
                    <label for="loanAmount">Loan Amount:</label>
                    <input type="number" id="loanAmount" name="loanAmount" required>
                </div>
                <div>
                    <label for="interestRate">Interest Rate:</label>
                    <input type="number" id="interestRate" name="interestRate" step="0.01" required>
                </div>
                <div>
                    <label for="loanTimeinterval">Time Interval (years):</label>
                    <input type="number" id="loanTimeinterval" name="loanTimeinterval" step="0.01" required>
                </div>
                <button type="submit">Request Loan</button>
            </form>
        </div>

        <!-- Pending Loans Section -->
        <div id="pending-loans-section" class="section">
            <h2>Pending Loans</h2>
            <table>
                <thead>
                    <tr>
                        <th>Loan Type</th>
                        <th>Amount</th>
                        <th>Interest Rate</th>
                        <th>Time Interval</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        List<CustomerLoan> pendingLoans = (List<CustomerLoan>) request.getAttribute("pendingLoans");
                        if (pendingLoans != null && !pendingLoans.isEmpty()) {
                            for (CustomerLoan loan : pendingLoans) {
                    %>
                    <tr>
                        <td><%= loan.getLoanType() %></td>
                        <td><%= loan.getLoanAmount() %></td>
                        <td><%= loan.getInterestRate() %></td>
                        <td><%= loan.getLoan_timeinterval() %></td>
                        <td><%= loan.getLoanStatus() %></td>
                    </tr>
                    <% 
                            }
                        } else {
                            out.println("<tr><td colspan='5'>No pending loans found.</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>

        <!-- Accepted Loans Section -->
        <div id="accepted-loans-section" class="section">
            <h2>Accepted Loans</h2>
            <table>
                <thead>
                    <tr>
                        <th>Loan Type</th>
                        <th>Amount</th>
                        <th>Interest Rate</th>
                        <th>Time Interval</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        List<CustomerLoan> acceptedLoans = (List<CustomerLoan>) request.getAttribute("acceptedLoans");
                        if (acceptedLoans != null && !acceptedLoans.isEmpty()) {
                            for (CustomerLoan loan : acceptedLoans) {
                    %>
                    <tr>
                        <td><%= loan.getLoanType() %></td>
                        <td><%= loan.getLoanAmount() %></td>
                        <td><%= loan.getInterestRate() %></td>
                        <td><%= loan.getLoan_timeinterval() %></td>
                        <td><%= loan.getLoanStatus() %></td>
                    </tr>
                    <% 
                            }
                        } else {
                            out.println("<tr><td colspan='5'>No accepted loans found.</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>

        <!-- Rejected Loans Section -->
        <div id="rejected-loans-section" class="section">
            <h2>Rejected Loans</h2>
            <table>
                <thead>
                    <tr>
                        <th>Loan Type</th>
                        <th>Amount</th>
                        <th>Interest Rate</th>
                        <th>Time Interval</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        List<CustomerLoan> rejectedLoans = (List<CustomerLoan>) request.getAttribute("rejectedLoans");
                        if (rejectedLoans != null && !rejectedLoans.isEmpty()) {
                            for (CustomerLoan loan : rejectedLoans) {
                    %>
                    <tr>
                        <td><%= loan.getLoanType() %></td>
                        <td><%= loan.getLoanAmount() %></td>
                        <td><%= loan.getInterestRate() %></td>
                        <td><%= loan.getLoan_timeinterval() %></td>
                        <td><%= loan.getLoanStatus() %></td>
                    </tr>
                    <% 
                            }
                        } else {
                            out.println("<tr><td colspan='5'>No rejected loans found.</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
