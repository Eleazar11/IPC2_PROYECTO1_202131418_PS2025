<%-- 
    Document   : confirmacion
    Created on : 10/03/2025, 19:46:06
    Author     : eleaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Ensamblaje</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Asegurar que el body tenga altura completa */
            body {
                display: flex;
                flex-direction: column;
                min-height: 100vh; /* 100% de la altura de la pantalla */
                background: url('https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/92009587580167.5dbc4c0433be8.gif') no-repeat center center fixed;
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

    <body>

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
                            <a class="nav-link" href="ensamblaje.jsp">Inicio</a>
                        </li>

                        <!-- Dropdown para Página 1 -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                                Componentes
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="ensamblaje.jsp">Registrar nuevo componente</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/ensamblaje/ObtenerComponentesServlet"">Ver Componentes</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/ensamblaje/ObtenerComponentesModificarServlet">Modificar componente</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/ensamblaje/ObtenerComponentesEliminarServlet">Eliminar componente</a></li>
                            </ul>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="loadPage('pagina2')">Página 2</a>
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
            <!-- Aquí va el contenido de confirmación -->
            <section class="d-flex justify-content-center align-items-center" style="min-height: 60vh;">
                <div class="card shadow-lg p-4" style="width: 25rem;">
                    <div class="card-body text-center">
                        <!-- Ícono de éxito -->
                        <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="green" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM7.032 11.077a.75.75 0 0 1-1.064-.008L4.847 9.561a.75.75 0 0 1 .015-1.062l2.62-2.4a.75.75 0 0 1 1.063.015l3.105 3.317a.75.75 0 0 1-.015 1.062l-4.146 3.85a.75.75 0 0 1-1.062-.016z"/>
                        </svg>

                        <h1 class="mt-3 text-success">¡Accion Relizada con EXITO!</h1>
                        <p class="text-muted">La accion para el componente se ha relizado exitosamente.</p>
                        <p class="text-muted">regresa al home y continua.</p>

                        <!-- Botones -->
                        <div class="mt-4">
                            <a href="ensamblaje.jsp" class="btn btn-primary">Regresar a Home</a>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <!-- Footer -->
        <footer class="bg-dark text-white text-center py-3 mt-5">
            © 2025 Ensamblaje. Todos los derechos reservados.
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

