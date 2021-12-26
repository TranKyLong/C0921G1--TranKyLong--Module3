import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@WebServlet(name = "Servlet", urlPatterns = {"", "/customer"})
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new LinkedList<>();
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://training.zendvn.com/images/users-cv/default.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", " Bắc Giang", "https://training.zendvn.com/images/users-cv/default.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "https://training.zendvn.com/images/users-cv/default.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa", " 1983-08-17", "На Тау", "https://training.zendvn.com/images/users-cv/default.jpg"));

        request.setAttribute("listCustomer", customerList);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}

