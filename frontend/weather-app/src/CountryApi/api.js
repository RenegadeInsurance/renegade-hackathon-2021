
const API_URI = "https://api.countrystatecity.in/v1/countries"

export const fetchCountires = async () => {
	let url = `${API_URI}`;

    const API_KEY = "djIyVlQ0VG9GWWx4NUNXY3gwY3BEaml5M01pVE1OcnRZNFJIT21XQg=="

	return await fetch(url, {
		headers: {
            "X-CSCAPI-KEY": `${API_KEY}`,
			"Content-Type": "application/json",
			Accept: "application/json",
		},
	}).then((res) => res.json());
};