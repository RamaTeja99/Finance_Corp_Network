package com.apsfc.servlet;

import com.apsfc.data.CustomerLoan;
import com.apsfc.services.LoanServiceImpl;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CustomerLoanServlet")
public class CustomerLoanServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@EJB
	private LoanServiceImpl loanService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("requestLoan".equals(action)) {
        	 String customerIdStr = request.getParameter("customerId");
             if (customerIdStr == null || customerIdStr.isEmpty()) {
                 throw new IllegalArgumentException("Customer ID is required.");
             }

             Long customerId = Long.parseLong(customerIdStr);
            String loanType = request.getParameter("loanType");
            double loanAmount = Double.parseDouble(request.getParameter("loanAmount"));
            double interestRate = Double.parseDouble(request.getParameter("interestRate"));
            double loanTimeinterval = Double.parseDouble(request.getParameter("loanTimeinterval"));

            CustomerLoan loan = new CustomerLoan();
            loan.setCustomerId(customerId);
            loan.setLoanType(loanType);
            loan.setLoanAmount(loanAmount);
            loan.setInterestRate(interestRate);
            loan.setLoan_timeinterval(loanTimeinterval);

            loanService.submitLoanRequest(loan);
            response.sendRedirect("customer_dashboard.jsp");
        }
    }
}
