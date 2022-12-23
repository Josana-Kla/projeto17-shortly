import connection from '../database/database.js';

async function getRankings(req, res) {
    try {
        const { rows } = await connection.query(`
            SELECT users.id, users.name, COUNT(urls.id) AS "linksCount", visits."qtdVisits" AS "visitCount" FROM users LEFT JOIN urls ON urls."userId" = users.id JOIN visits ON visits."urlId" = urls.id GROUP BY users.id, visits."qtdVisits" ORDER BY "visitCount" DESC, "linksCount" LIMIT 10;
        `);

        return res.status(200).send(rows);
    } catch (error) {
        console.log(error);
        return res.sendStatus(404);
    }
};

export { getRankings }; 