<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" charset="UTF-8">
	<title>DMV Mystery | AdminPanel</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bildhochladen.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/extras.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/hovereffekt.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/kat1sample.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/MUSA_panel-table-panel-table.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/MUSA_panel-table.css" type="text/css">
	<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.pack.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/assets/javascript/Video-Parallax-Background-v2.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/assets/javascript/adminpanel.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css"/>
</head>
<body>
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
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login.jsp" style="color: rgba(255,255,255,0.55);">Ausloggen</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<section class="py-4 py-md-5 mt-5"><link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
		<div class="container">
			<div class="row">
				<p></p>
				<div style="text-align: center">
					<h1>DMV Mystery Admin Panel</h1>
					<p>Dieses Panel dient der Administration der DMV Bildergalerie und verfügt im Moment über die Optionen Benutzer zu verwalten, oder Bilder hochzuladen. Weitere Features können auf Nachfrage ergänzt werden.</p></div>
				<br>
				<div class="col-md-10 col-md-offset-1">
				<div class="panel panel-default panel-table">
					<div class="panel-heading">
						<div class="row">
							<div class="col col-xs-6">
								<h3 class="panel-title">Benutzer</h3>
							</div>
							<div class="col col-xs-6 text-right" style="text-align: right">
								<button class="btn btn-sm btn-primary btn-create" onclick="createUser()">Benutzer anlegen</button>
							</div>
						</div>
					</div>
					<div class="panel-body">
						<table class="table table-striped table-bordered table-list">
							<thead>
							<tr>
								<th><em class="fa fa-cog"></em></th>
								<th class="hidden-xs">ID</th>
								<th>Name</th>
								<th>Rechte</th>
							</tr>
							</thead>
							<jsp:include page="./user/displayuser.jsp"/>
						</table>
					</div>
					<div class="panel-footer">
						<div class="row">
							<div class="error">
								<%
									Object error = pageContext.getRequest().getAttribute("errorMessage");
									String successMessage ="";
									if (error != null && error.toString().equals("200"))
										successMessage = "Der Benutzer wurde erfolgreich gelöscht!";
									if (error == null)
										successMessage = "";
								%>
								<label style="margin-top: 5px; color: green; padding-left: 7px; " class="<%=error == null ? "noErrorMessage" : "errorMessage"%>"><%=successMessage%></label>
							</div>
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
				<p class="mb-0" style="color: black">Alle Rechte vorbehalten © 2022 DMV Mystery</p>
			</div>
		</div>
	</footer>
</body>

</html>