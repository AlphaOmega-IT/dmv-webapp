$(document).ready(function () {
	setupVideo();
})

function setupVideo() {
	let video = document.getElementById("intro-video");
	video.addEventListener('click', function () {
		let contextURL = document.getElementById("context-url").getAttribute("url");
		window.location.replace( contextURL + "/login.jsp");
	})
	video.addEventListener('ended', function() {
		let contextURL = document.getElementById("context-url").getAttribute("url");
		window.location.replace( contextURL + "/login.jsp");
	});
}