import asyncHandler from 'express-async-handler'
import { prisma } from '../auth/prisma.js'

export const createNewRegisterLog = asyncHandler(async (req, res) => {
	const registerId = +req.params.id

	const register = await prisma.register.findUnique({
		where: {
			id: registerId
		}
	})

	if (!register) {
		res.status(404)
		throw new Error('Register not found')
	}

	const registerLog = await prisma.registerLog.create({
		data: {
			user: {
				connect: {
					id: req.user.id
				}
			},
			register: {
				connect: {
					id: registerId
				}
			}
		}
	})
	res.json(registerLog)
})

export const deleteRegisterLog = asyncHandler(async (req, res) => {
	try {
		const registerLog = await prisma.registerLog.delete({
			where: {
				id: +req.params.id
			}
		})

		res.json({ message: 'RegisterLog deleted!' })
	} catch (error) {
		res.status(404)
		throw new Error('RegisterLog not found!')
	}
})
