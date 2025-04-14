import { sql } from 'drizzle-orm';
import { pgTable, text, integer, varchar, char, timestamp } from 'drizzle-orm/pg-core';
import { createInsertSchema } from 'drizzle-zod';

export const usersTable = pgTable('users', { 
  id: integer().generatedAlwaysAsIdentity().primaryKey(),
  username: varchar({length:255}),
  email: text().notNull().unique(),
  password: varchar({length:255}).notNull(),
  created_at: timestamp().default(sql`now()`),
  updated_at: timestamp().default(sql`now()`)
});


export const createUserSchema = createInsertSchema(usersTable).omit({id:true as never});
export const loginUserSchema = createInsertSchema(usersTable).pick({email:true as never, password:true as never});