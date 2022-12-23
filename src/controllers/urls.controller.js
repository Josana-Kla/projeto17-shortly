import connection from '../database/database.js';
import joi from 'joi';

const newUrlSchema = joi.object({
    url: joi.string().email().required().empty('')
});

async function createNewUrl(req, res) {
    const { url } = req.body;
    const { authorization } = req.header;
    const validation = newUrlSchema.validate(req.body, {abortEarly: false});

    if(validation.error) {
        const error = validation.error.details.map(detail => detail.message);

        return res.status(422).send(error);
    };

  /*   if(!authorization || não é válido) {
        return res.sendStatus(401);
    }; */

    /* const hashPassword = bcrypt.hashSync(password, 10); */

    /* try {
        await connection.query(`INSERT INTO urls("userId", url, "shortUrl") VALUES($1, $2, $3)
        `, ["userId", url, "shortUrl"]
            
            'users').insertOne({ 
            name, 
            email, 
            password: hashPassword, 
            lastStatus: Date.now() 
        });
        return res.sendStatus(201);
    } catch(error) {
        console.log(error);
        return res.sendStatus(500);
    }; */
};

export { createNewUrl }; 