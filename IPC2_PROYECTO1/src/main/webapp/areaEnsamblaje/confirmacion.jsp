<%-- 
    Document   : confirmacion
    Created on : 10/03/2025, 19:46:06
    Author     : eleaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="mt-5 d-flex justify-content-center align-items-center">
    <div class="container text-center">
        <!-- Ícono de check -->
        <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="green" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM12.97 5.97a.75.75 0 0 0-1.08 0L7.25 10.62 4.11 7.47a.75.75 0 1 0-1.06 1.06l3.75 3.75a.75.75 0 0 0 1.06 0l5.25-5.25a.75.75 0 0 0 0-1.06z"/>
        </svg>

        <h1 class="mt-3">Componente registrado con éxito</h1>
        <p class="text-muted">Tu componente ha sido guardado correctamente en la base de datos.</p>

        <!-- Botones -->
        <div class="mt-4">
            <a href="#" onclick="loadPage('home')" class="btn btn-primary">🏠 Regresar a Home</a>
            <a href="#" onclick="loadPage('registroComponentes')" class="btn btn-success">➕ Registrar otro componente</a>
        </div>
    </div>
</section>
