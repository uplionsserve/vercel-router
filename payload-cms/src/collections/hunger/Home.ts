import { GlobalConfig } from "payload/types"

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
}

export default Home
