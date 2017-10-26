<%-- 
    Document   : ProcesoReporteEmpleado
    Created on : 1/10/2017, 10:30:36 AM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

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
    List<EmpleadoDTO> detalles = dao_empleado.MostrarIdEmp(n);
   int id= detalles.get(0).getId_empleado();
    List<UsuariosDTO> detalle = dao_usuarios.MostrarUsuario(id);
   String nombre=detalle.get(0).getUsuario();
    
    Connection conexion;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conexion = DriverManager.getConnection("jdbc:mysql://localhost/conexiones_camino_real", "root", "root");
    File reporte = new File(application.getRealPath("/Reportes/EmpleadosReportCobro.jasper"));
    Map parametro = new HashMap();
    parametro.put("empleado",nombre);
    byte[] bit = JasperRunManager.runReportToPdf(reporte.getPath(), parametro, conexion);
    response.setContentType("application/pdf");
    response.setContentLength(bit.length);
    ServletOutputStream output = response.getOutputStream();
    output.write(bit, 0, bit.length);
    output.flush();
    output.close();
   
%>