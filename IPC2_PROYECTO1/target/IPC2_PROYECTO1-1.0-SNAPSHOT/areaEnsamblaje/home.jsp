<%-- 
    Document   : home
    Created on : 10/03/2025, 15:04:45
    Author     : eleaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    body {
        background: url('https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/92009587580167.5dbc4c0433be8.gif') no-repeat center center fixed;
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
</style>

<div class="overlay"></div> <!-- Capa oscura para mejorar la visibilidad del contenido -->

<section class="mt-5 content">
    <h1 class="text-center">Bienvenido a Ensamblaje</h1>
    <p class="text-center">Explora nuestras páginas para más información.</p>
    
    <div class="container d-flex justify-content-center">
        <div id="carouselExample" class="carousel slide w-75" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://cloudfront-us-east-1.images.arcpublishing.com/metroworldnews/T24QILCV6BBNPPYWPZUBRCBSTQ.jpg" 
                        class="d-block w-100 rounded-3" alt="Imagen 1">
                </div>
                <div class="carousel-item">
                    <img src="https://grupoconsitel.com/resources/24curso-ensamblaje-y-mantenimiento-de-computadoras.jpg" 
                        class="d-block w-100 rounded-3" alt="Imagen 2">
                </div>
                <div class="carousel-item">
                    <img src="https://uni-master.net/wp-content/uploads/2023/12/Fotos-con-logo-para-la-pagina-52.png" 
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

