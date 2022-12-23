import connection from '../database/database.js';
import joi from 'joi';

const userSignInSchema = joi.object({
    email: joi.string().email().required().empty(''),
    password: joi.string().alphanum().required().empty('')
});

async function toLogin(req, res) {
    const { email, password } = req.body;
    const validation = userSignInSchema.validate(req.body, {abortEarly: false});

    if(validation.error) {
        const error = validation.error.details.map(detail => detail.message);

        return res.status(422).send(error);
    };

    try {
        await connection.query(`
            
        `);
        
        return res.status(200).send();
    } catch (error) {
        console.log(error);
        return res.sendStatus(500);
    }
};

export { toLogin }; 