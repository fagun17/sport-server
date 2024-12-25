import asyncHandler from 'express-async-handler'
import { prisma } from '../auth/prisma.js'

export const createNewCompetition = asyncHandler(async (req, res) => {
	const { name, times, iconSport, data, names, comandOne, comandTwo } = req.body

	const competition = await prisma.competition.create({
		data: {
			name,
			times,
			iconSport,
			data,
			names,
			comandOne,
			comandTwo
		}
	})

	res.json(competition)
})

export const getCompetitions = asyncHandler(async (req, res) => {
	const competitions = await prisma.competition.findMany({
		orderBy: {
			createdAt: 'desc'
		}
	})

	res.json(competitions)
})

export const updateCompetition = asyncHandler(async (req, res) => {
	const { name, times, iconSport, data, names, comandOne, comandTwo } = req.body

	try {
		const competition = await prisma.competition.update({
			where: {
				id: +req.params.id
			},
			data: {
				name,
				times,
				iconSport,
				data,
				names,
				comandOne,
				comandTwo
			}
		})

		res.json(competition)
	} catch (error) {
		res.status(404)
		throw new Error('Competition not found!')
	}
})

export const deleteCompetition = asyncHandler(async (req, res) => {
	try {
		const competition = await prisma.competition.delete({
			where: {
				id: +req.params.id
			}
		})

		res.json({ message: 'Competition deleted!' })
	} catch (error) {
		res.status(404)
		throw new Error('Competition not found!')
	}
})
