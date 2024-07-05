package com.apsfc.rest;

import javax.ejb.EJB;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.apsfc.data.Employee;
import com.apsfc.services.EmployeeService;


@Path("/employee")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class EmployeeResource {
    @EJB
    private EmployeeService employeeService;

    @POST
    @Path("/login")
    public Response employeeLogin(LoginRequest loginRequest) {
        Employee employee = employeeService.validateEmployeeLogin(loginRequest.getUsername(), loginRequest.getPassword());
        if (employee != null) {
            return Response.ok(employee).build();
        } else {
            return Response.status(Response.Status.UNAUTHORIZED).build();
        }
    }

    // Other employee-related endpoints
}
