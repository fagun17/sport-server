import asyncHandler from 'express-async-handler'

import { prisma } from '../../auth/prisma.js'
import { tournamentMinutes } from '../tournament-minutes.js'

// @desc    Get workout log
// @route   GET /api/workouts/log/:id
// @access  Private
export const getTournamentLog = asyncHandler(async (req, res) => {
	const tournamentLog = await prisma.tournamentLog.findUnique({
		where: {
			id: +req.params.id
		},
		include: {
			tournament: {
				include: {
					competitions: true,
					registrations: true
				}
			},
			registerLogs: {
				orderBy: {
					id: 'asc'
				},
				include: {
					register: true
				}
			},
			competitionLogs: {
				orderBy: {
					id: 'asc'
				},
				include: {
					competition: true
				}
			}
		}
	})

	if (!tournamentLog) {
		res.status(404)
		throw new Error('Tournament Log not found!')
	}

	res.json({
		...tournamentLog,
		minute: tournamentMinutes(tournamentLog.tournament.competitions.length)
	})
})
