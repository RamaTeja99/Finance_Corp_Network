package com.apsfc.servlet;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apsfc.data.Employee;
import com.apsfc.services.EmployeeDAO;

/**
 * Servlet implementation class EmployeeServlet
 */
@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private EmployeeDAO employeeDAO;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            Long employeeId = Long.parseLong(request.getParameter("employeeId"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String position = request.getParameter("position");

            Employee employee = new Employee();
            employee.setEmployeeId(employeeId);
            employee.setName(name);
            employee.setEmail(email);
            employee.setUsername(username);
            employee.setPassword(password);
            employee.setPosition(position);

            employeeDAO.updateEmployee(employee);
            
            // Redirect to RetrieveEmployees servlet to refresh the list
            request.getRequestDispatcher("/adminDashboard").forward(request, response);
        } else if ("delete".equals(action)) {
            Long employeeId = Long.parseLong(request.getParameter("employeeId"));
            employeeDAO.deleteEmployee(employeeId);
            request.getRequestDispatcher("/adminDashboard").forward(request, response);
        }
    }
}
