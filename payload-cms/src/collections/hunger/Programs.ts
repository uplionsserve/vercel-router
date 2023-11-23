import { CollectionConfig } from "payload/types"
import { toKebabCase } from "../helpers"
import { lexicalHTML } from "@payloadcms/richtext-lexical"
import { triggerHungerRegeneration } from "../../helpers"

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
			name: "logo_image",
			label: "Logo Image",
			type: "upload",
			relationTo: "hunger-data-media",
		},
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
		{
			name: "cta_button",
			label: "Call To Action Button",
			type: "group",
			fields: [
				{
					name: "text",
					type: "text",
				},
				{
					name: "url",
					type: "text",
				},
			],
		},
		lexicalHTML("description", { name: "description_html" }),
	],
	hooks: {
		afterChange: [() => triggerHungerRegeneration()],
	},
}

export default Programs
