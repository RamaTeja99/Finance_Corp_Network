package com.apsfc.services;

import java.util.List;
import java.util.logging.Logger;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import com.apsfc.data.Customer;
@Stateless
public class CustomerDAO {

    @PersistenceContext
    private EntityManager em;
    
    private static final Logger logger = Logger.getLogger(CustomerDAO.class.getName());

    public List<Customer> getAllCustomers() {
        List<Customer> customers = null;
        try {
            TypedQuery<Customer> query = em.createQuery("SELECT c FROM Customer c", Customer.class);
            customers = query.getResultList();
            logger.info("Retrieved customers: " + customers);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customers;
    }
    public void updateCustomer(Customer customer) {
        em.merge(customer);
    }

    public void deleteCustomer(Long customerId) {
        Customer customer = em.find(Customer.class, customerId);
        if (customer != null) {
            em.remove(customer);
        }
    }

    public Customer getCustomerById(Long customerId) {
        return em.find(Customer.class, customerId);
    }
}

