document.querySelector('#startGame').addEventListener("click", function() {
	xmlhttp = new XMLHttpRequest()
	url = '/game'
	xmlhttp.open("GET", url, true);
	xmlhttp.onreadystatechange = function() {
		if(xmlhttp.readyState === 4 && xmlhttp.status === 200) {
			document.querySelector('#playingField').innerHTML = xmlhttp.responseText
		}
	}
	xmlhttp.send();
})
