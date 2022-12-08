<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" charset="UTF-8">
	<title>DMV Mystery | Login</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/bildhochladen.css">
	<link rel="stylesheet" type="text/css" href="assets/css/style.css"/>
	<script src="assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</head>

<body style="background: url(${pageContext.request.contextPath}/assets/img/bgw.png);">
<nav class="navbar navbar-light navbar-expand-md fixed-top navbar-shrink py-3" id="mainNav" style="background: url(${pageContext.request.contextPath}/assets/img/bgw.png);">
	<div class="container">
		<a class="navbar-brand d-flex align-items-center" href="index.jsp">
			<span style="color: rgba(255,255,255,0.9);">
			DMV-Mystery
			</span>
		</a>
	</div>
</nav>
<section class="py-4 py-md-5 my-5">
	<div class="container py-md-5">
		<div class="row">
			<div class="col-md-6 text-center"><img class="rounded-circle img-fluid w-100" src="assets/img/Snapshot_2.jpg" alt="snapshot.jpg"></div>
			<div class="col-md-5 col-xl-4 text-center text-md-start">
				<h2 class="display-6 fw-bold mb-5" style="color: rgb(255,255,255);">DMV - Login</h2>
				<form method="post" action="${pageContext.request.contextPath}/login">
					<input aria-label="redirectId" name="redirectId" value="${param.redirectId}" hidden>
					<div class="error">
						<%
							Object error = pageContext.getRequest().getAttribute("errorMessage");
							String errorMessage = "Dein Benutzername oder Passwort sind falsch, bitte wende dich an den Webseitenadministrator solltest du deine Benutzerdaten vergessen haben!";
							if (error == null)
								errorMessage = "";
						%>
						<label class="<%=error == null ? "noErrorMessage" : "errorMessage"%>"><%=errorMessage%></label>
					</div>
					<div>
						<div class="inputFields"><input aria-label="username" required="" type="text" name="username" placeholder="Benutzername..." autofocus></div>
						<div class="inputFields"><input aria-label="password" required="" type="password" name="password" placeholder="Passwort..."></div>
						<div class="inputFields"><button type="submit" style="background: rgb(255,255,255);">Einloggen</button></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
	<footer>
		<div class="container py-4 py-lg-5">
			<hr>
			<div class="text-muted d-flex justify-content-between align-items-center pt-3">
				<p class="mb-0" style="color: rgb(255,255,255);">Alle Rechte vorbehalten © 2022 DMV Mystery</p>
			</div>
		</div>
	</footer>
</body>
</html>