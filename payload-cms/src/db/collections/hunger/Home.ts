import { GlobalConfig } from "payload/types"
import { triggerHungerRegeneration } from "@/utils/staticSiteRegenerators"

const Home: GlobalConfig = {
	slug: "hunger-pages-home",
	label: "Home",
	admin: {
		group: "Hunger Pages",
	},
	access: {
		read: () => true,
	},
	fields: [
		{
			name: "title",
			type: "text",
			required: true,
		},
	],
	hooks: {
		afterChange: [() => triggerHungerRegeneration()],
	},
}

export default Home
