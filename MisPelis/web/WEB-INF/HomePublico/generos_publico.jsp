<%-- 
    Document   : generos
    Created on : 31-jul-2020, 20:59:59
    Author     : cecio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- /w3l-medile-movies-grids -->
	<div class="general-agileits-w3l">
		<div class="w3l-medile-movies-grids">

				<!-- /movie-browse-agile -->
				
				      <div class="movie-browse-agile">
					     <!--/browse-agile-w3ls -->
						<div class="browse-agile-w3ls general-w3ls">
								<div class="tittle-head">
									<h4 class="latest-text">Generos</h4>
									<div class="container">
										<div class="agileits-single-top">
											<ol class="breadcrumb">
											  <li><a href="Home_Publico">Home</a></li>
											  <li class="active">Generos</li>
											</ol>
										</div>
									</div>
								</div>
                                                            <div class="general">
		
                                                                <div class="container">
                                                                        <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                                                                                <div id="myTabContent" class="tab-content">
                                                                                    <!-- DESTACADAS -->
                                                                                        <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
                                                                                        <c:forEach var="p" items="${peliculas}">
                                                                                                <div class="col-md-2 w3l-movie-gride-agile">
                                                                                                        <a href="PeliculaDetalle__Publico?id=${p.idPelicula}" class="hvr-shutter-out-horizontal"><img src="imagenes/peliculas/${p.imagen}" title="album-name" width="180" height="283" />
                                                                                                                <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
                                                                                                        </a>
                                                                                                        <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                                                                                <div class="w3l-movie-text">
                                                                                                                        <h6><a href="PeliculaDetalle__Publico?id=${p.idPelicula}">${p.titulo}</a></h6>							
                                                                                                                </div>

                                                                                                        </div>

                                                                                                </div>
                                                                                        </c:forEach>
                                                                                        <div class="clearfix"> </div>
                                                                                        </div>
                                                                                </div>     
                                                                        </div>
                                                                </div>
                                                        </div>
						</div>
				<!--//browse-agile-w3ls -->
						<!--div class="blog-pagenat-wthree">
							<ul>
								<li><a class="frist" href="#">Prev</a></li>
								<li><a href="#">1</a></li>
								<li><a class="last" href="#">Next</a></li>
							</ul>
						</div-->
					</div>
				
		</div>
	<!-- //w3l-medile-movies-grids -->
	</div>
	<!-- //comedy-w3l-agileits -->
