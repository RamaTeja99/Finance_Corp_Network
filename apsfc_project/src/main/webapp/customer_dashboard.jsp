<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard</title>
    <style type="text/css">
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        logout-button {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>Welcome, ${customer.name}</h1>
      <div class="logout-button">
            <form action="logout" method="post">
                <button type="submit">Logout</button>
            </form>
        </div>
     <h2>Request a Loan</h2>
    <%@ page import="java.util.*" %>
    <%@ page import="com.apsfc.data.CustomerLoan" %>
    <form action="CustomerLoanServlet" method="post">
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
    
</body>
</html>
