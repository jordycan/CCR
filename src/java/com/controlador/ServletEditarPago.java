/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import DAO.dao_clientes;
import DAO.dao_ventas;
import com.modelo.ConexionMySQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
public class ServletEditarPago extends HttpServlet {

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
 String validar = "";
            String id_cobro = request.getParameter("cobro");
            int id = Integer.parseInt(id_cobro);
            String f = request.getParameter("fecha");
            String c = request.getParameter("cantidad");
            int cantidad = Integer.parseInt(c);
            String mesPagado=request.getParameter("mesPagado");
            String nombre = request.getParameter("nombre");
            String d = request.getParameter("descuento");
            int descuento = Integer.parseInt(d);
            cantidad = cantidad+descuento;
            Connection conn;

            try {
                int tipo_de_cliente;
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date parsed = format.parse(f);
                java.sql.Date fecha = new java.sql.Date(parsed.getTime());

                conn = ConexionMySQL.getConexionUnica("localhost", "Conexiones_Camino_Real", "root", "root");
               
                dao_clientes clientes = new dao_clientes(conn);
                tipo_de_cliente = dao_clientes.MostrarTipoPorNombre(nombre);
                dao_ventas ventas = new dao_ventas(conn);

                Pagos pag = new Pagos();

                int a = pag.adeudo(tipo_de_cliente, cantidad);
                String status = pag.statusDePago(tipo_de_cliente, cantidad);

                if (cantidad <= 250 && tipo_de_cliente == 1) {
                    ventas.EditarCobro(id,mesPagado, fecha,cantidad, status, a,descuento);
                    request.getRequestDispatcher("PendientesDePago.jsp").forward(request, response);
                } else if (cantidad <= 500 && tipo_de_cliente == 2) {
                    ventas.EditarCobro(id, mesPagado,fecha, cantidad, status, a,descuento);
                      request.getRequestDispatcher("PendientesDePago.jsp").forward(request, response);
                } else if (cantidad <= 1000 && tipo_de_cliente == 3) {
                    ventas.EditarCobro(id,mesPagado, fecha, cantidad, status, a,descuento);
                    request.getRequestDispatcher("PendientesDePago.jsp").forward(request, response);
                }
                else if (cantidad <= 400 && tipo_de_cliente == 4) {
                    ventas.EditarCobro(id,mesPagado, fecha, cantidad, status, a,descuento);
                    request.getRequestDispatcher("PendientesDePago.jsp").forward(request, response);
                }
                  else if (cantidad <= 350 && tipo_de_cliente == 5) {
                    ventas.EditarCobro(id,mesPagado, fecha, cantidad, status, a,descuento);
                    request.getRequestDispatcher("PendientesDePago.jsp").forward(request, response);
                }
                    else if (cantidad <= 700 && tipo_de_cliente == 6) {
                    ventas.EditarCobro(id,mesPagado, fecha, cantidad, status, a,descuento);
                    request.getRequestDispatcher("PendientesDePago.jsp").forward(request, response);
                }
                else {
                   validar+="El pago es incorrecto";
                    request.setAttribute("validaciones", validar);
                      request.getRequestDispatcher("PendientesDePago.jsp").forward(request, response);
                }

            } catch (SQLException e) {

            } catch (ParseException ex) {
                Logger.getLogger(ServletEditarPago.class.getName()).log(Level.SEVERE, null, ex);
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
