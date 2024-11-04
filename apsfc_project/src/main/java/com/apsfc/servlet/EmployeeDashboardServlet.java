package com.apsfc.servlet;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apsfc.data.Customer;
import com.apsfc.data.CustomerLoan;
import com.apsfc.data.Employee;
import com.apsfc.services.EmployeeService;

/**
 * Servlet implementation class EmployeeDashboardServlet
 */
@WebServlet("/employeeDashboard")
public class EmployeeDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public EmployeeDashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    @EJB
    private EmployeeService employeeService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        if (employee == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Long employeeId = employee.getEmployeeId();
        List<Customer> customers = employeeService.getCustomersByEmployeeId(employeeId);
        List<CustomerLoan> loans = employeeService.getLoansByEmployeeId(employeeId);

        request.setAttribute("customers", customers);
        request.setAttribute("loans", loans);

        request.getRequestDispatcher("employee_dashboard.jsp").forward(request, response);
    }


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
