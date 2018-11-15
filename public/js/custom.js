var turn = undefined
document.querySelector('#startGame').addEventListener("click", function() {
	// Contact the server to get the playing field
	xmlhttp = new XMLHttpRequest()
	url = '/game'
	xmlhttp.open("GET", url, true);
	xmlhttp.onreadystatechange = function() {
		// If there is a response with no errors
		if(xmlhttp.readyState === 4 && xmlhttp.status === 200) {
			// Print the playing field
			showGrid()
			document.querySelector("#btnRestart").addEventListener("click", function() {
				restartGame()
			})
		}
	}
	xmlhttp.send();
})

function addTdListeners() {
	document.querySelectorAll('#playingField td').forEach(function(td) {
		// When the cursor is over a slot we want to highlight the entire column with its empty slots and show where the token will be placed
		td.addEventListener("mouseover", function() {
			var col = getChildNum(td) + 1
			var columnNSlots = document.querySelectorAll('#playingField tr td:nth-child('+col+')')
			columnNSlots.forEach(function(slot) {
				if(!slot.classList.contains('filled')) {
					slot.style.backgroundColor = "lightgrey"
				}
			})
			var i = columnNSlots.length - 1
			while(i > -1 && columnNSlots[i].classList.contains('filled')) {
				i--
			}
			if(i > -1) {
				columnNSlots[i].style.backgroundColor = "grey"
			}
		})
		// When the cursor exits the slot border we want to remove the highlight
		td.addEventListener("mouseout", function() {
			var col = getChildNum(td) + 1
			document.querySelectorAll('#playingField tr td:nth-child('+col+')').forEach(function(slot) {
				if(!slot.classList.contains('filled')) {
					slot.style.backgroundColor = "white"
					slot.style.backgroundImage = "none"
				}
			})
		})
		// When the cursor clicks a slot place a token on the column
		td.addEventListener("click", function() {
			var col = getChildNum(td) + 1
			insertToken(col)
		})
	})
}

function showGrid() {
	xmlhttp = new XMLHttpRequest()
	url = '/game'
	xmlhttp.open("GET", url, true);
	xmlhttp.onreadystatechange = function() {
		// If there is a response with no errors
		if(xmlhttp.readyState === 4 && xmlhttp.status === 200) {
			document.querySelector('#playingField').innerHTML = xmlhttp.responseText
			addTdListeners()
		}
	}
	xmlhttp.send();
}

function insertToken(column) {
	xmlhttp = new XMLHttpRequest()
	url = '/game/' + (column - 1)
	xmlhttp.open("GET", url, true);
	xmlhttp.onreadystatechange = function() {
		// If there is a response with no errors
		if(xmlhttp.readyState === 4 && xmlhttp.status === 200) {
			response = JSON.parse(xmlhttp.responseText)
			if(response['msg'] == "TURN") {
				turn = response['data']
			} else if(response['msg'] == "GAME_OVER") {
				M.toast({html: '<span>' + response['data'] + '</span><button onclick="restartGame()" class="btn-flat toast-action">Restart</button>'})
			} else {
				M.toast({html: response['data']})
			}
			showGrid()
		}
	}
	xmlhttp.send();
}

function restartGame() {
	xmlhttp = new XMLHttpRequest()
	url = '/restart'
	xmlhttp.open("GET", url, true);
	xmlhttp.onreadystatechange = function() {
		// If there is a response with no errors
		if(xmlhttp.readyState === 4 && xmlhttp.status === 200) {
			showGrid()
			M.Toast.dismissAll()
		}
	}
	xmlhttp.send();
}

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
