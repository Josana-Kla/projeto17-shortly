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

export { createNewUrl }; 