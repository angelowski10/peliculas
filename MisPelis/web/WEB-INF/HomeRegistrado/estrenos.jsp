<%-- 
    Document   : news
    Created on : 31-jul-2020, 20:52:23
    Author     : cecio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- faq-banner -->
<div class="single-page-agile-main">
<div class="container">
		<!-- /w3l-medile-movies-grids -->
			<div class="agileits-single-top">
				<ol class="breadcrumb">
				  <li><a href="Home_Registrado">Home</a></li>
				  <li class="active">Detalle película</li>
				</ol>
			</div>
                <div class="general">
		<h4 class="latest-text w3_latest_text">ESTRENOS DE ESTE AÑO</h4>
		<div class="container">
			<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
				<div id="myTabContent" class="tab-content">
                                    <!-- DESTACADAS -->
					<div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
                                        <c:forEach var="pn" items="${peliculaNueva}">
                                                <div class="col-md-2 w3l-movie-gride-agile">
							<a href="PeliculaDetalle_Registrado?id=${pn.idPelicula}" class="hvr-shutter-out-horizontal"><img src="imagenes/peliculas/${pn.imagen}" title="album-name" width="180" height="283" />
								<div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
							</a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6><a href="PeliculaDetalle_Registrado?id=${pn.idPelicula}">${p.titulo}</a></h6>							
								</div>
								
							</div>
							<div class="ribben">
								<p>NEW</p>
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
						</div>
					</div>
					
					<div class="clearfix"> </div>
				