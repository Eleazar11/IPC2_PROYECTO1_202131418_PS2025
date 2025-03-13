/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.servlets.administracion;

import com.mycompany.ipc2_proyecto1.database.ConexionBaseDeDatos;
import com.mycompany.ipc2_proyecto1.database.administracion.ActualizarModeloComputadora;
import com.mycompany.ipc2_proyecto1.database.administracion.ModeloComputadora;
import com.mycompany.ipc2_proyecto1.database.administracion.ObtenerModelosComputadora;
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
@WebServlet(name = "EditarModeloComputadoraServlet", urlPatterns = {"/EditarModeloComputadoraServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class EditarModeloComputadoraServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener conexión a la base de datos
        Connection connection = ConexionBaseDeDatos.getConnection();

        try {
            if (connection == null) {
                System.out.println("No se pudo establecer la conexión a la base de datos.");
                response.sendRedirect(request.getContextPath() + "/areaAdministracion/error.jsp");
                return;
            }

            // Recibir los parámetros del formulario
            String nombre = request.getParameter("nombre");
            int nuevaCantidadRAM = Integer.parseInt(request.getParameter("cantidadRAM"));
            int nuevaCantidadTarjetasGraficas = Integer.parseInt(request.getParameter("cantidadTarjetasGraficas"));
            int nuevaCantidadSSD = Integer.parseInt(request.getParameter("cantidadSSD"));
            double nuevoPrecio = Double.parseDouble(request.getParameter("precio"));
            boolean nuevaCantidadArmada = "true".equals(request.getParameter("armada"));
            boolean nuevaCantidadVendida = "true".equals(request.getParameter("vendida"));

            // Verificar si el modelo de computadora existe antes de actualizar
            ObtenerModelosComputadora obtenerModelosComputadora = new ObtenerModelosComputadora(connection);
            List<ModeloComputadora> listaModelos = obtenerModelosComputadora.obtenerTodosLosModelos();

            boolean existe = listaModelos.stream().anyMatch(m -> m.getNombre().equalsIgnoreCase(nombre));

            if (!existe) {
                response.sendRedirect(request.getContextPath() + "/areaAdministracion/error.jsp");
                return;
            }

            // Actualizar el modelo de computadora en la base de datos
            ActualizarModeloComputadora actualizarModeloComputadora = new ActualizarModeloComputadora(connection);
            actualizarModeloComputadora.actualizarModeloComputadora(
                    nombre, nuevaCantidadRAM, nuevaCantidadTarjetasGraficas, nuevaCantidadSSD, nuevoPrecio, nuevaCantidadArmada, nuevaCantidadVendida
            );

            response.sendRedirect(request.getContextPath() + "/areaAdministracion/confirmacionAdmin.jsp"); // Página de éxito

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/areaAdministracion/error.jsp"); // Página de error
        }
    }
}
