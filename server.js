import 'colors'
import cors from 'cors'
import dotenv from 'dotenv'
import express from 'express'
import morgan from 'morgan'
import path from 'path'
import authRoutes from './app/auth/auth.routes.js'
import { prisma } from './app/auth/prisma.js'
import competitionsRoutes from './app/competition/competition.routes.js'
import exerciseRoutes from './app/exercise/exercise.routes.js'
import { errorHandler, notFound } from './app/middleware/error.middleware.js'
import recordRoutes from './app/record/record.routes.js'
import registerRoutes from './app/register/register.routes.js'
import tournamentsRoutes from './app/tournament/tournament.routes.js'
import userRoutes from './app/user/user.routes.js'
import workoutRoutes from './app/workout/workout.routes.js'
dotenv.config()
const app = express()

async function main() {
	if (process.env.NODE_ENV === 'development') app.use(morgan('dev'))
	app.use(cors())
	app.use(express.json())

	const __dirname = path.resolve()

	app.use('/uploads', express.static(path.join(__dirname, '/uploads/')))
	app.use('/api/workouts', workoutRoutes)
	app.use('/api/auth', authRoutes)
	app.use('/api/users', userRoutes)
	app.use('/api/exercises', exerciseRoutes)
	app.use('/api/records', recordRoutes)
	app.use('/api/registrations', registerRoutes)
	app.use('/api/competitions', competitionsRoutes)
	app.use('/api/tournaments', tournamentsRoutes)
	app.use(notFound)
	app.use(errorHandler)

	const PORT = process.env.PORT || 5001

	app.listen(
		PORT,
		console.log(
			`🚀 Server running in ${process.env.NODE_ENV} mode on port ${PORT}`.blue
				.bold
		)
	)
}

main()
	.then(async () => {
		await prisma.$disconnect()
	})
	.catch(async e => {
		console.error(e)
		await prisma.$disconnect()
		process.exit(1)
	})
