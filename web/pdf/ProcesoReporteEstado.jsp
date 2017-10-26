<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%

    String select = request.getParameter("estado");
    int stat = Integer.parseInt(select);
    

    if (stat == 1) {
         Calendar fecha = Calendar.getInstance();
       int mes = fecha.get(Calendar.MONTH) + 1;
        int año = fecha.get(Calendar.YEAR);
        Connection conexion;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/conexiones_camino_real", "root", "root");
        File reporte = new File(application.getRealPath("/Reportes/Pagados.jasper"));
        Map parametro = new HashMap();
        parametro.put("MesCobro",mes);
        parametro.put("añoPago",año);

        byte[] bit = JasperRunManager.runReportToPdf(reporte.getPath(), parametro, conexion);
        response.setContentType("application/pdf");
        response.setContentLength(bit.length);
        ServletOutputStream output = response.getOutputStream();
        output.write(bit, 0, bit.length);
        output.flush();
        output.close();
    }

    else if(stat == 2) {

        Connection conexion;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/conexiones_camino_real", "root", "root");
        File reporte = new File(application.getRealPath("/Reportes/PendinteDePago.jasper"));

        byte[] bit = JasperRunManager.runReportToPdf(reporte.getPath(), null, conexion);
        response.setContentType("application/pdf");
        response.setContentLength(bit.length);
        ServletOutputStream output = response.getOutputStream();
        output.write(bit, 0, bit.length);
        output.flush();
        output.close();

    }


%>