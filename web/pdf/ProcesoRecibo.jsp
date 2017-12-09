<%-- 
    Document   : ProcesoReporteMes
    Created on : 26/09/2017, 09:27:35 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="com.modelo.ConexionMySQL"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%

    Connection conexion;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conexion = DriverManager.getConnection("jdbc:mysql://localhost/conexiones_camino_real", "root", "root");
    File reporte = new File(application.getRealPath("/Reportes/Recibo.jasper"));
    Map parametro = new HashMap();
    
    String m = request.getParameter("mes");
    String nombre = request.getParameter("search");
    String s = request.getParameter("seguro");
    int seguro = Integer.parseInt(s);
      String d = request.getParameter("descuento");
    int descuento = Integer.parseInt(d);
     String f = request.getParameter("folio");
    int folio = Integer.parseInt(f);
    
    parametro.put("nombre",nombre);
    parametro.put("mes",m);
    parametro.put("seguro",seguro);
    parametro.put("DCTO",descuento);
    parametro.put("folio",folio);
    //parametro.put("fecha", Fecha);
    byte[] bit = JasperRunManager.runReportToPdf(reporte.getPath(), parametro, conexion);
    response.setContentType("application/pdf");
    response.setContentLength(bit.length);
    ServletOutputStream output = response.getOutputStream();

    output.write(bit, 0, bit.length);
    output.flush();
    output.close();


%>