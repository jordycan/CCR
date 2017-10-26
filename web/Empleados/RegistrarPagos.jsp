<%-- 
    Document   : RegistrarPagos
    Created on : 13/09/2017, 05:09:33 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Registro de Pagos</title>
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
                                    <span class="hidden-xs">Empleado</span>

                                </a>
                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <img src="../imagenes/user.png" class="img-circle" alt="User Image">

                                        <p>
                                            Empleado

                                        </p>
                                    </li>
                                    <!-- Menu Body -->

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
                            <p>Empleado</p>
                            <!-- Status -->
                            <h6> <a><i class="fa fa-circle text-success"></i> Empleado</a></h6>
                        </div>
                    </div>

                    <!-- search form (Optional) -->

                    <!-- /.search form -->

                    <!-- Sidebar Menu -->
                    <ul class="sidebar-menu" data-widget="tree">
                        <li class="header">Menu</li>
                        <!-- Optionally, you can add icons to the links -->

                        <li class="treeview">
                            <a href="#"><i class="fa fa-user"></i> <span>Pagos</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="RegistrarPagos.jsp"><i class="fa fa-user-plus"></i>Registrar Pagos</a></li>
                                <li><a href="PendientesDePago.jsp"><i class="fa fa-user-times"></i>Pendientes por Pagar</a></li>
                                   <li><a href="RegistroDePagos.jsp"><i class="fa fa-user-times"></i>Registro de Pagos</a></li>
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

                    <div id="page-wrapper">
                        <div class="row">
                            <div class="col-lg-12">
                                <h1 class="page-header">Registro De Pagos</h1>
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                        <!-- /.row -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        Nuevo Registro
                                    </div>
                                    <div class="panel-body">
                                        <form action="ServletPagos" method="post">
                                            <div class="row">


                                                <div class="col-md-4">                    

                                                    <div class="form-group">

                                                        <label for="id_cliente">Cliente</label>
                                                        <input type="text" id="search" name="search" class="form-control" />

                                                    </div>


                                                </div> 





                                                <div class="col-md-4">                    

                                                    <div class="form-group">
                                                        <label for="usuario">Fecha de Pago</label>
                                                        <input type="date" name="fecha" maxlength="30" id="fecha" class="form-control" step="1" min="2017-01-01" max="2018-01-01" >
                                                    </div>  


                                                </div>

                                                <div class="col-md-4">                    

                                                    <div class="form-group">
                                                        <label for="cantidad">Cantidad</label>
                                                        <input type="text" name="cantidad" maxlength="30" id="cantidad" class="form-control" >
                                                    </div>  


                                                </div>

                                                 <div class="col-md-4">                    

                                                    <div class="form-group">
                                                        <label for="sector">Mes Pagado</label>
                                                        <select class="form-control" name="mesPagado" id="mesPagado">
                                                                <option value="Enero">Enero</option>
                                                                <option value="Febrero">Febreo</option>
                                                                <option value="Marzo">Marzo</option>
                                                                <option value="Abril">Abril</option>
                                                                <option value="Mayo">Mayo</option>
                                                                <option value="Junio">Junio</option>
                                                                <option value="Julio">Julio</option>
                                                                <option value="Agosto">Agosto</option>
                                                                <option value="Septiembre">Septiembre</option>
                                                                <option value="Octubre">Octubre</option>
                                                                <option value="Noviembre">Noviembre</option>
                                                                <option value="Diciembre">Diciembre</option>
                                                              
                                                              </select>

                                                    </div>  



                                                </div> 






                                                <div class="col-md-2">                    

                                                    <div class="form-group">
                                                        <br>
                                                        <button type="submit" class="btn btn-primary">Guardar</button>

                                                    </div>  


                                                </div> 







                                                <!-- /.col-lg-6 (nested) -->

                                                <!-- /.col-lg-6 (nested) -->
                                            </div>
                                            <%                                                if (request.getAttribute("validaciones") != null) {
                                            %>
                                            <div class="alert alert-danger alert-dismissable fade in">
                                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                <strong>Error!</strong>   ${requestScope.validaciones}
                                            </div>
                                            <%}%>
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
           
            <!-- Add the sidebar's background. This div must be placed
            immediately after the control sidebar -->
            
        </div>
        <!-- ./wrapper -->

        <!-- REQUIRED JS SCRIPTS -->

        <!-- jQuery 3 -->

        <!-- Bootstrap 3.3.7 -->
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