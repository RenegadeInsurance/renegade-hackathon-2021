const express = require('express');

const PORT = 5000;
const app = express();

app.get('/', (req, res) => {
	res.send("Hello");
});

app.listen(PORT, () => {
	console.log(`Server running at http://localhost:${PORT}`);
})