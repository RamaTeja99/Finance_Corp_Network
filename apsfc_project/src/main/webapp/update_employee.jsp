<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Employee</title>
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
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
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
            color: #333;
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
        input[type="text"],
        input[type="email"],
        input[type="password"],
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
<%@ page import="com.apsfc.services.EmployeeDAO" %>
<%@ page import="com.apsfc.data.Employee" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.NamingException" %>

<%
    try {
        // Initialize JNDI context
        Context initContext = new InitialContext();
        EmployeeDAO employeeDAO = (EmployeeDAO) initContext.lookup("java:global/apsfc_project/EmployeeDAO");

        // Retrieve employeeId from query parameters
        Long employeeId = Long.parseLong(request.getParameter("employeeId"));
        
        // Get the employee using DAO
        Employee employee = employeeDAO.getEmployeeById(employeeId);

        if (employee != null) {
%>
            <!-- Form to update employee details -->
            <form action="EmployeeServlet" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="employeeId" value="<%= employee.getEmployeeId() %>">
                
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<%= employee.getName() %>" required>
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= employee.getEmail() %>" required>
                
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="<%= employee.getUsername() %>" required>
                
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" value="<%= employee.getPassword() %>" required>
                
                <label for="position">Position:</label>
                <select id="position" name="position" required>
                    <option value="Employee" <%= employee.getPosition().equals("Employee") ? "selected" : "" %>>Employee</option>
                    <option value="Manager" <%= employee.getPosition().equals("Manager") ? "selected" : "" %>>Manager</option>
                </select>
                
               <button type="submit" class="btn btn-primary">Update</button>
                 <button type="button" class="btn-back" onclick="window.history.back();">Back</button>
            </form>
<%
        } else {
            out.println("Employee not found.");
        }
    } catch (NamingException e) {
        out.println("Error looking up EmployeeDAO: " + e.getMessage());
    } catch (NumberFormatException e) {
        out.println("Invalid employee ID format.");
    }
%>
</body>
</html>
