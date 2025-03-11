<%-- 
    Document   : piezas
    Created on : 11/03/2025, 01:37:12
    Author     : eleaz
--%>

<%@page import="com.mycompany.ipc2_proyecto1.database.ensamblaje.Componente"%>
<%@page import="com.mycompany.ipc2_proyecto1.database.ensamblaje.CategoriaComponente"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Componentes</title>
</head>
<body>
    <h2>Lista de Componentes</h2>

    <table border="1">
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Categoría</th>
                <th>Precio</th>
                <th>Cantidad</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Componente> componentes = (List<Componente>) request.getAttribute("componentes");

                if (componentes != null && !componentes.isEmpty()) {
                    for (Componente componente : componentes) {
            %>
                <tr>
                    <td><%= componente.getNombre() %></td>
                    <td><%= componente.getCategoriaComponente() %></td>
                    <td><%= componente.getPrecio() %></td>
                    <td><%= componente.getCantidad() %></td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="4">No hay componentes disponibles.</td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

</body>
</html>