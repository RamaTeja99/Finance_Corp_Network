package com.apsfc.services;

import java.util.List;
import java.util.logging.Logger;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import com.apsfc.data.Employee;

@Stateless
public class EmployeeDAO {

    @PersistenceContext
    private EntityManager em;
    
    private static final Logger logger = Logger.getLogger(EmployeeDAO.class.getName());

    public List<Employee> getAllEmployees() {
        List<Employee> employees = null;
        try {
            TypedQuery<Employee> query = em.createQuery("SELECT e FROM Employee e", Employee.class);
            employees = query.getResultList();
            logger.info("Retrieved employees: " + employees);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return employees;
    }

    public void updateEmployee(Employee employee) {
        em.merge(employee);
    }

    public void deleteEmployee(Long employeeId) {
        Employee employee = em.find(Employee.class, employeeId);
        if (employee != null) {
            em.remove(employee);
        }
    }

    public Employee getEmployeeById(Long employeeId) {
        return em.find(Employee.class, employeeId);
    }
}
