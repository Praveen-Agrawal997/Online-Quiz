<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Online Quiz - Login</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body class="container mt-5">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <input type="email" name="email" class="form-control mb-2" placeholder="Email">
            <input type="password" name="password" class="form-control mb-2" placeholder="Password">
            <button class="btn btn-primary">Login</button>
            <a href="register.jsp">New User? Register Here</a>
        </form>
    </body>
</html>
