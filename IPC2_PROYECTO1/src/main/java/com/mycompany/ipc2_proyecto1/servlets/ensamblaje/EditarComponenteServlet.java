/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.servlets.ensamblaje;

import com.mycompany.ipc2_proyecto1.database.ConexionBaseDeDatos;
import com.mycompany.ipc2_proyecto1.database.ensamblaje.ActualizarComponente;
import com.mycompany.ipc2_proyecto1.database.ensamblaje.Componente;
import com.mycompany.ipc2_proyecto1.database.ensamblaje.ObtenerComponentes;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.util.List;

/**
 *
 * @author eleaz
 */
@WebServlet(name = "EditarComponenteServlet", urlPatterns = {"/EditarComponenteServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class EditarComponenteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener conexión a la base de datos
        Connection connection = ConexionBaseDeDatos.getConnection();

        try {
            if (connection == null) {
                System.out.println("No se pudo establecer la conexión a la base de datos.");
                response.sendRedirect(request.getContextPath() + "/areaEnsamblaje/error.jsp");
                return;
            }

            // Recibir los parámetros del formulario
            String nombre = request.getParameter("nombre");
            String nuevaCategoria = request.getParameter("categoria");
            double nuevoPrecio = Double.parseDouble(request.getParameter("precio"));
            int nuevaCantidad = Integer.parseInt(request.getParameter("cantidad"));

            // Verificar si el componente existe antes de actualizar
            ObtenerComponentes obtenerComponentes = new ObtenerComponentes(connection);
            List<Componente> listaComponentes = obtenerComponentes.obtenerTodosLosComponentes();

            boolean existe = listaComponentes.stream().anyMatch(c -> c.getNombre().equalsIgnoreCase(nombre));

            if (!existe) {
                response.sendRedirect(request.getContextPath() + "/areaEnsamblaje/error.jsp");
                return;
            }

            // Actualizar el componente en la base de datos
            ActualizarComponente actualizarComponente = new ActualizarComponente(connection);
            actualizarComponente.actualizarComponente(nombre, nuevaCategoria, nuevoPrecio, nuevaCantidad);

            response.sendRedirect(request.getContextPath() + "/areaEnsamblaje/confirmacion.jsp"); // Página de éxito

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/areaEnsamblaje/error.jsp"); // Página de error
        }
    }
}
