class Ajax {
	constructor(url) {
		this.url = url != undefined ? url : ""
	}

	fetchPostData(data) {
		return fetch(
			this.url,
			{
				method : "POST",
				cache : "no-cache",
				body : JSON.stringify(data)
			}
		)
	}

	fetchGetData(data) {
		var url = this.url + '?' + encodeURI(JSON.stringify(data))
		return fetch(
			url,
			{
				method : "GET",
				cache : "no-cache"
			}
		)
	}

	getResponse(data, method = "GET") {
		fetch = method == "GET" ? this.fetchGetData(data) : this.fetchPostData(data)

		fetch.then(function(response) {
			console.log(response.blob)
		}).catch(function(error) {
		  console.log(error.message);
		});
	}
}
