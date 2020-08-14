
<%-- 
    Document   : frmPeliculas
    Created on : 11/08/2020, 01:48:13 PM
    Author     : aljad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>
        <c:if test="${action == 'EditPelicula'}">
      Editar película
        </c:if>
       <c:if test="${action == 'RegistroPeliculas'}">
      Registro película
        </c:if>
      
      </title>
        
   
    </head>
    <div class="container">
        <div class="jumbotron">
            <form name="frmAdministrador" action="${action}"
                  method="post" enctype="multipart/form-data"
                  >
            <h1 style="text-align: center; color: #000000;">
                 <c:if test="${action == 'EditPelicula'}">
      Editar
        </c:if>
       <c:if test="${action == 'RegistroPeliculas'}">
      Registro 
        </c:if>
            </h1>
                
             <hr>
             
             <input type="hidden" name="id" value="${editPeli.idPelicula}" >
            <div class="row">
                <div class="col-md-4">
                    <h3 style="color: #000000;">Titulo:</h3>
                    <input class="form-control" type="text" name="titulo" value="${editPeli.titulo}">
                </div>
                   <div class="col-md-4">
                    <h3 style="color: #000000;">Duración</h3>
                    <input class="form-control" type="text" name="duracion" value="${editPeli.duracion}">
                </div>
                 <div class="col-md-4">
                    <h3 style="color: #000000;">Sinopsis</h3>
                    <input class="form-control" type="text" name="sinopsis" value="${editPeli.sinopsis}">
                </div>
                
            </div>
         
         
         
         <fmt:parseDate pattern="yyyy-MM-dd" value="${editPeli.anioLanzamiento}" var="parsedDate" />
         <fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" var="stringDate"/>
         
         <br>
             <div class="row">
                <div class="col-md-6">
                    <h3 style="color: #000000;">Lanzamiento: </h3>
                    <input class="form-control" type="date" name="lanzamiento" value="<c:out value="${stringDate}"/>">
                </div>
                   
                
               
                 
                
                       <div class="col-md-6">
                         <h3 style="color: #000000;">Generos: </h3>
                              <select name="genero" multiple="" class="form-control" >
                            <c:forEach var="generos" items="${generos}">
                                 <option value="${generos.idGenero}"
                                         
                                         <c:forEach var="p" items="${editPeli.generoList}">
                                             <c:if test="${p.nombre==generos.nombre}">
                                                 selected
                                             </c:if>
                                        
                                          </c:forEach>>${generos.nombre}  </option>
                            </c:forEach>
                           
                            
                        </select>
                    </div>  
              
                
            </div>
                   
                         <div class="row">
                             <c:if test="${action == 'RegistroPeliculas'}">
                <div class="col-md-12">
                       </c:if>
                    <c:if test="${action == 'EditPelicula'}">
                <div class="col-md-6">
                       </c:if>
                       <center><h3 style="color: #000000;">Imagen nueva:</h3></center>
                    
                    <div id="nImg" class="" style="display:none;">
                        <center><img id="nImgPreview" class="img-responsive" src="" style="width: 50%; border-radius: 10px;"></center>
                
            </div>
                    <center><label class="btn btn-primary" id="imagenSelect" for="imagen">Imagen <span class="fa fa-upload"></span></label></center>
            <input class="inputFile"  style="display: none;" type="file" id="imagen"  name="imagen"  accept="image/*"  onchange="imgInfo(this.value)" >
                  
                    
                   
                
                </div>
           
                
                  <hr>
                
                    
                     <c:if test="${action == 'EditPelicula'}">
                  <div class="col-md-6">
                     
                       <h3 style="color: #000000;">Imagen anterior:</h3>
                    <img src="${ruta}/${editPeli.imagen}"   style="width: 50%; border-radius: 10px;" alt="imagen">
                    
                    </div>
                    
                      </c:if>
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
                    
    <script src="recursos/funciones/funciones.js"></script>
   
 
    
  