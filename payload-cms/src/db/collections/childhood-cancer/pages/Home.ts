import { GlobalConfig } from "payload/types"

const Home: GlobalConfig = {
	slug: "home",
	label: "Home",
	access: {
		read: () => true,
	},
	admin: {
		description: "Childhood Cancer home page",
	},
	fields: [
		// {
		// 	name: "hero_banner",
		// 	label: "Banner",
		// 	type: "group",
		// 	fields: [
		// 		{
		// 			name: "title",
		// 			label: "Title",
		// 			type: "text",
		// 			required: true,
		// 		},
		// 		{
		// 			name: "subtitle_1",
		// 			label: "Subtitle 1",
		// 			type: "text",
		// 			required: true,
		// 		},
		// 		{
		// 			name: "subtitle_2",
		// 			label: "Subtitle 2",
		// 			type: "text",
		// 			required: true,
		// 		},
		// 		{
		// 			name: "cta_button",
		// 			label: "Button",
		// 			type: "group",
		// 			fields: [
		// 				{
		// 					name: "text",
		// 					type: "text",
		// 					required: true,
		// 				},
		// 				{
		// 					// TODO: Change to pages relationship
		// 					name: "link",
		// 					type: "text",
		// 					required: true,
		// 				},
		// 			],
		// 		},
		// 	],
		// },
		{
			name: "our_heroes",
			label: "Our Heroes",
			labels: {
				singular: "Hero",
				plural: "Heroes",
			},
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
					name: "image",
					type: "upload",
					relationTo: "cc-data-media",
					required: true,
					admin: {
						description: "Must be 737px x 960px.",
					},
				},
				{
					name: "summary",
					type: "text",
					required: true,
				},
				{
					name: "story",
					type: "text",
					required: true,
				},
			],
		},
	],
}

export default Home
