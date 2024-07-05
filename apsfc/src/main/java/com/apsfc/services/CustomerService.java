package com.apsfc.services;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import com.apsfc.data.Customer;

@Stateless
public class CustomerService {
    @PersistenceContext
    private EntityManager em;

    public void registerCustomer(Customer customer) {
        em.persist(customer);
    }

    public Customer validateCustomerLogin(String username, String password) {
        try {
            return em.createQuery("SELECT c FROM customer c WHERE c.username = :username AND c.password = :password", Customer.class)
                     .setParameter("username", username)
                     .setParameter("password", password)
                     .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    // Other customer-related methods (CRUD operations)
}
