import { CollectionConfig } from "payload/types"
import { isAdmin } from "./helpers"

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
	],
}

export default Keys
