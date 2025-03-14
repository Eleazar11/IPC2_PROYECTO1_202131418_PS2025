<%-- 
    Document   : usuarioRepetido
    Created on : 7/03/2025, 22:41:18
    Author     : eleaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuario Repetido</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: gray;
        }
        .container {
            max-width: 500px;
            margin-top: 100px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .alert {
            font-size: 18px;
        }
        .btn {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container text-center">
        <h2 class="text-danger">¡Error en el Registro!</h2>
        <div class="alert alert-danger">
            <strong>El nombre de usuario ya está en uso.</strong> Por favor, elige otro username e intenta nuevamente.
        </div>
        <div class="d-grid gap-2">
            <a href="registroUsuario.jsp" class="btn btn-warning mb-2"> Regresar al Registro</a>
            <a href="index.jsp" class="btn btn-primary"> Ir al Login</a>
        </div>
    </div>
</body>
</html>
