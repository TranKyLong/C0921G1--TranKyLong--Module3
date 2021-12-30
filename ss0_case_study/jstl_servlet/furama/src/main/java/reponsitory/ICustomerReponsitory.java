package reponsitory;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerReponsitory {
    void createCustomer(Customer user) throws SQLException;

    Customer selectCustomer(int id);

    List<Customer> selectAllCustomer();

    boolean deleteCustomer(int id) throws SQLException;

    boolean updateCustomer(Customer user) throws SQLException;

    List<Customer> searchCustomer(String countryFind);

}
