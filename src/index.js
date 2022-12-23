import express from 'express';
import cors from 'cors';

import signUpRouter from './routers/signup.routers.js';
import signInRouter from './routers/signin.routers.js';
import urlRouter from './routers/urls.routers.js';
import userRouter from './routers/users.routers.js';
import rankingRouter from './routers/ranking.routers.js';

const app = express();
app.use(cors());
app.use(express.json());

// ROUTES:
app.use(signUpRouter);
app.use(signInRouter);
/* app.use(urlRouter);
app.use(userRouter);
app.use(rankingRouter); */ 

app.listen(4000, () => console.log(`Executando na porta 4000...`));