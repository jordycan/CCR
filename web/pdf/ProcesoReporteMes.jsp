<%-- 
    Document   : ProcesoReporteMes
    Created on : 26/09/2017, 09:27:35 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%
   
   
    String m = request.getParameter("mes");
    int mes=Integer.parseInt(m);
    Calendar cal = Calendar.getInstance();
    int año=cal.get(Calendar.YEAR);
    
    Connection conexion;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conexion = DriverManager.getConnection("jdbc:mysql://localhost/conexiones_camino_real", "root", "root");
    File reporte = new File(application.getRealPath("/Reportes/Fecha.jasper"));
    Map parametro = new HashMap();
    parametro.put("mes",mes);
    parametro.put("año",año);
    byte[] bit = JasperRunManager.runReportToPdf(reporte.getPath(), parametro, conexion);
    response.setContentType("application/pdf");
    response.setContentLength(bit.length);
    ServletOutputStream output = response.getOutputStream();
    output.write(bit, 0, bit.length);
    output.flush();
    output.close();
   
%>