package controller;

import dao.DBConnection;
import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String pass = req.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();

            // Check if email already exists
            PreparedStatement check = con.prepareStatement(
                "SELECT id FROM users WHERE email=?"
            );
            check.setString(1, email);
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                res.getWriter().print("Email already registered!");
                return;
            }

            // Insert new user
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(name, email, password) VALUES (?, ?, ?)"
            );
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pass);

            ps.executeUpdate();

            // Redirect to login page
            res.sendRedirect("index.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
