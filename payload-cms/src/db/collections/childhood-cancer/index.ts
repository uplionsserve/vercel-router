import { hasAccess } from "@/utils/authCheckers"
import { triggerChildhoodCancerRegeneration } from "@/utils/staticSiteRegenerators"
import Media from "./collections/Media"
import Heroes from "./collections/Heroes"
import PageBanners from "./collections/PageBanners"
import Newsletters from "./collections/Newsletters"
import Tags from "./collections/Tags"

const CancerData = {
	pages: [],
	collections: [Media, Heroes, PageBanners, Newsletters, Tags],
}

CancerData.pages = CancerData.pages.map((page) => ({
	...page,
	slug: `cc-page-${page.slug}`,
	admin: {
		...page.admin,
		group: "Childhood Cancer Pages",
		hidden: ({ user }) => !hasAccess(user, "Childhood Cancer"),
		hideAPIURL: process.env.NODE_ENV === "production",
	},
	access: {
		read: ({ req: { user } }) => hasAccess(user, "Childhood Cancer"),
		update: ({ req: { user } }) => hasAccess(user, "Childhood Cancer"),
		...page.access, // So individually specified access rules overwrite defaults
	},
	hooks: {
		afterChange: [triggerChildhoodCancerRegeneration],
	},
}))

CancerData.collections = CancerData.collections.map((collection) => ({
	...collection,
	slug: `cc-data-${collection.slug}`,
	admin: {
		...collection.admin,
		group: "Childhood Cancer",
		hidden: ({ user }) => !hasAccess(user, "Childhood Cancer"),
		hideAPIURL: process.env.NODE_ENV === "production",
	},
	access: {
		read: ({ req: { user } }) => hasAccess(user, "Childhood Cancer"),
		update: ({ req: { user } }) => hasAccess(user, "Childhood Cancer"),
		...collection.access, // So individually specified access rules overwrite defaults
	},
	hooks: {
		afterChange: [triggerChildhoodCancerRegeneration],
		afterDelete: [triggerChildhoodCancerRegeneration],
	},
}))

export default CancerData
