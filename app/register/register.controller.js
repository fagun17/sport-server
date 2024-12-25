import asyncHandler from 'express-async-handler'
import { prisma } from '../auth/prisma.js'
import { UserFields } from '../utils/user.utils.js'
export const createNewRegister = asyncHandler(async (req, res) => {
	const user = await prisma.user.findUnique({
		where: {
			id: req.user.id
		},
		select: UserFields
	})

	const countExerciseTimesCompleted = await prisma.exerciseLog.count({
		where: {
			userId: req.user.id,
			isCompleted: true
		}
	})
	const countCompetitionTimesCompleted = await prisma.competitionLog.count({
		where: {
			userId: req.user.id,
			isCompleted: true
		}
	})

	const kgs = await prisma.exerciseTime.aggregate({
		where: {
			exerciseLog: {
				userId: req.user.id
			},

			isCompleted: true
		},

		_sum: {
			weight: true
		}
	})

	const galls = await prisma.competitionTime.aggregate({
		where: {
			competitionLog: {
				userId: req.user.id
			},

			isCompleted: true
		},

		_sum: {
			comandOne: true
		},

		_sum: {
			comandTwo: true
		}
	})

	const workouts = await prisma.workoutLog.count({
		where: {
			userId: user.id,
			isCompleted: true
		}
	})

	const k = 0

	const tournaments = await prisma.tournamentLog.count({
		where: {
			userId: user.id,
			isCompleted: true
		}
	})

	res.json({
		...user,
		statistics: [
			{
				label: 'Минуты',
				value: Math.ceil(countExerciseTimesCompleted * 2.3) || 0
			},
			{
				label: 'Тренировки',
				value: workouts || 0
			},
			{
				label: 'КГ',
				value: kgs._sum.weight || 0
			},

			{
				label: 'Баллы',
				value:
					Math.ceil(
						(kgs._sum.weight * workouts) / (countExerciseTimesCompleted * 2.3)
					) || 0
			}
		]
	})

	const { fullName, tabNumber, scores, height, prioritet, tournamentIds } =
		req.body

	const register = await prisma.register.create({
		data: {
			fullName,
			tabNumber,
			scores:
				(kgs._sum.weight * workouts) / (countExerciseTimesCompleted * 2.3),
			height,
			prioritet: Math.floor(Math.random() * 41) + 60,
			tournaments: {
				connect: tournamentIds.map(id => ({ id: +id }))
			}
		}
	})

	res.json(register)
})

export const getRegisters = asyncHandler(async (req, res) => {
	const register = await prisma.register.findMany({
		orderBy: {
			createdAt: 'desc'
		}
	})

	res.json(register)
})

export const getRegister = asyncHandler(async (req, res) => {
	const register = await prisma.register.findUnique({
		where: { id: +req.params.id },

		include: {
			tournaments: true
		}
	})

	if (!register) {
		res.status(404)
		throw new Error('Register not found!')
	}

	res.json({ ...register })
})

export const updateRegister = asyncHandler(async (req, res) => {
	const { fullName, tabNumber, scores } = req.body

	try {
		const register = await prisma.register.update({
			where: {
				id: +req.params.id
			},
			data: {
				fullName,
				tabNumber,
				scores
			}
		})

		res.json(register)
	} catch (error) {
		res.status(404)
		throw new Error('Register not found!')
	}
})
export const deleteRegister = asyncHandler(async (req, res) => {
	try {
		const register = await prisma.register.delete({
			where: {
				id: +req.params.id
			}
		})

		res.json({ message: 'Register deleted!' })
	} catch (error) {
		res.status(404)
		throw new Error('Register not found!')
	}
})
