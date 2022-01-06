package reponsitory.customertype;

import model.Customer;
import model.CustomerType;
import reponsitory.BaseReponsitory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeReponsitoryImpl implements ICustomerTypeReponsitory {
    private static final String CREATE_CUSTOMER_TYPE =
            "INSERT into customer_type (customer_type_id,customer_type_name) VALUES ( ? , ? ); ";

    private static final String SELECT_ALL_CUSTOMER_TYPE = "select * from customer_type where delete_flag=1;";
//    private static final String CREATE_CUSTOMER;
//    private static final String CREATE_CUSTOMER;

    public CustomerTypeReponsitoryImpl() {
    }

    @Override
    public List<CustomerType> displayAllCustomerType() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        try (PreparedStatement preparedStatement = BaseReponsitory.getConnection().prepareStatement(SELECT_ALL_CUSTOMER_TYPE);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("customer_type_id");

                String typeName = rs.getString("customer_type_name");
                customerTypeList.add(new CustomerType(id, typeName));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customerTypeList;
    }

    public static void main(String[] args) {

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

}
