<%-- 
    Document   : generos
    Created on : Aug 13, 2020, 1:49:25 PM
    Author     : Luis Angel
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">/Generos</h1>
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
          
            <div class="col-md-12 grid-margin strech-card">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">
                            <div class="col-md-12">
                                <div class="row">
                                <div class="col-md-9 theeme-grid-col">
                                   
                                   Editar / Generos      
                                   
                                   
                                </div>
                                <div class="col-md-3 theeme-grid-col">
                                   
                                   
                                    <input type="text" 
                                   value="Total de registros : ${total}" readonly=""
                                   class="form-control form-control-sm"
                                   >      
                                    </div>
                              
                                    
                                </div>
                                     
                            </div>
                                    
                                
                           
                            
                           
                                   
                          
                        </div>
                        <div class="col-md-12 strech-card">
                            <div class="espacio-boton-table">
                                
                            
                                <div class="table-responsive jsgrid-grid-body" style="height: 200px;" >
                                
                             
                        <table class="table">
                            <thead>
                                <tr>
                                    <th> </th>
                                    <th>Código</th>
                                    <th>Genero</th>
                                    <th>Modalidad</th>
                                </tr>
                            </thead>
                           
                            <tbody>
                       <c:forEach var="t" items="${generos}" >      
                               
                                <tr>
                                    <td>
                                        <div class="dropdown">
                                            <button class="btn btn-secondary dropdown-toggle btn-sm"
                                                     type="button" id="dropdown1" data-toggle="dropdown"
                                            aria-haspopup="true" aria-expanded="false">
                                           Opciones     
                                           </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <a class="dropdown-item" href="editGenero?id=${t.idGenero}"> Modificar </a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item"  href="deleteGenero?id=${t.idGenero}"> Eliminar </a>
                                                <input type="hidden" value="${t.idGenero}" class="idGenero">
                                          
                                            </div>
                                        </div>
                                    </td>
                                    <td>${t.idGenero}</td>
                                    <td>${t.nombre}</td>
                                    <td>Activada</td>
                                      <td> 
                                      
                                 
                                      </td>  
                                </tr>
                                  </c:forEach>
                               
                             
                            </tbody>
                        </table>
                                 </div>  
                        </div>
</div>
                    
                    
                    
                    </div>
                </div>
            </div>
                                   <br />
                                   
                                   <h2>Agregar genero</h2>
                                   <form method="post" action="NuevoAdminGenero">
                                       
                                       <input type="text"
                                              value="" name="txtGenero" />
                                       
                                       <button type="submit">
                                           
                                           Guardar
                                           
                                       </button>
                                       
                                   </form>

          

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

</html>

