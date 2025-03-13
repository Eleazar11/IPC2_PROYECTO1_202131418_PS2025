<%-- 
    Document   : home
    Created on : 11/03/2025, 23:32:09
    Author     : eleaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    body {
        background: url('https://i.redd.it/qpvv7xji49361.gif') no-repeat center center fixed;
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
    <h1 class="text-center">Bienvenido al módulo de VENTAS</h1>
    <p class="text-center">Explora las funciones que puedes realizar en el modulo de ventas.</p>

    <div class="container d-flex justify-content-center">
        <div id="carouselExample" class="carousel slide w-75" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://w2a-noticierovenevision-net.s3.amazonaws.com/public/media/images/zcujta5ahfcj5mywbpnzirg7wm-d7aa0a.jpg" 
                         class="d-block w-100 rounded-3" alt="Imagen 1">
                </div>
                <div class="carousel-item">
                    <img src="https://web.smarteamcr.com/wp-content/uploads/2022/05/1-nota-1024x576.png" 
                         class="d-block w-100 rounded-3" alt="Imagen 2">
                </div>
                <div class="carousel-item">
                    <img src="https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2021/04/stonks-2286073.jpg?tf=3840x" 
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

 
</section>



