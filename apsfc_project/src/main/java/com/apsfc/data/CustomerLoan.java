package com.apsfc.data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name="customer_loan")
public class CustomerLoan implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long customer_loan_id;

    @Column(name = "customer_id")
    private Long customerId;

    private String loan_type;
    private double interest_rate;
    private double loan_amount;
    private String loan_status;
    private Date loan_startdate;
    private Date loan_enddate;
    private double loan_installment;
    private double loan_timeinterval;

    // Getters and Setters
    // Constructors

    public Long getCustomer_loan_id() {
		return customer_loan_id;
	}

	public void setCustomer_loan_id(Long customer_loan_id) {
		this.customer_loan_id = customer_loan_id;
	}

	public String getLoan_type() {
		return loan_type;
	}

	public void setLoan_type(String loan_type) {
		this.loan_type = loan_type;
	}

	public double getInterest_rate() {
		return interest_rate;
	}

	public void setInterest_rate(double interest_rate) {
		this.interest_rate = interest_rate;
	}

	public double getLoan_amount() {
		return loan_amount;
	}

	public void setLoan_amount(double loan_amount) {
		this.loan_amount = loan_amount;
	}

	public String getLoan_status() {
		return loan_status;
	}

	public void setLoan_status(String loan_status) {
		this.loan_status = loan_status;
	}

	public Date getLoan_startdate() {
		return loan_startdate;
	}

	public void setLoan_startdate(Date loan_startdate) {
		this.loan_startdate = loan_startdate;
	}

	public Date getLoan_enddate() {
		return loan_enddate;
	}

	public void setLoan_enddate(Date loan_enddate) {
		this.loan_enddate = loan_enddate;
	}

	public double getLoan_installment() {
		return loan_installment;
	}

	public void setLoan_installment(double loan_installment) {
		this.loan_installment = loan_installment;
	}

	public double getLoan_timeinterval() {
		return loan_timeinterval;
	}

	public void setLoan_timeinterval(double loan_timeinterval) {
		this.loan_timeinterval = loan_timeinterval;
	}

	public Long getCustomerLoanId() {
        return customer_loan_id;
    }

    public void setCustomerLoanId(Long customer_loan_id) {
        this.customer_loan_id = customer_loan_id;
    }

 

    public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public String getLoanType() {
        return loan_type;
    }

    public void setLoanType(String loan_type) {
        this.loan_type = loan_type;
    }

    public double getInterestRate() {
        return interest_rate;
    }

    public void setInterestRate(double interest_rate) {
        this.interest_rate = interest_rate;
    }

    public double getLoanAmount() {
        return loan_amount;
    }

    public void setLoanAmount(double loanAmount) {
        this.loan_amount = loanAmount;
    }

    public String getLoanStatus() {
        return loan_status;
    }

    public void setLoanStatus(String loan_status) {
        this.loan_status = loan_status;
    }

    public Date getLoanStartdate() {
        return loan_startdate;
    }

    public void setLoanStartdate(Date loan_startdate) {
        this.loan_startdate = loan_startdate;
    }

    public Date getLoanEnddate() {
        return loan_enddate;
    }

    public void setLoanEnddate(Date loan_enddate) {
        this.loan_enddate = loan_enddate;
    }

    public double getLoanInstallment() {
        return loan_installment;
    }

    public void setLoanInstallment(double loan_installment) {
        this.loan_installment = loan_installment;
    }
}
