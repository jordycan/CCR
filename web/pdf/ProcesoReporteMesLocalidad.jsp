<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%
   
   
    Calendar fecha = Calendar.getInstance();
    
        int año = fecha.get(Calendar.YEAR);
        String mes = request.getParameter("mes");
        String sector = request.getParameter("localidad");
        Connection conexion;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/conexiones_camino_real", "root", "root");
        File reporte = new File(application.getRealPath("/Reportes/Localidad.jasper"));
        Map parametro = new HashMap();
        
       
        parametro.put("anio",año);
         parametro.put("mes",mes);
         parametro.put("sector",sector);
         
        byte[] bit = JasperRunManager.runReportToPdf(reporte.getPath(), parametro, conexion);
        response.setContentType("application/pdf");
        response.setContentLength(bit.length);
        ServletOutputStream output = response.getOutputStream();
        output.write(bit, 0, bit.length);
        output.flush();
        output.close();
   
%>