import { CollectionConfig } from "payload/types"

const Newsletters: CollectionConfig = {
	slug: "newsletters",
	labels: {
		singular: "Newsletters",
		plural: "Newsletters",
	},
	admin: {
		useAsTitle: "name",
		defaultColumns: ["name", "volume", "issue", "date"],
	},
	fields: [
		{
			name: "name",
			type: "text",
			required: true,
		},
		{
			type: "row",
			fields: [
				{
					name: "volume",
					type: "number",
					required: true,
				},
				{
					name: "issue",
					type: "number",
					required: true,
				},
				{
					name: "date",
					type: "date",
					admin: {
						date: {
							pickerAppearance: "monthOnly",
						},
					},
				},
			],
		},
		{
			name: "newsletter_file",
			type: "upload",
			relationTo: "cc-data-media",
			required: true,
		},
	],
}

export default Newsletters
