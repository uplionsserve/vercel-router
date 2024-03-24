import { GlobalConfig } from "payload/types"
import { lexicalHTML } from "@payloadcms/richtext-lexical"
import { triggerHungerRegeneration } from "@/utils/staticSiteRegenerators"

const Donate: GlobalConfig = {
	slug: "hunger-pages-donate",
	label: "Donate",
	admin: {
		group: "Hunger Pages",
	},
	access: {
		read: () => true,
	},
	fields: [
		{
			name: "donate_statement",
			label: "Donate Statement",
			type: "richText",
		},
		{
			name: "donate_cta_button",
			label: "Donate Call To Action Button",
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
		lexicalHTML("donate_statement", { name: "donate_statement_html" }),
	],
	hooks: {
		afterChange: [() => triggerHungerRegeneration()],
	},
}

export default Donate
