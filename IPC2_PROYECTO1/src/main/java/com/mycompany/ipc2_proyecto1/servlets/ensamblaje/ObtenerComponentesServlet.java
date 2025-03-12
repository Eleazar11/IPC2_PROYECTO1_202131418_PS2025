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
import com.mycompany.ipc2_proyecto1.database.ensamblaje.ObtenerTodosLosComponentesFiltros;
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

    private ObtenerTodosLosComponentesFiltros obtenerComponentesFiltros;

    @Override
    public void init() throws ServletException {
        // Establecer la conexión y la clase que obtiene los componentes
        Connection connection = ConexionBaseDeDatos.getConnection();
        this.obtenerComponentesFiltros = new ObtenerTodosLosComponentesFiltros(connection);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del filtro y orden
        String ordenarPor = request.getParameter("ordenarPor");
        String orden = request.getParameter("orden");

        try {
            // Obtener los componentes con los filtros
            List<Componente> componentes = obtenerComponentesFiltros.obtenerComponentesConFiltros(ordenarPor, orden);

            // Pasar los componentes al JSP
            request.setAttribute("componentes", componentes);
            request.getRequestDispatcher("../../areaEnsamblaje/listadoComponentes.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al obtener los componentes.");
        }
    }
}
// solo que nos rediriga
//response.sendRedirect("../../areaEnsamblaje/piezas.jsp");
