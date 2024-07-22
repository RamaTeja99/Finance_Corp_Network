<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
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
        .actions-container {
    display: flex; /* Enable flexbox layout */
    gap: 10px; /* Space between the items */
    align-items: center; /* Align items vertically centered */
}

.delete-form {
    margin: 0; /* Remove default margin if needed */
}

.update-link {
    text-decoration: none; /* Remove underline from the link */
    color: #007bff; /* Optional: Set link color */
}

.update-link:hover {
    text-decoration: underline; /* Optional: Add underline on hover */
}
        
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>
<h2>Customer List</h2>
    <%@ page import="java.util.*" %>
    <%@ page import="com.apsfc.data.*" %>
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
                        <td><%= customer.getPhone_no() %>
                        <td><%= customer.getCustomerType() %></td>
                        <td><%= customer.getUsername() %></td>
                        <td class="actions">
                            <!-- Delete Form -->
                            <form action="CustomerServlet" method="post">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="customerId" value="<%= customer.getCustomerId() %>">
                                <input type="submit" value="Delete">
                            </form>
                            <!-- Update Link -->
                            <a href="update_customer.jsp?customerId=<%= customer.getCustomerId() %>">Update</a>
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
    <h2>Employee List</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Postion</th>
        <th>Username</th>
        <th>Delete & Update</th>
        <!-- Add other employee columns as needed -->
    </tr>
    <%
        List<Employee> employeeList = (List<Employee>) request.getAttribute("employeeList");
        if (employeeList != null) {
            for (Employee employee : employeeList) {
    %>
    <tr>
        <td><%= employee.getEmployeeId() %></td>
        <td><%= employee.getName() %></td>
        <td><%= employee.getEmail() %></td>
        <td><%= employee.getPosition() %>
        <td><%= employee.getUsername() %>
        <!-- Add other employee details as needed -->
        <td class="actions">
                            <!-- Delete Form -->
                            <form action="EmployeeServlet" method="post">
                                <input type="hidden" name="action" value="delete">
                                 <input type="hidden" name="employeeId" value="<%= employee.getEmployeeId() %>">
                                <input type="submit" value="Delete">
                            </form>
                            <!-- Update Link -->
                            <a href="update_employee.jsp?employeeId=<%= employee.getEmployeeId() %>">Update</a>
                        </td>
    </tr>
    <% 
            }
        } else {
    %>
    <tr><td colspan="3">No employees found.</td></tr>
    <% } %>
</table>

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
                <input type="text" class="form-control" id="position" name="position">
            </div>
            <button type="submit" class="btn btn-primary">Add Employee</button>
        </form>
    </div>
</body>
</html>
