package com.apsfc.services;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import com.apsfc.data.Customer;

@Stateless
public class CustomerService {

    @PersistenceContext
    private EntityManager em;

    public void registerCustomer(String name, String email, String username, String password, String customerType,String phone_no) {
        Customer customer = new Customer();
        customer.setName(name);
        customer.setEmail(email);
        customer.setUsername(username);
        customer.setPassword(password);
        customer.setCustomerType(customerType);
        customer.setPhone_no(phone_no);
        
        em.persist(customer); // Ensure customer entity is persisted correctly
    }

    public Customer validateCustomerLogin(String username, String password) {
        try {
            return em.createQuery("SELECT c FROM Customer c WHERE c.username = :username AND c.password = :password", Customer.class)
                     .setParameter("username", username)
                     .setParameter("password", password)
                     .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public List<Customer> readCustomerData() {
        List<Customer> customers = new ArrayList<>();
        try {
            TypedQuery<Customer> query = em.createQuery("SELECT c FROM Customer c", Customer.class);
            customers = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customers;
    }
}
