package controller;

import dao.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            res.sendRedirect("index.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");
        String subject = (String) session.getAttribute("subject");

        List<Map<String,String>> questions =
            (List<Map<String,String>>) session.getAttribute("questions");

        Map<String,String> answers = new HashMap<>();

        for (Map<String,String> q : questions) {
            String qid = q.get("id");
            String ans = req.getParameter("q" + qid);
            if (ans != null) {
                answers.put(qid, ans);
            }
        }

        int score = 0;
        for (Map<String,String> q : questions) {
            String qid = q.get("id");
            if (answers.containsKey(qid)
                    && answers.get(qid).equals(q.get("correct"))) {
                score++;
            }
        }

        // ✅ SAVE RESULT INTO DATABASE
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO results (user_id, subject, score, total_questions) VALUES (?,?,?,?)"
            );

            ps.setInt(1, userId);
            ps.setString(2, subject);
            ps.setInt(3, score);
            ps.setInt(4, questions.size());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        session.setAttribute("score", score);
        session.setAttribute("answers", answers);

        res.sendRedirect("result.jsp");
    }
}
