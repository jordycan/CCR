<%-- 
    Document   : ReportePorFechas
    Created on : 28/09/2017, 06:24:01 PM
    Author     : Jordy Can
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Reporte por Rango de Fecha</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script src="autocompleter.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">

        <link rel="stylesheet" href="../bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">


        <link rel="stylesheet" href="../dist/css/skins/skin-blue.min.css">


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
                                <li><a href="ActualizarClientes.jsp"><i class="fa fa-user-times"></i>Actualizar Clientes</a></li>
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


                <!-- Main content -->
                <section class="content container-fluid">

                    <div id="page-wrapper">
                        <div class="row">
                            <div class="col-lg-12">
                                <h1 class="page-header">Reporte por Rango de Fecha</h1>
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                        <!-- /.row -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        Clientes
                                    </div>
                                    <div class="panel-body">
                                        <form action="../pdf/ProcesoReporteFechas.jsp" method="post">
                                            <div class="row">

                                                <div class="col-md-4">                    

                                                    <div class="form-group">

                                                        <label for="fecha">Fecha 1</label>
                                                        <input type="date" id="fecha1" name="fecha1" class="form-control" />

                                                    </div>


                                                </div> 

                                                <div class="col-md-4">                    

                                                    <div class="form-group">

                                                        <label for="fecha">Fecha 2</label>
                                                        <input type="date" id="fecha2" name="fecha2" class="form-control" />

                                                    </div>


                                                </div> 


                                                <div class="col-md-2">                    

                                                    <div class="form-group">
                                                        <br>
                                                        <button type="submit" class="btn btn-primary">Generar</button>

                                                    </div>  


                                                </div> 



                                                <!-- /.col-lg-6 (nested) -->

                                                <!-- /.col-lg-6 (nested) -->
                                            </div>


                                        </form>

                                        <!-- /.row (nested) -->
                                    </div>
                                    <!-- /.panel-body -->
                                </div>


                                <!-- /.panel -->
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                        <!-- /.row -->
                    </div>

                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <!-- Main Footer -->
            <footer class="main-footer">
                <!-- To the right -->
                <div class="pull-right hidden-xs">
                    Pomuch,Hkn,Campeche
                </div>
                <!-- Default to the left -->
                <strong>Copyright &copy; 2017 <a href="#">Conexiones del Camino Real</a>.</strong> All rights reserved.
            </footer>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Create the tabs -->
                <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
                    <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
                    <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <!-- Home tab content -->
                    <div class="tab-pane active" id="control-sidebar-home-tab">
                        <h3 class="control-sidebar-heading">Recent Activity</h3>
                        <ul class="control-sidebar-menu">
                            <li>
                                <a href="javascript:;">
                                    <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                                        <p>Will be 23 on April 24th</p>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <!-- /.control-sidebar-menu -->

                        <h3 class="control-sidebar-heading">Tasks Progress</h3>
                        <ul class="control-sidebar-menu">
                            <li>
                                <a href="javascript:;">
                                    <h4 class="control-sidebar-subheading">
                                        Custom Template Design
                                        <span class="pull-right-container">
                                            <span class="label label-danger pull-right">70%</span>
                                        </span>
                                    </h4>

                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <!-- /.control-sidebar-menu -->

                    </div>
                    <!-- /.tab-pane -->
                    <!-- Stats tab content -->
                    <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
                    <!-- /.tab-pane -->
                    <!-- Settings tab content -->
                    <div class="tab-pane" id="control-sidebar-settings-tab">
                        <form method="post">
                            <h3 class="control-sidebar-heading">General Settings</h3>

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Report panel usage
                                    <input type="checkbox" class="pull-right" checked>
                                </label>

                                <p>
                                    Some information about this general settings option
                                </p>
                            </div>
                            <!-- /.form-group -->
                        </form>
                    </div>
                    <!-- /.tab-pane -->
                </div>
            </aside>
            <!-- /.control-sidebar -->
            <!-- Add the sidebar's background. This div must be placed
            immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->

        <!-- REQUIRED JS SCRIPTS -->
        <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- AdminLTE App -->

        <!-- Bootstrap 3.3.7 -->
        <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="../dist/js/adminlte.min.js"></script>


        <!-- Optionally, you can add Slimscroll and FastClick plugins.
             Both of these plugins are recommended to enhance the
             user experience. -->
    </body>
</html>