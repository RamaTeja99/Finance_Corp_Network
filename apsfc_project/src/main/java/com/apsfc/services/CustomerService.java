package com.apsfc.services;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import com.apsfc.data.Admin;
import com.apsfc.data.Customer;
import com.apsfc.data.Employee;

@Stateless
public class CustomerService {

    @PersistenceContext
    private EntityManager em;

    public void registerCustomer(Long employeeId,String name, String email, String username, String password, String customerType,String phone_no) {
        Customer customer = new Customer();
        Employee employee = em.find(Employee.class, employeeId);
        if (employee != null) {
        customer.setEmployeeId(employeeId); 
        customer.setName(name);
        customer.setEmail(email);
        customer.setUsername(username);
        customer.setPassword(password);
        customer.setCustomerType(customerType);
        customer.setPhone_no(phone_no);
        
        em.persist(customer); // Ensure customer entity is persisted correctly
        }
    else {
        throw new IllegalArgumentException("Employee with ID " + employeeId + " not found");
    }
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

    @EJB
    private CustomerDAO customerDAO;
    
    private static final Logger logger = Logger.getLogger(CustomerService.class.getName());

    public List<Customer> readCustomerData() {
        List<Customer> customers = customerDAO.getAllCustomers();
        logger.info("CustomerService readCustomerData retrieved: " + customers);
        return customers;
    }
    
}
