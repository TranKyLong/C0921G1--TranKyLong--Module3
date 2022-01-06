package service.customer;

import model.Customer;
import model.CustomerType;
import reponsitory.customer.ICustomerReponsitory;
import reponsitory.customer.CustomerReponsitoryImpl;
import service.customer.ICustomerService;
import validate.Validate;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerSerivceImpl implements ICustomerService {
    ICustomerReponsitory reponsi = new CustomerReponsitoryImpl();

    @Override
    public Map<String, String> createCustomer(Customer customer) throws SQLException {
        Map<String, String> stringStringMap = new HashMap<>();

        if (!Validate.regexMail(customer.getCustomerEmail())) {
            stringStringMap.put("mailCheck", "something wrong, please re-enter email ");
        }
//
        if (!Validate.regexName(customer.getCustomerName())) {
            stringStringMap.put("nameCheck", "something wrong, please re-enter name ");
        }
//
        if (!Validate.regexIdCard(customer.getCustomerIdCard())) {
            stringStringMap.put("idCardCheck", "something wrong, please re-enter IdCard ");
        }
//
        if (!Validate.regexPhone(customer.getCustomerPhone())) {
            stringStringMap.put("phoneCheck", "something wrong, please re-enter phone ");
        }
        if (!Validate.regexGender(customer.getCustomerGender())) {
            stringStringMap.put("genderCheck", "please chose gender ");
        }
        if (!Validate.regexType(customer.getCustomerType())) {
            stringStringMap.put("typeCheck", "something wrong, please chose Customer type ");
        }

        if (stringStringMap.isEmpty()) {
            reponsi.createCustomer(customer);
        }
        return stringStringMap;
    }

    public static void main(String[] args) {

         CustomerSerivceImpl cus = new CustomerSerivceImpl();
        CustomerType t = new CustomerType(3);
         Customer c = new Customer( "Naame", "2000-1-1", 1, "123456789", "0917598765","mail@mail.com", t , "adrees" );
        try {
            cus.createCustomer(c);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        try {
            Map <String , String> map =   cus.createCustomer(c);
            for (Map.Entry<String, String> entry : map.entrySet()) {
                System.out.println(entry.getKey() + "/" + entry.getValue());
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public Customer selectCustomer(int id) {
        return null;
    }

    @Override
    public List<Customer> displayAllCustomer() {
        return reponsi.displayAllCustomer();
    }

    @Override
    public void deleteCustomer(int id) {
        try {
            reponsi.deleteCustomer(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public Map<String, String> updateCustomer(Customer customer) throws SQLException {
        Map<String, String> stringStringMap = new HashMap<>();

        if (!Validate.regexMail(customer.getCustomerEmail())) {
            stringStringMap.put("mailCheck", "something wrong, please re-enter email ");
        }

        if (!Validate.regexName(customer.getCustomerName())) {
            stringStringMap.put("nameCheck", "something wrong, please re-enter name ");
        }

        if (!Validate.regexIdCard(customer.getCustomerIdCard())) {
            stringStringMap.put("idCardCheck", "something wrong, please re-enter IdCard ");
        }

        if (!Validate.regexPhone(customer.getCustomerPhone())) {
            stringStringMap.put("phoneCheck", "something wrong, please re-enter phone ");
        }
//        if (!Validate.regexGender(customer.getCustomerGender())) {
//            stringStringMap.put("genderCheck", "please choose gender ");
//        }
        if (!Validate.regexType(customer.getCustomerType())) {
            stringStringMap.put("typeCheck", "something wrong, please choose Customer type ");
        }

        if (stringStringMap.isEmpty()) {
            reponsi.updateCustomer(customer);
        }
        return stringStringMap;
    }


    @Override
    public Customer findById(int id) {
        return reponsi.findById(id);
    }
}


