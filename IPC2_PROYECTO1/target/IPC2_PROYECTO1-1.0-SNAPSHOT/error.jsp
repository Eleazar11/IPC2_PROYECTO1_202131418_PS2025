<%-- 
    Document   : error
    Created on : 7/03/2025, 22:35:13
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
    <style>
    /* Asegurar que el body tenga altura completa */
    body {
        background: url('https://64.media.tumblr.com/cca4f06484b447c0687f0325af5b38c9/428a8db1dc8ae92f-87/s1280x1920/7c751558b1d93e15c2d885cff2162ddb95059b8d.gif') no-repeat center center fixed;
        background-size: cover;
    }

    /* Estilo para el texto */
    body, p, h1, h2, h3, h4, h5, h6, span {
        
        color: white; /* Texto en blanco */
    }
        </style>
</head>
<body>
    <div class="container text-center">
        <h2 class="text-danger">¡Error en el Registro!</h2>
        <div class="alert alert-danger">
            <strong>Error con db o error general del programa.</strong> Por favor, trata de resolver el problema e intenta nuevamente.
        </div>
        <div class="d-grid gap-2">
            <a href="registroUsuario.jsp" class="btn btn-warning mb-2"> Regresar al Registro</a>
            <a href="index.jsp" class="btn btn-primary"> Ir al Login</a>
        </div>
    </div>
</body>
</html>
