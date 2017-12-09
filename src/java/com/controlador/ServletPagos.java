/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import DAO.dao_clientes;
import DAO.dao_ventas;
import com.dto.ClientesDTO;
import com.dto.CobroDTO;
import com.modelo.ConexionMySQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class ServletPagos extends HttpServlet {

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

            String validaciones = "";
            String nombre = request.getParameter("search");
            String c = request.getParameter("cantidad");
            String mesPagado = request.getParameter("mesPagado");
            int cantidad = Integer.parseInt(c);
            String estado = "";
            String f = request.getParameter("fecha");
            HttpSession sesion = request.getSession();
            String usuario;
            usuario = sesion.getAttribute("user").toString();

            Connection con;

            usuario = sesion.getAttribute("user").toString();

            try {

                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date parsed = format.parse(f);
                java.sql.Date fecha = new java.sql.Date(parsed.getTime());
                int tipo_de_cliente;

                con = ConexionMySQL.getConexionUnica("localhost", "Conexiones_Camino_Real", "root", "root");

                dao_clientes clientes = new dao_clientes(con);
                tipo_de_cliente = dao_clientes.MostrarTipoPorNombre(nombre);
                dao_ventas venta = new dao_ventas(con);

                Pagos pag = new Pagos();

                int cf = dao_clientes.MostrarIdClienteporNombre(nombre);
                DecimalFormat df = new DecimalFormat("00000000");
                df.format(cf);

                int a = pag.adeudo(tipo_de_cliente, cantidad);
                String status = pag.statusDePago(tipo_de_cliente, cantidad);

                if (cantidad <= 250 && tipo_de_cliente == 1) {
                    venta.RegistrarVenta(cf, nombre, fecha, status, mesPagado, cantidad, a, usuario);
                    request.getRequestDispatcher("Principal.jsp").forward(request, response);
                } else if (cantidad <= 500 && tipo_de_cliente == 2) {

                    venta.RegistrarVenta(cf, nombre, fecha, status, mesPagado, cantidad, a, usuario);
                    request.getRequestDispatcher("Principal.jsp").forward(request, response);
                } else if (cantidad <= 1000 && tipo_de_cliente == 3) {
                    venta.RegistrarVenta(cf, nombre, fecha, status, mesPagado, cantidad, a, usuario);
                    request.getRequestDispatcher("Principal.jsp").forward(request, response);
                } else if (cantidad <= 400 && tipo_de_cliente == 4) {
                    venta.RegistrarVenta(cf, nombre, fecha, status, mesPagado, cantidad, a, usuario);
                    request.getRequestDispatcher("Principal.jsp").forward(request, response);
                } else if (cantidad <= 350 && tipo_de_cliente == 5) {
                    venta.RegistrarVenta(cf, nombre, fecha, status, mesPagado, cantidad, a, usuario);
                    request.getRequestDispatcher("Principal.jsp").forward(request, response);
                } else if (cantidad <= 700 && tipo_de_cliente == 6) {
                    venta.RegistrarVenta(cf, nombre, fecha, status, mesPagado, cantidad, a, usuario);
                    request.getRequestDispatcher("Principal.jsp").forward(request, response);
                } else {
                    validaciones += "El pago es incorrecto";
                    request.setAttribute("validaciones", validaciones);
                    request.getRequestDispatcher("RegistrarPagos.jsp").forward(request, response);

                }

            } catch (Exception e) {
                Logger.getLogger(ServletPagos.class.getName()).log(Level.SEVERE, null, e);
                response.sendRedirect("Empleados/RegistrarPagos.jsp");

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
