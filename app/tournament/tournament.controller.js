import asyncHandler from 'express-async-handler'
import { prisma } from '../auth/prisma.js'
import { tournamentMinutes } from './tournament-minutes.js'

export const createNewTournament = asyncHandler(async (req, res) => {
	const { name, competitionIds, registerIds } = req.body

	const data = {
		name,
		competitions: {
			connect: competitionIds.map(id => ({ id: +id }))
		}
	}

	if (registerIds && registerIds.length > 0) {
		data.registrations = {
			connect: registerIds.map(id => ({ id: +id }))
		}
	}

	const tournament = await prisma.tournament.create({
		data
	})

	res.json(tournament)
})

export const getTournaments = asyncHandler(async (req, res) => {
	const tournaments = await prisma.tournament.findMany({
		orderBy: {
			createdAt: 'desc'
		},
		include: {
			competitions: true,
			registrations: true
		}
	})

	res.json(tournaments)
})

export const getTournament = asyncHandler(async (req, res) => {
	const tournament = await prisma.tournament.findUnique({
		where: { id: +req.params.id },

		include: {
			competitions: true,
			registrations: true
		}
	})

	if (!tournament) {
		res.status(404)
		throw new Error('Tournament not found!')
	}

	const times = tournamentMinutes(tournament.competitions.length)

	res.json({ ...tournament, times })
})

export const updateTournament = asyncHandler(async (req, res) => {
	const { name, competitionIds } = req.body

	try {
		const tournament = await prisma.tournament.update({
			where: {
				id: +req.params.id
			},
			data: {
				name,
				competitions: {
					set: competitionIds.map(id => ({ id: +id }))
				}
			}
		})

		res.json(tournament)
	} catch (error) {
		res.status(404)
		throw new Error('Tournament not found!')
	}
})

export const deleteTournament = asyncHandler(async (req, res) => {
	try {
		const tournament = await prisma.tournament.delete({
			where: {
				id: +req.params.id
			}
		})

		res.json({ message: 'Tournament deleted!' })
	} catch (error) {
		res.status(404)
		throw new Error('Tournament not found!')
	}
})
