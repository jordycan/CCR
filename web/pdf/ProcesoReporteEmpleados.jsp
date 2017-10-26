<%@page import="java.util.List"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%

  Connection conexion;
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  conexion=DriverManager.getConnection("jdbc:mysql://localhost/conexiones_camino_real","root","root");
  File reporte=new File(application.getRealPath("/Reportes/Empleados.jasper"));
 
  byte [] bit=JasperRunManager.runReportToPdf(reporte.getPath(),null,conexion);
  response.setContentType("application/pdf");
  response.setContentLength(bit.length);
  ServletOutputStream output=response.getOutputStream();
  output.write(bit, 0, bit.length);
  output.flush();
  output.close();
%>