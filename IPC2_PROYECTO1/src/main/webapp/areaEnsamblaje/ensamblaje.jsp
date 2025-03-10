<%-- 
    Document   : ensamblajeHome
    Created on : 8/03/2025, 01:03:15
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
</head>

<body onload="loadPage('home')"> <!-- Carga home.jsp al inicio -->

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#" onclick="loadPage('home')">Mi Aplicación</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="loadPage('home')">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="loadPage('pagina1')">Página 1</a>
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
        <!-- Aquí se cargará home.jsp al inicio -->
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

