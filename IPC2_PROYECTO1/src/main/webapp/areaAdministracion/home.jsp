<%-- 
    Document   : home
    Created on : 11/03/2025, 23:32:09
    Author     : eleaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    body {
        background: url('https://i.pinimg.com/originals/19/b2/8c/19b28c8372aaec65623f7ee7332e74be.gif') no-repeat center center fixed;
        background-size: cover;
    }

    /* Capa oscura para mejor contraste */
    .overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5); /* Oscurece un poco el fondo */
        z-index: -1;
    }

    /* Estilos adicionales */
    .content {
        position: relative;
        z-index: 1;
        color: white; /* Texto en blanco para contraste */
    }

    /* Espaciado para los botones */
    .button-container {
        margin-top: 20px;
    }
</style>

<div class="overlay"></div> <!-- Capa oscura para mejorar la visibilidad del contenido -->

<section class="mt-5 content">
    <h1 class="text-center">Bienvenido al módulo de administración</h1>
    <p class="text-center">Explora las funciones que puedes realizar al ser admin.</p>

    <div class="container d-flex justify-content-center">
        <div id="carouselExample" class="carousel slide w-75" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://www.bbva.com/wp-content/uploads/2022/06/BBVA-finanzas-personales-y-corporativas.jpg" 
                         class="d-block w-100 rounded-3" alt="Imagen 1">
                </div>
                <div class="carousel-item">
                    <img src="https://www.ucuenca.edu.ec/wp-content/uploads/2024/05/posg017-1920x1080.jpg" 
                         class="d-block w-100 rounded-3" alt="Imagen 2">
                </div>
                <div class="carousel-item">
                    <img src="https://esieduc.org/wp-content/uploads/2024/03/AdobeStock_675066090-scaled.jpeg" 
                         class="d-block w-100 rounded-3" alt="Imagen 3">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Anterior</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Siguiente</span>
            </button>
        </div>
    </div>

    <!-- Contenedor de botones ../areaEnsamblaje/ensamblaje-->
    <div class="container text-center button-container">
        <a href="../areaEnsamblaje/ensamblaje.jsp" class="btn btn-primary mx-2">Ir al Modulo de Ensamblaje</a>
        <a href="../areaVentas/ventas.jsp" class="btn btn-success mx-2">Ir al Modulo de Ventas</a>
    </div>
</section>



