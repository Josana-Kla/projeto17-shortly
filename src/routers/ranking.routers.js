import express from 'express';
import { getRankings } from '../controllers/ranking.controller.js';

const router = express.Router();

router.get("/ranking", getRankings);

export default router;