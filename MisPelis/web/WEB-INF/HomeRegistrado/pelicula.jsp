<%-- 
    Document   : single
    Created on : 31-jul-2020, 20:37:03
    Author     : cecio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="single-page-agile-main">
<div class="container">
		<!-- /w3l-medile-movies-grids -->
			<div class="agileits-single-top">
				<ol class="breadcrumb">
				  <li><a href="HomeRegistrado">Home</a></li>
				  <li class="active">Detalle película</li>
				</ol>
			</div>
			<div class="single-page-agile-info">
                   <!-- /movie-browse-agile -->
                           <div class="show-top-grids-w3lagile">
				<div class="col-sm-8 single-left">
					<div class="song">
						<div class="song-info">
                                                   <h3>${pelicula.titulo}</h3>
                                                </div>
						<div class="video-grid-single-page-agileits">
                                                    <div data-video="dLmKio67pVQ" id="video"> 
                                                       <img src="imagenes/peliculas/cargando.gif" width="150" height="580" />
                                                    </div>
						</div>
					</div>
					
					<div class="clearfix"> </div>

					<div class="all-comments">
						<div class="all-comments-info">
							<a href="#">Comentarios</a>
							<div class="agile-info-wthree-box">
								<form action="AgregarComentario" method="post">
                                                                    <input type="text" value="${pelicula.idPelicula}" hidden="" name="pelicula"/>			 
                                                                    <textarea placeholder="Comentarios" required="" name="comentario"></textarea>
                                                                    <input type="number" placeholder="Calificacion" required="" name="calificacion"/>
                                                                        <br>
                                                                        <br>
                                                                        <input type="submit" value="Enviar">
									<div class="clearfix"> </div>
								</form>
							</div>
						</div>
						<div class="media-grids">
                                                    <c:forEach var="c" items="${pelicula.comentarioList}">
							<div class="media">
								<h5>${c.idUsuario.nomUsuario}</h5>
								<div class="media-left">
									<a href="#">
										<img src="imagenes/user.jpg" title="One movies" alt=" " />
									</a>
								</div>
								<div class="media-body">
                                                                    <p>${c.comentario}</p>
                                                                        <span>Correo :<a href="#"> ${c.idUsuario.correo} </a></span>
								</div>
							</div>
                                                    </c:forEach>
						</div>
					</div>
                                        
				</div>
                                                    <div class="col-md-4 single-right">
					<h3>Sinopsis :</h3><h5>${pelicula.sinopsis}</h5>
                                        <br>
                                        <h3>Duración :</h3><h5>${pelicula.duracion}</h5>
                                        <br>
                                        <h3>Genero:</h3>
                                        <c:forEach var="g" items="${pelicula.generoList}">
                                        ${g.nombre} |
                                        </c:forEach>
				</div>
                                 <div class="clearfix"> </div>                 
			</div>
				<!-- //movie-browse-agile -->
				<!--body wrapper start-->
			<div class="w3_agile_banner_bottom_grid">
				<div id="owl-demo" class="owl-carousel owl-theme">
                                    <c:forEach var="pr" items="${peliculaRecomendacion}">
					<div class="item">
						<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
                                                    <a href="PeliculaDetalle_Registrado?id=${pr.idPelicula.idPelicula}" class="hvr-shutter-out-horizontal"><img src="imagenes/peliculas/${pr.idPelicula.imagen}" title="album-name" width="180" height="283" />
								<div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
							</a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6><a href="PeliculaDetalle_Registrado?id=${pr.idPelicula.idPelicula}">${pr.idPelicula.titulo}</a></h6>							
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>${pr.idPelicula.anioLanzamiento}  |  Puntuación: ${pr.calificacion}</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
                                                        </div>
						</div>
					</div>
                                    </c:forEach>
				</div>
			</div>
		<!--body wrapper end-->
						
							 
				</div>
				<!-- //w3l-latest-movies-grids -->
			</div>	
		</div>
	<!-- //w3l-medile-movies-grids -->
	