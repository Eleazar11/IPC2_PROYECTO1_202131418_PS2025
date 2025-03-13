<%-- 
    Document   : editarComponentes
    Created on : 11/03/2025, 17:49:05
    Author     : eleaz
--%>

<%@page import="com.mycompany.ipc2_proyecto1.database.ensamblaje.Componente"%>
<%@page import="com.mycompany.ipc2_proyecto1.database.ensamblaje.CategoriaComponente"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
                            <a class="nav-link" href="../../areaEnsamblaje/ensamblaje.jsp">Inicio</a>
                        </li>

                        <!-- Dropdown para Página 1 -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                                Componentes
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../../areaEnsamblaje/ensamblaje.jsp">Registrar nuevo componente</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/ensamblaje/ObtenerComponentesServlet"">Ver Componentes</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/ensamblaje/ObtenerComponentesModificarServlet">Modificar componente</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/ensamblaje/ObtenerComponentesEliminarServlet">Eliminar componente</a></li>
                            </ul>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="loadPage('../../areaEnsamblaje/ensamblaje.jsp')">Página 2</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="loadPage('../../areaEnsamblaje/ensamblaje.jsp')">Página 3</a>
                        </li>
                    </ul>

                    <!-- Botón de cierre de sesión -->
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="btn btn-danger" href="../../LogoutServlet">Cerrar sesión</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Contenido dinámico -->
        <main id="content" class="container mt-4">
            <section class="mt-5 content">
                <h2>Editar Componentes</h2>

                <table class="table table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Nombre</th>
                            <th>Categoría</th>
                            <th>Precio</th>
                            <th>Cantidad</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Componente> componentes = (List<Componente>) request.getAttribute("componentes");

                            if (componentes != null && !componentes.isEmpty()) {
                                for (Componente componente : componentes) {
                        %>
                        <tr>
                            <td><%= componente.getNombre()%></td>
                            <td><%= componente.getCategoriaComponente()%></td>
                            <td><%= componente.getPrecio()%></td>
                            <td><%= componente.getCantidad()%></td>
                            <td>
                                <button class="btn btn-warning btn-sm" data-bs-toggle="modal" 
                                        data-bs-target="#modalEditar" 
                                        data-nombre="<%= componente.getNombre()%>"
                                        data-categoria="<%= componente.getCategoriaComponente()%>" 
                                        data-precio="<%= componente.getPrecio()%>"
                                        data-cantidad="<%= componente.getCantidad()%>">
                                    Editar
                                </button>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="5" class="text-center">No hay componentes disponibles.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </section>

            <!-- MODAL PARA EDITAR COMPONENTE -->
            <div class="modal fade" id="modalEditar" tabindex="-1" aria-labelledby="modalEditarLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalEditarLabel">Editar Componente</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                        </div>
                        <div class="modal-body">
                            <form id="formEditar" action="EditarComponenteServlet" method="post">
                                <input type="hidden" id="idComponente" name="idComponente">

                                <div class="mb-3">
                                    <label for="nombreComponente" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="nombreComponente" name="nombre" readonly>
                                </div>

                                <div class="mb-3">
                                    <label for="categoriaComponente" class="form-label">Categoría</label>
                                    <select class="form-control" id="categoriaComponente" name="categoria">
                                        <option value="Procesador">Procesador</option>
                                        <option value="RAM">RAM</option>
                                        <option value="TARJETA_GRAFICA">Tarjeta Madre</option>
                                        <option value="SSD">SSD</option>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="precioComponente" class="form-label">Precio</label>
                                    <input type="number" step="0.01" class="form-control" id="precioComponente" name="precio">
                                </div>

                                <div class="mb-3">
                                    <label for="cantidadComponente" class="form-label">Cantidad</label>
                                    <input type="number" class="form-control" id="cantidadComponente" name="cantidad">
                                </div>

                                <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    var modalEditar = document.getElementById('modalEditar');
                    modalEditar.addEventListener('show.bs.modal', function (event) {
                        var button = event.relatedTarget;
                        var nombre = button.getAttribute('data-nombre');
                        var categoria = button.getAttribute('data-categoria');
                        var precio = button.getAttribute('data-precio');
                        var cantidad = button.getAttribute('data-cantidad');

                        // Actualizamos los valores en el formulario
                        document.getElementById('nombreComponente').value = nombre;
                        document.getElementById('categoriaComponente').value = categoria;
                        document.getElementById('precioComponente').value = precio;
                        document.getElementById('cantidadComponente').value = cantidad;
                    });
                });
            </script>
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