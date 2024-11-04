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
        /* Global Styles */
        body { 
            font-family: Arial, sans-serif; 
            margin: 0; 
            padding: 0; 
            background: linear-gradient(135deg, #2d3436, #636e72); 
            color: #f5f6fa; 
            display: flex; 
            flex-direction: column; 
            min-height: 100vh;
        }
        h1, h2, h3 { 
            color: #00b894; 
            text-shadow: 1px 1px 2px #000; 
        }
        .navbar {
            background: rgba(30, 144, 255, 0.8);
            backdrop-filter: blur(10px);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            position: sticky;
            top: 0;
            z-index: 100;
            transition: background 0.3s ease;
        }
        .navbar a {
            color: #f5f6fa;
            padding: 10px 15px;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            transition: background 0.3s ease, color 0.3s ease;
        }
        .navbar a:hover {
            background: rgba(255, 255, 255, 0.2);
            color: #dff9fb;
        }
        .navbar-right .btn-logout {
            background: #0984e3;
            border: none;
            color: white;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 20px;
            transition: background 0.3s ease;
        }
        .btn-logout:hover {
            background: #74b9ff;
        }

        /* Container Styles */
        .container {
            padding: 40px;
            margin: auto;
            flex-grow: 1;
            width: 80%;
            max-width: 1200px;
        }
        .form-box, .table-container {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
            margin-bottom: 30px;
            display: none; /* Hide by default */
        }
        .form-box.active, .table-container.active {
            display: block; /* Show when active */
            opacity: 1;
            transform: translateY(0);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            margin-bottom: 8px;
            font-size: 1rem;
            color: #dfe6e9;
        }
        .form-group input, .form-group select, .btn-primary {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: none;
            outline: none;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
            transition: box-shadow 0.3s ease;
        }
        .form-group input:focus, .form-group select:focus, .btn-primary:focus {
            box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.3);
        }
        .btn-primary {
            background-color: #00b894;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #00cec9;
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background: rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
        }
        table th, table td {
            padding: 15px;
            text-align: left;
            color: #f5f6fa;
        }
        table th {
            background: #00b894;
            color: #dfe6e9;
            text-transform: uppercase;
        }
        table tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.05);
        }
        table tr:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transition: background 0.2s ease;
        }

        /* Footer Styles */
        .navbar-footer {
            background: #333;
            color: #f5f6fa;
            text-align: center;
            padding: 20px;
            margin-top: auto;
        }
        
    </style>
    <script>
        // JavaScript to toggle visibility of sections
        function showSection(sectionId) {
            document.querySelectorAll('.form-box, .table-container').forEach(section => {
                section.classList.remove('active'); // Remove active class to hide all
            });
            document.getElementById(sectionId).classList.add('active'); // Show the selected section
        }

        window.onload = function() {
            showSection('add-customer-section'); // Default section to show on load
        };
    </script>
</head>
<body>
    <div class="navbar navbar-top">
        <a href="#" onclick="showSection('add-customer-section')">Add Customer</a>
        <a href="#" onclick="showSection('customer-list-section')">Customer List</a>
        <a href="#" onclick="showSection('loan-list-section')">Loan List</a>
        <div class="navbar-right">
            <form action="logout" method="post" style="margin: 0;">
                <button type="submit" class="btn-logout">Logout</button>
            </form>
        </div>
    </div>

    <div class="container">
        <h1>Employee Dashboard</h1>
        <h2>Welcome, ${employee.name}</h2>

        <!-- Register Customer Form -->
        <div id="add-customer-section" class="form-box active">
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
        <div id="customer-list-section" class="table-container">
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
                    %>
                    <tr>
                        <td colspan="5">No customers found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

        <!-- Loan List Section -->
        <div id="loan-list-section" class="table-container">
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
                    %>
                    <tr>
                        <td colspan="4">No loans found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <div class="navbar-footer">
        <p>&copy; 2024 Your Company Name. All rights reserved.</p>
    </div>
</body>
</html>
