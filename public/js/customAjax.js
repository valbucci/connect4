class Ajax {
	static getMatch(data, url, method) {
		fetch(url, {
			method : method,
			cache : "no-cache",
			body : JSON.stringify(data)
		}).then(
			response => response.text()
		).then(
			html => console.log(html)
		);
	}
}
