import { Field } from "payload/types"

const bannerField: Field = {
	name: "banner_image",
	label: "Banner Image",
	type: "upload",
	relationTo: "cc-data-media",
}

export default bannerField
