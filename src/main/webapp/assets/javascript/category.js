function category(element) {
	let contextURL = document.getElementById("context-url").getAttribute("url");
	window.location.replace( contextURL + "/login/" + element.id + ".jsp");
}