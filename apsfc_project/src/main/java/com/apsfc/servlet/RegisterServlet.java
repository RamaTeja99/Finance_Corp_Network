package com.apsfc.servlet;

import java.io.IOException;
import java.util.logging.Logger;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apsfc.services.EmployeeService;
import com.apsfc.data.Admin;
import com.apsfc.data.Employee;
import com.apsfc.services.CustomerService;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private EmployeeService employeeService;

    @EJB
    private CustomerService customerService;
    private static final Logger LOGGER = Logger.getLogger(RegisterServlet.class.getName());

 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String role = request.getParameter("role");
        LOGGER.info(role);
        if ("customer".equalsIgnoreCase(role)) {
            // Register Customer
        	Employee employee = (Employee) request.getSession().getAttribute("employee");
            if (employee == null) {
                  response.sendRedirect("login.jsp");
                  return;
            }
            if ("Manager".equals(employee.getPosition())) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String customerType = request.getParameter("customerType");
            String phone_no = request.getParameter("phone");
            LOGGER.info("Added Customer");

            try {
            	LOGGER.info("Employee adding");
                customerService.registerCustomer((Long)employee.getEmployeeId(),name, email, username, password, customerType,phone_no);
                String successMessage = "Employee "+ name +" added by " + employee.getName();
                request.setAttribute("successMessage", successMessage);
                response.sendRedirect("employeeDashboard");
            } catch (Exception e) {
                // Handle registration error
                e.printStackTrace();
                response.sendRedirect("employeeDashboard");
            }
            }
        } else if ("employee".equalsIgnoreCase(role)) {
            // Register Employee - only accessible by admin
            Admin admin = (Admin) request.getSession().getAttribute("admin");
            if (admin == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            LOGGER.info("Adding by admin");

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String position = request.getParameter("position");

            try {
            	LOGGER.info("added Employee");
                employeeService.registerEmployee(admin.getAdminId(), name, email, username, password, position);
                String successMessage = "Employee "+ name +" added by " + admin.getUsername();
                request.setAttribute("successMessage", successMessage);
                response.sendRedirect("adminDashboard");
            } catch (Exception e) {
                // Handle registration error
                e.printStackTrace();
                response.sendRedirect("adminDashboard");
            }
        } else {
            response.sendRedirect("index.xhtml");
        }
    }

}
