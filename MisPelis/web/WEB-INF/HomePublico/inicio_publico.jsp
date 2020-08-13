<%-- 
    Document   : inicio
    Created on : 31-jul-2020, 19:29:31
    Author     : cecio
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- banner -->
	<div id="slidey" style="display:none;">
		<ul>
			<li><img src="imagenes/Peliculas/elexorcista.gif" alt=" "><p class='title'>El exorcista</p><p class='description'>Una actriz llama a unos sacerdotes jesuitas para que intenten terminar con la posesión demoníaca de su hija de 12 años.</p></li>
			<li><img src="imagenes/Peliculas/nosotros.gif" alt=" "><p class='title'>Nosotros</p><p class='description'>Adelaide y su esposo viajan a la casa en la que ella creció junto a la playa. Tiene un presentimiento siniestro que precede a un encuentro espeluznante: cuatro enmascarados se presentan ante su casa. Lo aterrador viene cuando muestran sus rostros.</p></li>
			<li><img src="imagenes/Peliculas/ei.gif" alt=" "><p class='title'>Joker</p><p class='description'>Arthur Fleck adora hacer reír a la gente, pero su carrera como comediante es un fracaso. El repudio social, la marginación y una serie de trágicos acontecimientos lo conducen por el sendero de la locura y, finalmente, cae en el mundo del crimen.</p></li>
			<li><img src="imagenes/Peliculas/laotramissy.gif" alt=" "><p class='title'>La otra missy</p><p class='description'>Tras un intensa relación virtual, un joven decide invitar a la chica de sus sueños a una isla paradisíaca. Sin embargo, cuando se encuentran en persona, ambos se dan cuenta del error que han cometido.</p></li>
			<li><img src="imagenes/Peliculas/tequieroimbecil.gif" alt=" "><p class='title'>Te quiero imbecil</p><p class='description'>Contamos cómo una nueva generación de hombres de 30 años se sienten perdidos frente al nuevo rol de la mujer y al suyo propio. En realidad, la sociedad ha cambiado y, con ella, las relaciones. El "machote" ya no está de moda y hay que adaptarse a los nuevos referentes masculinos. Marcos, intentará convertirse en un hombre actual de los que se depila y se interesa por la moda</p></li>
			<li><img src="imagenes/Peliculas/conjuro.gif" alt=" "><p class='title'>El conjuro 3</p><p class='description'>“The Conjuring: The Devil Made Me Do It”  revela una escalofriante historia de terror, asesinatos y una desconocida y malvada entidad que incluso sorprendió a los experimentados investigadores de lo paranorlal Lorraine y Ed Warren. Uno de los casos más sensacionales de los archivos de los Warren, comienza por la batalla por el alma de un pequeño niño y después los leva más allá de todo lo que han vivido antes, tanto que , por primera vez en la historia de Estados Unidos, un sospechoso de asesinato se declara inocente, por posesión demoníaca.</p></li>
		</ul>   	
    </div>
    <script src="recursos/js/jquery.slidey.js"></script>
    <script src="recursos/js/jquery.dotdotdot.min.js"></script>
	   <script type="text/javascript">
			$("#slidey").slidey({
				interval: 8000,
				listCount: 5,
				autoplay: false,
				showList: true
			});
			$(".slidey-list-description").dotdotdot();
		</script>
