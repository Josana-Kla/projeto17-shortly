import connection from '../database/database.js';
import joi from 'joi';
import bcrypt from 'bcrypt';
import { v4 as uuidv4 } from 'uuid';

const userSignInSchema = joi.object({
    email: joi.string().email().required().empty(''),
    password: joi.string().alphanum().required().empty('')
});

async function checkUserAlreadyExists(email) {
    try {
        const emailExists = await connection.query(`
            SELECT * FROM users WHERE email = $1;
        `, [email]);

        if(emailExists.rows[0].email !== undefined) {
            return true;
        };

    } catch (error) {
        console.log(error);
    }
};

async function toLogin(req, res) {
    const { email, password } = req.body;
    const validation = userSignInSchema.validate(req.body, {abortEarly: false});

    if(validation.error) {
        const error = validation.error.details.map(detail => detail.message);

        return res.status(422).send(error);
    };

    if(await checkUserAlreadyExists(email) === false) {
        return res.sendStatus(401);
    };

    try {
        const userData = await connection.query(`
            SELECT * FROM users WHERE email = $1;
        `, [email]);
        
        const userId = userData.rows[0].id;
        const isValid = bcrypt.compareSync(password, userData.rows[0].password);

        if(!isValid) {
            return res.sendStatus(401);
        };

        const token = uuidv4();

        await connection.query(`
            INSERT INTO sessions("userId", token, "isActived") VALUES($1, $2, $3);
        `, [userId, token, true]);
      
        return res.status(200).send({token: token});

    } catch (error) {
        console.log(error);
        return res.sendStatus(500);
    }
};

export { toLogin }; 