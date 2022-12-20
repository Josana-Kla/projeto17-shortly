import express from 'express';
import { toLogin } from '../controllers/signin.controller.js';

const router = express.Router();

router.post("/signin", toLogin);

export default router;