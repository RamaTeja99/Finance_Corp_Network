package com.apsfc.rest;
import javax.ejb.EJB;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.apsfc.data.Customer;
import com.apsfc.services.CustomerService;

@Path("/customer")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class CustomerResource {
    @EJB
    private CustomerService customerService;

    @POST
    @Path("/register")
    public Response registerCustomer(Customer customer) {
        customerService.registerCustomer(customer);
        return Response.ok().build();
    }

    @POST
    @Path("/login")
    public Response customerLogin(LoginRequest loginRequest) {
        Customer customer = customerService.validateCustomerLogin(loginRequest.getUsername(), loginRequest.getPassword());
        if (customer != null) {
            return Response.ok(customer).build();
        } else {
            return Response.status(Response.Status.UNAUTHORIZED).build();
        }
    }

    // Other customer-related endpoints
}
