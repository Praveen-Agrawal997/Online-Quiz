<%--<%@ page import="java.util.*" %>
<%
    HttpSession s = request.getSession(false);

    if (s == null || s.getAttribute("score") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>--%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Select Quiz Subject</title>

        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

        <style>
            body {
                background: linear-gradient(135deg, #f8f9fa, #e9ecef);
            }
            .subject-card {
                transition: transform 0.3s, box-shadow 0.3s;
            }
            .subject-card:hover {
                transform: scale(1.05);
                box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            }
        </style>
    </head>

    <body>

        <div class="container mt-5">
            <div class="text-center mb-4">
                <h1 class="fw-bold">Online Quiz System</h1>
                <p class="text-muted">Choose a subject to start your quiz</p>
            </div>

            <form action="QuizServlet" method="get">
                <div class="row justify-content-center g-4">

                    <!-- Java -->
                    <div class="col-md-4">
                        <div class="card subject-card border-primary text-center h-100">
                            <div class="card-body">
                                <h3 class="card-title text-primary">Java</h3>
                                <p class="card-text">
                                    Test your core Java knowledge including OOPs,
                                    syntax and concepts.
                                </p>
                                <button class="btn btn-primary w-100"
                                        name="subject" value="java">
                                    Start Java Quiz
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Python -->
                    <div class="col-md-4">
                        <div class="card subject-card border-success text-center h-100">
                            <div class="card-body">
                                <h3 class="card-title text-success">Python</h3>
                                <p class="card-text">
                                    Check your understanding of Python basics,
                                    functions and data types.
                                </p>
                                <button class="btn btn-success w-100"
                                        name="subject" value="python">
                                    Start Python Quiz
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- C -->
                    <div class="col-md-4">
                        <div class="card subject-card border-warning text-center h-100">
                            <div class="card-body">
                                <h3 class="card-title text-warning">C Language</h3>
                                <p class="card-text">
                                    Practice C programming fundamentals,
                                    loops, functions and pointers.
                                </p>
                                <button class="btn btn-warning w-100"
                                        name="subject" value="c">
                                    Start C Quiz
                                </button>
                            </div>
                        </div>
                    </div>

                </div>
            </form>

            <div class="text-center mt-5">
                <a href="myresults.jsp" class="btn btn-outline-secondary me-2">
                    My Results
                </a>
                <a href="LogoutServlet" class="btn btn-outline-danger">
                    Logout
                </a>
            </div>
        </div>

    </body>
</html>
