import express from 'express'
import { protect } from '../middleware/auth.middleware.js'

import {
	createNewRecord,
	deleteRecord,
	getRecord,
	getRecords,
	updateRecord
} from './record.controller.js'

const router = express.Router()

router.route('/').post(protect, createNewRecord).get(protect, getRecords)

router
	.route('/:id')
	.put(protect, updateRecord)
	.delete(protect, deleteRecord)
	.get(protect, getRecord)

export default router
