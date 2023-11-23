import { CollectionConfig } from "payload/types"
import { triggerHungerRegeneration } from "../../helpers"

const Media: CollectionConfig = {
	slug: "hunger-data-media",
	labels: {
		singular: "Media",
		plural: "Media",
	},
	admin: {
		group: "Hunger Data",
	},
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
		staticDir: process.env.MEDIA_DIR || undefined,
		mimeTypes: ["image/*", "application/pdf"],
		imageSizes: [
			{
				name: "thumbnail",
				width: 400,
				height: 300,
				position: "centre",
			},
			{
				name: "logo",
				width: 512,
				height: 512,
				position: "centre",
				withoutEnlargement: false,
			},
		],
	},
	hooks: {
		afterChange: [() => triggerHungerRegeneration()],
	},
}

export default Media
