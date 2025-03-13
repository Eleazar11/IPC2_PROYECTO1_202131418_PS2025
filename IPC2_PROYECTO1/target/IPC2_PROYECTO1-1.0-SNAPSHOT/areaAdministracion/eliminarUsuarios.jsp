<%-- 
    Document   : eliminarUsuarios
    Created on : 12/03/2025, 18:11:53
    Author     : eleaz
--%>

<%@page import="com.mycompany.ipc2_proyecto1.Usuario"%>
<%@page import="java.util.List"%>
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
                min-height: 100vh;
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

    <body onload="loadPage('home')">

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
                            <a class="nav-link" href="../../areaAdministracion/administracion.jsp">Inicio</a>
                        </li>

                        <!-- Dropdown para Usuarios -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                                Usuarios
                            </a>
                            <ul class="dropdown-menu">
                                <li<a class="dropdown-item" href="../../areaAdministracion/administracion.jsp">Registrar nuevo usuario</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/administracion/ObtenerUsuariosServlet">Ver Lista de Usuarios</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/administracion/ObtenerUsuariosModificarServlet">Modificar Usuario</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/administracion/ObtenerUsuariosEliminarServlet">Eliminar Usario</a></li>
                            </ul>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="../../areaAdministracion/administracion.jsp">Registrar Nuevo Modelo Computadora</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../../areaAdministracion/administracion.jsp">Página 3</a>
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

        <!-- Contenido -->
        <main class="container mt-4">
            <section class="mt-5">
                <h2 class="text-center">Eliminar Usuarios</h2>
                <table class="table table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Nombre</th>
                            <th>Username</th>
                            <th>Tipo de Usuario</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");

                            if (usuarios != null && !usuarios.isEmpty()) {
                                for (Usuario usuario : usuarios) {
                        %>
                        <tr>
                            <td><%= usuario.getNombre()%></td>
                            <td><%= usuario.getUsername()%></td>
                            <td><%= usuario.getTipoUsuario()%></td>
                            <td>
                                <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#eliminarUsuarioModal"
                                        data-username="<%= usuario.getUsername()%>"
                                        data-nombre="<%= usuario.getNombre()%>">
                                    Eliminar
                                </button>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="4" class="text-center">No hay usuarios disponibles.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </section>

            <div class="mt-4 text-center">
                <a href="../../areaAdministracion/administracion.jsp" class="btn btn-primary">Regresar a Home</a>
            </div>

            <!-- Modal de Confirmación para Eliminar Usuario -->
            <div class="modal fade" id="eliminarUsuarioModal" tabindex="-1" aria-labelledby="eliminarUsuarioModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="eliminarUsuarioModalLabel">Confirmar Eliminación</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                        </div>
                        <div class="modal-body">
                            <p>¿Estás seguro de que deseas eliminar al usuario <strong id="usuarioEliminar"></strong>?</p>
                            <form id="formEliminarUsuario" action="EliminarUsuarioServlet" method="post">
                                <input type="hidden" id="usernameEliminar" name="username">
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-danger" form="formEliminarUsuario">Eliminar</button>
                        </div>
                    </div>
                </div>
            </div>

        </main>

        <!-- Footer -->
        <footer class="bg-dark text-white text-center py-3 mt-5">
            © 2025 Administracion. Todos los derechos reservados.
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                        document.addEventListener("DOMContentLoaded", function () {
                            let eliminarUsuarioModal = document.getElementById('eliminarUsuarioModal');

                            eliminarUsuarioModal.addEventListener('show.bs.modal', function (event) {
                                let button = event.relatedTarget;
                                let username = button.getAttribute('data-username');
                                let nombre = button.getAttribute('data-nombre');

                                document.getElementById('usuarioEliminar').textContent = nombre;
                                document.getElementById('usernameEliminar').value = username;
                            });
                        });
        </script>

    </body>
</html>

