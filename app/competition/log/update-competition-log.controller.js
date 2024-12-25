import asyncHandler from 'express-async-handler'

import { prisma } from '../../auth/prisma.js'

// @desc    Update exercise log time
// @route   PUT /api/exercises/log/time/:id
// @access  Private
export const updateCompetitionLogTime = asyncHandler(async (req, res) => {
	const { comandOne, comandTwo, isCompleted } = req.body

	try {
		const competitionLogTime = await prisma.competitionTime.update({
			where: {
				id: +req.params.id
			},
			data: {
				comandOne,
				comandTwo,
				isCompleted
			}
		})

		res.json(competitionLogTime)
	} catch (error) {
		res.status(404)
		throw new Error('Competition log time not found!')
	}
})

// @desc    Update status of complete exercise log
// @route   PATCH /api/exercises/log/complete/:id
// @access  Private
export const completeCompetitionLog = asyncHandler(async (req, res) => {
	const { isCompleted } = req.body

	try {
		const competitionLog = await prisma.competitionLog.update({
			where: {
				id: +req.params.id
			},
			data: {
				isCompleted
			},
			include: { competition: true, tournamentLog: true }
		})

		res.json(competitionLog)
	} catch (error) {
		res.status(404)
		throw new Error('Competition log not found!')
	}
})
