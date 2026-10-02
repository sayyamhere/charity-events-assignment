const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'skhan33_eventuser',
    password: 'Sayyam1122!',
    database: 'skhan33_charityevents_db',
    connectTimeout: 10000
});

connection.connect((error) => {
    if (error) {
        console.log('Database connection failed:', error.message);
        return;
    }

    console.log('Connected to cPanel database successfully!');
});

module.exports = connection;
