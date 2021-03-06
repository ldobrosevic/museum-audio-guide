<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->

<head>
<!-- BASICS -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>AppTownFunk ludi muzej</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="css/isotope.css"
	media="screen" />
<link rel="stylesheet" href="js/fancybox/jquery.fancybox.css"
	type="text/css" media="screen" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrap-theme.css" />
<link href="css/responsive-slider.css" rel="stylesheet" />
<link rel="stylesheet" href="css/animate.css" />
<link rel="stylesheet" href="css/style.css" />

<link rel="stylesheet" href="css/font-awesome.min.css" />
<!-- skin -->
<link rel="stylesheet" href="skin/default.css" />

<!-- <link rel="stylesheet" href="../static/bootstrap.css"  /> -->
</head>

<body>

	
	<div class="header">
		<section id="header" class="appear">

			<div class="navbar navbar-fixed-top" role="navigation"
				data-0="line-height:100px; height:100px; 
		background-color:rgba(0,0,0,0.3);"
				data-300="line-height:60px; height:60px; background-color:rgba(0,0,0,1);">

				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="fa fa-bars color-white"></span>
					</button>
					<h1>
						<a class="navbar-brand" href="/" data-0="line-height:90px;"
							data-300="line-height:50px;"> Muzej muzeja </a>
					</h1>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav" data-0="margin-top:20px;"
						data-300="margin-top:5px;">
						<li><a href="#izlozbe">Izlo??be</a></li>
						<li><a href="#audio">Audio</a></li>
						<li><a href="#omuzeju">O muzeju</a></li>
						<li><a href="#shop">Shop</a></li>

						<li><a href="#myModal" data-toggle="modal"
							data-target="#login-modal">Login</a></li>
					</ul>
				</div>
				<!--/.navbar-collapse -->
			</div>


		</section>
	</div>


	<div class="slider">
		<div id="about-slider">
			<div id="carousel-slider" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators visible-xs">
					<li data-target="#carousel-slider" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-slider" data-slide-to="1"></li>
					<li data-target="#carousel-slider" data-slide-to="2"></li>
				</ol>

				<div class="carousel-inner">
					<div class="item active">
						<img src="img/1.jpg" class="img-responsive" alt="" />
						<div class="carousel-caption">
							<div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="0s">
								<h2>
									<span>Mladi T-rexovi</span>
								</h2>
							</div>
							<div class="col-md-10 col-md-offset-1">
								<div class="wow fadeInUp" data-wow-offset="0"
									data-wow-delay="0.3s">
									<p>Pogledajte izlo??bu najboljih dinosaura</p>
								</div>
							</div>
							<div class="wow fadeInUp" data-wow-offset="0"
								data-wow-delay="0.6s">
								<form class="form-inline">
									<div class="form-group">
										<button type="getnow" name="Get Now"
											class="btn btn-primary btn-lg" required="required">Kupite
											ulaznice</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<div class="item">
						<img src="img/2.jpg" class="img-responsive" alt="" />
						<div class="carousel-caption">
							<div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="0s">
								<h2>Vodeni autobusi</h2>
							</div>
							<div class="col-md-10 col-md-offset-1">
								<div class="wow fadeInUp" data-wow-offset="0"
									data-wow-delay="0.3s">
									<p>Do??ivite najrealisti??niju plovidbu na suhome</p>
								</div>
							</div>
							<div class="wow fadeInUp" data-wow-offset="0"
								data-wow-delay="0.6s">
								<form class="form-inline">
									<div class="form-group">
										<button type="getnow" name="subscribe"
											class="btn btn-primary btn-lg" required="required">Kupite
											ulaznice</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<a class="left carousel-control hidden-xs" href="#carousel-slider"
					data-slide="prev"> <i class="fa fa-angle-left"></i>
				</a> <a class=" right carousel-control hidden-xs"
					href="#carousel-slider" data-slide="next"> <i
					class="fa fa-angle-right"></i>
				</a>
			</div>
			<!--/#carousel-slider-->
		</div>
		<!--/#about-slider-->
	</div>
	<!--/#slider-->

	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">

			<div class="loginmodal-container">
				<h1>Login to Your Account</h1>
				<br>
				<form role="form" data-toggle="validator" id="login-form"
					action="${pageContext.request.contextPath}/" method="post">
					<p>
						<%
							if (null != request.getAttribute("errorMessage")) {
								out.println(request.getAttribute("errorMessage"));
							}
						%>
					</p>
					<input type="text" name="user" placeholder="Username"> 
					<input type="password" name="pass" placeholder="Password"> 
					<input id="login" type="submit" name="login" class="login loginmodal-submit" value="Login">
					
				</form>
				<div class="login-help">
					<a href="${pageContext.request.contextPath}/registration">Register</a> - <a href="#">Forgot Password</a>
				</div>
			</div>
		</div>
	</div>

	<!-- section works -->
	<section id="izlozbe" class="section appear clearfix">
		<div class="container">

			<div class="row mar-bot40">
				<div class="col-md-offset-3 col-md-6">
					<div class="section-header">
						<h2 class="section-heading animated" data-animation="bounceInUp">Izlo??be</h2>
						<p>Donosimo Vam bogati izbor raznovrsnih izlo??bi.</p>
					</div>
				</div>
			</div>

			<div class="row">
				<nav id="filter" class="col-md-12 text-center">
					<ul>
						<li><a href="#" class="current btn-theme btn-small"
							data-filter="*">Sve</a></li>
						<li><a href="#" class="btn-theme btn-small"
							data-filter=".webdesign">Prija??nje</a></li>
						<li><a href="#" class="btn-theme btn-small"
							data-filter=".photography">Trenuta??ne</a></li>
						<li><a href="#" class="btn-theme btn-small"
							data-filter=".print">Budu??e</a></li>
					</ul>
				</nav>
				<div class="col-md-12">
					<div class="row">
						<div class="portfolio-items isotopeWrapper clearfix" id="3">

							<article class="col-md-4 isotopeItem webdesign">
								<div class="portfolio-item">
									<div class="wow rotateInUpLeft" data-animation-delay="4.8s">
										<img src="img/portfolio/1.jpg" alt="welcome" />
									</div>
									<div class="portfolio-desc align-center">
										<div class="folio-info">
											<h5>
												<a href="#">Picasso</a>
											</h5>
											<a href="img/portfolio/1.jpg" class="fancybox"> <i
												class="fa fa-external-link fa-2x"></i>
											</a>
										</div>
									</div>
								</div>
							</article>

							<article class="col-md-4 isotopeItem photography">
								<div class="portfolio-item">
									<div class="wow bounceIn">
										<img src="img/portfolio/2.jpg" alt="" />
									</div>
									<div class="portfolio-desc align-center">
										<div class="folio-info">
											<h5>
												<a href="#">Apollo</a>
											</h5>
											<a href="img/portfolio/2.jpg" class="fancybox"> <i
												class="fa fa-external-link fa-2x"></i>
											</a>
										</div>
									</div>
								</div>
							</article>


							<article class="col-md-4 isotopeItem photography">
								<div class="portfolio-item">
									<div class="wow rotateInDownRight">
										<img src="img/portfolio/3.jpg" alt="" />
									</div>
									<div class="portfolio-desc align-center">
										<div class="folio-info">
											<h5>
												<a href="#">Tesla</a>
											</h5>
											<a href="img/portfolio/3.jpg" class="fancybox"> <i
												class="fa fa-external-link fa-2x"></i>
											</a>
										</div>
									</div>
								</div>
							</article>

							<article class="col-md-4 isotopeItem print">
								<div class="portfolio-item">
									<div class="wow rotateInUpLeft">
										<img src="img/portfolio/4.jpg" alt="" />
									</div>
									<div class="portfolio-desc align-center">
										<div class="folio-info">
											<h5>
												<a href="#">Fosili</a>
											</h5>
											<a href="img/portfolio/4.jpg" class="fancybox"> <i
												class="fa fa-external-link fa-2x"></i>
											</a>
										</div>
									</div>
								</div>
							</article>

							<article class="col-md-4 isotopeItem photography">
								<div class="portfolio-item">
									<div class="wow bounceIn">
										<img src="img/portfolio/5.jpg" alt="" />
									</div>
									<div class="portfolio-desc align-center">
										<div class="folio-info">
											<h5>
												<a href="#">Parne lokomotive</a>
											</h5>
											<a href="img/portfolio/5.jpg" class="fancybox"> <i
												class="fa fa-external-link fa-2x"></i>
											</a>
										</div>
									</div>
								</div>
							</article>

							<article class="col-md-4 isotopeItem webdesign">
								<div class="portfolio-item">
									<div class="wow rotateInDownRight">
										<img src="img/portfolio/6.jpg" alt="" />
									</div>
									<div class="portfolio-desc align-center">
										<div class="folio-info">
											<h5>
												<a href="#">Stare knjige</a>
											</h5>
											<a href="img/portfolio/6.jpg" class="fancybox"> <i
												class="fa fa-external-link fa-2x"></i>
											</a>
										</div>
									</div>
								</div>
							</article>

							<article class="col-md-4 isotopeItem print">
								<div class="portfolio-item">
									<div class="wow rotateInUpLeft">
										<img src="img/portfolio/7.jpg" alt="" />
									</div>
									<div class="portfolio-desc align-center">
										<div class="folio-info">
											<h5>
												<a href="#">Stara ra??unala</a>
											</h5>
											<a href="img/portfolio/7.jpg" class="fancybox"> <i
												class="fa fa-external-link fa-2x"></i>
											</a>
										</div>
									</div>
								</div>
							</article>

							<article class="col-md-4 isotopeItem photography">
								<div class="portfolio-item">
									<div class="wow bounceIn">
										<img src="img/portfolio/8.jpg" alt="" />
									</div>
									<div class="portfolio-desc align-center">
										<div class="folio-info">
											<h5>
												<a href="#">Michelangelo</a>
											</h5>
											<a href="img/portfolio/8.jpg" class="fancybox"> <i
												class="fa fa-external-link fa-2x"></i>
											</a>
										</div>
									</div>
								</div>
							</article>

							<article class="col-md-4 isotopeItem print">
								<div class="portfolio-item">
									<div class="wow rotateInDownRight">
										<img src="img/portfolio/9.jpg" alt="" />
									</div>
									<div class="portfolio-desc align-center">
										<div class="folio-info">
											<h5>
												<a href="#">Drago kamenje</a>
											</h5>
											<a href="img/portfolio/9.jpg" class="fancybox"> <i
												class="fa fa-external-link fa-2x"></i>
											</a>
										</div>
									</div>
								</div>
							</article>
						</div>

					</div>


				</div>
			</div>

		</div>
	</section>

	<section id="audio">
		<div class="container">
			<div class="about">
				<div class="row mar-bot40">
					<div class="col-md-offset-3 col-md-6">
						<div class="title">
							<div class="wow bounceIn">

								<h2 class="section-heading animated" data-animation="bounceInUp">Audio
									zapisi</h2>

							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-3 mar-bot30">
						<audio id="completed" controls src="completed.wav"></audio>
						<audio controls src="sorry_dave.wav"></audio>
						<audio controls src="well.wav"></audio>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--about-->
	<section id="omuzeju">
		<div class="container">
			<div class="about">
				<div class="row mar-bot40">
					<div class="col-md-offset-3 col-md-6">
						<div class="title">
							<div class="wow bounceIn">

								<h2 class="section-heading animated" data-animation="bounceInUp">O
									muzeju</h2>


							</div>
						</div>
					</div>
				</div>
				<div class="row">

					<div class="row-slider">
						<div class="col-lg-6 mar-bot30">
							<div class="responsive-slider" data-spy="responsive-slider"
								data-autoplay="true">
								<div class="slides" data-group="slides">
									<ul>

										<div class="slide-body" data-group="slide">
											<li><img alt="" class="img-responsive" src="img/9.jpg"
												width="100%" height="350" /></li>
											<li><img alt="" class="img-responsive" src="img/10.jpg"
												width="100%" height="350" /></li>
											<li><img alt="" class="img-responsive" src="img/11.jpg"
												width="100%" height="350" /></li>

										</div>
									</ul>
									<a class="slider-control left" href="#" data-jump="prev"> <i
										class="fa fa-angle-left fa-2x"></i>
									</a> <a class="slider-control right" href="#" data-jump="next">
										<i class="fa fa-angle-right fa-2x"></i>
									</a>

								</div>
							</div>
						</div>

						<div class="col-lg-6 ">
							<div class="company mar-left10">
								<h4>
									Na?? muzej ima puno godina ve??, neka ekstra rije??i, <span>malo
										nagla??eno ne??ta</span> i sli??no.
								</h4>
								<p>Tijekom tog perioda puno izlo??bi. Random rije??i,
									mandarina i mlije??na ??okolada. Copy paste sa wikipedije, A
									museum is an institution that cares for (conserves) a
									collection of artifacts and other objects of artistic,
									cultural, historical, or scientific importance. Many public
									museums make these items available for public viewing through
									exhibits that may be permanent or temporary. The largest
									museums are located in major cities throughout the world, while
									thousands of local museums exist in smaller cities, towns and
									rural areas. Museums have varying aims, ranging from serving
									researchers and specialists to serving the general public. The
									goal of serving researchers is increasingly shifting to serving
									the general public.</p>
							</div>
							<div class="list-style">
								<div class="row">
									<div class="col-lg-6 col-sm-6 col-xs-12">
										<ul>
											<li>Prvi pojam</li>
											<li>Druga rije??</li>
											<li>Tre??i broj</li>
											<li>??etvrti znak</li>
										</ul>
									</div>
									<div class="col-lg-6 col-sm-6 col-xs-12">
										<ul>
											<li>Peta slika</li>
											<li>??esti kipar</li>
											<li>Sedma izlo??ba</li>
											<li>Osam</li>
										</ul>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>

			</div>

		</div>
	</section>
	<!--/about-->

	<!-- services -->
	<section id="services" class="section pad-bot5 bg-white">
		<div class="container">
			<div class="row mar-bot5">
				<div class="col-md-offset-3 col-md-6">
					<div class="section-header">
						<div class="wow bounceIn" data-animation-delay="7.8s">

							<h2 class="section-heading animated">Za??to izabrati nas</h2>
							<h4>Istra??ite kako najbolje do??ivjeti atmosferu muzeja.</h4>

						</div>
					</div>
				</div>
			</div>
			<div class="row mar-bot40">
				<div class="col-lg-3">
					<div class="wow bounceIn">
						<div class="align-center">

							<div class="wow rotateIn">
								<div class="service-col">
									<div class="service-icon">
										<figure>
											<i class="fa fa-compass"></i>
										</figure>
									</div>
									<h2>
										<a href="#">Lako snala??enje</a>
									</h2>
									<p>Ne??to o lakom snala??enju, dostupnosti karata i tlocrta.
										Ovo je samo da se popuni tekst</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="align-center">
						<div class="wow bounceIn">

							<div class="wow rotateIn">
								<div class="service-col">
									<div class="service-icon">
										<figure>
											<i class="fa fa-picture-o"></i>
										</figure>
									</div>
									<h2>
										<a href="#">Brojne izlo??be</a>
									</h2>
									<p>Puno izlo??bi, raznovrstnost i bogatstvo. Vrhunski
										slikari, umjetnici, sve ostalo ??ta postoji ve??.</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="align-center">
						<div class="wow bounceIn">
							<div class="service-col">
								<div class="service-icon">
									<figure>
										<i class="fa fa-user"></i>
									</figure>
								</div>
								<h2>
									<a href="#">Uslu??no osoblje</a>
								</h2>
								<p>Educirano osoblje, nasmijano, uvijek pomo??i, itd itd.
									Pitajte nas za pomo??.</p>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="align-center">
						<div class="wow bounceIn">
							<div class="service-col">
								<div class="service-icon">
									<figure>
										<i class="fa fa-volume-up"></i>
									</figure>
								</div>
								<h2>
									<a href="#">Zvukovni zapisi</a>
								</h2>
								<p>Pomo??u QR kodova se mogu reproducirati audio zapisi. Jo??
									malo o tome.</p>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
	</section>
	<!--/services-->

	<!-- spacer section:testimonial -->
	<section id="testimonials" class="section"
		data-stellar-background-ratio="0.3">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="align-center">
						<div class="testimonial pad-top40 pad-bot40 clearfix">
							<h5>Kao mali puno sam i??ao u muzeje, a ovaj muzej je
								najbolji od svih.</h5>
							<br /> <span class="author">&mdash; Luka Justi?? /
								Voditelj AppTownFunk-a</span>
						</div>

					</div>
				</div>
			</div>

		</div>

	</section>

	<section id="line-pricing" class="line-section line-center">
		<div class="container pad-top50">
			<div class="row mar-bot10 ">
				<div class="col-md-offset-3 col-md-6">
					<div class="section-header">
						<div class="wow bounceIn">

							<h2 class="section-heading animated" data-animation="bounceInUp">Cijene
								ulaznica</h2>
							<p>U??tedite s povoljnom kupovinom ulaznica.</p>

						</div>
					</div>
				</div>
			</div>
			<div class="line-wrap">
				<div class="line-pricing-table">
					<div class="pricing-table-wrap"
						data-scrollreveal="enter top over 0.5s after 0.3s">
						<ul>
							<li class="line-head-row">Jednodnevna</li>
							<li class="line-price-row">
								<p>
									<span class="symbol">$</span> <span>10</span>
								</p> <small>Odli??na za prvi posjet muzeju</small>
							</li>
							<li>1 izlo??ba uklju??ena</li>
							<li>1 godina pretplate na elektroni??ku po??tu</li>
							<li>20% na budu??im kupovinama</li>
							<li class="line-btn-row"><a href="" class="line-btn light">Kupite
									sada </a></li>
						</ul>
					</div>
					<div class="pricing-table-wrap"
						data-scrollreveal="enter top over 0.5s after 0.5s">
						<ul class="line-highlight">
							<li class="line-head-row">Godi??nja</li>
							<li class="line-price-row">
								<p>
									<span class="symbol">$</span> <span>300</span>
								</p> <small>Za muzejske entuzijaste</small>
							</li>
							<li>24 izlo??be uklju??ene</li>
							<li>??ivotna pretplata na elektroni??ku po??tu</li>
							<li>Prvi saznajte za budu??e izlo??be</li>
							<li class="line-btn-row"><a href="" class="line-btn green">Kupite
									sada </a></li>
						</ul>
					</div>
					<div class="pricing-table-wrap"
						data-scrollreveal="enter top over 0.5s after 0.7s">
						<ul>
							<li class="line-head-row">Obiteljska</li>
							<li class="line-price-row">
								<p>
									<span class="symbol">$</span> <span>30</span>
								</p> <small>2 odraslih + 3 djece</small>
							</li>
							<li>2 izlo??be uklju??ene</li>
							<li>Tematska dje??ja igraonica i edukacija</li>
							<li>Savr??eno za obiteljske izlete</li>
							<li class="line-btn-row"><a href="" class="line-btn light">Kupite
									sada </a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- contact -->
	<section id="section-contact" class="section appear clearfix">
		<div class="container">

			<div class="row mar-bot40">
				<div class="col-md-offset-3 col-md-6">
					<div class="section-header">
						<h2 class="section-heading animated" data-animation="bounceInUp">Kontaktirajte
							nas</h2>
						<p>Primjedbe, pohvale, savjete, ??elje, poslovne ideje,
							pitanja.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div id="sendmessage">Va??a poruka je poslana. Hvala Vam!</div>
					<div id="errormessage"></div>
					<form action="" method="post" role="form" class="contactForm">
						<div class="form-group">
							<input type="text" name="name" class="form-control" id="name"
								placeholder="Va??e ime" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="email" class="form-control" name="email" id="email"
								placeholder="Va?? E-mail" data-rule="email"
								data-msg="Please enter a valid email" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="subject"
								id="subject" placeholder="Tema" data-rule="minlen:4"
								data-msg="Please enter at least 8 chars of subject" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="message" rows="5"
								data-rule="required" data-msg="Please write something for us"
								placeholder="Poruka"></textarea>
							<div class="validation"></div>
						</div>

						<div class="text-center">
							<button type="submit" class="line-btn green">Po??alji
								poruku</button>
						</div>
					</form>
				</div>
				<!-- ./span12 -->
			</div>

		</div>
	</section>

	<!-- map -->
	<section id="section-map" class="clearfix">
		<div id="google-map" data-latitude="45.8009616"
			data-longitude="15.970385"></div>
	</section>

	<section id="footer" class="section footer">
		<div class="container">
			<div class="row animated opacity mar-bot0" data-andown="fadeIn"
				data-animation="animation">
				<div class="col-sm-12 align-center">
					<ul class="social-network social-circle">
						<li><a href="#" class="icoRss" title="Rss"> <i
								class="fa fa-rss"></i>
						</a></li>
						<li><a href="#" class="icoFacebook" title="Facebook"> <i
								class="fa fa-facebook"></i>
						</a></li>
						<li><a href="#" class="icoTwitter" title="Twitter"> <i
								class="fa fa-twitter"></i>
						</a></li>
						<li><a href="#" class="icoGoogle" title="Google +"> <i
								class="fa fa-google-plus"></i>
						</a></li>
						<li><a href="#" class="icoLinkedin" title="Linkedin"> <i
								class="fa fa-linkedin"></i>
						</a></li>
					</ul>
				</div>
			</div>

			<div class="row align-center copyright">
				<div class="col-sm-12">
					<p>&copy; AppTownFunk</p>
				</div>
			</div>
		</div>

	</section>
	<a href="#header" class="scrollup"> <i class="fa fa-chevron-up"></i>
	</a>

	<script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<script src="js/jquery.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="https://maps.google.com/maps/api/js?sensor=true"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/jquery.nicescroll.min.js"></script>
	<script src="js/fancybox/jquery.fancybox.pack.js"></script>
	<script src="js/skrollr.min.js"></script>
	<script src="js/jquery.scrollTo.js"></script>
	<script src="js/jquery.localScroll.js"></script>
	<script src="js/stellar.js"></script>
	<script src="js/responsive-slider.js"></script>
	<script src="js/jquery.appear.js"></script>
	<script src="js/grid.js"></script>
	<script src="js/main.js"></script>
	<script src="js/wow.min.js"></script>
	<script>
		wow = new WOW({}).init();
	</script>
	<script src="contactform/contactform.js"></script>

</body>

</html>