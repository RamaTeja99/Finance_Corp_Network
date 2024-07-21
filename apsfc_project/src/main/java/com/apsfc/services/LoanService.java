package com.apsfc.services;

import com.apsfc.data.Loan;
import com.apsfc.data.Admin;
import com.apsfc.data.Customer;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@Stateless
public class LoanService {

    @PersistenceContext
    private EntityManager entityManager;

    // Method to fetch loans associated with a specific admin
    public List<Loan> getLoansForAdmin(Admin admin) {
        TypedQuery<Loan> query = entityManager.createQuery(
                "SELECT l FROM Loan l WHERE l.admin = :admin", Loan.class);
        query.setParameter("admin", admin);
        return query.getResultList();
    }

    // Method to fetch loans associated with a specific customer
    public List<Loan> getLoansForCustomer(Customer customer) {
        TypedQuery<Loan> query = entityManager.createQuery(
                "SELECT l FROM Loan l WHERE l.customer = :customer", Loan.class);
        query.setParameter("customer", customer);
        return query.getResultList();
    }

    // Method to save a new loan
    public void saveLoan(Loan loan) {
        entityManager.persist(loan);
    }

    // Method to update an existing loan
    public void updateLoan(Loan loan) {
        entityManager.merge(loan);
    }

    // Method to delete a loan
    public void deleteLoan(Long loanId) {
        Loan loan = entityManager.find(Loan.class, loanId);
        if (loan != null) {
            entityManager.remove(loan);
        }
    }
    

    // Other methods related to loan management (e.g., approval/rejection logic)

}
