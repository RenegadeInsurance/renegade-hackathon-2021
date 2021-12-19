module.exports = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx}",
    "./src/components/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
				// mycolor : '#FFFFFF',
				// primary: {
				//   light: '#283A45',
				//   default: '#283A45'
				// }
				item_list_bg: "#283A45",
				drak_blue_background: "#1E272D",
				blue_secondary: "#111E6C",

				gary_blue: "00E472",
				gary_dark: "2C2C2C",

				// Color used in button to filter
				// newest or must popular product.
				color4: "#311A8E",

				// Blue green upcomming prouduct item
				// background color .
				color5: "#083C82",

				//Orange color for button
				// motivation color
				color6: "#F39912",

				// upvote button color red type
				color7: "#EB5757",

				buttonGreen: "#238636",
			},
    },
  },
  plugins: [],
}
