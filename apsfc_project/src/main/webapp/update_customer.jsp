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
                <input type="text" id="name" name="name" value="<%= customer.getName() %>" required><br><br>
                <label for="employee_id">Employee Id:</label>
                <input type="text" id="employee_id" name="employee_id" value="<%= customer.getEmployeeId() %>" required><br><br>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= customer.getEmail() %>"><br><br>
                
                <label for="phone">Phone Number:</label>
                <input type="tel"  id="phone" name="phone" value=<%= customer.getPhone_no() %> pattern="[0-9]{10}" ><br><br>
                
                <label for="customerType">Customer Type:</label>
                <input type="text" id="customerType" name="customerType" value="<%= customer.getCustomerType() %>"><br><br>
                
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="<%= customer.getUsername() %>" required><br><br>
                
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" value="<%= customer.getPassword() %>" required><br><br>
                
                <input type="submit" value="Update">
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
