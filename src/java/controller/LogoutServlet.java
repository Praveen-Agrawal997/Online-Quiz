package controller;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        HttpSession session = req.getSession(false);

        if (session != null) {
            session.invalidate(); // destroy session
        }

        res.sendRedirect(req.getContextPath() + "/index.jsp");
    }
}
