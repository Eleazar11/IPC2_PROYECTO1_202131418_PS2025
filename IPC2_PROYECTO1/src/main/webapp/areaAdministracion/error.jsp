<%-- 
    Document   : error
    Created on : 12/03/2025, 01:45:03
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
                background: url('https://i.pinimg.com/originals/19/b2/8c/19b28c8372aaec65623f7ee7332e74be.gif') no-repeat center center fixed;
                background-size: cover;
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

    <body> <!-- Carga home.jsp al inicio -->

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

                        <!-- Dropdown para Página 1 -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                                Usuarios
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#" onclick="loadPage('crearUsuario')">Registrar nuevo usuario</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/administracion/ObtenerUsuariosServlet">Ver Lista de Usuarios</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/ensamblaje/ObtenerComponentesModificarServlet">Modificar Usuario</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/ensamblaje/ObtenerComponentesEliminarServlet">Eliminar Usario</a></li>
                            </ul>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="loadPage('pagina2')">Registrar Nuevo Modelo Computadora</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="loadPage('pagina3')">Página 3</a>
                        </li>
                    </ul>

                    <!-- Botón de cierre de sesión -->
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="btn btn-danger" href="../LogoutServlet">Cerrar sesión</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Contenido dinámico -->
        <main id="content" class="container mt-4">
            <!-- Aquí va el contenido de componenteRepetido -->
            <section class="d-flex justify-content-center align-items-center" style="min-height: 60vh;">
                <div class="card shadow-lg p-4" style="width: 25rem;">
                    <div class="card-body text-center">
                        <!-- Ícono de advertencia -->
                        <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="red" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM7.002 11a1 1 0 1 0 2 0 1 1 0 0 0-2 0zM7.1 5.005a.905.905 0 0 0-.9.9v3.19a.9.9 0 0 0 1.8 0V5.905a.905.905 0 0 0-.9-.9z"/>
                        </svg>

                        <h1 class="mt-3 text-danger">¡Error!</h1>
                        <p class="text-muted">Ha ocurrido un error generico.</p>
                        <p class="text-muted">intenta de  nuevo y realiza bien las acciones.</p>

                        <!-- Botones -->
                        <div class="mt-4">
                            <a href="administracion.jsp" class="btn btn-primary">Regresar a Home</a>
                        </div>
                    </div>
                </div>
            </section>
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