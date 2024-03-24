import path from "path"
import express from "express"
import payload from "payload"

require("dotenv").config()
const app = express()

const port = (process.env.PORT as unknown as number) || 3000
const host = process.env.HOST || "localhost"

const start = async () => {
	app.get("/", (_, res) => {
		res.redirect(process.env.SERVER_URL || "/admin")
	})

	app.use("/assets", express.static(path.resolve(__dirname, "./assets")))

	// Initialize Payload
	await payload.init({
		secret: process.env.PAYLOAD_SECRET,
		express: app,
		onInit: async () => {
			payload.logger.info(`Payload Admin URL: ${payload.getAdminURL()}`)
		},

		// email: {
		// 	fromName: "Admin",
		// 	fromAddress: "admin@example.com",
		// 	logMockCredentials: true,
		// },
	})

	// Add your own express routes here

	app.listen(port, host, () => {})
}

start()
