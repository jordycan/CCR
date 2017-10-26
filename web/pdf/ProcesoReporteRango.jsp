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

    String fecha1 = request.getParameter("fecha1");
    String fecha2 = request.getParameter("fecha2");
    
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date parsed = format.parse(fecha1);
    java.sql.Date f1 = new java.sql.Date(parsed.getTime());
    

    parsed = format.parse(fecha2);
    java.sql.Date f2 = new java.sql.Date(parsed.getTime());
    
    String fe1=f1.toString();
    String fe2=f2.toString();
    
    Connection conexion;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conexion = DriverManager.getConnection("jdbc:mysql://localhost/conexiones_camino_real", "root", "root");
    File reporte = new File(application.getRealPath("/Reportes/RangoDeFecha.jasper"));
    Map parametro = new HashMap();
    parametro.put("fecha1", fe1);
    parametro.put("fecha2", fe2);
    byte[] bit = JasperRunManager.runReportToPdf(reporte.getPath(), parametro, conexion);
    response.setContentType("application/pdf");
    response.setContentLength(bit.length);
    ServletOutputStream output = response.getOutputStream();
    output.write(bit, 0, bit.length);
    output.flush();
    output.close();

%>