<%-- 
    Document   : generos
    Created on : Aug 13, 2020, 1:49:25 PM
    Author     : Luis Angel
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">/Pelicula</h1>
        </div>
        <!-- Content Row -->
        <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total Películas</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">400</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-film fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total Usuarios</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">215</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-users fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Total Categorías</div>
                                <div class="row no-gutters align-items-center">
                                    <div class="col-auto">
                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-bookmark fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Comentarios</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-comments fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <br />




    </div>
    <!-- /.container-fluid -->

    <!-- codigo de peliculas -->

    <div class="col-md-12 grid-margin strech-card">
        <div class="card">
            <div class="card-body">
                <div class="card-title">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-9 theeme-grid-col">

                                <a href="CtrlAdministrador">Inicio</a> / Peliculas      


                            </div>
                        </div>   
                    </div>       
                </div>
                <div class="col-md-12 strech-card">
                    <div class="col-md-12">
                        <div class="row">
                            <label style="color: #000000;"><b>Agregar nueva pelicula</b></label>
                        </div>
                        <br>
                        <form method="post" action="AdminEditPelicula" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Titulo</label>
                                        <br>
                                        <input type="text" name="titulo"
                                               value="${editPeli.titulo}" placeholder="Titulo"
                                               placeholder="" id="" required=""/>

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Duracion</label>
                                        <br>
                                        <input type="text" name="duracion"
                                               value="${editPeli.duracion}" placeholder="Duracion"
                                               placeholder="" id="" required=""/>

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Año de Lanzamiento</label>
                                        <br>
                                        <fmt:parseDate pattern="yyyy-MM-dd" value="${editPeli.anioLanzamiento}" var="parsedDate" />
                                        <fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" var="stringDate"/>

                                    </div>  
                                </div>    

                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <center><label>Generos</label></center>
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

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <center><label> Sinopsis </label></center>
                                        <br>
                                        <!-- <input type="text" name="sinopsis"
                                               value="" placeholder="Sinopsis"
                                               placeholder="" id="" required=""/>-->
                                        <textarea name="sinopsis" 
                                                  placeholder="Sinopsis de la pelicula"
                                                  cols="50"
                                                  rows="4"
                                                  >
                                            ${editPeli.sinopsis}
                                        </textarea>

                                    </div>

                                </div>

                            </div>
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <center><label>+ Cargar Pelicula</label></center>
                                        <br>
                                        <div id="nImg" class="" style="display:none;">
                                            <center><img id="nImgPreview" class="img-responsive" src="" style="width: 50%; border-radius: 10px;"></center>

                                        </div>
                                        <center><label class="btn btn-primary" id="imagenSelect" for="imagen">Imagen <span class="fa fa-upload"></span></label></center>
                                        <input class="inputFile"  style="display: none;" type="file" id="imagen"  name="imagen"  accept="image/*"  onchange="imgInfo(this.value)" >

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">

                                        <h3 style="color: #000000;">Imagen anterior:</h3>
                                        <img src="${ruta}/${editPeli.imagen}"   style="width: 50%; border-radius: 10px;" alt="imagen">

                                    </div>
                                </div>
                            </div>
                            <br>


                            <div class="col-md-4">
                                <center><label>Imagen</label></center>
                                <div class="form-group">
                                    <button type="submit" 
                                            class="btn btn-success">Guardar</button>

                                </div>
                            </div>


                        </form>


                    </div>



                </div>
            </div>
        </div>


    </div>
    <!-- End of Main Content -->

</html>

