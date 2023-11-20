import { CollectionConfig } from "payload/types"
import { toKebabCase } from "../helpers"

const Programs: CollectionConfig = {
	slug: "programs",
	admin: {
		group: "Hunger",
	},
	access: {
		read: () => true,
	},
	defaultSort: "id",
	fields: [
		{
			name: "title",
			type: "text",
			required: true,
		},
		{
			name: "title_id",
			type: "text",
			hidden: true,
			hooks: {
				afterRead: [({ data }) => toKebabCase(data.title)],
			},
		},
		{
			name: "home_page_description",
			label: "Home Page Description",
			type: "text",
			required: true,
		},
		{
			name: "description",
			type: "richText",
			required: true,
		},
	],
}

export default Programs
