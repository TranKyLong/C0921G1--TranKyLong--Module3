package service.customertype;

import model.CustomerType;
import reponsitory.customertype.CustomerTypeReponsitoryImpl;
import reponsitory.customertype.ICustomerTypeReponsitory;

import java.util.List;

public class CustomerTypeServiceImpl implements ICustomerTypeService {
    ICustomerTypeReponsitory typeReponsitory = new CustomerTypeReponsitoryImpl();

    @Override
    public List<CustomerType> displayAllCustomerType() {
        return typeReponsitory.displayAllCustomerType();
    }
}
