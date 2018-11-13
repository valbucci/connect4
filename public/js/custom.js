document.querySelector('#startGame').addEventListener("click", function() {
	var ajx = new Ajax("/game")
	this.innerHTML = ajx.getResponse({})
})
