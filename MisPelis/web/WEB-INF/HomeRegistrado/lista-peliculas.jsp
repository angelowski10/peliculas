<%-- 
    Document   : list
    Created on : 31-jul-2020, 20:47:25
    Author     : cecio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- faq-banner -->
	<div class="faq">
		<h4 class="latest-text w3_faq_latest_text w3_latest_text">Lista de Películas</h4>
			<div class="container">
				<div class="agileits-news-top">
					<ol class="breadcrumb">
					  <li><a href="Home_Registrado">Home</a></li>
					  <li class="active">Lista</li>
					</ol>
				</div>
				<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
						<ul id="myTab" class="nav nav-tabs" role="tablist">
							<li role="presentation"><a href="ListaPeliculaRegistrado" role="tab" id="b-tab" aria-controls="home" aria-expanded="true">Todo</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=a">A</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=b" role="tab" id="b-tab" aria-controls="b">B</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=c" role="tab" id="c-tab" aria-controls="c">C</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=d" role="tab" id="d-tab" aria-controls="d">D</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=e" role="tab" id="e-tab" aria-controls="e">E</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=f" role="tab" id="f-tab" aria-controls="f">F</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=g" role="tab" id="g-tab" aria-controls="g">G</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=h" role="tab" id="h-tab" aria-controls="h">H</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=i" role="tab" id="i-tab" aria-controls="i">I</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=j" role="tab" id="j-tab" aria-controls="j">J</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=k" role="tab" id="k-tab" aria-controls="k">K</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=l" role="tab" id="l-tab" aria-controls="l">L</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=m" role="tab" id="m-tab" aria-controls="m">M</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=n" role="tab" id="n-tab" aria-controls="n">N</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=o" role="tab" id="o-tab" aria-controls="o">O</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=p" role="tab" id="p-tab" aria-controls="p">P</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=q" role="tab" id="q-tab" aria-controls="q">Q</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=r" role="tab" id="r-tab" aria-controls="r">R</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=s" role="tab" id="s-tab" aria-controls="s">S</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=t" role="tab" id="t-tab" aria-controls="t">T</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=u" role="tab" id="u-tab" aria-controls="u">U</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=v" role="tab" id="v-tab" aria-controls="v">V</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=w" role="tab" id="w-tab" aria-controls="w">W</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=x" role="tab" id="x-tab" aria-controls="x">X</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=y" role="tab" id="y-tab" aria-controls="y">Y</a></li>
							<li role="presentation"><a href=" MostrarLista_Registrado?letra=z" role="tab" id="z-tab" aria-controls="z">Z</a></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
								<div class="agile-news-table">
									<table class="table">
										<thead>
										  <tr>
                                                                                        <th>Pelicula</th>
                                                                                        <th>Titulo</th>
											<th>Año</th>
											<th>Duración</th>
											<th>Generos</th>
										  </tr>
										</thead>
										<tbody>
                                                                                  <c:forEach var="p" items="${peliculaList}">
                                                                                      <tr>
                                                                                          <td><a href="PeliculaDetalle_Registrado?id=${p.idPelicula}"/><img src="imagenes/peliculas/${p.imagen}" width="100" height="100 " /></td>
                                                                                          <td><a href="PeliculaDetalle_Registrado?id=${p.idPelicula}"/> ${p.titulo} </td>
											<td>${p.anioLanzamiento}</td>
											<td>${p.duracion}</td>
                                                                                        
											<td>
                                                                                            <c:forEach var="g" items="${p.generoList}">
                                                                                            <a href="Generos_Registrado">${g.nombre}</a> |
                                                                                            </c:forEach>
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
<!-- //faq-banner -->
