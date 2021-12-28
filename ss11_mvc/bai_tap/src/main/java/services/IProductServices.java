package services;

import model.Product;

import java.util.List;

public interface IProductServices {
    List<Product> displayAll();

    void creatNew(Product creatProduct);

    void update(int id, Product updateProduct);

    void delete(int id);

    Product seeDetail(int id);

    List<Product> searchByName(String nameProduct);

    Product findById(int id);
}
