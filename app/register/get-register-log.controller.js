import asyncHandler from 'express-async-handler'
import { prisma } from '../auth/prisma.js'

export const getRegisterLog = asyncHandler(async (req, res) => {
	const registerLog = await prisma.registerLog.findUnique({
		where: {
			id: +req.params.id
		},
		include: {
			register: true
		}
	})

	if (!registerLog) {
		res.status(404)
		throw new Error('Register Log not found')
	}
	res.json({
		...registerLog
	})
})
