<%-- 
    Document   : crearUsuario
    Created on : 12/03/2025, 01:20:31
    Author     : eleaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: url('https://i.pinimg.com/originals/19/b2/8c/19b28c8372aaec65623f7ee7332e74be.gif') no-repeat center center fixed;
            background-size: cover;
        }
        .form-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        .form-label {
            font-size: 1.2rem;
            font-weight: bold;
            color: white;
            text-shadow: 2px 2px 4px black;
        }
        .form-control, .form-select {
            font-size: 1.1rem;
        }
        .titulo-form {
            color: white;
            text-shadow: 3px 3px 6px black;
            font-size: 2rem;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <section class="container mt-5">
        <h2 class="text-center text-white titulo-form">Registro de Usuario</h2>
        <div class="form-container mx-auto col-md-6">
            <form method="POST" action="${pageContext.servletContext.contextPath}/servlets/administracion/RegistroUsuariosAdminServlet">
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
                    <input type="password" class="form-control" id="contrasena" name="contrasena" required minlength="6" pattern=".{6,}" title="Debe tener al menos 6 caracteres">
                </div>

                <div class="mb-3">
                    <label for="tipoUsuario" class="form-label">Tipo de Usuario (ROL - COMPUTADORA FELIZ)</label>
                    <select class="form-select" id="tipoUsuario" name="tipoUsuario" required>
                        <option value="ENSAMBLAJE">Ensamblaje</option>
                        <option value="VENTAS">Ventas</option>
                        <option value="ADMINISTRACION">Administración</option>
                    </select>
                </div>

                <div class="text-center mb-3">
                    <button type="submit" class="btn btn-primary">Registrar</button>>
                </div>
                <div class="text-center">
                    <a href="administracion.jsp" class="btn btn-secondary">Volver a la página principal</a>
                </div>
            </form>
        </div>
    </section>
</body>
</html>

