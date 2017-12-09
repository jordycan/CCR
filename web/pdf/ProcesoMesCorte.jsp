
<%@page import="com.modelo.ConexionMySQL"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="Text/html" pageEncoding="UTF-8" %>
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<%
    // String fec1=request.getParameter("date1");
    //String fec2=request.getParameter("date2");
    String fecha1 = request.getParameter("fecha1");
    String fecha2 = request.getParameter("fecha2");
    
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date parsed = format.parse(fecha1);
    java.sql.Date f1 = new java.sql.Date(parsed.getTime());
    

    parsed = format.parse(fecha2);
    java.sql.Date f2 = new java.sql.Date(parsed.getTime());
    
    String fe1=f1.toString();
    String fe2=f2.toString();
    
    String mes = request.getParameter("mes");
    String localidad = request.getParameter("localidad");
    String corte = request.getParameter("corte");
    //String Clinica=request.getParameter("clinica");
    //int numeroClinica=Integer.parseInt(Clinica);
    Connection conexion;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conexion = DriverManager.getConnection("jdbc:mysql://localhost/conexiones_camino_real", "root", "root");
    File reporte = new File(application.getRealPath("/Reportes/ReporteMesCorteLocalidad.jasper"));
    Map parametro = new HashMap();

    parametro.put("fechafinal2", fe2);
    parametro.put("mes", mes);
    parametro.put("fechafinal1", fe1);
    parametro.put("localidad", localidad);
    parametro.put("corte", corte);

    byte[] bit = JasperRunManager.runReportToPdf(reporte.getPath(), parametro, conexion);
    response.setContentType("application/pdf");
    response.setContentLength(bit.length);
    ServletOutputStream output = response.getOutputStream();
    output.write(bit, 0, bit.length);
    output.flush();
    output.close();
%>