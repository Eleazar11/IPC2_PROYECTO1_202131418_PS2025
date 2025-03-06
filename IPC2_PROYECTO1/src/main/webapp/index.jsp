<%-- 
    Document   : index
    Created on : 5/03/2025, 17:40:40
    Author     : eleaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h2 class="text-center mt-5">Login COMPUTADORA FELIZ :)</h2>
        
        <% 
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="alert alert-danger" role="alert">
                <%= error %>
            </div>
        <% 
            }
        %>

        <form action="LoginServlet" method="POST">
            <!-- Username input -->
            <div class="form-outline mb-4">
                <input type="text" id="loginUsername" name="username" class="form-control" required>
                <label class="form-label" for="loginUsername">Username</label>
            </div>

            <!-- Password input -->
            <div class="form-outline mb-4">
                <input type="password" id="loginPassword" name="password" class="form-control" required>
                <label class="form-label" for="loginPassword">Password</label>
            </div>

            <!-- Submit button -->
            <button type="submit" class="btn btn-primary btn-block mb-4">Iniciar Sesión</button>

            <!-- Register link -->
            <div class="text-center">
                <p>No eres un usuario? <a href="registroUsuario.jsp">Click para registrarte</a></p>
            </div>
        </form>
    </div>
</body>
</html>