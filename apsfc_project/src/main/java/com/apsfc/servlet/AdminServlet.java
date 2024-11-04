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
import java.util.Date;
import java.util.List;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@EJB
	private LoanServiceImpl loanService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("updateLoanStatus".equals(action)) {
            Long loanId = Long.parseLong(request.getParameter("loanId"));
            String status = request.getParameter("status");
            CustomerLoan loan = loanService.findById(loanId);

            if ("approved".equals(status)) {
                Date currentDate = new Date();
                loan.setLoanStartdate(new java.sql.Date(currentDate.getTime()));
                
                long endDateMillis = (long) (currentDate.getTime() + (double) (loan.getLoan_timeinterval()) * 365.25 * 24 * 60 * 60 * 1000);
                loan.setLoanEnddate(new java.sql.Date(endDateMillis));
                
                double installment = (loan.getInterestRate() / 100) * loan.getLoanAmount();
                loan.setLoanInstallment(installment);
            }
            loan.setLoanStatus(status);
            loanService.updateLoanStatus(loan);
            request.getRequestDispatcher("/retrieveForAdmin").forward(request, response);
        }
    }
}
