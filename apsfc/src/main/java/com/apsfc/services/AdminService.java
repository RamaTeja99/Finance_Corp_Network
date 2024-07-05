package com.apsfc.services;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import com.apsfc.data.Admin;

@Stateless
public class AdminService {
    @PersistenceContext
    private EntityManager em;

    public Admin validateAdminLogin(String username, String password) {
        try {
            return em.createQuery("SELECT a FROM Admin a WHERE a.username = :username AND a.password = :password", Admin.class)
                     .setParameter("username", username)
                     .setParameter("password", password)
                     .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    // Other admin-related methods (CRUD operations)
}