package com.apsfc.services;

import java.util.List;
import java.util.logging.Logger;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import com.apsfc.data.Admin;
import com.apsfc.data.Customer;
import com.apsfc.data.CustomerLoan;
import com.apsfc.data.Employee;

@Stateless
public class EmployeeService {

    @PersistenceContext
    private EntityManager em;

    public void registerEmployee(Long adminId, String name, String email, String username, String password, String position) {
        Employee employee = new Employee();
        Admin admin = em.find(Admin.class, adminId);
        
        if (admin != null) {
            employee.setAdminId(adminId);
            employee.setName(name);
            employee.setEmail(email);
            employee.setUsername(username);
            employee.setPassword(password);
            employee.setPosition(position);

            em.persist(employee);
        } else {
            throw new IllegalArgumentException("Admin with ID " + adminId + " not found");
        }
    }

    public Employee validateEmployeeLogin(String username, String password) {
        try {
            return em.createQuery("SELECT e FROM Employee e WHERE e.username = :username AND e.password = :password", Employee.class)
                     .setParameter("username", username)
                     .setParameter("password", password)
                     .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
        @EJB
        private EmployeeDAO employeeDAO;
        
        private static final Logger logger = Logger.getLogger(CustomerService.class.getName());

        public List<Employee> readEmployeeData() {
            List<Employee> employees = employeeDAO.getAllEmployees();
            logger.info("CustomerService readCustomerData retrieved: " + employees);
            return employees;
        }
        public List<Customer> getCustomersByEmployeeId(Long employeeId) {
            TypedQuery<Customer> query = em.createQuery(
                "SELECT c FROM Customer c WHERE c.employeeId = :employeeId", Customer.class);
            query.setParameter("employeeId", employeeId);
            return query.getResultList();
        }

        public List<CustomerLoan> getLoansByEmployeeId(Long employeeId) {
            TypedQuery<CustomerLoan> query = em.createQuery(
                "SELECT cl FROM CustomerLoan cl WHERE cl.customerId IN (SELECT c.customerId FROM Customer c WHERE c.employeeId = :employeeId)", CustomerLoan.class);
            query.setParameter("employeeId", employeeId);
            return query.getResultList();
        }
    
}
