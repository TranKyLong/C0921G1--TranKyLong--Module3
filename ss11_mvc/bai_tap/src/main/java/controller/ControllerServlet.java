package controller;

import model.Product;
import services.IProductServices;
import services.impl.ProductServicesImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ControllerServlet", urlPatterns = {"", "/Product"})
public class ControllerServlet extends HttpServlet {

    private final IProductServices servicesProduct = new ProductServicesImpl();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            default:
                break;
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.servicesProduct.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            this.servicesProduct.delete(id);
            try {
                response.sendRedirect("/Product");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int idProduct = Integer.parseInt(request.getParameter("id"));
        String ten = request.getParameter("ten");
        Double gia = Double.parseDouble(request.getParameter("gia"));
        String mota = request.getParameter("mota");
        String nsx = request.getParameter("nsx");
        Product product = this.servicesProduct.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            product.setId(idProduct);
            product.setTen(ten);
            product.setGia(gia);
            product.setMoTa(mota);
            product.setNsx(nsx);
            this.servicesProduct.update(id, product);
            request.setAttribute("Product", product);
            request.setAttribute("message", "Product information was updated");
            dispatcher = request.getRequestDispatcher("/Edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        String ten = request.getParameter("ten");
        String gia = request.getParameter("gia");
        String moTa = request.getParameter("moTa");
        String nsx = request.getParameter("nsx");
        int id = (int) (Math.random() * 10000);

        Product product = new Product(id, ten, Double.parseDouble(gia), moTa, nsx);
        this.servicesProduct.creatNew(product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/CreateProduct.jsp");
        request.setAttribute("message", "Tạo thành công");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreate(request, response);
                break;
            case "edit":
                showEdit(request, response);
                break;
            case "delete":
                showDelete(request, response);
                break;
            case "view":
                seeDetail(request, response);
                break;
            default:
                displayAll(request, response);
                break;
        }
    }

    private void seeDetail(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.servicesProduct.findById(id);
        RequestDispatcher dispatcher;
        if(product == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("Product", product);
            dispatcher = request.getRequestDispatcher("/SeeDetail.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/CreateProduct.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product productId = this.servicesProduct.findById(id);
        RequestDispatcher dispatcher;
        if (productId == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("Product", productId);
            dispatcher = request.getRequestDispatcher("Edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product productId = this.servicesProduct.findById(id);
        RequestDispatcher dispatcher;
        if (productId == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("Product", productId);
            dispatcher = request.getRequestDispatcher("Delete.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void displayAll(HttpServletRequest request, HttpServletResponse response) {
        List<Product> allProduct = this.servicesProduct.displayAll();
        request.setAttribute("Product", allProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/ProductDisplayer.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}


