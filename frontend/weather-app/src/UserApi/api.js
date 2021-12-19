const API_URL = ""

export const addUser = async (field) => {
	// const access =
	// 	typeof window !== "undefined" ? localStorage.getItem("access") : "";
	// if (access == "") {
	// 	return alert("Unauthorized request ");
	// }

	let url = `${API_URL}/product_upvote/`;

	return await fetch(url, {
		method: "POST",
		headers: {
			"Content-Type": "application/json",
		},
		body: JSON.stringify(field),
	});
};