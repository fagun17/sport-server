import asyncHandler from 'express-async-handler'
import { prisma } from '../auth/prisma.js'

export const createNewRecord = asyncHandler(async (req, res) => {
	const {
		names,
		lastNames,
		nameNames,
		viewHalls,
		typeWorkouts,
		coaches,
		viewWorkouts,
		dateTime,
		timeDate
	} = req.body

	const record = await prisma.record.create({
		data: {
			names,
			lastNames,
			nameNames,
			viewHalls,
			typeWorkouts,
			coaches,
			viewWorkouts,
			dateTime,
			timeDate
		}
	})

	res.json(record)
})
export const getRecord = asyncHandler(async (req, res) => {
	const record = await prisma.record.findUnique({
		where: {
			id: +req.params.id
		}
	})

	if (!record) {
		res.status(404)
		throw new Error('RECORD not found!')
	}
})
export const getRecords = asyncHandler(async (req, res) => {
	const records = await prisma.record.findMany({
		orderBy: {
			createdAt: 'desc'
		}
	})

	res.json(records)
})

export const updateRecord = asyncHandler(async (req, res) => {
	const {
		names,
		lastNames,
		nameNames,
		viewHalls,
		typeWorkouts,
		coaches,
		viewWorkouts,
		dateTime,
		timeDate
	} = req.body

	try {
		const record = await prisma.record.update({
			where: {
				id: +req.params.id
			},
			data: {
				names,
				lastNames,
				nameNames,
				viewHalls,
				typeWorkouts,
				coaches,
				viewWorkouts,
				dateTime,
				timeDate
			}
		})

		res.json(record)
	} catch (error) {
		res.status(404)
		throw new Error('Record not found!')
	}
})
export const deleteRecord = asyncHandler(async (req, res) => {
	try {
		const record = await prisma.record.delete({
			where: {
				id: +req.params.id
			}
		})

		res.json({ message: 'Record deleted!' })
	} catch (error) {
		res.status(404)
		throw new Error('Record not found!')
	}
})
