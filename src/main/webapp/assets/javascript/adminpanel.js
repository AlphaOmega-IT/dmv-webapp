function createUser() {
	let contextURL = document.getElementById("context-url").getAttribute("url");
	window.location.replace( contextURL + "/login/user/usercreation.jsp");
}