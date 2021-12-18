
const API_KEY = "c5d6b6e3bdff41b10301cec2bd1a5f33"
const API_URL = "https://api.openweathermap.org/data/2.5/weather"
const API_URL2 = "https://api.openweathermap.org/data/2.5/weather?q="


export const fetchWeatherByCity = async ({ queryKey }) => {
	// const cityname = "kathmandu"
	// const cityname = queryKey[1]
    // console.log("cityname ", cityname)

	// let url = `${API_URL}?q=${cityname}&appid=${API_KEY}`;

	
	// return await fetch(url,{mode:'no-cors'}, {
	// 	headers: {
	// 		"Content-Type": "application/json",
	// 		Accept: "application/json",
	// 	},
	// }).then((res) => res.json());


	const city = "kathmandu "
    const apiKey = "c5d6b6e3bdff41b10301cec2bd1a5f33"


	const url2 = `${API_URL2} + ${city}+&units=metric&appid=${apiKey}` 

	function displayWeather(data)
	{
		console.log("displaying the data ", data)
	}
	
    return await fetch( url2, {
		headers: {
			"Content-Type": "application/json",
			Accept: "application/json",
		}
	})
        .then((response) => response.json())
        .then((data) => displayWeather(data));
};