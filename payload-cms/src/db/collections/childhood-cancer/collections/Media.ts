import { CollectionConfig } from "payload/types"
import CategorySelectField from "../fields/CategorySelectField"

const Media: CollectionConfig = {
	slug: "media",
	labels: {
		singular: "Media",
		plural: "Media",
	},
	access: {
		read: () => true,
	},
	fields: [
		{
			type: "row",
			fields: [
				{
					name: "alt",
					type: "text",
				},
				CategorySelectField,
				{
					name: "photo_gallery",
					label: "Show in Photo Gallery",
					type: "checkbox",
				},
			],
		},
	],
	upload: {
		staticDir: `${process.env.MEDIA_DIR}/childhood-cancer`,
		mimeTypes: ["image/*", "application/pdf"],
		imageSizes: [
			{
				name: "thumbnail",
				withoutEnlargement: false,
				width: 240,
			},
		],
	},
}

export default Media
