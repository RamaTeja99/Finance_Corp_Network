package com.apsfc.servlet;

import java.io.IOException;
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String role = request.getParameter("role");
        
        if ("customer".equalsIgnoreCase(role)) {
            // Register Customer
        	Employee employee = (Employee) request.getSession().getAttribute("employee");
            if (employee == null) {
                  response.sendRedirect("login.jsp");
                  return;
            }
            if(employee.getPosition() == "Manager") {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String customerType = request.getParameter("customerType");
            String phone_no = request.getParameter("phone");

            try {
                customerService.registerCustomer((Long)employee.getEmployeeId(),name, email, username, password, customerType,phone_no);
                String successMessage = "Employee "+ name +" added by " + employee.getName();
                request.setAttribute("successMessage", successMessage);
                response.sendRedirect("employee_dashboard.jsp");
            } catch (Exception e) {
                // Handle registration error
                e.printStackTrace();
                response.sendRedirect("login.jsp");
            }
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
