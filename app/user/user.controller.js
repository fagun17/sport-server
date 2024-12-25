import asyncHandler from 'express-async-handler'
import { prisma } from '../auth/prisma.js'
import { UserFields } from '../utils/user.utils.js'
// desc GET user profile
// route GET /api/users/profile
// @access Private
export const getUserProfile = asyncHandler(async (req, res) => {
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
})

export const getUsers = asyncHandler(async (req, res) => {
	const users = await prisma.user.findMany({
		orderBy: {
			createdAt: 'desc'
		}
	})

	res.json(users)
})

export const updateUser = asyncHandler(async (req, res) => {
	const { key2 } = req.body

	try {
		const user = await prisma.user.update({
			where: {
				id: +req.params.id
			},
			data: {
				key2
			}
		})

		res.json(user)
	} catch (error) {
		res.status(404)
		throw new Error('User not found!')
	}
})

export const deleteUser = asyncHandler(async (req, res) => {
	try {
		const user = await prisma.user.delete({
			where: {
				id: +req.params.id
			}
		})

		res.json({ message: 'User deleted!' })
	} catch (error) {
		res.status(404)
		throw new Error('User not found!')
	}
})
