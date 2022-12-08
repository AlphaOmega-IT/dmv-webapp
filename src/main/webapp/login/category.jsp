<%@ page import="de.alphaomega.it.dmv.database.entities.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" charset="UTF-8">
	<title>DMV Mystery | Kategorien</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css">
	<link rel="stylesheet" href="../assets/css/bildhochladen.css" type="text/css">
	<link rel="stylesheet" href="../assets/css/extras.css" type="text/css">
	<link rel="stylesheet" href="../assets/css/hovereffekt.css" type="text/css">
	<link rel="stylesheet" href="../assets/css/kat1sample.css" type="text/css">
	<link rel="stylesheet" href="../assets/css/MUSA_panel-table-panel-table.css" type="text/css">
	<link rel="stylesheet" href="../assets/css/MUSA_panel-table.css" type="text/css">
	<script src="../assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.pack.js" type="text/javascript"></script>
	<script src="../assets/javascript/Video-Parallax-Background-v2.js" type="text/javascript"></script>
	<script src="../assets/javascript/category.js" type="text/javascript"></script>
</head>

<body style="background: url(${pageContext.request.contextPath}/assets/img/bgw.png) center / cover no-repeat;">
<header>
	<div id="context-url" hidden url="${pageContext.request.contextPath}"></div>
</header>
<nav class="navbar navbar-light navbar-expand-md fixed-top navbar-shrink py-3" id="mainNav" style="background: url(${pageContext.request.contextPath}/assets/img/bgw.png);">
	<div class="container">
		<a class="navbar-brand d-flex align-items-center" href="category.jsp">
			<span style="color: rgba(255,255,255,0.9);">
				DMV-Mystery
			</span>
		</a>
		<div class="collapse navbar-collapse" id="navcol-1">
			<ul class="navbar-nav mx-auto" style="margin-right: 0!important;">
				<%
					boolean isAdmin = request.getSession() != null && request.getSession().getAttribute("loggedUser").toString().contains("username='admin'");
				%>
				<li class="nav-item"><a class="nav-link" href="adminpanel.jsp" style="color: rgba(255,255,255,0.55); display: <%=isAdmin ? "inline-flex" : "none"%>">AdminPanel</a></li>
				<li class="nav-item"><a class="nav-link" href="../login.jsp" style="color: rgba(255,255,255,0.55);">Ausloggen</a></li>
			</ul>
		</div>
	</div>
