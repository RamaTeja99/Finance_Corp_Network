package com.apsfc.data;

import java.io.IOException;
import java.util.concurrent.Semaphore;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apsfc.services.CustomerDAO;

/**
 * Servlet implementation class CustomerServlet
 */
@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@EJB
    private CustomerDAO customerDAO;
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");

    if ("update".equals(action)) {
        Long customerId = Long.parseLong(request.getParameter("customerId"));
        String name = request.getParameter("name");
        int employeeId = Integer.parseInt(request.getParameter("employee_id"));
        String email = request.getParameter("email");
        String phone_no = request.getParameter("phone");
        String customerType = request.getParameter("customerType");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Customer customer = new Customer();
        customer.setCustomerId(customerId);
        customer.setName(name);
        customer.setEmployeeId(employeeId);
        customer.setEmail(email);
        customer.setPhone_no(phone_no);
        customer.setCustomerType(customerType);
        customer.setUsername(username);
        customer.setPassword(password);

        customerDAO.updateCustomer(customer);
        
        // Forward request to RetrieveCustomers servlet
        request.getRequestDispatcher("/retrieveCustomers").forward(request, response);
    } else if ("delete".equals(action)) {
        Long customerId = Long.parseLong(request.getParameter("customerId"));
        customerDAO.deleteCustomer(customerId);
        request.getRequestDispatcher("/retrieveCustomers").forward(request, response);
    }
}
}