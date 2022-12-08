<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" type="text/css" href="assets/css/style.css"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js" type="text/javascript"></script>
	<script src="assets/javascript/video.js" type="text/javascript"></script>
	<title>DMV Mystery</title>
</head>
<body id="background">
	<header>
		<div id="context-url" hidden url="${pageContext.request.contextPath}"></div>
	</header>
	<div>
		<video id="intro-video" autoplay muted>
			<source src="https://dmv-mysterie.7iz.de/video/l1.mp4" type="video/mp4">
		</video>
	</div>
</body>
</html>