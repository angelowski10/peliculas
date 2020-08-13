<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Pelis plus</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="One Movies Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="recursos/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="recursos/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="recursos/css/contactstyle.css" type="text/css" media="all" />
<link rel="stylesheet" href="recursos/css/faqstyle.css" type="text/css" media="all" />
<link href="recursos/css/single.css" rel='stylesheet' type='text/css' />
<link href="recursos/css/medile.css" rel='stylesheet' type='text/css' />
<!-- news-css -->
<link rel="stylesheet" href="recursos/news-css/news.css" type="text/css" media="all" />
<!-- //news-css -->
<!-- list-css -->
<link rel="stylesheet" href="recursos/list-css/list.css" type="text/css" media="all" />
<!-- //list-css -->
<!-- banner-slider -->
<link href="recursos/css/jquery.slidey.min.css" rel="stylesheet">
<!-- //banner-slider -->
<!-- pop-up -->
<link href="recursos/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
<!-- //pop-up -->
<!-- font-awesome icons -->
<link rel="stylesheet" href="recursos/css/font-awesome.min.css" />
<!-- //font-awesome icons -->
<!-- js -->
<script type="text/javascript" src="recursos/js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- banner-bottom-plugin -->
<link href="recursos/css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
<script src="recursos/js/owl.carousel.js"></script>
<script>
	$(document).ready(function() { 
		$("#owl-demo").owlCarousel({
	 
		  autoPlay: 3000, //Set AutoPlay to 3 seconds
	 
		  items : 5,
		  itemsDesktop : [640,4],
		  itemsDesktopSmall : [414,3]
	 
		});
	 
	}); 
</script> 
<!-- //banner-bottom-plugin -->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="recursos/js/move-top.js"></script>
<script type="text/javascript" src="recursos/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
</head>
	
<body>
<!-- header -->
	<div class="header">
		<div class="container">
			<div class="w3layouts_logo">
				<a href="Home_Publico"><h1>Pelis<span>Plus</span></h1></a>
			</div>
			<div class="w3_search">
				<form action="Buscar" method="get">
					<input type="text" name="Search" placeholder="Buscar..." required="" autocomplete="off">
					<input type="submit" value="Buscar">
				</form>
			</div>
			<div class="w3l_sign_in_register">
				<ul>
					<!--li><i class="fa fa-phone" aria-hidden="true"></i> (+000) 123 345 653</li-->
					<li><a href="#" data-toggle="modal" data-target="#myModal">Login</a></li>
				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //header -->
<!-- bootstrap-pop-up -->
	<div class="modal video-modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					Sign In & Sign Up
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
				</div>
				<section>
					<div class="modal-body">
						<div class="w3_login_module">
							<div class="module form-module">
							  <div class="toggle"><i class="fa fa-times fa-pencil"></i>
								<div class="tooltip">Click Me</div>
							  </div>
							  <div class="form">
								<h3>Login to your account</h3>
								<form action="autenticar" method="post">
                                                                    <input type="text" name="Username" placeholder="Nombre de Usuario" required="" autocomplete="off">
                                                                    <input type="password" name="Password" placeholder="Password" required="" autocomplete="off">
								  <input type="submit" value="Login">
								</form>
							  </div>
							  <div class="form">
								<h3>Crear cuenta</h3>
								<form action="Registro" method="post">
                                                                    <input type="text" name="username" placeholder="Nombre de usuario" required="" autocomplete="off">
								  <input type="password" name="password" placeholder="Password" required="" autocomplete="off">
								  <input type="email" name="email" placeholder="Correo" required="" autocomplete="off">
                                                                  <input type="text" name="nombre" placeholder="Nombre" required="" autocomplete="off">
                                                                  <input type="text" name="apellido" placeholder="Apellido" required="" autocomplete="off">
								  <input type="submit" value="Register">
								</form>
							  </div>
							  <!--div class="cta"><a href="#">Forgot your password?</a></div-->
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<script>
		$('.toggle').click(function(){
		  // Switches the Icon
		  $(this).children('i').toggleClass('fa-pencil');
		  // Switches the forms  
		  $('.form').animate({
			height: "toggle",
			'padding-top': 'toggle',
			'padding-bottom': 'toggle',
			opacity: "toggle"
		  }, "slow");
		});
	</script>
<!-- //bootstrap-pop-up -->
<!-- nav -->
	<div class="movies_nav">
		<div class="container">
			<nav class="navbar navbar-default">
				<div class="navbar-header navbar-left">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
					<nav>
						<ul class="nav navbar-nav">
							<li class="active"><a href="Home_Publico">Home</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Generos <b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-3">
									<li>
									<div class="col-sm-4">
										<ul class="multi-column-dropdown">
                                                                                    <c:forEach var="g" items="${generoList}">
                                                                                        <li><a href="Generos_Publico?id=${g.idGenero}">${g.nombre}</a></li>
                                                                                    </c:forEach>
                                                                                </ul>
									</div>
									<div class="clearfix"></div>
									</li>
								</ul>
							</li>	
                                                        <li><a href="ListaEstrenos_Publico">Estrenos</a></li>
                                                        <li><a href="ListaPelicula_Publico">A - z lista</a></li>
						</ul>
					</nav>
				</div>
			</nav>	
		</div>
	</div>
<!-- //nav -->
