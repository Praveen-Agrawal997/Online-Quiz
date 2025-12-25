<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>

<%
    HttpSession s = request.getSession(false);
    if (s == null || s.getAttribute("userId") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    int userId = (Integer) s.getAttribute("userId");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Results</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body class="container mt-4">

        <h3>My Quiz History</h3>

        <table class="table table-bordered">
            <tr>
                <th>Subject</th>
                <th>Score</th>
                <th>Total</th>
                <th>Date</th>
            </tr>

            <%
                Connection con = DBConnection.getConnection();
                PreparedStatement ps
                        = con.prepareStatement("SELECT * FROM results WHERE user_id=?");
                ps.setInt(1, userId);

                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("subject")%></td>
                <td><%= rs.getInt("score")%></td>
                <td><%= rs.getInt("total_questions")%></td>
                <td><%= rs.getTimestamp("quiz_date")%></td>
            </tr>
            <%
                }
            %>
        </table>

        <a href="subject.jsp" class="btn btn-primary">Take Another Quiz</a>
        <a href="LogoutServlet" class="btn btn-danger">Logout</a>

    </body>
</html>
