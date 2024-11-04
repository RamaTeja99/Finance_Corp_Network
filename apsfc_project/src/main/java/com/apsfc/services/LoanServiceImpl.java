package com.apsfc.services;

import com.apsfc.data.CustomerLoan;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@Stateless
public class LoanServiceImpl {

    @PersistenceContext
    private EntityManager em;

    
    public void submitLoanRequest(CustomerLoan loan) {
        loan.setLoanStatus("pending");
        em.persist(loan);
    }

    
    public List<CustomerLoan> findAllPending() {
        TypedQuery<CustomerLoan> query = em.createQuery(
            "SELECT cl FROM CustomerLoan cl WHERE cl.loan_status = 'pending'", CustomerLoan.class);
        return query.getResultList();
    }

    
    public CustomerLoan findById(Long loanId) {
        return em.find(CustomerLoan.class, loanId);
    }

    
    public void updateLoanStatus(CustomerLoan loan) {
        em.merge(loan);
    }
    public List<CustomerLoan> findLoansByCustomerIdAndStatus(Long customerId, String status) {
        TypedQuery<CustomerLoan> query = em.createQuery(
            "SELECT cl FROM CustomerLoan cl WHERE cl.customerId = :customerId AND cl.loan_status = :status", CustomerLoan.class);
        query.setParameter("customerId", customerId);
        query.setParameter("status", status);
        return query.getResultList();
    }
}
