import { GlobalConfig } from "payload/types"

const Home: GlobalConfig = {
	slug: "hunger-pages-about",
	label: "About",
	admin: {
		group: "Hunger Pages",
	},
	access: {
		read: () => true,
	},
	fields: [
		{
			name: "mission_statement",
			label: "Mission Statement",
			type: "richText",
		},
		{
			name: "vision_statement",
			label: "Vision Statement",
			type: "richText",
		},
	],
}

export default Home
