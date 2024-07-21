<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard</title>
    <!-- Include any necessary CSS or JS files -->
</head>
<body>
    <h1>Welcome, ${customerName}</h1>
    
    <!-- Display Customer's Existing Loans -->
    <h2>Your Loans</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Loan ID</th>
                <th>Loan Amount</th>
                <th>Loan Type</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="loan" items="${customerLoans}">
                <tr>
                    <td>${loan.id}</td>
                    <td>${loan.amount}</td>
                    <td>${loan.type}</td>
                    <td>${loan.status}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <!-- Apply for a New Loan Form -->
    <h2>Apply for a New Loan</h2>
    <form action="applyLoanServlet" method="post">
        <label for="amount">Loan Amount:</label>
        <input type="text" id="amount" name="amount" required><br><br>
        
        <label for="type">Loan Type:</label>
        <select id="type" name="type" required>
            <option value="Personal">Personal</option>
            <option value="Business">Business</option>
            <!-- Add more options as needed -->
        </select><br><br>
        
        <button type="submit">Apply</button>
    </form>
    
    <!-- Include any additional content or links -->
</body>
</html>
