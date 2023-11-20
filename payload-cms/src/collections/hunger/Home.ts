import { GlobalConfig } from "payload/types"

const Home: GlobalConfig = {
	slug: "hunger_home",
	label: "Home",
	access: {
		read: () => true,
	},
	admin: {
		group: "Hunger",
	},
	fields: [
		{
			name: "title",
			type: "text",
			required: true,
		},
	],
}

export default Home
