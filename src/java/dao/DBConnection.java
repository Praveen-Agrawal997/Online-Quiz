package dao;
import java.sql.*;

public class DBConnection {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://yamabiko.proxy.rlwy.net:36466/railway?useSSL=false&allowPublicKeyRetrieval=true",
                "root",
                "QcauDOZuTgXpocbGGGAYfsQdUyIXshyB"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}

