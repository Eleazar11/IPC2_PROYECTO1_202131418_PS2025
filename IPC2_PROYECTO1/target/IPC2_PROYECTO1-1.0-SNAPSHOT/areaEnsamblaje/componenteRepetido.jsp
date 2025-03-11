<%-- 
    Document   : componenteRepetido
    Created on : 10/03/2025, 19:52:10
    Author     : eleaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="mt-5 d-flex justify-content-center align-items-center">
    <div class="container text-center">
        <!-- Ícono de advertencia -->
        <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="red" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM7.002 11a1 1 0 1 0 2 0 1 1 0 0 0-2 0zM7.1 5.005a.905.905 0 0 0-.9.9v3.19a.9.9 0 0 0 1.8 0V5.905a.905.905 0 0 0-.9-.9z"/>
        </svg>

        <h1 class="mt-3 text-danger">¡Componente repetido!</h1>
        <p class="text-muted">Este componente ya está registrado en la base de datos.</p>

        <!-- Botones -->
        <div class="mt-4">
            <a href="#" onclick="loadPage('home')" class="btn btn-primary">🏠 Regresar a Home</a>
            <a href="#" onclick="loadPage('registroComponentes')" class="btn btn-warning">🔄 Intentar de nuevo</a>
        </div>
    </div>
</section>

