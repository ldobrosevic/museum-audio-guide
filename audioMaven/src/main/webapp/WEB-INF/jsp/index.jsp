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
		<h1>
				Muzej muzeja
		</h1>
		<ul>
			<li>Izložbe</li>
			<li>Audio</li>
			<li>O muzeju</li>
			<li>Shop</li>
		</ul>
	<img src="img/1.jpg"/>
	<h2>
		<span>Mladi T-rexovi</span>
	</h2>
	<p>Pogledajte izložbu najboljih dinosaura</p>

	<img src="img/2.jpg"/>
	<h2>Vodeni autobusi</h2>
	<p>Doživite najrealističniju plovidbu na suhome</p>


	<c:if test="${user.username == null}">
	<a href="${pageContext.request.contextPath}/login">Sign in</a>
	-
	<a href="${pageContext.request.contextPath}/registration">Register</a>
	-
	<a href="#">Forgot Password</a>			
	</c:if>
	
	<c:if test="${user.username != null }">
		Dobrodošao <c:out value="${user.username }"></c:out>! | 
		<a href="${pageContext.request.contextPath}/logout">Log out</a>
	</c:if>
	


		<h2>Izložbe</h2>
		<p>Donosimo Vam bogati izbor raznovrsnih izložbi.</p>
		<img src="img/portfolio/1.jpg" alt="welcome" /> <img
			src="img/portfolio/2.jpg" alt="" /> <img src="img/portfolio/3.jpg"
			alt="" /> <img src="img/portfolio/4.jpg" alt="" /> <img
			src="img/portfolio/5.jpg" alt="" /> <img src="img/portfolio/6.jpg"
			alt="" /> <img src="img/portfolio/7.jpg" alt="" /> <img
			src="img/portfolio/8.jpg" alt="" /> <img src="img/portfolio/9.jpg"
			alt="" />

		<h2>Audio zapisi</h2>
		<audio controls src="completed.wav"></audio>
		<audio controls src="sorry_dave.wav"></audio>
		<audio controls src="well.wav"></audio>
		<a href="/audio?a=completed.wav">Audio</a>
		<a href="detailsUpload">Upload novi audio</a>
		<h2>O muzeju</h2>

		<img alt="" src="img/9.jpg" width="100%" height="350" /> <img alt=""
			src="img/10.jpg" width="100%" height="350" /> <img alt=""
			src="img/11.jpg" width="100%" height="350" />
		<h4>
			Naš muzej ima puno godina već, neka ekstra riječi, <span>malo
				naglašeno nešta</span> i slično.
		</h4>
		<p>Tijekom tog perioda puno izložbi. Random riječi, mandarina i
			mliječna čokolada. Copy paste sa wikipedije, A museum is an
			institution that cares for (conserves) a collection of artifacts and
			other objects of artistic, cultural, historical, or scientific
			importance. Many public museums make these items available for public
			viewing through exhibits that may be permanent or temporary. The
			largest museums are located in major cities throughout the world,
			while thousands of local museums exist in smaller cities, towns and
			rural areas. Museums have varying aims, ranging from serving
			researchers and specialists to serving the general public. The goal
			of serving researchers is increasingly shifting to serving the
			general public.</p>
		<ul>
			<li>Prvi pojam</li>
			<li>Druga riječ</li>
			<li>Treći broj</li>
			<li>Četvrti znak</li>
		</ul>
		<ul>
			<li>Peta slika</li>
			<li>Šesti kipar</li>
			<li>Sedma izložba</li>
			<li>Osam</li>
		</ul>
		
		
		<h2>Zašto izabrati nas</h2>
		<h4>Istražite kako najbolje doživjeti atmosferu muzeja.</h4>
		<h2>
		Lako snalaženje
		</h2>
		<p>Nešto o lakom snalaženju, dostupnosti karata i tlocrta. Ovo je
			samo da se popuni tekst</p>
		<h2>
			Brojne izložbe
		</h2>
		<p>Puno izložbi, raznovrstnost i bogatstvo. Vrhunski slikari,
			umjetnici, sve ostalo šta postoji već.</p>
		<h2>
			Uslužno osoblje
		</h2>
		<p>Educirano osoblje, nasmijano, uvijek pomoći, itd itd. Pitajte
			nas za pomoć.</p>
		<h2>
			Zvukovni zapisi
		</h2>
		<p>Pomoću QR kodova se mogu reproducirati audio zapisi. Još malo o
			tome.</p>
			
			
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