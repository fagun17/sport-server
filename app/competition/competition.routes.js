import express from 'express'

import { protect } from '../middleware/auth.middleware.js'
import {
	createNewCompetition,
	deleteCompetition,
	getCompetitions,
	updateCompetition
} from './competition.controller.js'
import { createNewCompetitionLog } from './log/competition-log.controller.js'
import { getCompetitionLog } from './log/get-competition-log.controller.js'
import {
	completeCompetitionLog,
	updateCompetitionLogTime
} from './log/update-competition-log.controller.js'

const router = express.Router()

router
	.route('/')
	.post(protect, createNewCompetition)
	.get(protect, getCompetitions)
router
	.route('/:id')
	.put(protect, updateCompetition)
	.delete(protect, deleteCompetition)

router
	.route('/log/:id')
	.post(protect, createNewCompetitionLog)
	.get(protect, getCompetitionLog)

router.route('/log/time/:id').put(protect, updateCompetitionLogTime)

router.route('/log/complete/:id').patch(protect, completeCompetitionLog)

export default router
