import { GlobalConfig } from "payload/types"

const Home: GlobalConfig = {
	slug: "hunger_home",
	label: "Home",
	access: {
		read: () => true,
	},
	admin: {
		group: "Hunger",
		description: "Hunger home page",
	},
	fields: [
		{
			name: "title",
			label: "Title",
			type: "text",
			required: true,
		},
		{
			name: "programs",
			label: "Programs",
			admin: {
				components: {
					RowLabel: ({ data }) => data.name,
				},
			},
			type: "array",
			fields: [
				{
					name: "name",
					type: "text",
					required: true,
				},
				{
					name: "description",
					type: "richText",
					required: true,
				},
			],
		},
	],
}

export default Home
