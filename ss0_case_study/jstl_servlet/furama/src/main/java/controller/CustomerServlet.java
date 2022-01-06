package controller;

import model.Customer;
import model.CustomerType;
import service.customer.CustomerSerivceImpl;
import service.customer.ICustomerService;
import service.customertype.CustomerTypeServiceImpl;
import service.customertype.ICustomerTypeService;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customer"})
public class CustomerServlet extends HttpServlet {

    private ICustomerService customerService = new CustomerSerivceImpl();
    private ICustomerTypeService typeService = new CustomerTypeServiceImpl();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(request, response);
                break;
            case "edit":
                update(request, response);
                break;
            default:
                showList(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = " ";
        }
        switch (action) {
            case "create":
                showCreate(request, response);
                break;
            case "edit":
                showUpdate(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                showList(request, response);
                break;
        }
    }


    private void showUpdate(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = typeService.displayAllCustomerType();
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        request.setAttribute("customerTypeList", customerTypeList);
        request.setAttribute("customer", customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("update_customer.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.deleteCustomer(id);
        showList(request, response);
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("customername");
        String birth = request.getParameter("birthday");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String mail = request.getParameter("mail");
        String address = request.getParameter("address");

        int typeId ;
        try {
            typeId = Integer.parseInt(request.getParameter("customertype"));
        } catch (Exception e) {
             typeId = 0;
        }

        Customer customer = new Customer(name, birth, gender, idCard, phone, mail, new CustomerType(typeId), address);
        try {
            Map<String, String> stringStringMap = customerService.createCustomer(customer);
            if (!stringStringMap.isEmpty()) {
                List<CustomerType> customerTypeList = typeService.displayAllCustomerType();
                request.setAttribute("customerTypeList", customerTypeList);
                request.setAttribute("mailCheck", stringStringMap.get("mailCheck"));
                request.setAttribute("nameCheck", stringStringMap.get("nameCheck"));
                request.setAttribute("idCardCheck", stringStringMap.get("idCardCheck"));
                request.setAttribute("phoneCheck", stringStringMap.get("phoneCheck"));
                request.setAttribute("genderCheck", stringStringMap.get("genderCheck"));
                request.setAttribute("typeCheck", stringStringMap.get("typeCheck"));

                request.setAttribute("customer", customer);
                request.getRequestDispatcher("create_customer.jsp").forward(request, response);
            } else {

                response.sendRedirect("customer");
            }
        } catch (SQLException | ServletException | IOException throwables) {
            throwables.printStackTrace();
        }
    }


    private void showList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Customer> displayAll = customerService.displayAllCustomer();
        request.setAttribute("displayallcustomer", displayAll);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list_customer.jsp");
        dispatcher.forward(request, response);
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = typeService.displayAllCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);

        List<Customer> displayAll = customerService.displayAllCustomer();
        request.setAttribute("customerList", displayAll);

        RequestDispatcher dispatcher = request.getRequestDispatcher("create_customer.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


    private void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("customerId_u"));
        String name = request.getParameter("customername");
        String birth = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String idcard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String mail = request.getParameter("mail");
        int typeId = 0;
        try {
            typeId = Integer.parseInt(request.getParameter("customertype"));
        } catch (Exception e) {
            typeId=0;
        }

        CustomerType customerType = new CustomerType(typeId);
        String address = request.getParameter("address");
        Customer customer = new Customer(id, name, birth, Integer.parseInt(gender), idcard, phone, mail, customerType, address);
        try {
            Map<String, String> stringStringMap = customerService.updateCustomer(customer);
            if (!stringStringMap.isEmpty()) {
                List<CustomerType> customerTypeList = typeService.displayAllCustomerType();
                request.setAttribute("customerTypeList", customerTypeList);

                request.setAttribute("mailCheck", stringStringMap.get("mailCheck"));
                request.setAttribute("nameCheck", stringStringMap.get("nameCheck"));
                request.setAttribute("idCardCheck", stringStringMap.get("idCardCheck"));
                request.setAttribute("phoneCheck", stringStringMap.get("phoneCheck"));
                request.setAttribute("genderCheck", stringStringMap.get("genderCheck"));
                request.setAttribute("typeCheck", stringStringMap.get("typeCheck"));
                request.setAttribute("customer", customer);
                request.getRequestDispatcher("update_customer.jsp").forward(request, response);
            } else {
                response.sendRedirect("customer");
            }
        } catch (SQLException | ServletException | IOException throwables) {
            throwables.printStackTrace();
        }
        response.sendRedirect("customer");
    }
}
