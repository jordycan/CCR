<%-- 
    Document   : ProcesoCorteReporte
    Created on : 06-dic-2017, 14:21:00
    Author     : Particular
--%>

<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%
   
   
    String corte=request.getParameter("corte");
    String localidad=request.getParameter("localidad");
    
    Connection conexion;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conexion = DriverManager.getConnection("jdbc:mysql://localhost/conexiones_camino_real", "root", "root");
    File reporte = new File(application.getRealPath("/Reportes/CorteLocal.jasper"));
    Map parametro = new HashMap();
    parametro.put("corte",corte);
    parametro.put("localidad",localidad);
    byte[] bit = JasperRunManager.runReportToPdf(reporte.getPath(), parametro, conexion);
    response.setContentType("application/pdf");
    response.setContentLength(bit.length);
    ServletOutputStream output = response.getOutputStream();
    output.write(bit, 0, bit.length);
    output.flush();
    output.close();
   
%>