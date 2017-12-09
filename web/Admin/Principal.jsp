<%-- 
    Document   : Principal
    Created on : 13/09/2017, 10:16:59 AM
    Author     : Jordy Can
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Admin Principal</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="../bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
  <link rel="stylesheet" href="../dist/css/skins/skin-blue.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="Principal.jsp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>C</b>CR</span>
      <!-- logo for regular state and mobile devices -->
      <h4><span class="logo-lg">Conexiones Camino Real</span></h4>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
         
          <!-- Tasks Menu -->
          <li class="dropdown tasks-menu">
            <!-- Menu Toggle Button -->
            
            
          </li>
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
              
               <%
                                HttpSession sesion = request.getSession();
                                String usuario;

                                if (sesion.getAttribute("user") != null) {
                                    usuario = sesion.getAttribute("user").toString();
                            %>
                            
                            <%
                                    //out.print("<a href='../Login.jsp?cerrar=true'><h5>Cerrar Sesion </h5></a>");
                                } else {
                                    out.print("<script> location.replace('../index.jsp');</script>");
                                }

                                //<li><a href="login.jsp"></i> Iniciar Sesion</a>
                            %>
              
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
              <img src="../imagenes/user.png" class="user-image" alt="User Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs">Daniel Can</span>
              
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img src="../imagenes/user.png" class="img-circle" alt="User Image">

                <p>
                 Ing. Daniel Can 
                  <small> Jefe de ???</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="VerEmpleados.jsp">Empleados</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="VerClientes.jsp">Clientes</a>
                  </div>
                  
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Perfil</a>
                </div>
                <div class="pull-right">
                  <a href="../index.jsp?cerrar=true" class="btn btn-default btn-flat">Salir</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
         
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="../imagenes/user.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Daniel Can</p>
          <!-- Status -->
         <h6> <a><i class="fa fa-circle text-success"></i> Administrador</a></h6>
        </div>
      </div>

      <!-- search form (Optional) -->
   
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">Menu</li>
        <!-- Optionally, you can add icons to the links -->
        
        <li class="treeview">
          <a href="#"><i class="fa fa-user"></i> <span>Empleados</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="AgregarEmpleados.jsp"><i class="fa fa-user-plus"></i>Nuevos Empleados</a></li>
            <li><a href="ActualizarEmpleados.jsp"><i class="fa fa-user-times"></i>Actualizar Empleados</a></li>
          </ul>
        </li>

         <li class="treeview">
          <a href="#"><i class="fa fa-user-o"></i> <span>Clientes</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="Clientes.jsp"><i class="fa fa-user-plus"></i>Nuevos Clientes</a></li>
            <li><a href="ActualizarClients.jsp"><i class="fa fa-user-times"></i>Actualizar Clientes</a></li>
          </ul>
        </li>

          <li class="treeview">
          <a href="#"><i class="fa fa-credit-card"></i> <span>Pagos</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
              <li><a href="adeudos.jsp"><i class="fa fa-calendar"></i>Adeudos</a></li>
            <li><a href="PagoMes.jsp"><i class="fa fa-calendar"></i>Pagos por Mes</a></li>
            <li><a href="PagoCliente.jsp"><i class="fa fa-user-o"></i> Pagos por Clientes</a></li>
            <li><a href="PagoRangoFecha.jsp"><i class="fa fa-calendar-times-o"></i>Pagos por Rango de Fechas</a></li>
           
          </ul>
        </li>

         <li class="treeview">
          <a href="#"><i class="fa fa-file-pdf-o"></i> <span>Reportes</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="ReportePorMes.jsp">Reportes por Mes</a></li>
            <li><a href="ReportePorEmpleado.jsp">Reportes por Empleados</a></li>
            <li><a href="ReportePorEstado.jsp">Reportes por Estado de Pago</a></li>
           <li><a href="ReporteporMesPagado.jsp">Reportes por Mes y Localidad</a></li>
           <li><a href="ReporteporRango.jsp">Reportes por Rango de Fecha</a></li>
           <li><a href="Recibos.jsp">Recibos</a></li>
           <li><a href="ReporteCorte.jsp">Reporte por fecha de Corte</a></li>
           <li><a href="ReporteCorteMesPagado.jsp">Reporte por Rango de Corte</a></li>
          </ul>
        </li>

      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Conexiones del Camino Real
        <br>
        <small>Sistema de control de Clientes y Pagos</small>
      </h1>
    
    </section>

    <!-- Main content -->
    <section class="content container-fluid">

      <!--------------------------
        | Your Page Content Here |
        -------------------------->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
 
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3 -->
<script src="../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.min.js"></script>


<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
</body>
</html>