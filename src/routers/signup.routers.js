import express from 'express';
import { toSignUp } from '../controllers/signup.controller.js';

const router = express.Router();

router.post("/signup", toSignUp);

export default router;