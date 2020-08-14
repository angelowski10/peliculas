<%-- 
    Document   : admingenero_edit
    Created on : Aug 14, 2020, 1:12:03 PM
    Author     : Luis Angel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        
          
          <div class="col-md-12 grid-margin strech-card">
                <div class="card">
                    <div class="card-body">
                        <div class="Nuevo Genero">
                            <div class="col-md-12">
                               
                               <br><br>
                                <div class="col-md-12">
                                    <div class="card-title">
                                        Editar / Genero
                                    </div>
                                    <form method="post" action=${ruta}>
                                        
                                    
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="txtGenero"> Genero de Peliculas </label> 
                                            
                                            <input type="text" value="${modificargenero.nombre}" required="" name="txtGeneroModificar" class="form-control" placeholder="Genero">    
                                            <input type="hidden" value="${modificargenero.idGenero}" required="" name="txtIdGenero" class="form-control" placeholder="Musica">    
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <button class="btn btn-success btn-md btn-block " type="submit">
                                            Guardar
                                        </button>
                                    </div>
                                    </form>    
                                        
                                </div>
                                <br><br>
                                     
                            </div>
                        </div>
                    </div>
            </div>
               </div>
        
    </body>
</html>
