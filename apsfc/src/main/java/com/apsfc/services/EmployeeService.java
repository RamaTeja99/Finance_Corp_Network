package com.apsfc.services;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import com.apsfc.data.Admin;
import com.apsfc.data.Employee;

@Stateless
public class EmployeeService {
    @PersistenceContext
    private EntityManager em;

    // Employee registration handled by AdminService

    public Employee validateEmployeeLogin(String username, String password) {
        try {
            return em.createQuery("SELECT e FROM employee e WHERE e.username = :username AND e.password = :password", Employee.class)
                     .setParameter("username", username)
                     .setParameter("password", password)
                     .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
    public List<Employee> getEmployeesForAdmin(Admin admin) {
        TypedQuery<Employee> query = em.createQuery(
                "SELECT e FROM Employee e WHERE e.admin = :admin", Employee.class);
        query.setParameter("admin", admin);
        return query.getResultList();
    }

    // Other employee-related methods (CRUD operations)
}