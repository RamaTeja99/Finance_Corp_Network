package com.apsfc.servlet;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.apsfc.services.AdminService;
import com.apsfc.services.EmployeeService;
import com.apsfc.services.LoanServiceImpl;
import com.apsfc.services.CustomerService;
import com.apsfc.data.Admin;
import com.apsfc.data.Employee;
import com.apsfc.data.Customer;
import com.apsfc.data.CustomerLoan;

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
    
    @EJB
    private LoanServiceImpl loanService;

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
                response.sendRedirect("adminDashboard");
                return;
            }

            Employee employee = employeeService.validateEmployeeLogin(username, password);
            if (employee != null) {
                // Employee logged in successfully
                request.getSession().setAttribute("employee", employee);
                response.sendRedirect("employeeDashboard");
                return;
            }

            Customer customer = customerService.validateCustomerLogin(username, password);
            if (customer != null) {
                request.getSession().setAttribute("customer", customer);
                response.sendRedirect("customerDashboard");
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
