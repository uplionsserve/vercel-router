import { GlobalConfig } from "payload/types"
import { lexicalHTML } from "@payloadcms/richtext-lexical"

const About: GlobalConfig = {
	slug: "hunger-pages-about",
	label: "About",
	admin: {
		group: "Hunger Pages",
	},
	access: {
		read: () => true,
	},
	fields: [
		{
			name: "mission_statement",
			label: "Mission Statement",
			type: "richText",
		},
		{
			name: "vision_statement",
			label: "Vision Statement",
			type: "richText",
		},
		lexicalHTML("mission_statement", { name: "mission_statement_html" }),
		lexicalHTML("vision_statement", { name: "vision_statement_html" }),
	],
}

export default About
