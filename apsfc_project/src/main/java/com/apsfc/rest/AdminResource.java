package com.apsfc.rest;

import javax.ejb.EJB;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.apsfc.data.Admin;
import com.apsfc.services.AdminService;

@Path("/admin")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class AdminResource {
    @EJB
    private AdminService adminService;

    @POST
    @Path("/login")
    public Response adminLogin(LoginRequest loginRequest) {
        Admin admin = adminService.validateAdminLogin(loginRequest.getUsername(), loginRequest.getPassword());
        if (admin != null) {
            return Response.ok(admin).build();
        } else {
            return Response.status(Response.Status.UNAUTHORIZED).build();
        }
    }

    // Other admin-related endpoints
}
