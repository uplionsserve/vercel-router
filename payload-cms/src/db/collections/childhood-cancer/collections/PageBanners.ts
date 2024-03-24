import { isAdmin } from "@/utils/authCheckers"
import { CollectionConfig } from "payload/types"

const PageBanners: CollectionConfig = {
	slug: "page-banners",
	labels: {
		singular: "Page Banner",
		plural: "Page Banners",
	},
	admin: {
		useAsTitle: "name",
		defaultColumns: ["name", "url"],
	},
	access: {
		create: ({ req: { user } }) => isAdmin(user),
	},
	fields: [
		{
			name: "name",
			type: "text",
			required: true,
		},
		{
			name: "url",
			label: "URL",
			type: "text",
			required: true,
			validate: (value: string) => {
				if (!/\/[a-z\d-+_]+/i.test(value)) {
					return "URL must start with a '/' and be url-safe."
				}

				return true
			},
			access: {
				update: ({ req: { user } }) => isAdmin(user),
			},
		},
		{
			name: "banner",
			type: "upload",
			relationTo: "cc-data-media",
			required: true,
			admin: {
				description: "Must be 1920px x 540px.",
			},
		},
	],
}

export default PageBanners
