<%-- 
    Document   : listAdministradores
    Created on : 6/08/2020, 02:20:20 PM
    Author     : aljad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado administradores</title>
        
  
    </head>
   
           <div class="col-md-6 mb-4">
               <a href="frmAdministradores">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Registrar +</div>
                     
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-users fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
                   </a>
            </div>
        
       
    
           
       
<table id="example" class="display" style="width:90%">
        <thead>
            <tr>
                <th>#</th>
      <th>Usuario</th>
      <th>Nombres</th>
        <th>Apellidos</th>
      <th>Correo</th>
      <th>Opciones</th>
            </tr>
        </thead>
        <tbody>
          
        <c:forEach var="u" items="${usuarios}">
              <c:if test="${u.idTipousuario.tipoUsuario == 'Administrador'}">
             <tr>
                
            <td>${u.idUsuario}</td>
            <td>${u.nomUsuario}</td>
            <td>${u.nombres}</td>
            <td>${u.apellidos}</td>
            <td>${u.correo}</td>
    
    
    
      <td>
          <a class="editar btn btn-primary" href="frmEditAdministradores?id=${u.idUsuario}" >Editar</a>
          <a class="btn btn-danger" href="EliminarAdministradores?id=${u.idUsuario}" >Eliminar</a>
      </td>
     
      </tr>
        </c:if>
      </c:forEach>
        
        </tbody>
        <tfoot>
            <tr>
              <th>#</th>
      <th>Usuario</th>
      <th>Nombres</th>
        <th>Apellidos</th>
      <th>Correo</th>
      <th>Opciones</th>
            </tr>
        </tfoot>
    </table>
    
   
    
   
  
    
     