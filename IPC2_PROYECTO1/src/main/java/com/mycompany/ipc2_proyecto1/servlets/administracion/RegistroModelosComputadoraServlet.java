/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.servlets.administracion;

import com.mycompany.ipc2_proyecto1.database.ConexionBaseDeDatos;
import com.mycompany.ipc2_proyecto1.database.administracion.InsertarModeloComputadora;
import com.mycompany.ipc2_proyecto1.database.administracion.ModeloComputadora;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.SQLIntegrityConstraintViolationException;

/**
 *
 * @author eleaz
 */
@WebServlet(name = "RegistroModelosComputadoraServlet", urlPatterns = {"/RegistroModelosComputadoraServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class RegistroModelosComputadoraServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Crear la conexión
        Connection connection = ConexionBaseDeDatos.getConnection();

        try {
            if (connection == null) {
                System.out.println("No se pudo establecer la conexión a la base de datos.");
                response.sendRedirect(request.getContextPath() + "/areaAdministracion/error.jsp");
                return;
            }

            // Recibir los datos del formulario
            String nombre = request.getParameter("nombre");
            int cantProcesador = Integer.parseInt(request.getParameter("cantProcesador"));
            int cantRAM = Integer.parseInt(request.getParameter("cantRAM"));
            int cantTarjetaGrafica = Integer.parseInt(request.getParameter("cantTarjetaGrafica"));
            int cantSSD = Integer.parseInt(request.getParameter("cantSSD"));
            double precio = Double.parseDouble(request.getParameter("precio"));
            boolean armada = Boolean.parseBoolean(request.getParameter("armada"));
            boolean vendida = Boolean.parseBoolean(request.getParameter("vendida"));

            // Verificar si el modelo de computadora ya existe
            InsertarModeloComputadora insertarModeloComputadora = new InsertarModeloComputadora(connection);
            if (insertarModeloComputadora.modeloComputadoraExiste(nombre)) {
                response.sendRedirect(request.getContextPath() + "/areaAdministracion/error.jsp");
                return;
            }

            // Crear el objeto ModeloComputadora
            ModeloComputadora modeloComputadora = new ModeloComputadora(
                    nombre,
                    cantProcesador,
                    cantRAM,
                    cantTarjetaGrafica,
                    cantSSD,
                    precio
            );
            modeloComputadora.setArmada(armada);
            modeloComputadora.setVendida(vendida);

            // Intentar registrar el modelo de computadora
            try {
                insertarModeloComputadora.registrarModeloComputadora(modeloComputadora);
                // Verificar si se están leyendo los datos de la base de datos (opcional)
                response.sendRedirect(request.getContextPath() + "/areaAdministracion/confirmacionAdmin.jsp"); // Si el registro es exitoso
            } catch (SQLIntegrityConstraintViolationException e) {
                response.sendRedirect(request.getContextPath() + "/areaAdministracion/error.jsp"); // Modelo repetido
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/areaAdministracion/error.jsp"); // Página de error genérico
        } finally {
            // Cerrar la conexión (opcional)
        }
    }
}

