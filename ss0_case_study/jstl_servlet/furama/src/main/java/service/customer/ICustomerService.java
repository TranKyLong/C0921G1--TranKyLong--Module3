package service.customer;

import model.Customer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICustomerService {
    Map<String,String> createCustomer(Customer user) throws SQLException;

    Customer selectCustomer(int id);

    List<Customer> displayAllCustomer();

    void deleteCustomer(int id) ;

    Map<String, String> updateCustomer(Customer customer) throws SQLException;


    Customer findById(int id);
}
