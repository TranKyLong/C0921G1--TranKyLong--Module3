package reponsitory.customer;

import model.Customer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICustomerReponsitory {
    void createCustomer(Customer customer) throws SQLException;

    Customer selectCustomer(int id);

    List<Customer> displayAllCustomer();

    void deleteCustomer(int id) throws SQLException;

    Customer updateCustomer(Customer customer) throws SQLException;

    Customer findById(int id);


}
