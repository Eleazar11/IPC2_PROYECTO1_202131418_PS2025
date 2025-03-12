/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ipc2_proyecto1;

import com.mycompany.ipc2_proyecto1.database.ConexionBaseDeDatos;
import com.mycompany.ipc2_proyecto1.database.ConsultarUsuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author eleaz
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Conexión a la base de datos
        Connection connection = ConexionBaseDeDatos.getConnection();

        // Instancia de la clase ConsultarUsuario
        ConsultarUsuario consultarUsuario = new ConsultarUsuario(connection);

        try {
            // Verificar si el usuario es válido
            String tipoUsuario = consultarUsuario.consultarTipoUsuario(username, password);

            if (tipoUsuario != null) {
                // Si las credenciales son válidas, crear una sesión y redirigir al usuario
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("tipoUsuario", tipoUsuario);

                // Redirigir según el tipo de usuario
                switch (tipoUsuario) {
                    case "ENSAMBLAJE":
                        response.sendRedirect("areaEnsamblaje/ensamblaje.jsp");
                        break;
                    case "VENTAS":
                        response.sendRedirect("areaVentas/ventas.jsp");
                        break;
                    case "ADMINISTRACION":
                        response.sendRedirect("areaAdministracion/administracion.jsp");
                        break;
                    default:
                        response.sendRedirect("index.jsp"); // En caso de que no haya coincidencia
                }
            } else {
                // Si las credenciales no son válidas, mostrar un mensaje de error
                request.setAttribute("error", "Invalid username or password");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}
