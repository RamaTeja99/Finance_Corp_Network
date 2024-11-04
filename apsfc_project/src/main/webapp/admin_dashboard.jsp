<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
  body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }
        .navbar {
            overflow: hidden;
            background-color: #7dcba6; /* Primary */
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }
        .navbar a {
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-weight: bold;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .logout-button form {
            display: inline;
        }
        .container {
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        table th, table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        table th {
            background-color: #7dcba6; /* Primary */
            color: #fff;
            text-transform: uppercase;
        }
        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        table tr:hover {
            background-color: #f1f1f1;
        }
        table thead th {
            background-color: #4114e4; /* Dark Blue */
        }
        .actions-container {
            display: flex;
            gap: 10px;
            align-items: center;
        }
        .actions-container form, .actions-container a {
            display: inline-block;
            margin: 0;
        }
        .actions-container input[type="submit"] {
            background-color: #f44336; /* Red */
            color: #fff;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 4px;
            text-align: center;
        }
        .actions-container input[type="submit"]:hover {
            background-color: #d32f2f;
        }
        .actions-container a.update-link {
            background-color: #8fef17; /* Success */
            color: #fff;
            padding: 8px 12px;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
        }
        .actions-container a.update-link:hover {
            background-color: #76c613;
        }
        .content-section {
            display: none;
        }
        .active {
            display: block;
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
        .btn-logout {
            background-color: #7dcba6; /* Primary */
            border: none;
            color: white;
            padding: 14px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
            border-radius: 4px;
        }
        .success-message {
            color: green;
            margin-top: 10px;
        }
    </style>
    <script>
        function showSection(sectionId) {
            var sections = document.getElementsByClassName('section');
            for (var i = 0; i < sections.length; i++) {
                sections[i].style.display = 'none';
            }
            document.getElementById(sectionId).style.display = 'block';
        }
    </script>
</head>
<body>
     <div class="navbar">
        <div class="navbar-links">
            <a href="javascript:showSection('addEmployeeSection')">Add Employee</a>
            <a href="javascript:showSection('employeeListSection')">Employee List</a>
            <a href="javascript:showSection('customerListSection')">Customer List</a>
            <a href="javascript:showSection('pendingLoansSection')">Pending Loans</a>
        </div>
        <div class="logout-button">
            <form action="logout" method="post">
                <button type="submit" class="btn-logout">Logout</button>
            </form>
        </div>
    </div>
    <div class="container">
        <h1>Admin Dashboard</h1>
        <%@ page import="java.util.*" %>
        <%@ page import="com.apsfc.data.CustomerLoan" %>
        <%@ page import="com.apsfc.data.Customer" %>
        <%@ page import="com.apsfc.data.Employee" %>  

        <div id="addEmployeeSection" class="section">
            <h2>Add Employee</h2>
            <form action="register" method="post">
                <input type="hidden" name="role" value="employee">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email">
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
                    <label for="position">Position:</label>
                    <select class="form-control" id="position" name="position">
                        <option value="Employee">Employee</option>
                        <option value="Manager">Manager</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Add Employee</button>
            </form>
        </div>
        
        <div id="employeeListSection" class="section">
            <h2>Employee List</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Position</th>
                        <th>Username</th>
                        <th>Delete & Update</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        List<Employee> employeeList = (List<Employee>) request.getAttribute("employeeList");
                        if (employeeList != null) {
                            for (Employee employee : employeeList) {
                    %>
                    <tr>
                        <td><%= employee.getEmployeeId() %></td>
                        <td><%= employee.getName() %></td>
                        <td><%= employee.getEmail() %></td>
                        <td><%= employee.getPosition() %></td>
                        <td><%= employee.getUsername() %></td>
                        <td class="actions">
                            <div class="actions-container">
                                <form action="EmployeeServlet" method="post">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="employeeId" value="<%= employee.getEmployeeId() %>">
                                    <input type="submit" value="Delete">
                                </form>
                                <a href="update_employee.jsp?employeeId=<%= employee.getEmployeeId() %>">Update</a>
                            </div>
                        </td>
                    </tr>
                    <% 
                            }
                        } else {
                    %>
                    <tr><td colspan="6">No employees found.</td></tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        
        <div id="customerListSection" class="section">
            <h2>Customer List</h2>
            <% 
                List<Customer> customers = (List<Customer>) request.getAttribute("list");
                if (customers != null && !customers.isEmpty()) {
            %>
            <table>
                <thead>
                    <tr>
                        <th>Customer ID</th>
                        <th>Employee ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>Customer Type</th>
                        <th>Username</th>
                        <th>Delete & Update</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        for (Customer customer : customers) {
                    %>
                    <tr>
                        <td><%= customer.getCustomerId() %></td>
                        <td><%= customer.getEmployeeId() %></td>
                        <td><%= customer.getName() %></td>
                        <td><%= customer.getEmail() %></td>
                        <td><%= customer.getPhone_no() %></td>
                        <td><%= customer.getCustomerType() %></td>
                        <td><%= customer.getUsername() %></td>
                        <td class="actions">
                            <div class="actions-container">
                                <form action="CustomerServlet" method="post">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="customerId" value="<%= customer.getCustomerId() %>">
                                    <input type="submit" value="Delete">
                                </form>
                                <a href="update_customer.jsp?customerId=<%= customer.getCustomerId() %>">Update</a>
                            </div>
                        </td>
                    </tr>
                    <% 
                        }
                    %>
                </tbody>
            </table>
            <% 
                } else {
                    out.println("<p>No customers found.</p>");
                }
            %>
        </div>
        
        <div id="pendingLoansSection" class="section">
            <h2>Pending Loan Requests</h2>
            <% 
                List<CustomerLoan> pendingLoans = (List<CustomerLoan>) request.getAttribute("pendingLoans");
                if (pendingLoans != null && !pendingLoans.isEmpty()) {
            %>
            <table>
                <thead>
                    <tr>
                        <th>Loan ID</th>
                        <th>Customer ID</th>
                        <th>Loan Amount</th>
                        <th>Loan Duration</th>
                        <th>Loan Type</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        for (CustomerLoan loan : pendingLoans) {
                    %>
                    <tr>
                        <td><%= loan.getCustomerLoanId() %></td>
                        <td><%= loan.getCustomerId() %></td>
                        <td><%= loan.getLoanAmount() %></td>
                        <td><%= loan.getLoan_timeinterval() %></td>
                        <td><%= loan.getLoanType() %></td>
                        <td><%= loan.getLoanStatus() %></td>
                                <td>
                        <div class="actions-container">
                            <form action="CustomerLoanServlet" method="post">
                                <input type="hidden" name="action" value="updateStatus">
                                <input type="hidden" name="loanId" value="<%= loan.getCustomerLoanId() %>">
                                <select name="newStatus">
                                    <option value="Approved">Approve</option>
                                    <option value="Rejected">Reject</option>
                                </select>
                                <input type="submit" value="Submit">
                            </form>
                        </div>
                    </td>
                    </tr>
                    <% 
                        }
                    %>
                </tbody>
            </table>
            <% 
                } else {
                    out.println("<p>No pending loan requests found.</p>");
                }
            %>
        </div>
    </div>
    
    <script>
        // Display the first section by default
        showSection('addEmployeeSection');
    </script>
</body>
</html>
