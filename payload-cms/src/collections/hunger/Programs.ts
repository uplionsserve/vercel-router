import { CollectionConfig } from "payload/types"
import { toKebabCase } from "../helpers"
import { lexicalHTML } from "@payloadcms/richtext-lexical"

const Programs: CollectionConfig = {
	slug: "hunger-data-programs",
	labels: {
		singular: "Program",
		plural: "Programs",
	},
	admin: {
		group: "Hunger Data",
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
		lexicalHTML("description", { name: "description_html" }),
	],
}

export default Programs
