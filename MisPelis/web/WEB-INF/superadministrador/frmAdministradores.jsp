<%-- 
    Document   : registroAdministradores
    Created on : 6/08/2020, 02:28:35 PM
    Author     : aljad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
               <c:if test="${action == 'EditAdministrador'}">
      Editar administrador
        </c:if>
       <c:if test="${action == 'RegistroAdministradores'}">
      Registro administrador
        </c:if>
      
            
        </title>
   
    </head>
    <div class="container">
        <div class="jumbotron">
            <form name="frmAdministrador" action="${action}"
                  method="post"
                  >
            <h1 style="text-align: center; color: #000000;">
            
                      <c:if test="${action == 'EditAdministrador'}">
      Editar 
        </c:if>
       <c:if test="${action == 'RegistroAdministradores'}">
      Registro 
        </c:if>
            
            </h1>
             <hr>
             
             <input type="hidden" name="id" value="${editAdmin.idUsuario}" >
            <div class="row">
                <div class="col-md-4">
                    <h3 style="color: #000000;">Usuario:</h3>
                    <input class="form-control" type="text" name="usuario" value="${editAdmin.nomUsuario}">
                </div>
                   <div class="col-md-4">
                    <h3 style="color: #000000;">Password:</h3>
                    <input class="form-control" type="password" name="password" value="${editAdmin.password}">
                </div>
                 <div class="col-md-4">
                    <h3 style="color: #000000;">Correo:</h3>
                    <input class="form-control" type="email" name="correo" value="${editAdmin.correo}">
                </div>
                
            </div>
            
             <div class="row">
                <div class="col-md-6">
                    <h3 style="color: #000000;">Nombres:</h3>
                    <input class="form-control" type="text" name="nombres" value="${editAdmin.nombres}">
                </div>
                   <div class="col-md-6">
                    <h3 style="color: #000000;">Apellidos</h3>
                    <input class="form-control" type="text" name="apellidos" value="${editAdmin.apellidos}">
                </div>
                
            </div>
             <br><br><br>  
             <div class="col-md-12" style="left: 32%;"> 
    <button class="btn btn-success col-lg-4 form-group" type="submit" >Guardar</button>
  
    </div>
             <div class="col-md-12" style="left: 32%;"> 
    <a class="btn btn-danger col-lg-4 form-group" type="button" href="ListAdministradores" >Cancelar</a>
  
    </div>
             </form>
    </div> 
    </div>
    
  
