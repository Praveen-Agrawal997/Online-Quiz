<%@ page import="java.util.*" %>
<%
    HttpSession s = request.getSession(false);
    List<Map<String, String>> questions = null;

    if (s != null) {
        questions = (List<Map<String, String>>) s.getAttribute("questions");
    }

    if (questions == null || questions.isEmpty()) {
%>
<h3>No quiz loaded. Please login through the proper flow.</h3>
<%
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Online Quiz</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

        <script>
            let time = 120; // seconds
            setInterval(() => {
                document.getElementById("timer").innerHTML = time;
                time--;
                if (time < 0) {
                    document.getElementById("quizForm").submit();
                }
            }, 1000);
        </script>
    </head>

    <body class="container mt-4">

        <h4>
            Subject:
            <%= session.getAttribute("subject").toString().toUpperCase()%>
        </h4>

        <h3>Online Quiz</h3>
        <h5 class="text-danger">Time Left: <span id="timer">120</span> sec</h5>

        <form action="ResultServlet" method="post" id="quizForm">

            <%
                int count = 1;
                for (Map<String, String> q : questions) {
            %>
            <div class="card mb-3">
                <div class="card-body">

                    <p><b>Q<%= count++%>. <%= q.get("question")%></b></p>

                    <input type="radio" name="q<%= q.get("id")%>" value="1"> <%= q.get("option1")%><br>
                    <input type="radio" name="q<%= q.get("id")%>" value="2"> <%= q.get("option2")%><br>
                    <input type="radio" name="q<%= q.get("id")%>" value="3"> <%= q.get("option3")%><br>
                    <input type="radio" name="q<%= q.get("id")%>" value="4"> <%= q.get("option4")%><br>

                </div>
            </div>
            <%
                }
            %>


            <button class="btn btn-success">Submit Quiz</button>
        </form>

    </body>
</html>
