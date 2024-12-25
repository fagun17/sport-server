import express from 'express'

import { protect } from '../middleware/auth.middleware.js'

import { getAdminProfile } from './admin.controller.js'
import {
	deleteUser,
	getUserProfile,
	getUsers,
	updateUser
} from './user.controller.js'

const router = express.Router()

router.route('/profile').get(protect, getUserProfile)
router.route('/admin').get(protect, getAdminProfile)
router.route('/').get(protect, getUsers)
router.route('/:id').put(protect, updateUser).delete(protect, deleteUser)
export default router
