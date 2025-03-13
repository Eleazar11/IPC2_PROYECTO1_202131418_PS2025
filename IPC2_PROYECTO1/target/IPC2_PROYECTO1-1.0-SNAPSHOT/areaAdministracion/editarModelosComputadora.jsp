<%-- 
    Document   : editarModelosComputadora
    Created on : 12/03/2025, 20:36:07
    Author     : eleaz
--%>

<%@page import="com.mycompany.ipc2_proyecto1.database.administracion.ModeloComputadora"%>
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

    <body onload="loadPage('')"> <!-- Carga home.jsp al inicio -->

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
                            <a class="nav-link dropdown-toggle" href="#" id="usuariosDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Usuarios
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="usuariosDropdown">
                                <li><a class="dropdown-item" href="../../areaAdministracion/administracion.jsp" onclick="loadPage('')">Registrar nuevo usuario</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/administracion/ObtenerUsuariosServlet">Ver Lista de Usuarios</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/administracion/ObtenerUsuariosModificarServlet">Modificar Usuario</a></li>
                                <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/servlets/administracion/ObtenerUsuariosEliminarServlet">Eliminar Usario</a></li>
                            </ul>
                        </li>

                        <!-- Dropdown para Modelos Computadora -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="modelosDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Modelos Computadora
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="modelosDropdown">
                                <li><a class="dropdown-item" href="#" onclick="loadPage('registroModeloComputadora')">Registrar</a></li>
                                <li><a class="dropdown-item" href="#">Ver Lista</a></li>
                                <li><a class="dropdown-item" href="#">Modificar</a></li>
                                <li><a class="dropdown-item" href="#">Eliminar</a></li>
                            </ul>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="loadPage('pagina3')">Página 3</a>
                        </li>
                    </ul>

                    <!-- Botón de cierre de sesión -->
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="btn btn-danger" href="../../LogoutServlet">Cerrar sesión</a>
                        </li>
                    </ul>
                </div>
        </nav>

        <!-- Contenido dinámico -->
        <main id="content" class="container mt-4">
            <!-- Aquí se cargará home.jsp al inicio -->
            <section class="mt-5 content">
                <h2>Lista de Modelos de Computadora</h2>

                <table class="table table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Nombre</th>
                            <th>Cantidad de Procesadores</th>
                            <th>Cantidad de RAM</th>
                            <th>Cantidad de Tarjetas Gráficas</th>
                            <th>Cantidad de SSD</th>
                            <th>Precio</th>
                            <th>Armada</th>
                            <th>Vendida</th>
                            <th>Modificar</th> <!-- Nueva columna de "Modificar" -->
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            // Obtener la lista de modelos de computadora desde el request
                            List<ModeloComputadora> modelos = (List<ModeloComputadora>) request.getAttribute("modelos");

                            if (modelos != null && !modelos.isEmpty()) {
                                for (ModeloComputadora modelo : modelos) {
                        %>
                        <tr>
                            <td><%= modelo.getNombre()%></td>
                            <td><%= modelo.getCantProcesador()%></td>
                            <td><%= modelo.getCantRAM()%></td>
                            <td><%= modelo.getCantTarjetaGrafica()%></td>
                            <td><%= modelo.getCantSSD()%></td>
                            <td><%= modelo.getPrecio()%></td>
                            <td><%= modelo.isArmada() ? "Sí" : "No"%></td>
                            <td><%= modelo.isVendida() ? "Sí" : "No"%></td>
                            <td>
                                <!-- Botón para abrir el modal de modificación -->
                                <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#modificarModal<%= modelo.getId()%>">
                                    Modificar
                                </button>
                            </td>
                        </tr>

                        <!-- Modal de modificación para cada modelo -->
                    <div class="modal fade" id="modificarModal<%= modelo.getId()%>" tabindex="-1" aria-labelledby="modificarModalLabel<%= modelo.getId()%>" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="modificarModalLabel<%= modelo.getId()%>">Modificar Modelo: <%= modelo.getNombre()%></h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                                </div>
                                <div class="modal-body">
                                    <!-- Formulario para modificar los detalles del modelo -->
                                    <form action="EditarModeloComputadoraServlet" method="post">
                                        <input type="hidden" name="nombre" value="<%= modelo.getNombre()%>">

                                        <!-- Campo de cantidad de RAM -->
                                        <div class="mb-3">
                                            <label for="ram<%= modelo.getId()%>" class="form-label">Cantidad de RAM</label>
                                            <input type="number" class="form-control" id="ram<%= modelo.getId()%>" name="cantidadRAM" value="<%= modelo.getCantRAM()%>" required>
                                        </div>

                                        <!-- Campo de cantidad de tarjetas gráficas -->
                                        <div class="mb-3">
                                            <label for="tarjetaGrafica<%= modelo.getId()%>" class="form-label">Cantidad de Tarjetas Gráficas</label>
                                            <input type="number" class="form-control" id="tarjetaGrafica<%= modelo.getId()%>" name="cantidadTarjetasGraficas" value="<%= modelo.getCantTarjetaGrafica()%>" required>
                                        </div>

                                        <!-- Campo de cantidad de SSD -->
                                        <div class="mb-3">
                                            <label for="ssd<%= modelo.getId()%>" class="form-label">Cantidad de SSD</label>
                                            <input type="number" class="form-control" id="ssd<%= modelo.getId()%>" name="cantidadSSD" value="<%= modelo.getCantSSD()%>" required>
                                        </div>

                                        <!-- Campo de precio -->
                                        <div class="mb-3">
                                            <label for="precio<%= modelo.getId()%>" class="form-label">Precio</label>
                                            <input type="number" class="form-control" id="precio<%= modelo.getId()%>" name="precio" value="<%= modelo.getPrecio()%>" required>
                                        </div>

                                        <!-- Campo oculto para enviar 'false' cuando el checkbox no esté marcado -->
                                        <input type="hidden" name="armada" value="false">
                                        <div class="mb-3 form-check">
                                            <input type="checkbox" class="form-check-input" id="armada<%= modelo.getId()%>" name="armada" value="true" <%= modelo.isArmada() ? "checked" : ""%>>
                                            <label class="form-check-label" for="armada<%= modelo.getId()%>">Armada</label>
                                        </div>

                                        <input type="hidden" name="vendida" value="false">
                                        <div class="mb-3 form-check">
                                            <input type="checkbox" class="form-check-input" id="vendida<%= modelo.getId()%>" name="vendida" value="true" <%= modelo.isVendida() ? "checked" : ""%>>
                                            <label class="form-check-label" for="vendida<%= modelo.getId()%>">Vendida</label>
                                        </div>


                                        <!-- Botones de enviar y cancelar -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="9" class="text-center">No hay modelos de computadora disponibles.</td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </section>
            <div class="mt-4">
                <a href="../../areaAdministracion/administracion.jsp" class="btn btn-primary">Regresar a Home</a>
            </div>

        </main>

        <!-- Footer -->
        <footer class="bg-dark text-white text-center py-3 mt-5">
            © 2025 Administracion. Todos los derechos reservados.
        </footer>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
