<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.apsfc.data.Customer" %>
<%@ page import="com.apsfc.data.CustomerLoan" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .navbar {
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .navbar-top {
            background-color: #A8D5BA;
            position: relative;
        }
        .navbar-footer {
            background-color: #333;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 0;
        }
        .navbar a {
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .navbar-right {
            position: absolute;
            right: 0;
        }
        .container {
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .form-box {
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px; /* Curved edges */
            width: 50%;
            background-color: #e0f7fa; /* Different box color */
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group select, .btn {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            color: white;
            padding: 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
        }
        .btn-logout {
            background-color: #A8D5BA;
            border: none;
            color: white;
            padding: 14px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }
    </style>
</head>
<body>
    <!-- Top Navbar -->
    <div class="navbar navbar-top">
        <a href="#" class="bold">Employee Dashboard</a>
        <div class="navbar-right">
            <form action="logout" method="post" style="margin: 0;">
                <button type="submit" class="btn-logout">Logout</button>
            </form>
        </div>
    </div>

    <!-- Container -->
    <div class="container">
        <h1>Employee Dashboard</h1>
        <h2>Welcome, ${employee.name}</h2>

        <!-- Register Customer Form -->
        <div class="form-box">
            <form action="register" method="post">
                <input type="hidden" name="role" value="customer">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number:</label>
                    <input type="tel" class="form-control" id="phone" name="phone" pattern="[0-9]{10}" required>
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="customerType">Customer Type:</label>
                    <select class="form-control" id="customerType" name="customerType">
                        <option value="regular">Regular</option>
                        <option value="premium">Premium</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Register</button>
            </form>
        </div>

        <!-- Customers Table -->
        <h3>Customers</h3>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Customer Type</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
                    if (customers != null && !customers.isEmpty()) {
                        for (Customer customer : customers) {
                %>
                <tr>
                    <td><%= customer.getCustomerId() %></td>
                    <td><%= customer.getName() %></td>
                    <td><%= customer.getEmail() %></td>
                    <td><%= customer.getPhone_no() %></td>
                    <td><%= customer.getCustomerType() %></td>
                </tr>
                <%
                        }
                    } else {
                        out.println("<tr><td colspan='5'>No customers found.</td></tr>");
                    }
                %>
            </tbody>
        </table>

        <!-- Loans Table -->
        <h3>Loans</h3>
        <table>
            <thead>
                <tr>
                    <th>Loan ID</th>
                    <th>Customer ID</th>
                    <th>Loan Type</th>
                    <th>Amount</th>
                    <th>Interest Rate</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<CustomerLoan> loans = (List<CustomerLoan>) request.getAttribute("loans");
                    if (loans != null && !loans.isEmpty()) {
                        for (CustomerLoan loan : loans) {
                %>
                <tr>
                    <td><%= loan.getCustomer_loan_id() %></td>
                    <td><%= loan.getCustomerId() %></td>
                    <td><%= loan.getLoan_type() %></td>
                    <td><%= loan.getLoan_amount() %></td>
                    <td><%= loan.getInterest_rate() %></td>
                    <td><%= loan.getLoan_status() %></td>
                </tr>
                <%
                        }
                    } else {
                        out.println("<tr><td colspan='6'>No loans found.</td></tr>");
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Footer Navbar -->
    <div class="navbar navbar-footer">
        <p>©2024 Kl, Inc all rights reserved</p>
    </div>
</body>
</html>