import connection from '../database/database.js';
import joi from 'joi';
import  { nanoid } from  'nanoid'; 

const newUrlSchema = joi.object({
    url: joi.string().uri().required().empty('')
});

async function createNewUrl(req, res) {
    const { url } = req.body;
    const authorization =  req.headers.authorization?.replace('Bearer ', '');
    const validation = newUrlSchema.validate(req.body, {abortEarly: false});

    if(validation.error) {
        const error = validation.error.details.map(detail => detail.message);

        return res.status(422).send(error);
    };

    if(!authorization) {
        return res.sendStatus(401);
    };

    try {      
        const getUserIdSession = await connection.query(`
            SELECT users.id, sessions.token FROM sessions JOIN users ON sessions."userId" = users.id WHERE sessions.token = $1;
        `, [authorization]);

        const userId = getUserIdSession.rows[0].id;
        const shortUrl = nanoid(10);

        await connection.query(`
            INSERT INTO urls("userId", url, "shortUrl") VALUES($1, $2, $3);
        `, [userId, url, shortUrl]);

        return res.status(201).send(`newShortUrl: ${shortUrl}`);
    } catch(error) {
        console.log(error);
        return res.sendStatus(500);
    };
};

async function getUrlById(req, res) {
    const { id } = req.params;
    
    try {
        const { rows } = await connection.query(`
            SELECT * FROM urls WHERE id = $1;
        `, [id]);

        if(!rows[0].id) {
            return res.sendStatus(404);
        };

        return res.status(200).send({
            "id": rows[0].id,
            "shortUrl": rows[0].shortUrl,
            "url": rows[0].url
        });
    } catch (error) {
        console.log(error);
        return res.sendStatus(404);
    }
};

async function getAndAccessShortUrl(req, res) {
    const { shortUrl } = req.params;

    try {
        const { rows } = await connection.query(`
            SELECT * FROM urls WHERE "shortUrl" = $1;
        `, [shortUrl]);

        console.log(rows);
        if(rows[0].url === undefined) {
            return res.sendStatus(404);
        };

        const urlId = rows[0].id;
        const url = rows[0].url;

        await connection.query(`
            INSERT INTO visits("urlId") VALUES($1);
        `, [urlId]);

        const getVisits = await connection.query(`
            SELECT * FROM visits WHERE "urlId" = $1;
        `, [urlId]);

        const incrementVisits = getVisits.rows[0].qtdVisits + 1;

        await connection.query(`
            UPDATE visits SET "qtdVisits" = $2 WHERE "urlId" = $1;
        `, [urlId, incrementVisits]);

        return  res.redirect(url);
    } catch (error) {
        console.log(error);
        return res.sendStatus(404);
    }
};

export { createNewUrl, getUrlById, getAndAccessShortUrl }; 