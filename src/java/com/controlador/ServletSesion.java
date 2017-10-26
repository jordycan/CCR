/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import DAO.dao_usuarios;
import com.modelo.ConexionMySQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jordy Can
 */
public class ServletSesion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            
           String usuario=request.getParameter("user");
           String contraseña=request.getParameter("pass");
           
           Connection conn;
           
                try {
                    conn = ConexionMySQL.getConexionUnica("localhost", "Conexiones_Camino_Real", "root", "root");

                    dao_usuarios logeo = new dao_usuarios(conn);
                    HttpSession sesion = request.getSession();
                        if (logeo.autentificacion(1,usuario, contraseña)) {
                            sesion.setAttribute("user", usuario);
                            response.sendRedirect("Admin/Principal.jsp");
                         }
                        else if (logeo.autentificacion(2,usuario, contraseña)) {
                            sesion.setAttribute("user", usuario);
                            response.sendRedirect("Empleados/Principal.jsp");
                         }
                        
                        else if(logeo.autentificacion(2,usuario, contraseña)==false){
                        request.setAttribute("invalidate", new String("Contraseña Incorrecta"));
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                        }
             else {
                   
            }
             

            if (request.getParameter("cerrar") != null) {
                sesion.invalidate();

            }
            } catch (SQLException ex) {
                Logger.getLogger(ServletSesion.class.getName()).log(Level.SEVERE, null, ex);
                }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
