/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.servlets.ensamblaje;

import com.mycompany.ipc2_proyecto1.database.ConexionBaseDeDatos;
import com.mycompany.ipc2_proyecto1.database.ensamblaje.CategoriaComponente;
import com.mycompany.ipc2_proyecto1.database.ensamblaje.Componente;
import com.mycompany.ipc2_proyecto1.database.ensamblaje.InsertarComponente;
import com.mycompany.ipc2_proyecto1.database.ensamblaje.ObtenerComponentes;
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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author eleaz
 */
@WebServlet(name = "ObtenerComponentesServlet", urlPatterns = {"/ObtenerComponentesServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class ObtenerComponentesServlet extends HttpServlet {

    private ObtenerComponentes obtenerComponentes;

    @Override
    public void init() throws ServletException {
        // Utilizamos la clase ConexionBaseDeDatos para obtener la conexión
        Connection connection = ConexionBaseDeDatos.getConnection();
        // Pasamos la conexión al constructor de ObtenerComponentes
        this.obtenerComponentes = new ObtenerComponentes(connection);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = ConexionBaseDeDatos.getConnection();

        try {
            ObtenerComponentes obtenerComponentes = new ObtenerComponentes(connection);
            List<Componente> componentes = obtenerComponentes.obtenerTodosLosComponentes();

            request.setAttribute("componentes", componentes);
            request.getRequestDispatcher("../../areaEnsamblaje/piezas.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al obtener los componentes.");
        }
    }

}
// solo que nos rediriga
//response.sendRedirect("../../areaEnsamblaje/piezas.jsp");
