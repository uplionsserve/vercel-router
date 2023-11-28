import { GlobalConfig } from "payload/types"
import { lexicalHTML } from "@payloadcms/richtext-lexical"
import { triggerHungerRegeneration } from "../../helpers"

const About: GlobalConfig = {
	slug: "hunger-pages-about",
	label: "About",
	admin: {
		group: "Hunger Pages",
	},
	fields: [
		{
			name: "mission_statement",
			label: "Mission Statement",
			type: "richText",
		},
		{
			name: "mission_cta_button",
			label: "Mission Call To Action Button",
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
		{
			name: "vision_statement",
			label: "Vision Statement",
			type: "richText",
		},
		lexicalHTML("mission_statement", { name: "mission_statement_html" }),
		lexicalHTML("vision_statement", { name: "vision_statement_html" }),
	],
	hooks: {
		afterChange: [triggerHungerRegeneration],
	},
}

export default About
