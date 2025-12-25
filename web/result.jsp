<%@ page import="java.util.*" %>
<%
    HttpSession s = request.getSession(false);

    if (s == null || s.getAttribute("score") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    int score = (Integer) s.getAttribute("score");
    List<Map<String, String>> questions
            = (List<Map<String, String>>) s.getAttribute("questions");

    Map<String, String> answers
            = (Map<String, String>) s.getAttribute("answers");

    String subject = (String) s.getAttribute("subject");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quiz Result</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body class="container mt-5">

        <h2 class="text-center">
            <%= subject.toUpperCase()%> Quiz Result
        </h2>

        <h4 class="text-center text-success">
            Score: <%= score%> / <%= questions.size()%>
        </h4>

        <hr>

        <h4>Answer Key</h4>

        <%
            int i = 1;
            for (Map<String, String> q : questions) {
                String qid = q.get("id");
                String correct = q.get("correct");
                String userAns = answers.get(qid);
        %>

        <div class="mb-3">
            <p><b>Q<%= i++%>. <%= q.get("question")%></b></p>

            <p>Your Answer:
                <span class="<%= (correct.equals(userAns)) ? "text-success" : "text-danger"%>">
                    Option <%= (userAns == null ? "Not Answered" : userAns)%>
                </span>
            </p>

            <p class="text-success">
                Correct Answer: Option <%= correct%>
            </p>
        </div>

        <% }%>

        <hr>

        <a href="subject.jsp" class="btn btn-primary">Take Another Quiz</a>
        <a href="myresults.jsp" class="btn btn-info">
            View My Previous Results
        </a>

        <a href="LogoutServlet" class="btn btn-danger">Logout</a>

    </body>
</html>
