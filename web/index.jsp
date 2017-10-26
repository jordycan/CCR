<%-- 
    Document   : index
    Created on : 13/09/2017, 09:35:17 AM
    Author     : Jordy Can
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio de Sesión</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximun=1.0,minimum-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    
                    <div class="wrap">
                        <p class="form-title">
                            Conexiones del Camino Real</p>
                        <form class="login" action="ServletSesion" method="post" >
                            <input type="text" placeholder="Username" id="user" name="user"/>
                            <input type="password" placeholder="Password" id="pass" name="pass"/>
                            <input type="submit" value="Sign In" class="btn btn-success btn-sm" />
                            
                            <br>
 <%
                                
                                Object mensaje=request.getAttribute("invalidate");
                                if(mensaje!=null){
                                     %>
                                     <div class="alert alert-danger">
                                         <strong>
                                             <%=mensaje%>
                                         </strong>
                                     </div>
                                  <%
                                }
                   %>
                        </form>
                       
                        
                    </div>
                    
                </div>
                    
                    
                
                 
                   
                   
                    <%
            HttpSession sesion = request.getSession();

            if (request.getParameter("cerrar") != null) {
                sesion.invalidate();

            }
        %>
            </div>

        </div>
            

    </body>
</html>
