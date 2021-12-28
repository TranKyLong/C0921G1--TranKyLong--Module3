package reponsitory;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public interface IProductReponsitory {
    List<Product> displayAll();

    void creatNew(Product creatProduct);

    void update(int id, Product updateProduct);

    void delete(int id);

    Product seeDetail(int id);

    List<Product> searchByName(String nameProduct);

    Product findById(int id);

}