<!-- //banner -->
<!-- banner-bottom -->
	<div class="banner-bottom">
		<div class="container">
			<div class="w3_agile_banner_bottom_grid">
				<div id="owl-demo" class="owl-carousel owl-theme">
                                    <c:forEach var="p" items="${peliculaList}">
                                        <div class="item">
						<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
							<a href="PeliculaDetalle__Publico?id=${p.idPelicula}" class="hvr-shutter-out-horizontal"><img src="imagenes/Peliculas/${p.imagen}" title="album-name" width="180" height="283"/>
								<div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
							</a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6><a href="PeliculaDetalle__Publico?id=${p.idPelicula}">${p.titulo}</a></h6>							
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>${p.anioLanzamiento}</p>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</div>
                                    </c:forEach>
				</div>
			</div>			
		</div>
	</div>

        <div class="Latest-tv-series">
            <h4 class="latest-text w3_latest_text w3_home_popular">RECOMENDACIONES</h4>
		<div class="container">
			<section class="slider">
                            <div class="flexslider">
				<ul class="slides">
                                    <c:forEach var="pr" items="${peliculaRecomendacion}">
                                    <li>
                                    <div class="agile_tv_series_grid">
					<div class="col-md-6 agile_tv_series_grid_left">
                                            <div class="w3ls_market_video_grid1">
                                                <img src="imagenes/Peliculas/${pr.idPelicula.imagen}"  width="320" height="340" />
                                                    <a class="w3_play_icon" href="#small-dialog">
							<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
                                                    </a>
                                            </div>
					</div>
                                       <div class="col-md-6 agile_tv_series_grid_right">
                                           <h4><p class="fexi_header">${pr.idPelicula.titulo}</p></h4>

                                                            <p class="fexi_header_para"><span>Sinopsis <label>:</label></span> ${pr.idPelicula.sinopsis} </p>
                                                            
                                                            <p class="fexi_header_para"><span>Año<label>:</label></span> ${pr.idPelicula.anioLanzamiento} </p>
                                                            
                                                            <p class="fexi_header_para"><span>Genero<label>:</label></span>
                                                                <c:forEach var="pg" items="${pr.idPelicula.generoList}">
                                                                    <a href="Generos_Publico?id=${pg.idGenero}">${pg.nombre}</a> |
                                                                </c:forEach>
                                                            </p>
                                        </div>		
                                        <div class="clearfix"> </div>
                                    </div>            
                                    </li>
                                    </c:forEach>
				</ul>
				</div>
			</section>
			<!-- flexSlider -->
                            <link rel="stylesheet" href="recursos/css/flexslider.css" type="text/css" media="screen" property="" />
                            <script defer src="recursos/js/jquery.flexslider.js"></script>
                            <script type="text/javascript">
				$(window).load(function(){
				  $('.flexslider').flexslider({
					animation: "slide",
					start: function(slider){
					  $('body').removeClass('loading');
					}
				  });
				});
                            </script>
			<!-- //flexSlider -->
		</div>
	</div>


<!-- general -->
	<div class="general">
		<h4 class="latest-text w3_latest_text">PELÍCULAS DESTACADAS</h4>
		<div class="container">
			<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
				<ul id="myTab" class="nav nav-tabs" role="tablist">
					
				</ul>
				<div id="myTabContent" class="tab-content">
                                    <!-- DESTACADAS -->
					<div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
                                        <c:forEach var="pD" items="${peliculaDestacada}">
                                                <div class="col-md-2 w3l-movie-gride-agile">
							<a href="PeliculaDetalle__Publico?id=${pD.idPelicula}" class="hvr-shutter-out-horizontal"><img src="imagenes/Peliculas/${pD.imagen}" title="album-name" width="180" height="283" />
								<div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
							</a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6><a href="PeliculaDetalle__Publico?id=${pD.idPelicula}">${pD.titulo}</a></h6>							
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
<!-- //general -->
<!-- Latest-tv-series -->
	<div class="Latest-tv-series">
		<h4 class="latest-text w3_latest_text w3_home_popular">PELÍCULAS MÁS POPULARES</h4>
		<div class="container">
			<section class="slider">
				<div class="flexslider">
					<ul class="slides">
						<li>
                                                    <div class="agile_tv_series_grid">
							
							<div class="agileinfo_flexislider_grids">
                                                            
                                                            <c:forEach var="pp" items="${peliculasPopulares}">
                                                            <div class="col-md-2 w3l-movie-gride-agile">
								<a href="PeliculaDetalle__Publico?id=${pp.idPelicula.idPelicula}" class="hvr-shutter-out-horizontal"><img src="imagenes/Peliculas/${pp.idPelicula.imagen}" title="album-name" width="180" height="283" />
                                                                    <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
								</a>
								<div class="mid-1 agileits_w3layouts_mid_1_home">
                                                                    <div class="w3l-movie-text">
									<h6><a href="PeliculaDetalle__Publico?id=${pp.idPelicula.idPelicula}">${pp.idPelicula.titulo}</a></h6>							
                                                                    </div>
                                                                    <div class="mid-2 agile_mid_2_home">
									<p>Calificación: ${pp.calificacion}</p>
                                                                    <div>
                                                                        <ul class="w3l-ratings">
                                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                                        </ul>
                                                                    </div>
                                                                        <div class="clearfix"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            </c:forEach>
                                                            
                                                           
							<div class="clearfix"> </div>
							</div>
                                                    </div>
                                                   
						</li>
					</ul>
				</div>
			</section>
		</div>
	</div>
