package com.apsfc.data;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apsfc.services.CustomerService;
import com.apsfc.services.EmployeeService;

/**
 * Servlet implementation class RetrieveCustomers
 */
@WebServlet("/retrieveCustomers")
public class RetrieveCustomers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RetrieveCustomers() {
        super();
        // TODO Auto-generated constructor stub
    }

    @EJB
    private CustomerService customerService;
    @EJB
    private EmployeeService employeeService;

    private static final Logger logger = Logger.getLogger(RetrieveCustomers.class.getName());
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       List<Customer> customerList = customerService.readCustomerData();
	        logger.info("Retrieved customer list: " + customerList);
	        request.setAttribute("list", customerList);
	        List<Employee> employeeList = employeeService.readEmployeeData();
	        logger.info("Retrieved employee list: " + employeeList);
	        request.setAttribute("employeeList", employeeList);
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
