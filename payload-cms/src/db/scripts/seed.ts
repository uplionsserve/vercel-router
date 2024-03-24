import path from "path"
import dotenv from "dotenv"
import payload from "payload"

import seedChildhoodCancer from "@/db/seeders/childhoodCancerSeeder"

dotenv.config()

const seed = async (): Promise<void> => {
	await payload.init({
		secret: process.env.PAYLOAD_SECRET,
		local: true,
		onInit: async () => {
			console.log("🌰 Running seeders...")
		},
	})

	await seedChildhoodCancer(payload)

	console.log("🪴 Seeding complete")
}

seed()
