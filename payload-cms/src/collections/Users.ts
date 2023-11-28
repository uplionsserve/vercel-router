import { CollectionConfig } from "payload/types"
import { isAdmin } from "./helpers"

const Users: CollectionConfig = {
	slug: "users",
	admin: {
		useAsTitle: "name.full",
		hidden: ({ user }) => !isAdmin(user),
		group: "Administration",
	},
	auth: true,
	access: {
		create: ({ req: { user } }) => isAdmin(user),
	},
	fields: [
		{
			name: "name",
			type: "group",
			fields: [
				{
					name: "first",
					type: "text",
				},
				{
					name: "last",
					type: "text",
				},
				{
					name: "full",
					type: "text",
					hidden: true,
					hooks: {
						afterRead: [
							({ data }) => {
								return `${data.name.first} ${data.name.last}`
							},
						],
					},
				},
			],
		},
		{
			name: "roles",
			type: "group",
			access: {
				read: ({ req: { user } }) => isAdmin(user),
			},
			fields: [
				{
					name: "admin",
					type: "checkbox",
				},
			],
		},
		{
			name: "website_access",
			label: "Website Access",
			type: "select",
			hasMany: true,
			options: ["U.P. Lions Serve", "Childhood Cancer", "Hunger"],
		},
	],
}

export default Users
