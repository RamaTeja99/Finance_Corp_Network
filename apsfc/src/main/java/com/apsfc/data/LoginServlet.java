package com.apsfc.data;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apsfc.services.AdminService;
import com.apsfc.services.CustomerService;
import com.apsfc.services.EmployeeService;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@EJB
    private AdminService adminService;

    @EJB
    private EmployeeService employeeService;

    @EJB
    private CustomerService customerService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Admin admin = adminService.validateAdminLogin(username, password);
        if (admin != null) {
            // Admin logged in successfully
            request.getSession().setAttribute("admin", admin);
            response.sendRedirect("admin_dashboard.jsp");
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
    }
}

