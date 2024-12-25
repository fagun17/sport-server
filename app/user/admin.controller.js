import asyncHandler from 'express-async-handler'
import { prisma } from '../auth/prisma.js'
import { UserFields } from '../utils/user.utils.js'
// desc GET user profile
// route GET /api/users/profile
// @access Private
export const getAdminProfile = asyncHandler(async (req, res) => {
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
				label: 'Всего событий',
				value: Math.ceil(countCompetitionTimesCompleted * 1) || 0
			},
			{
				label: 'Завершенные события',
				value: tournaments || 0
			}
		]
	})
})
