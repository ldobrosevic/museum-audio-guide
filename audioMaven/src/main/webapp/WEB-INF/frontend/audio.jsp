<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
  	
  	
</head>

<!-- Izvor: https://www.youtube.com/watch?v=vtZCMTtP-0Y -->

<body>

<a href="/">Naslovnica</a>
<div class="container">
	<audio id="audio" controls preload="auto" >
		<source id="audioSource" src=""></source>
	</audio>
</div>	
	<script type="text/javascript">
		audioPlayer();
		function audioPlayer(){
			
			var url_string = window.location.href;
			var url = new URL(url_string);
			var a = url.searchParams.get("a");
			$("source")[0].src = "audio/"+a; 
			$("audio")[0].play(); 
			
		}
	
	</script>
	
	
	<style>
		.container{
			    text-align: center;
			  	margin-top:20%; 
		}
	</style>
</body>
</html>