const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Rana123456#',
    database: 'charityevents_db'
});

connection.connect((error) => {
    if (error) {
        console.log('Database connection failed:', error.message);
        return;
    }

    console.log('Connected to charityevents_db successfully!');
});

module.exports = connection;