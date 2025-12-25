<%@ page import="java.util.*" %>

<%
    List<Map<String, String>> questions
            = (List<Map<String, String>>) session.getAttribute("questions");

    if (questions == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Answer Key</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>

    <body class="container mt-4">

        <h3>Answer Key</h3>

        <%
            for (Map<String, String> q : questions) {
                String correct = q.get("correct");
                String ans = "";

                if (correct.equals("1")) {
                    ans = q.get("option1");
                }
                if (correct.equals("2")) {
                    ans = q.get("option2");
                }
                if (correct.equals("3")) {
                    ans = q.get("option3");
                }
                if (correct.equals("4"))
                    ans = q.get("option4");
        %>
        <div class="card mb-2">
            <div class="card-body">
                <b><%= q.get("question")%></b>
                <p class="text-success">Correct Answer: <%= ans%></p>
            </div>
        </div>
        <%
            }
        %>

        <a href="result.jsp" class="btn btn-primary">Back to Result</a>

    </body>
</html>
