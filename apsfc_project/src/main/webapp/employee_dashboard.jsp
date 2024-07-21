<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Dashboard</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Employee Dashboard</h1>
        <h2>Welcome, ${employee.name}!</h2>
        
        <h3>Customer Details</h3>
        <table class="data-table">
            <thead>
                <tr>
                    <th>Customer ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Customer Type</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="customer" items="${customers}">
                    <tr>
                        <td>${customer.customer_id}</td>
                        <td>${customer.name}</td>
                        <td>${customer.email}</td>
                        <td>${customer.customer_type}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <h3>Customer Loans</h3>
        <table class="data-table">
            <thead>
                <tr>
                    <th>Loan ID</th>
                    <th>Customer Name</th>
                    <th>Loan Amount</th>
                    <th>Loan Type</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="loan" items="${loans}">
                    <tr>
                        <td>${loan.loan_id}</td>
                        <td>${loan.customer.name}</td>
                        <td>${loan.amount}</td>
                        <td>${loan.type}</td>
                        <td>${loan.status}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <a href="logout">Logout</a>
    </div>
</body>
</html>
