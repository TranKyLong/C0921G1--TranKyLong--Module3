package reponsitory.customer;

import model.Customer;
import model.CustomerType;
import reponsitory.BaseReponsitory;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerReponsitoryImpl implements ICustomerReponsitory {
    //customer
    private static final String CREATE_CUSTOMER =
            "  insert into customer ( " +
                    "  customer_type_id ,  " +
                    "  `customer_name` ,  " +
                    "  customer_birthday ,  " +
                    "  customer_gender ,  " +
                    "  customer_id_card ,  " +
                    "  customer_phone ,   " +
                    "  customer_email ,  " +
                    "  customer_address )  " +
                    "  value (?, ?, ?, ?, ?, ?, ?, ?); ";

    private static final String DISPLAY_ALL_CUSTOMER = "call displayAllCustomer();";
    private static final String FIND_BY_ID = "select * from  customer join customer_type ON customer.customer_type_id = customer_type.customer_type_id \n" +
            "where customer.delete_flag = 1 and customer.customer_id = ?;";
//    private static final String SELECT_USER_BY_COUNTRY = "select id,name,email,country from users where country like ?";


    private static final String DELETE_CUSTOMER = "UPDATE customer " +
            "SET delete_flag = 0 " +
            "WHERE customer_id = ?;";
    private static final String UPDATE_CUSTOMER = "    update customer " +
            "  SET customer_type_id = ?,  " +
            "  customer_name = ? , " +
            "  customer_birthday = ?, " +
            "  customer_gender = ? , " +
            "  customer_id_card = ?, " +
            "  customer_phone = ?,  " +
            "  customer_email = ?, " +
            "  customer_address = ? " +
            "  WHERE customer_id = ? ; ";


    @Override
    public void createCustomer(Customer Customer) throws SQLException {
        try (
                PreparedStatement preparedStatement = BaseReponsitory.getConnection().prepareStatement(CREATE_CUSTOMER)) {
            preparedStatement.setInt(1, Customer.getCustomerType().getCustomerTypeID());
            preparedStatement.setString(2, Customer.getCustomerName());
            preparedStatement.setString(3, Customer.getCustomerBirthday());
            preparedStatement.setInt(4, Customer.getCustomerGender());
            preparedStatement.setString(5, Customer.getCustomerIdCard());
            preparedStatement.setString(6, Customer.getCustomerPhone());
            preparedStatement.setString(7, Customer.getCustomerEmail());
            preparedStatement.setString(8, Customer.getCustomerAddress());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException ignored) {
            printSQLException(ignored);
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    @Override
    public Customer selectCustomer(int id) {
        return null;
    }

    @Override
    public List<Customer> displayAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        try (CallableStatement callableStatement = BaseReponsitory.getConnection().prepareCall(DISPLAY_ALL_CUSTOMER);) {
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                Customer showCustomer = new Customer();
                showCustomer.setCustomerId(rs.getInt("customer_id"));
                showCustomer.setCustomerName(rs.getString("customer_name"));

                String typeName = rs.getString("customer_type_name");
                Integer typeId = Integer.parseInt(rs.getString("customer_type_id"));
                showCustomer.setCustomerType(new CustomerType(typeId, typeName));
                showCustomer.setCustomerBirthday(rs.getString("customer_birthday"));
                showCustomer.setCustomerGender(rs.getInt("customer_gender"));
                showCustomer.setCustomerIdCard(rs.getString("customer_id_card"));
                showCustomer.setCustomerPhone(rs.getString("customer_phone"));
                showCustomer.setCustomerEmail(rs.getString("customer_email"));
                showCustomer.setCustomerAddress(rs.getString("customer_address"));
                customerList.add(showCustomer);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customerList;
    }


    @Override
    public void deleteCustomer(int id) {
        try {

            PreparedStatement preparedStatement = BaseReponsitory.getConnection().prepareStatement(DELETE_CUSTOMER);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            BaseReponsitory.close();
        }
    }


    @Override
    public Customer updateCustomer(Customer customer) throws SQLException {
        try {
            CallableStatement callableStatement = BaseReponsitory.getConnection().prepareCall(UPDATE_CUSTOMER);
            callableStatement.setInt(1, customer.getCustomerType().getCustomerTypeID());
            callableStatement.setString(2, customer.getCustomerName());
            callableStatement.setString(3, customer.getCustomerBirthday());
            callableStatement.setInt(4, customer.getCustomerGender());
            callableStatement.setString(5, customer.getCustomerIdCard());
            callableStatement.setString(6, customer.getCustomerPhone());
            callableStatement.setString(7, customer.getCustomerEmail());
            callableStatement.setString(8, customer.getCustomerAddress());
            callableStatement.setInt(9, customer.getCustomerId());
            callableStatement.executeUpdate();

            System.out.println(callableStatement);

        } catch (SQLException e) {
            printSQLException(e);
        }
        return customer;
    }

//    public static void main(String[] args) {
//        CustomerType t = new CustomerType(3);
//        Customer customer = new Customer("NameOne", "2000-1-1", 1, "123456789", "0917589987", "mail@gmail.com", t, "Adress");
//        CustomerReponsitoryImpl cus = new CustomerReponsitoryImpl();
//        try {
//            cus.createCustomer(customer);
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//        cus.displayAllCustomer();
//
//    }

    @Override
    public Customer findById(int id) {
        PreparedStatement preparedStatement;
        Customer cus = null;
        try {
            preparedStatement = BaseReponsitory.getConnection().prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                cus = new Customer();
                cus.setCustomerId(rs.getInt("customer_id"));
                cus.setCustomerName(rs.getString("customer_name"));
                //doi tuong customer type
                String typeName = rs.getString("customer_type_name");
                Integer typeId = Integer.parseInt(rs.getString("customer_type_id"));
                cus.setCustomerType(new CustomerType(typeId, typeName));
                cus.setCustomerBirthday(rs.getString("customer_birthday"));
                cus.setCustomerGender(rs.getInt("customer_gender"));
                cus.setCustomerIdCard(rs.getString("customer_id_card"));
                cus.setCustomerPhone(rs.getString("customer_phone"));
                cus.setCustomerEmail(rs.getString("customer_email"));
                cus.setCustomerAddress(rs.getString("customer_address"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            BaseReponsitory.close();
        }
        return cus;
    }

}
