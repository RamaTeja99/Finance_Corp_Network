<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update_Employee</title>
    <style type="text/css"></style>
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
                <input type="text" id="name" name="name" value="<%= employee.getName() %>" required><br><br>
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= employee.getEmail() %>"><br><br>
                
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="<%= employee.getUsername() %>" required><br><br>
                
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" value="<%= employee.getPassword() %>" required><br><br>
                
                <label for="position">Position:</label>
                <input type="text" id="position" name="position" value="<%= employee.getPosition() %>"><br><br>
                
                <input type="submit" value="Update">
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
