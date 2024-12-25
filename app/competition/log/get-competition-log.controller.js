//@desc  Get exerciseLog
//@route GET /api/exercises/log/:id
// @access Private
import asyncHandler from 'express-async-handler'
import { prisma } from '../../auth/prisma.js'
import { addPrevValues } from './add-prev-values.util.js'

export const getCompetitionLog = asyncHandler(async (req, res) => {
	const competitionLog = await prisma.competitionLog.findUnique({
		where: {
			id: +req.params.id
		},
		include: {
			competition: true,
			times: {
				orderBy: {
					id: 'asc'
				}
			}
		}
	})

	if (!competitionLog) {
		res.status(404)
		throw new Error('Competition Log not found!')
	}
	const prevCompetitionLog = await prisma.competitionLog.findFirst({
		where: {
			competitionId: competitionLog.competitionId,
			userId: +req.user.id,
			isCompleted: true
		},
		orderBy: {
			createdAt: 'desc'
		},
		include: {
			times: true
		}
	})

	const newTimes = addPrevValues(competitionLog, prevCompetitionLog)

	res.json({
		...competitionLog,
		times: addPrevValues(competitionLog, prevCompetitionLog)
	})
})
