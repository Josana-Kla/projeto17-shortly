import connection from '../database/database.js';
import joi from 'joi';

const userSignUpSchema = joi.object({
    name: joi.string().pattern(/^[A-zÀ-ú]/).required().empty(' '),
    email: joi.string().email().required().empty(''),
    password: joi.string().alphanum().required().empty(''),
    checkPassword: joi.string().alphanum().required().empty('')
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

async function toSignUp(req, res) {
    const { name, email, password, checkPassword } = req.body;
    const validation = userSignUpSchema.validate(req.body, {abortEarly: false});

    if(validation.error) {
        const error = validation.error.details.map(detail => detail.message);

        return res.status(422).send(error);
    };

    if(password !== checkPassword) {
        return res.sendStatus(400);
    };

    if(await checkUserAlreadyExists(email)) {
        return res.sendStatus(409);
    };

    try {
        await connection.query(`
            INSERT INTO users(name, email, password) VALUES($1, $2, $3)
        `, [name, email, password]);

        return res.sendStatus(201);
    } catch (error) {
        console.log(error);
        return res.sendStatus(500);
    }
};

export { toSignUp }; 