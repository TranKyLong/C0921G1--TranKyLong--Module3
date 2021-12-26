import java.io.IOException;

@javax.servlet.annotation.WebServlet(name = "DiscountCalculatorServlet", urlPatterns = {"", "/tinhchietkhau"})
public class DiscountCalculatorServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String gia = request.getParameter("gia");
        String chietKhau = request.getParameter("chietkhau");

        double tyLeChietKhau = Integer.parseInt(gia) *  Integer.parseInt(chietKhau) * 0.01;

        request.setAttribute( "tyLeChietKhau",tyLeChietKhau);
        request.getRequestDispatcher("index.jsp").forward(ssrequest,response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }s
}
