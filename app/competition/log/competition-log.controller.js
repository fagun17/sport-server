// @desc  Create new exerciseLog
// @route POST /api/exercises/log/:exerciseId
// @access  Private
import asyncHandler from 'express-async-handler'
import { prisma } from '../../auth/prisma.js'

export const createNewCompetitionLog = asyncHandler(async (req, res) => {
	const competitionId = +req.params.id
	const registerId = +req.params.id
	const competition = await prisma.competition.findUnique({
		where: {
			id: competitionId
		}
	})

	if (!competition) {
		res.status(404)
		throw new Error('Competition not found!')
	}

	let timesDefault = []

	for (let i = 0; i < competition.times; i++) {
		timesDefault.push({
			comandOne: 0,
			comandTwo: 0
		})
	}

	const competitionLog = await prisma.competitionLog.create({
		data: {
			user: {
				connect: {
					id: req.user.id
				}
			},
			competition: {
				connect: {
					id: competitionId
				}
			},
			Register: {
				connect: {
					id: registerId
				}
			},
			times: {
				createMany: {
					data: timesDefault
				}
			}
		},
		include: {
			times: true
		}
	})
	res.json(competitionLog)
})
