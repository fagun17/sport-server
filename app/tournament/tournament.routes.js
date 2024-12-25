import express from 'express'

import { protect } from '../middleware/auth.middleware.js'

import { getTournamentLog } from './log/get-tournament-log.controller.js'
import { createNewTournamentLog } from './log/tournament-log.controller.js'
import { updateCompleteTournamentLog } from './log/update-tournament-log.controller.js'
import {
	createNewTournament,
	deleteTournament,
	getTournament,
	getTournaments,
	updateTournament
} from './tournament.controller.js'

const router = express.Router()

router
	.route('/')
	.post(protect, createNewTournament)
	.get(protect, getTournaments)

router
	.route('/:id')
	.get(protect, getTournament)
	.put(protect, updateTournament)
	.delete(protect, deleteTournament)

router
	.route('/log/:id')
	.post(protect, createNewTournamentLog)
	.get(protect, getTournamentLog)

router.route('/log/complete/:id').patch(protect, updateCompleteTournamentLog)

export default router
