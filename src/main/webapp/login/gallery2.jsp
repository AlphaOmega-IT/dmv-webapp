<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" charset="UTF-8">
  <title>DMV Mystery | Galerie</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js" type="text/javascript"></script>
  <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" type="text/css">
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
</head>

<body style="background: url(${pageContext.request.contextPath}/assets/img/bgw.png) center / cover no-repeat;">
<nav class="navbar navbar-light navbar-expand-md fixed-top navbar-shrink py-3" id="mainNav" style="background: url(${pageContext.request.contextPath}/assets/img/bgw.png);">
    <div class="container">
      <a class="navbar-brand d-flex align-items-center" href="category.jsp">
			<span style="color: rgba(255,255,255,0.9);">
				DMV-Mystery
			</span>
      </a>
      <div class="collapse navbar-collapse" id="navcol-1">
        <ul class="navbar-nav mx-auto" style="margin-right: 0!important;">
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
        <h2 class="display-6 fw-bold mb-4" style="color: rgb(255,255,255);">Kategorie - Bilder</h2>
        <h2 class="display-6 fw-bold mb-4" style="color: rgb(255,255,255);">DMV Mystery</h2>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="row flex-box flex-wrap-wrap">
      <div class="col-sm-4 flex-box flex-justify-center flex-align-center"><a class="fancybox" rel="gallery1" title="Hero Image Nature" href="${pageContext.request.contextPath}/assets/img/hero-background-nature.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/hero-background-nature.jpg" alt="snapshot.jpg"></a></div>
      <div class="col-sm-4 flex-box flex-justify-center flex-align-center"><a class="fancybox" rel="gallery1" title="Hero Image Technology" href="${pageContext.request.contextPath}/assets/img/hero-background-technology.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/hero-background-technology.jpg" alt="snapshot.jpg"></a></div>
      <div class="col-sm-4 flex-box flex-justify-center flex-align-center"><a class="fancybox" rel="gallery1" title="Hero Image Travel" href="${pageContext.request.contextPath}/assets/img/hero-background-travel.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/hero-background-travel.jpg" alt="snapshot.jpg"></a></div>
      <div class="col-sm-4 flex-box flex-justify-center flex-align-center"><a class="fancybox" rel="gallery1" title="Hero Image Food" href="${pageContext.request.contextPath}/assets/img/hero-background-food.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/hero-background-food.jpg" alt="snapshot.jpg"></a></div>
      <div class="col-sm-4 flex-box flex-justify-center flex-align-center"><a class="fancybox" rel="gallery1" title="Hero Image Music" href="${pageContext.request.contextPath}/assets/img/hero-background-music.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/hero-background-music.jpg" alt="snapshot.jpg"></a></div>
      <div class="col-sm-4 flex-box flex-justify-center flex-align-center"><a class="fancybox" rel="gallery1" title="Hero Image Photography" href="${pageContext.request.contextPath}/assets/img/hero-background-photography.jpg"><img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/hero-background-photography.jpg" alt="snapshot.jpg"></a></div>
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