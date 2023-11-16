import { CollectionConfig } from "payload/types"

const Media: CollectionConfig = {
	slug: "media",
	access: {
		read: () => true,
	},
	fields: [
		{
			name: "alt",
			type: "text",
		},
	],
	upload: {
		mimeTypes: ["image/*", "application/pdf"],
	},
}

export default Media
