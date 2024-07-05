<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <!-- Include Bootstrap or any other styling framework -->
    <link rel="stylesheet" href="path_to_your_css/bootstrap.min.css">
    <!-- Include any custom styles -->
    <style>
        /* Custom styles */
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>
        
        <!-- Display Registered Employees -->
        <h2>Registered Employees</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Position</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="employee" items="${employees}">
                    <tr>
                        <td>${employee.employee_id}</td>
                        <td>${employee.name}</td>
                        <td>${employee.email}</td>
                        <td>${employee.position}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <!-- Display Customer Loans -->
        <h2>Customer Loans</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Customer Name</th>
                    <th>Loan Type</th>
                    <th>Loan Amount</th>
                    <th>Loan Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="loan" items="${customerLoans}">
                    <tr>
                        <td>${loan.customer.name}</td>
                        <td>${loan.loan.loan_type}</td>
                        <td>${loan.loan_amount}</td>
                        <td>${loan.loan_status}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
    </div>
</body>
</html>
