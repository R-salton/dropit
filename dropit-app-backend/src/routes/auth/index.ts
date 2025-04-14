

import { Router } from 'express';
import { loginUser, registerUser } from './authControllers';
import { validateData } from '../../middlewares/validateMiddleware'
import { createUserSchema, loginUserSchema } from '../../db/usersSchema';


const router = Router();




router.post("/register",validateData(createUserSchema), registerUser);

router.post("/login",validateData(loginUserSchema), loginUser);



export default router;

 