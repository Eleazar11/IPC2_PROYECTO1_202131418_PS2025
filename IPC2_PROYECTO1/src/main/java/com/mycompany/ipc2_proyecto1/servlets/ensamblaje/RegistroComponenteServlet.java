/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.servlets.ensamblaje;

import com.mycompany.ipc2_proyecto1.database.ConexionBaseDeDatos;
import com.mycompany.ipc2_proyecto1.database.ensamblaje.CategoriaComponente;
import com.mycompany.ipc2_proyecto1.database.ensamblaje.Componente;
import com.mycompany.ipc2_proyecto1.database.ensamblaje.InsertarComponente;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLIntegrityConstraintViolationException;


/**
 *
 * @author eleaz
 */
@WebServlet(name = "RegistroComponenteServlet", urlPatterns = {"/RegistroComponenteServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class RegistroComponenteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Crear la conexión
        Connection connection = ConexionBaseDeDatos.getConnection();

        try {
            if (connection == null) {
                System.out.println("No se pudo establecer la conexión a la base de datos.");
                response.sendRedirect(request.getContextPath() + "/areaEnsamblaje/error.jsp");
                return;
            }

            // Recibir los datos del formulario
            String nombre = request.getParameter("nombre");
            String categoria = request.getParameter("categoria");
            double precio = Double.parseDouble(request.getParameter("precio"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));

            // Verificar si el componente ya existe
            InsertarComponente insertarComponente = new InsertarComponente(connection);
            if (insertarComponente.componenteExiste(nombre)) { // Verificar si el nombre ya existe
                response.sendRedirect(request.getContextPath() + "/areaEnsamblaje/componenteRepetido.jsp");
                return;
            }

            // Crear el objeto componente
            CategoriaComponente categoriaComponente = CategoriaComponente.valueOf(categoria.toUpperCase()); // Asumiendo que la categoría se pasa en minúsculas

            Componente componente = new Componente(
                    nombre,
                    categoriaComponente,
                    precio,
                    cantidad
            );

            // Intentar registrar el componente
            try {
                insertarComponente.registrarComponente(componente);
                response.sendRedirect(request.getContextPath() + "/areaEnsamblaje/confirmacion.jsp"); // Si el registro es exitoso
            } catch (SQLIntegrityConstraintViolationException e) {
                response.sendRedirect(request.getContextPath() + "/areaEnsamblaje/componenteRepetido.jsp"); // Componente duplicado
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/areaEnsamblaje/error.jsp"); // Página de error genérico
        } finally {
            // Cerrar la conexión
        }
    }
}


