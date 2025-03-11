<%-- 
    Document   : pagina1
    Created on : 10/03/2025, 14:49:21
    Author     : eleaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    body {
        background: url('https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/92009587580167.5dbc4c0433be8.gif') no-repeat center center fixed;
        background-size: cover;
    }
    .form-container {
        background: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }
</style>

<section class="mt-5 d-flex justify-content-center align-items-center">
    <div class="container form-container w-50">
        <h1 class="text-center">Registrar Componente</h1>
        <form id="componentForm" action="${pageContext.servletContext.contextPath}/servlets/ensamblaje/RegistroComponenteServlet" enctype="multipart/form-data" method="POST">
            <!-- Nombre -->
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre del Componente:</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>

            <!-- Categoría -->
            <div class="mb-3">
                <label for="categoria" class="form-label">Categoría:</label>
                <select class="form-select" id="categoria" name="categoria" required>
                    <option value="">Seleccione una categoría</option>
                    <option value="PROCESADOR">Procesador</option>
                    <option value="TARJETA_GRAFICA">Tarjeta Gráfica</option>
                    <option value="RAM">RAM</option>
                    <option value="SSD">SSD</option>
                </select>
            </div>

            <!-- Precio -->
            <div class="mb-3">
                <label for="precio" class="form-label">Precio (Quetzales):</label>
                <input type="number" class="form-control" id="precio" name="precio" step="0.01" required>
            </div>

            <!-- Cantidad -->
            <div class="mb-3">
                <label for="cantidad" class="form-label">Cantidad:</label>
                <input type="number" class="form-control" id="cantidad" name="cantidad" required>
            </div>

            <!-- Botones -->
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Registrar</button>
                <button type="reset" class="btn btn-warning">Limpiar</button>
                <a href="#" onclick="loadPage('home')" class="btn btn-danger">Cancelar</a>
            </div>
        </form>
    </div>
</section>
            

