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
import com.apsfc.services.LoanServiceImpl;

/**
 * Servlet implementation class CustomerDashboardServlet
 */
@WebServlet("/customerDashboard")
public class CustomerDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerDashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    @EJB
    private LoanServiceImpl loanService;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Customer customer = (Customer) request.getSession().getAttribute("customer");
		  Long customerId = customer.getCustomerId();
          List<CustomerLoan> pendingLoans = loanService.findLoansByCustomerIdAndStatus(customerId, "pending");
          List<CustomerLoan> acceptedLoans = loanService.findLoansByCustomerIdAndStatus(customerId, "approved");
          List<CustomerLoan> rejectedLoans = loanService.findLoansByCustomerIdAndStatus(customerId, "rejected");
          request.setAttribute("pendingLoans", pendingLoans);
          request.setAttribute("acceptedLoans", acceptedLoans);
          request.setAttribute("rejectedLoans", rejectedLoans);
          request.getRequestDispatcher("customer_dashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
