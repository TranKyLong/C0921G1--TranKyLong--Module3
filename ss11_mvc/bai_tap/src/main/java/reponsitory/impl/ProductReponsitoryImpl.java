package reponsitory.impl;

import model.Product;
import reponsitory.IProductReponsitory;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class ProductReponsitoryImpl implements IProductReponsitory {

    static Map<Integer, Product> productMap;

    static {
        productMap = new TreeMap<>();
        productMap.put(15, new Product(15, "Iphone X", 20.2, "White & blue", "I Phone"));
        productMap.put(16, new Product(16, "Vinsmart Live 4 ", 19.5, "Pearl, Black, Gold", "Vin"));
        productMap.put(18, new Product(28, "Mobistar Live Zumbo", 15.5, "White, Red, Sea", "Mobistar"));
        productMap.put(23, new Product(92, "Neo Nokia ", 10.2, "Iron Clad", "Nokia"));
    }

    @Override
    public List<Product> displayAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void creatNew(Product creatProduct) {
        productMap.put(creatProduct.getId(), creatProduct);
    }

    @Override
    public void update(int id, Product updateProduct) {
        productMap.put(id, updateProduct);
    }

    @Override
    public void delete(int id) {
        productMap.remove(id);
    }

    @Override
    public Product seeDetail(int id) {
        return productMap.get(id);
    }

    @Override
    public List<Product> searchByName(String nameProduct) {
        List<Product> searchResult = new ArrayList<>();
        for (Product p : displayAll()) {
            if (p.getTen().contains(nameProduct)) {
                searchResult.add(p);
            }
        }
        return searchResult;
    }

    @Override
    public Product findById(int id) {
        for (Map.Entry<Integer, Product> entry : productMap.entrySet()) {
            if (entry.getKey() == id) {
                return entry.getValue();
            }
        }
        return null;
    }
}
