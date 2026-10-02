const express = require('express');

const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

const PORT = 4000;

app.get('/', (req, res) => {
    res.send('Charity Events Web Application is running');
});

app.listen(PORT, () => {
    console.log(`Web application running on port ${PORT}`);
});