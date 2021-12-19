const API_URL = "http://902e-202-79-35-20.ngrok.io/personalapi/"

export const addUser = async (field) => {
	// const access =
	// 	typeof window !== "undefined" ? localStorage.getItem("access") : "";
	// if (access == "") {
	// 	return alert("Unauthorized request ");
	// }

	let url = `${API_URL}`;

	return await fetch(url, {
		method: "POST",
		headers: {
			"Content-Type": "application/json",
		},
		body: JSON.stringify(field),
	});
};