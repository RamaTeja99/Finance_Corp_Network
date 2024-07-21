package com.apsfc.data;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.apsfc.services.AdminService;
import com.apsfc.services.EmployeeService;
import com.apsfc.services.CustomerService;
import com.apsfc.data.Admin;
import com.apsfc.data.Employee;
import com.apsfc.data.Customer;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private AdminService adminService;

    @EJB
    private EmployeeService employeeService;

    @EJB
    private CustomerService customerService;

    /**
     * Handles POST requests for user login.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Admin admin = adminService.validateAdminLogin(username, password);
            if (admin != null) {
                // Admin logged in successfully
                request.getSession().setAttribute("admin", admin);
                // Redirect to admin dashboard
                request.getRequestDispatcher("/retrieveCustomers").forward(request, response);
                return;
            }

            Employee employee = employeeService.validateEmployeeLogin(username, password);
            if (employee != null) {
                // Employee logged in successfully
                request.getSession().setAttribute("employee", employee);
                response.sendRedirect("employee_dashboard.jsp");
                return;
            }

            Customer customer = customerService.validateCustomerLogin(username, password);
            if (customer != null) {
                // Customer logged in successfully
                request.getSession().setAttribute("customer", customer);
                response.sendRedirect("customer_dashboard.jsp");
                return;
            }

            // Invalid login
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