</nav>
<section class="py-5 mt-5">
	<div class="container py-4 py-xl-5">
		<div class="row mb-5" style="height: 148px;">
			<div class="col-md-8 col-xl-6 text-center mx-auto"><img class="rounded img-fluid" src="${pageContext.request.contextPath}/assets/img/Snapshot_2.jpg" style="width: 50%;" alt="snapshot.jpg"></div>
		</div>
		<div class="row mb-5" style="height: 148px;">
			<div class="col-md-8 col-xl-6 text-center mx-auto">
				<h2 class="display-6 fw-bold mb-4" style="color: rgb(255,255,255);">Bildergalerie</h2>
				<h2 class="display-6 fw-bold mb-4" style="color: rgb(255,255,255);">DMV Mystery</h2>
			</div>
		</div>
	</div>
	<%
		Object user = pageContext.getSession().getAttribute("loggedUser");
		User loggedInUser = (User) user;
		boolean isValidUser = loggedInUser != null;
		boolean hasPermForCategory1 = false, hasPermForCategory2 = false, hasPermForCategory3 = false, hasPermForCategory4 = false, hasPermForCategory5 = false, hasPermForCategory6 = false;
		
		if (isValidUser) {
			hasPermForCategory1 = loggedInUser.getPermissions().contains("Kategorie 1");
			hasPermForCategory2 = loggedInUser.getPermissions().contains("Kategorie 2");
			hasPermForCategory3 = loggedInUser.getPermissions().contains("Kategorie 3");
			hasPermForCategory4 = loggedInUser.getPermissions().contains("Kategorie 4");
			hasPermForCategory5 = loggedInUser.getPermissions().contains("Kategorie 5");
			hasPermForCategory6 = loggedInUser.getPermissions().contains("Kategorie 6");
		}
	%>
	<div class="container py-5">
		<div class="py-5">
			<div class="row">
				<div class="col-lg-6 mb-3 mb-lg-0" id="gallery1" onclick=<%=hasPermForCategory1 ? "category(this)" : ""%>>
					<div class="text-white hover hover-1 rounded"><img src="${pageContext.request.contextPath}/assets/img/Snapshot_4.jpg" alt="snapshot.jpg">
						<div class="hover-overlay"></div>
						<div class="hover-1-content px-5 py-4">
							<h3 class="text-uppercase hover-1-title font-weight-bold mb-0">Kategorie 1</h3>
							<p class="hover-1-description font-weight-light mb-0">Subtitel</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-3 mb-lg-0" id="gallery2" onclick=<%=hasPermForCategory2 ? "category(this)" : ""%>>
					<div class="text-white hover hover-1 rounded"><img src="${pageContext.request.contextPath}/assets/img/Bereich%202%20Bild%20wenn%20man%20mit%20der%20Maus%20drauf%20ist.jpg" alt="snapshot.jpg">
						<div class="hover-overlay"></div>
						<div class="hover-1-content px-5 py-4">
							<h3 class="text-uppercase hover-1-title font-weight-bold mb-0">Kategorie 2</h3>
							<p class="hover-1-description font-weight-light mb-0">Subtitel</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="py-5">
			<div class="row">
				<div class="col-lg-6 mb-3 mb-lg-0" id="gallery3" onclick=<%=hasPermForCategory3 ? "category(this)" : ""%>>
					<div class="text-white hover hover-1 rounded"><img src="${pageContext.request.contextPath}/assets/img/Vorschaubild%20Bereich%203%20wenn%20der%20Mauszeiger%20drauf%20ist.jpg" alt="snapshot.jpg">
						<div class="hover-overlay"></div>
						<div class="hover-1-content px-5 py-4">
							<h3 class="text-uppercase hover-1-title font-weight-bold mb-0">Kategorie 3</h3>
							<p class="hover-1-description font-weight-light mb-0">Subtitel</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-3 mb-lg-0" id="gallery4" onclick=<%=hasPermForCategory4 ? "category(this)" : ""%>>
					<div class="text-white hover hover-1 rounded"><img src="${pageContext.request.contextPath}/assets/img/Bild%20für%20Bereiche%204%20und%205%20und%206%20wenn%20der%20Mauszeiger%20drauf%20ist.jpg" alt="snapshot.jpg">
						<div class="hover-overlay"></div>
						<div class="hover-1-content px-5 py-4">
							<h3 class="text-uppercase hover-1-title font-weight-bold mb-0">Kategorie 4</h3>
							<p class="hover-1-description font-weight-light mb-0">Subtitel</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="py-5">
			<div class="row">
				<div class="col-lg-6 mb-3 mb-lg-0" id="gallery5" onclick=<%=hasPermForCategory5 ? "category(this)" : ""%>>
					<div class="text-white hover hover-1 rounded"><img src="${pageContext.request.contextPath}/assets/img/Bild%20für%20Bereiche%204%20und%205%20und%206%20wenn%20der%20Mauszeiger%20drauf%20ist.jpg" alt="snapshot.jpg">
						<div class="hover-overlay"></div>
						<div class="hover-1-content px-5 py-4">
							<h3 class="text-uppercase hover-1-title font-weight-bold mb-0">Kategorie 5</h3>
							<p class="hover-1-description font-weight-light mb-0">Subtitel</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-3 mb-lg-0" id="gallery6" onclick=<%=hasPermForCategory6 ? "category(this)" : ""%>>
					<div class="text-white hover hover-1 rounded"><img src="${pageContext.request.contextPath}/assets/img/Bild%20für%20Bereiche%204%20und%205%20und%206%20wenn%20der%20Mauszeiger%20drauf%20ist.jpg" alt="snapshot.jpg">
						<div class="hover-overlay"></div>
						<div class="hover-1-content px-5 py-4">
							<h3 class="text-uppercase hover-1-title font-weight-bold mb-0">Kategorie 6</h3>
							<p class="hover-1-description font-weight-light mb-0">Subtitel</p>
						</div>
					</div>
				</div>
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