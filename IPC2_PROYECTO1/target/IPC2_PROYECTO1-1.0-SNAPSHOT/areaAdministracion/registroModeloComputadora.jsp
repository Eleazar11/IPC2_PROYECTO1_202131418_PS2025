<%-- 
    Document   : registroModeloComputadora
    Created on : 12/03/2025, 19:23:27
    Author     : eleaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Modelos de Computadora</title>
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
        <h2 class="text-center text-white titulo-form">Registro de Modelos de Computadora</h2>
        <div class="form-container mx-auto col-md-6">
            <form method="POST" action="${pageContext.servletContext.contextPath}/servlets/administracion/RegistroModelosComputadoraServlet">
                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre del Modelo</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" required>
                </div>

                <div class="mb-3">
                    <label for="cantProcesador" class="form-label">Cantidad de Procesadores</label>
                    <input type="number" class="form-control" id="cantProcesador" name="cantProcesador" required min="1">
                </div>

                <div class="mb-3">
                    <label for="cantRAM" class="form-label">Cantidad de RAM (GB)</label>
                    <input type="number" class="form-control" id="cantRAM" name="cantRAM" required min="1">
                </div>

                <div class="mb-3">
                    <label for="cantTarjetaGrafica" class="form-label">Cantidad de Tarjetas Gráficas</label>
                    <input type="number" class="form-control" id="cantTarjetaGrafica" name="cantTarjetaGrafica" required min="0">
                </div>

                <div class="mb-3">
                    <label for="cantSSD" class="form-label">Cantidad de SSD (GB)</label>
                    <input type="number" class="form-control" id="cantSSD" name="cantSSD" required min="0">
                </div>

                <div class="mb-3">
                    <label for="precio" class="form-label">Precio</label>
                    <input type="number" class="form-control" id="precio" name="precio" required min="1" step="0.01">
                </div>

                <div class="mb-3">
                    <label for="armada" class="form-label">¿Está Armada?</label>
                    <select class="form-select" id="armada" name="armada" required>
                        <option value="true">Sí</option>
                        <option value="false">No</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="vendida" class="form-label">¿Está Vendida?</label>
                    <select class="form-select" id="vendida" name="vendida" required>
                        <option value="true">Sí</option>
                        <option value="false">No</option>
                    </select>
                </div>

                <div class="text-center mb-3">
                    <button type="submit" class="btn btn-primary">Registrar Modelo</button>
                </div>
                <div class="text-center">
                    <a href="${pageContext.servletContext.contextPath}/areaEnsamblaje/confirmacion.jsp" class="btn btn-secondary">Volver a la página principal</a>
                </div>
            </form>
        </div>
    </section>
</body>
</html>


