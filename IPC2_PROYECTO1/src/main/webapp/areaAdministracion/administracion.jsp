<%-- 
    Document   : administracion
    Created on : 8/03/2025, 01:04:13
    Author     : eleaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Administracion</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Asegurar que el body tenga altura completa */
            body {
                display: flex;
                flex-direction: column;
                min-height: 100vh; /* 100% de la altura de la pantalla */
            }

            /* Hacer que el contenido principal tome todo el espacio disponible */
            main {
                flex-grow: 1;
            }

            /* Asegurar que el footer siempre esté abajo */
            footer {
                margin-top: auto;
            }
        </style>
    </head>

    <body onload="loadPage('home')"> <!-- Carga home.jsp al inicio -->

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="#" onclick="loadPage('home')">COMPUTADORA FELIZ ;)</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="loadPage('home')">Inicio</a>
                        </li>

                        <!-- Dropdown para Usuarios -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="usuariosDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Usuarios
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="usuariosDropdown">
                                <li><a class="dropdown-item" href="#" onclick="loadPage('crearUsuario')">Registrar nuevo usuario</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/administracion/ObtenerUsuariosServlet">Ver Lista de Usuarios</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/administracion/ObtenerUsuariosModificarServlet">Modificar Usuario</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/administracion/ObtenerUsuariosEliminarServlet">Eliminar Usuario</a></li>
                            </ul>
                        </li>

                        <!-- Dropdown para Modelos Computadora -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="modelosDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Modelos Computadora
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="modelosDropdown">
                                <li><a class="dropdown-item" href="#" onclick="loadPage('registroModeloComputadora')">Registrar</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/administracion/ObtenerModelosComputadoraServlet">Ver Lista</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/administracion/ObtenerModelosComputadoraModificarServlet">Modificar</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/administracion/ObtenerModelosComputadoraEliminarServlet">Eliminar</a></li>
                            </ul>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="loadPage('home')">Reportes</a>
                        </li>
                    </ul>

                    <!-- Botón de cierre de sesión -->
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="btn btn-danger" href="../LogoutServlet">Cerrar sesión</a>
                        </li>
                    </ul>
                </div>
        </nav>

        <!-- Contenido dinámico -->
        <main id="content" class="container mt-4">
            <!-- Aquí se cargará home.jsp al inicio -->
        </main>

        <!-- Footer -->
        <footer class="bg-dark text-white text-center py-3 mt-5">
            © 2025 Administracion. Todos los derechos reservados.
        </footer>

        <!-- Scripts -->
        <script>
            function loadPage(page) {
                fetch(page + ".jsp") // Carga la página sin recargar la web
                        .then(response => response.text())
                        .then(html => {
                            document.getElementById("content").innerHTML = html;
                        })
                        .catch(error => console.error("Error al cargar la página:", error));
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>