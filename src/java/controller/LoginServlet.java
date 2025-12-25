package controller;

import dao.DBConnection;
import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String pass  = req.getParameter("password");

        System.out.println("Email=" + email);
        System.out.println("Password=" + pass);

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?"
            );
            ps.setString(1, email.trim());
            ps.setString(2, pass.trim());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                req.getSession().setAttribute("userId", rs.getInt("id"));
                res.sendRedirect(req.getContextPath() + "/subject.jsp");
            } else {
                res.getWriter().print("Invalid details");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
