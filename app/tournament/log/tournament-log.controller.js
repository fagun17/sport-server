import asyncHandler from 'express-async-handler'

import { prisma } from '../../auth/prisma.js'

// @desc    Create new workout log
// @route   POST /api/workouts/log/:id
// @access  Private
export const createNewTournamentLog = asyncHandler(async (req, res) => {
	const tournamentId = +req.params.id

	const tournament = await prisma.tournament.findUnique({
		where: {
			id: tournamentId
		},

		include: {
			registrations: true,
			competitions: true
		}
	})

	if (!tournament) {
		res.status(404)
		throw new Error('Tournament not found!')
	}

	const tournamentLog = await prisma.tournamentLog.create({
		data: {
			user: {
				connect: {
					id: req.user.id
				}
			},
			tournament: {
				connect: {
					id: tournamentId
				}
			},
			registerLogs: {
				create: tournament.registrations.map(register => ({
					user: {
						connect: {
							id: req.user.id
						}
					},
					register: {
						connect: {
							id: register.id
						}
					}
				}))
			},

			competitionLogs: {
				create: tournament.competitions.map(competition => ({
					user: {
						connect: {
							id: req.user.id
						}
					},
					competition: {
						connect: {
							id: competition.id
						}
					},
					times: {
						create: Array.from({ length: competition.times }, () => ({
							comandOne: 0,
							comandTwo: 0
						}))
					}
				}))
			}
		},
		include: {
			competitionLogs: {
				include: {
					times: true
				}
			}
		}
	})

	res.json(tournamentLog)
})
