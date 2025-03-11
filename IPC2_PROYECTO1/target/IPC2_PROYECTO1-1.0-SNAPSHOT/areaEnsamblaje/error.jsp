<%-- 
    Document   : error
    Created on : 10/03/2025, 19:51:44
    Author     : eleaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="mt-5 d-flex justify-content-center align-items-center">
    <div class="container text-center">
        <!-- Ícono de error -->
        <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="red" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
        </svg>

        <h1 class="mt-3 text-danger">¡Ha ocurrido un error!</h1>
        <p class="text-muted">Se ha producido un error inesperado. Por favor, intenta nuevamente más tarde.</p>

        <!-- Botones -->
        <div class="mt-4">
            <a href="#" onclick="loadPage('home')" class="btn btn-primary">🏠 Regresar a Home</a>
            <a href="#" onclick="loadPage('registroComponentes')" class="btn btn-warning">🔄 Reintentar</a>
        </div>
    </div>
</section>

