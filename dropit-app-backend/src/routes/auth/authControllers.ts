
import { Request,Response } from "express";
import bcrypt from 'bcryptjs';
import {db} from "../../db/db";
import { usersTable } from "../../db/usersSchema";
import { eq } from "drizzle-orm"; 
import jwt from 'jsonwebtoken';

const SALT_ROUNDS = 10;
const JWT_SECRET = process.env.JWT_SECRET;

// Register user
export async function registerUser(req: Request, res: Response) {



    try {

        const { username, email, password } = req.cleanBody;
        const hashedPassword = await bcrypt.hash(password, SALT_ROUNDS);
        
        const [existingUser] = await db.select().from(usersTable).where(eq(usersTable.email, email));

        if (existingUser) {
            res.status(400).json({ error: 'User already exists' });
            return;
        }
        
        const [user] = await db.insert(usersTable).values({ username, email, password: hashedPassword }).returning();
        res.status(201).json({ message: "User created Successfully", user });


        
    } catch (error) {
        res.status(500).json({ error: 'Internal Server Error'});
    }

    res.send("User registered");
}



// Login user
export async function loginUser(req: Request, res: Response): Promise<void> {

   

    try {

        const { email, password } = req.cleanBody;
        console.log(email, password);
        const [user] = await db.select().from(usersTable).where(eq(usersTable.email, email));



    if(!user){
        res.status(400).json({ error: 'Invalid email or password' });
        return;
    }
    const isPassowrdValid = await bcrypt.compare(password, user.password);
    if(!isPassowrdValid){
        res.status(400).json({ error: 'Invalid email or password' });
        return;
    }
    // Generate JWT token
    const token = jwt.sign({ id: user.id }, JWT_SECRET!, { expiresIn: '1h' });
    res.status(200).json({ message: "User logged in successfully", token });
        
    } catch (error) {
        res.status(500).json({ error: 'Internal Server Error'});
        
    }


    


}


// Logout user
export function logoutUser(req: Request, res: Response) {

    res.send("User logged out");
}