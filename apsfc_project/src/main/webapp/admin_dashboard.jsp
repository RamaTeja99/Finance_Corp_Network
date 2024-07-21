<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="path_to_your_css/bootstrap.min.css">
    <style>
        /* Custom styles */
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>
        <%@ page import="java.util.*"%>
        <%@ page import="com.apsfc.data.*"%>
        <%
            List<Customer> CL = (List<Customer>) request.getAttribute("list");
        %>
        <% if (CL != null && !CL.isEmpty()) { %>
            <table border="1">
                <tr>
                    <th>Customer Id</th>
                    <th>Customer Name</th>
                    <th>Customer Email</th>
                    <th>Customer Phone_Number</th>
                    <th>Customer Username</th>
                    <th>Customer CustomerType</th>
                </tr>
                <% for (Customer C : CL) { %>
                    <tr>
                        <td><%= C.getCustomerId() %></td>
                        <td><%= C.getName() %></td>
                        <td><%= C.getEmail() %></td>
                        <td><%= C.getPhone_no() %></td>
                        <td><%= C.getUsername() %></td>
                        <td><%= C.getCustomerType() %></td>
                    </tr>
                <% } %>
            </table>
        <% } else { %>
            <p>No customers found.</p>
        <% } %>

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
