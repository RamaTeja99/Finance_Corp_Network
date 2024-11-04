package com.apsfc.servlet;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apsfc.data.Customer;
import com.apsfc.data.CustomerLoan;
import com.apsfc.data.Employee;
import com.apsfc.services.CustomerService;
import com.apsfc.services.EmployeeService;
import com.apsfc.services.LoanServiceImpl;

/**
 * Servlet implementation class RetrieveForAdmin
 */
@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */


    @EJB
    private CustomerService customerService;
    @EJB
    private EmployeeService employeeService;
    @EJB
	private LoanServiceImpl loanService;

    private static final Logger logger = Logger.getLogger(AdminDashboardServlet.class.getName());
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       List<Customer> customerList = customerService.readCustomerData();
	        logger.info("Retrieved customer list: " + customerList);
	        request.setAttribute("list", customerList);
	        List<Employee> employeeList = employeeService.readEmployeeData();
	        logger.info("Retrieved employee list: " + employeeList);
	        request.setAttribute("employeeList", employeeList);
	        List<CustomerLoan> pendingLoans = loanService.findAllPending();
	        logger.info("Retrieved employee list: " + loanService);
	        request.setAttribute("pendingLoans", pendingLoans);
	        RequestDispatcher rd = request.getRequestDispatcher("admin_dashboard.jsp");
	        rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
