import express from 'express'
import { protect } from '../middleware/auth.middleware.js'

import { getRegisterLog } from './get-register-log.controller.js'
import {
	createNewRegisterLog,
	deleteRegisterLog
} from './register-log.controller.js'
import {
	createNewRegister,
	deleteRegister,
	getRegister,
	getRegisters,
	updateRegister
} from './register.controller.js'

const router = express.Router()

router.route('/').post(protect, createNewRegister).get(protect, getRegisters)
router
	.route('/log/:id')
	.post(protect, createNewRegisterLog)
	.get(protect, getRegisterLog)
	.delete(protect, deleteRegisterLog)

router
	.route('/:id')
	.put(protect, updateRegister)
	.delete(protect, deleteRegister)
	.get(protect, getRegister)

export default router
