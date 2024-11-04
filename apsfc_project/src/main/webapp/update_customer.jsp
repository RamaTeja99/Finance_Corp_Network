<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Customer</title>
    <style>
          body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            overflow: hidden;
        }
        body:hover{
        overflow-y:auto;
        }
        form {
            background: white;
            border-radius: 10px;
            box-shadow: 0 8px 40px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 400px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        form:hover {
            transform: scale(1.02);
            box-shadow: 0 12px 60px rgba(0, 0, 0, 0.15);
        }
         .btn-back {
        background-color: #e74c3c; /* Red color for back button */
        color: white;
        border: none;
        padding: 12px 20px;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
        font-size: 16px;
        font-weight: bold; /* Bold button text */
        width: 100%; /* Full width button */
        margin-top: 10px; /* Space above back button */
    }

    .btn-back:hover {
        background-color: #c0392b; /* Darker red on hover */
        transform: translateY(-2px); /* Slight lift effect */
    }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
            color: #333;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="tel"],
        select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 20px; /* Space between fields */
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        input[type="tel"]:focus,
        select:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            outline: none;
        }
        .btn-primary {
            background-color: #2980b9;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            font-size: 16px;
            font-weight: bold; /* Bold button text */
            width: 100%; /* Full width button */
        }

        .btn-primary:hover {
            background-color: #3498db; /* Lighter button color on hover */
            transform: translateY(-2px); /* Slight lift effect */
        }
        @media (max-width: 500px) {
            form {
                width: 90%;
                padding: 20px;
            }
        }
        
    </style>
</head>
<body>
<%@ page import="java.util.*" %>
<%@ page import="com.apsfc.services.CustomerDAO" %>
<%@ page import="com.apsfc.data.Customer" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.NamingException" %>

<%
    try {
        // Initialize JNDI context
        Context initContext = new InitialContext();
        CustomerDAO customerDAO = (CustomerDAO) initContext.lookup("java:global/apsfc_project/CustomerDAO");

        // Retrieve customerId from query parameters
        Long customerId = Long.parseLong(request.getParameter("customerId"));
        
        // Get the customer using DAO
        Customer customer = customerDAO.getCustomerById(customerId);

        if (customer != null) {
%>
            <!-- Form to update customer details -->
            
                <form action="CustomerServlet" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="customerId" value="<%= customer.getCustomerId() %>">
                    
                   
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="name" name="name" value="<%= customer.getName() %>" required>
                    
                    
                        <label for="employee_id">Employee Id:</label>
                        <input type="text" class="form-control" id="employee_id" name="employee_id" value="<%= customer.getEmployeeId() %>" required>
                    
                    
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" value="<%= customer.getEmail() %>" required>
                    
                    
                    
                        <label for="phone">Phone Number:</label>
                        <input type="tel" class="form-control" id="phone" name="phone" value="<%= customer.getPhone_no() %>" pattern="[0-9]{10}" required>
                  
                    
                    
                        <label for="customerType">Customer Type:</label>
                        <select class="form-control" id="customerType" name="customerType" required>
                            <option value="regular" <%= customer.getCustomerType().equals("regular") ? "selected" : "" %>>Regular</option>
                            <option value="premium" <%= customer.getCustomerType().equals("premium") ? "selected" : "" %>>Premium</option>
                        </select>
                    
                    
                    
                        <label for="username">Username:</label>
                        <input type="text" class="form-control" id="username" name="username" value="<%= customer.getUsername() %>" required>
                 
                    
                    
                        <label for="password">Password:</label>
                        <input type="password" class="form-control" id="password" name="password" value="<%= customer.getPassword() %>" required>
               
                    
                    <button type="submit" class="btn btn-primary">Update</button>
                     <button type="button" class="btn-back" onclick="window.history.back();">Back</button>
                </form>
<%
        } else {
            out.println("Customer not found.");
        }
    } catch (NamingException e) {
        out.println("Error looking up CustomerDAO: " + e.getMessage());
    } catch (NumberFormatException e) {
        out.println("Invalid customer ID format.");
    }
%>
</body>
</html>
