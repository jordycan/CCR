/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import DAO.dao_clientes;
import com.dto.ClientesDTO;
import com.modelo.ConexionMySQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class ServletClientes extends HttpServlet {

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
           
            String nombre=request.getParameter("nombre");
            String direccion=request.getParameter("direccion");
            String sector=request.getParameter("sector");
            String telefono=request.getParameter("telefono");
            String id_tipo=request.getParameter("tipo_cliente");
            int id=Integer.parseInt(id_tipo);
            String validacion="";
            
            Connection con;
            
            
            try{
                
                con= ConexionMySQL.getConexionUnica("localhost", "Conexiones_Camino_Real","root", "root");
                
                dao_clientes cliente = new dao_clientes(con);
                
                if(cliente.RegistrarClientes(nombre,direccion,sector,id,telefono)){
                    validacion="Registro exitoso";
                    request.getSession().setAttribute("validar_cliente", validacion);
                    response.sendRedirect("Admin/Clientes.jsp");
                }
               
            }catch(Exception e){
                            validacion="Error";
                           request.getSession().setAttribute("validar_cliente", validacion);
                           response.sendRedirect("Admin/Clientes.jsp");
			 Logger.getLogger(ServletSesion.class.getName()).log(Level.SEVERE, null, e);
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
