package reponsitory.impl;

import model.Customer;
import reponsitory.ICustomerReponsitory;

import java.sql.SQLException;
import java.util.List;

public class CustomerReponsitoryImpl implements ICustomerReponsitory {
    //customer
    private static final String INSERT_USERS_SQL = "INSERT INTO users" + "  (name, email, country) VALUES " +
            " (?, ?, ?);";

    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_USER_BY_COUNTRY = "select id,name,email,country from users where country like ?";
    private static final String SELECT_ALL_USERS = "call displayAllusers()";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "call updateUsers(?,?,?,?);";

    @Override
    public void createCustomer(Customer user) throws SQLException {

    }

    @Override
    public Customer selectCustomer(int id) {
        return null;
    }

    @Override
    public List<Customer> selectAllCustomer() {
        return null;
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateCustomer(Customer user) throws SQLException {
        return false;
    }

    @Override
    public List<Customer> searchCustomer(String countryFind) {
        return null;
    }
}
