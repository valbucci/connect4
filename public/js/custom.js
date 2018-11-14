document.querySelector('#startGame').addEventListener("click", function() {
	// Contact the server to get the playing field
	xmlhttp = new XMLHttpRequest()
	url = '/game'
	xmlhttp.open("GET", url, true);
	xmlhttp.onreadystatechange = function() {
		// If there is a response with no errors
		if(xmlhttp.readyState === 4 && xmlhttp.status === 200) {
			// Print the playing field
			document.querySelector('#playingField').innerHTML = xmlhttp.responseText


			document.querySelectorAll('#playingField td').forEach(function(td) {
				// When the cursor is over a slot we want to highlight the entire column with its empty slots and show where the token will be placed
				td.addEventListener("mouseover", function() {
					var col = getChildNum(td) + 1
					document.querySelectorAll('#playingField tr td:nth-child('+col+')').forEach(function(slot) {
						if(!slot.classList.contains('filled')) {
							slot.style.backgroundColor = "darkgrey"
						}
					})
				})
				// When the cursor exits the slot border we want to remove the highlight
				td.addEventListener("mouseout", function() {
					var col = getChildNum(td) + 1
					document.querySelectorAll('#playingField tr td:nth-child('+col+')').forEach(function(slot) {
						if(!slot.classList.contains('filled')) {
							slot.style.backgroundColor = "white"
						}
					})
				})
			})
		}
	}
	xmlhttp.send();
})

function getChildNum(child) {
	var parent = child.parentNode
	var children = parent.children
	var num = 0
	while(num < children.length - 1 && child != children[num]) {
		num++;
	}
	if(child == children[num]) {
		return num
	}
	return null
}
