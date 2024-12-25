import asyncHandler from 'express-async-handler'

import { prisma } from '../../auth/prisma.js'

// @desc    Update workout log completed
// @route   PATCH /api/workouts/log/complete/:id
// @access  Private
export const updateCompleteTournamentLog = asyncHandler(async (req, res) => {
	const logId = +req.params.id

	try {
		const tournamentLog = await prisma.tournamentLog.update({
			where: {
				id: logId
			},
			data: {
				isCompleted: true
			}
		})

		res.json(tournamentLog)
	} catch (error) {
		res.status(404)
		throw new Error('Tournament log not found!')
	}
})
