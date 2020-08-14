<%-- 
    Document   : lisPeliculas
    Created on : 10/08/2020, 01:37:58 AM
    Author     : aljad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado administradores</title>
        
  
    </head>
   
           <div class="col-md-6 mb-4">
               <a href="frmPeliculas">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Registrar +</div>
                     
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-picture-o fa-2x text-gray-300"></i>
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
        <th>Titulo</th>
      <th>Duración</th>
        <th>Sinopsis</th>
        <th>Generos</th>
      <th>Lanzamiento</th>
      <th>Imagen</th>
       <th>Opciones</th>
            </tr>
        </thead>
        <tbody>
          
        <c:forEach var="p" items="${peliculas}">
             <tr>
                
            <td>${p.idPelicula}</td>
            <td>${p.titulo}</td>
            <td>${p.duracion}</td>
            <td>${p.sinopsis}</td>
            <td>
            <c:forEach var="pel" items="${p.generoList}">
            ${pel.nombre}
            </c:forEach>
                </td>
              <td>${p.anioLanzamiento}</td>
              <td><center><img src="${ruta}/${p.imagen}"   style="width: 100%; height: 100%; border-radius: 10px;" alt="imagen"></center>  </td>
            
    
    
      <td>
          <a class="editar btn btn-primary" href="frmEditPeliculas?id=${p.idPelicula}" >Editar</a>
          <a class="btn btn-danger" href="EliminarPeliculas?id=${p.idPelicula}" >Eliminar</a>
      </td>
     
      </tr>
      </c:forEach>
        
        </tbody>
        <tfoot>
            <tr>
              <th>#</th>
     <th>Titulo</th>
      <th>Duración</th>
        <th>Sinopsis</th>
        <th>Generos</th>
      <th>Lanzamiento</th>
      <th>Imagen</th>
          <th>Opciones</th>
            </tr>
        </tfoot>
    </table>
  
    