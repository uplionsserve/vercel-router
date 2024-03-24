import { CollectionConfig } from "payload/types"

const Tags: CollectionConfig = {
	slug: "categories",
	labels: {
		singular: "Category",
		plural: "Categories",
	},
	admin: {
		useAsTitle: "name",
		defaultColumns: ["name"],
	},
	fields: [
		{
			name: "name",
			type: "text",
			required: true,
			unique: true,
		},
	],
}

export default Tags
