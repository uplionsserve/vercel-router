import { CollectionConfig } from "payload/types"
import { isAdmin } from "@/utils/authCheckers"

const Keys: CollectionConfig = {
	slug: "api-keys",
	labels: {
		singular: "API Key",
		plural: "API Keys",
	},
	auth: {
		useAPIKey: true,
		disableLocalStrategy: true,
	},
	admin: {
		group: "Administration",
		useAsTitle: "name",
		defaultColumns: ["name"],
		hidden: ({ user }) => !isAdmin(user),
	},
	fields: [
		{
			name: "name",
			type: "text",
			required: true,
		},
		{
			name: "website_access",
			label: "Website Access",
			type: "select",
			hasMany: true,
			options: ["U.P. Lions Serve", "Childhood Cancer", "Hunger"],
			required: true,
		},
	],
}

export default Keys
