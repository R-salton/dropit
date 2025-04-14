import express, { Router,urlencoded } from 'express';
import authRoutes from './routes/auth/index';


const router = Router();


const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(router);

app.get('/', (req, res) => {
  res.send('Hello World!');
});

router.use('/auth', authRoutes);

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});
