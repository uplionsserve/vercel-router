import { CollectionConfig } from "payload/types"
import { triggerHungerRegeneration } from "../../helpers"

const Programs: CollectionConfig = {
	slug: "hunger-data-partners",
	labels: {
		singular: "Partner",
		plural: "Partners",
	},
	admin: {
		group: "Hunger Data",
		useAsTitle: "name",
	},
	access: {
		read: () => true,
	},
	defaultSort: "name",
	fields: [
		{
			name: "logo_image",
			label: "Logo Image",
			type: "upload",
			relationTo: "hunger-data-media",
		},
		{
			name: "name",
			type: "text",
			required: true,
		},
		{
			name: "link",
			type: "text",
		},
	],
	hooks: {
		afterChange: [() => triggerHungerRegeneration()],
	},
}

export default Programs
