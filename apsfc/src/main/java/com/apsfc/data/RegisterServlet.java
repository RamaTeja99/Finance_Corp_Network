package com.apsfc.data;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apsfc.services.EmployeeService;
import com.apsfc.services.CustomerService;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private EmployeeService employeeService;

    @EJB
    private CustomerService customerService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String role = request.getParameter("role");
        
        if ("customer".equalsIgnoreCase(role)) {
            // Register Customer
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String customerType = request.getParameter("customerType");

            try {
                customerService.registerCustomer(name, email, username, password, customerType);
                response.sendRedirect("login.jsp");
            } catch (Exception e) {
                // Handle registration error
                e.printStackTrace();
                response.sendRedirect("register.jsp");
            }
        } else if ("employee".equalsIgnoreCase(role)) {
            // Register Employee - only accessible by admin
            Admin admin = (Admin) request.getSession().getAttribute("admin");
            if (admin == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String position = request.getParameter("position");

            try {
                employeeService.registerEmployee(admin.getAdminId(), name, email, username, password, position);
                response.sendRedirect("admin_dashboard.jsp");
            } catch (Exception e) {
                // Handle registration error
                e.printStackTrace();
                response.sendRedirect("admin_dashboard.jsp");
            }
        } else {
            response.sendRedirect("register.jsp");
        }
    }

}
