import express from 'express';
import { createNewUrl, getUrlById, /* getAndAccessShortUrl, removeUrl  */} from '../controllers/urls.controller.js';

const router = express.Router();

router.post("/urls/shorten", createNewUrl);
router.get("/urls/:id", getUrlById);
/* router.get("/urls/open/:shortUrl", getAndAccessShortUrl);
router.delete("/urls/:id", removeUrl); */

export default router;