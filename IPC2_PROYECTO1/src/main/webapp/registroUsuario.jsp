<%-- 
    Document   : registroUsuario
    Created on : 5/03/2025, 19:09:49
    Author     : eleaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuarios - COMPUTADORA FELIZ</title>
    <jsp:include page="/includes/resources.jsp"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
    <div class="container mt-5">
        <h2 class="text-center">Registro de Usuario</h2>
        <form method="POST" action="${pageContext.servletContext.contextPath}/RegistroServlet" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>

            <div class="mb-3">
                <label for="username" class="form-label">Username (único)</label>
                <input type="text" class="form-control" id="username" name="username" required pattern="[a-zA-Z0-9_]+" title="Solo letras, números y guion bajo">
            </div>

            <div class="mb-3">
                <label for="contrasena" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="contrasena" name="contrasena" required minlength="6">
            </div>

            <div class="mb-3">
                <label for="tipoUsuario" class="form-label">Tipo de Usuario (ROL - COMPUTADORA FELIZ)</label>
                <select class="form-select" id="tipoUsuario" name="tipoUsuario" required>
                    <option value="ensamblaje">Ensamblaje</option>
                    <option value="ventas">Ventas</option>
                    <option value="administracion">Administración</option>
                </select>
            </div>

            <div class="text-center mb-3">
                <button type="submit" class="btn btn-primary">Registrar</button>
            </div>
            <div class="text-center">
                <a href="index.jsp" class="btn btn-secondary">Volver a la página principal</a>
            </div>
        </form>
    </div>
</body>
</html>
