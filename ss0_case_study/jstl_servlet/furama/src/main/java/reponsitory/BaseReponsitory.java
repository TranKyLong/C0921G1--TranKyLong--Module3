package reponsitory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseReponsitory {
    public static Connection connection;
    public static String jdbcURL = "jdbc:mysql://localhost:3306/resortfurama?useSSL=false";
    public static String jdbcUsername = "root";
    public static String jdbcPassword = "long842000";

    public BaseReponsitory() {
    }

    public static Connection getConnection()  {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return connection;

    }

    public static void close() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
