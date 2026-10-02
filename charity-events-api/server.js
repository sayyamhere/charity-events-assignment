const express = require('express');
const cors = require('cors');
const db = require('./event_db');

const app = express();

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
    res.send('Charity Events API is running');
});

app.get('/events', (req, res) => {
    const sql = `
        SELECT events.*, categories.category_name
        FROM events
        JOIN categories
        ON events.category_id = categories.category_id
        WHERE events.status = 'active'
        AND events.event_date >= CURDATE()
        ORDER BY events.event_date ASC
    `;

    db.query(sql, (error, results) => {
        if (error) {
            res.status(500).json({ error: error.message });
            return;
        }

        res.json(results);
    });
});
app.get('/categories', (req, res) => {
    const sql = 'SELECT * FROM categories';

    db.query(sql, (error, results) => {
        if (error) {
            res.status(500).json({ error: error.message });
            return;
        }

        res.json(results);
    });
});
app.get('/events/:id', (req, res) => {
    const eventId = req.params.id;

    const sql = `
        SELECT events.*, categories.category_name,
        organisations.organisation_name
        FROM events
        JOIN categories
        ON events.category_id = categories.category_id
        JOIN organisations
        ON events.organisation_id = organisations.organisation_id
        WHERE events.event_id = ?
    `;

    db.query(sql, [eventId], (error, results) => {
        if (error) {
            res.status(500).json({ error: error.message });
            return;
        }

        if (results.length === 0) {
            res.status(404).json({ message: 'Event not found' });
            return;
        }

        res.json(results[0]);
    });
});

app.get('/search', (req, res) => {
    const { name, date, location, category } = req.query;

    let sql = `
        SELECT events.*, categories.category_name,
        organisations.organisation_name
        FROM events
        JOIN categories
        ON events.category_id = categories.category_id
        JOIN organisations
        ON events.organisation_id = organisations.organisation_id
        WHERE 1=1
    `;

    const values = [];

    if (name) {
        sql += ' AND events.event_name LIKE ?';
        values.push(`%${name}%`);
    }

    if (date) {
        sql += ' AND events.event_date = ?';
        values.push(date);
    }

    if (location) {
        sql += ' AND events.location LIKE ?';
        values.push(`%${location}%`);
    }

    if (category) {
        sql += ' AND categories.category_name = ?';
        values.push(category);
    }

    sql += ' ORDER BY events.event_date ASC';

    db.query(sql, values, (error, results) => {
        if (error) {
            res.status(500).json({ error: error.message });
            return;
        }

        res.json(results);
    });
});


const PORT = 3000;

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});