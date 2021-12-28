package services.impl;

import model.Product;
import reponsitory.IProductReponsitory;
import reponsitory.impl.ProductReponsitoryImpl;
import services.IProductServices;

import java.util.ArrayList;
import java.util.List;

public class ProductServicesImpl implements IProductServices {

    IProductReponsitory ps = new ProductReponsitoryImpl();


    @Override
    public List<Product> displayAll() {
        return ps.displayAll();
    }

    @Override
    public void creatNew(Product creatProduct) {
        ps.creatNew(creatProduct);
    }

    @Override
    public void update(int id, Product updateProduct) {
        ps.update(id, updateProduct);
    }

    @Override
    public void delete(int id) {
        ps.delete(id);
    }

    @Override
    public Product seeDetail(int id) {
        return ps.seeDetail(id);
    }

    @Override
    public List<Product> searchByName(String nameProduct) {
        return ps.searchByName(nameProduct);
    }

    @Override
    public Product findById(int id) {
        return ps.findById(id);
    }
}
