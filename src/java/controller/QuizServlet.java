package controller;

import dao.DBConnection;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/QuizServlet")
public class QuizServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            res.sendRedirect("index.jsp");
            return;
        }

        String subject = req.getParameter("subject");

        // if subject not selected before, get from session
        if (subject == null) {
            subject = (String) session.getAttribute("subject");
        } else {
            session.setAttribute("subject", subject);
        }

        List<Map<String, String>> questions = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM questions WHERE subject=?"
            );
            ps.setString(1, subject);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, String> q = new HashMap<>();
                q.put("id", rs.getString("id"));
                q.put("question", rs.getString("question"));
                q.put("option1", rs.getString("option1"));
                q.put("option2", rs.getString("option2"));
                q.put("option3", rs.getString("option3"));
                q.put("option4", rs.getString("option4"));
                q.put("correct", rs.getString("correct_option"));
                questions.add(q);
            }

            session.setAttribute("questions", questions);
            res.sendRedirect("quiz.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doGet(req, res);
    }
}
