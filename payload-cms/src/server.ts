import express from "express"
import payload from "payload"

require("dotenv").config()
const app = express()

const port = (process.env.PORT as unknown as number) || 3000
const host = process.env.HOST || "localhost"

const start = async () => {
	// Initialize Payload
	await payload.init({
		secret: process.env.PAYLOAD_SECRET,
		express: app,
		onInit: async () => {
			payload.logger.info(`Payload Admin URL: ${payload.getAdminURL()}`)
		},
	})

	// Add your own express routes here

	app.listen(port, host, () => {})
}

start()
