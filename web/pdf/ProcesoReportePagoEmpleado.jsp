<%-- 
    Document   : ProcesoReporteEmpleado
    Created on : 1/10/2017, 10:30:36 AM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="com.modelo.ConexionMySQL"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DAO.dao_usuarios"%>
<%@page import="com.dto.UsuariosDTO"%>
<%@page import="DAO.dao_empleado"%>
<%@page import="com.dto.EmpleadoDTO"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%

    String n = request.getParameter("nombre");
    

    String fecha = request.getParameter("fecha1");
    SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
    java.sql.Date f = java.sql.Date.valueOf(fecha);
    String datef = dateformat.format(f);
    java.sql.Date sqlDate = java.sql.Date.valueOf(datef);
    String fechafinal1 = sqlDate.toString();
    String fecha2 = request.getParameter("fecha2");
    SimpleDateFormat dateformat2 = new SimpleDateFormat("yyyy-MM-dd");
    java.sql.Date f2 = java.sql.Date.valueOf(fecha2);
    String datef2 = dateformat.format(f2);
    java.sql.Date sqlDate2 = java.sql.Date.valueOf(datef2);
    String fechafinal2 = sqlDate2.toString();

    try {
        Connection conn;
        conn = ConexionMySQL.getConexionUnica("localhost", "Conexiones_Camino_Real", "root", "root");
        File reporte = new File(application.getRealPath("/Reportes/EmpleadosReportCobro.jasper"));
        Map parametro = new HashMap();
        parametro.put("empleado", n);
        parametro.put("fecha1", fechafinal1);
        parametro.put("fecha2", fechafinal2);
        //parametro.put("fecha", Fecha);
        byte[] bit = JasperRunManager.runReportToPdf(reporte.getPath(), parametro, conn);
        response.setContentType("application/pdf");
        response.setContentLength(bit.length);
        ServletOutputStream output = response.getOutputStream();

        output.write(bit, 0, bit.length);
        output.flush();
        output.close();

    } catch (SQLException e) {
        out.print("Se a producido un error");
    }

    response.sendRedirect("ProcesoReporteFechas.jsp");

%>