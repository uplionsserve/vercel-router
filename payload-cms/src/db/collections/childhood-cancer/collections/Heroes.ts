import { CollectionConfig } from "payload/types"

const Heroes: CollectionConfig = {
	slug: "heroes",
	labels: {
		singular: "Hero",
		plural: "Heroes",
	},
	admin: {
		useAsTitle: "name",
		defaultColumns: ["name", "image", "summary"],
	},
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
			required: false,
			admin: {
				description: "Must be 737px x 960px.",
			},
		},
		{
			name: "summary",
			type: "textarea",
			required: true,
		},
		{
			name: "story",
			type: "textarea",
			required: true,
		},
	],
}

export default Heroes
