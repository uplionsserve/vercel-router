import { CollectionAfterChangeHook, GlobalAfterChangeHook } from "payload/types"
import { hasAccess } from "@/utils/authCheckers"
import { triggerHungerRegeneration } from "@/utils/staticSiteRegenerators"
import Media from "./Media"
import About from "./About"
import Home from "./Home"
import Partners from "./Partners"
import Programs from "./Programs"
import Donate from "./Donate"

const HungerData = {
	pages: [Home, About, Donate],
	collections: [Programs, Partners, Media],
}

HungerData.pages = HungerData.pages.map((page) => ({
	...page,
	admin: {
		...page.admin,
		hidden: ({ user }) => !hasAccess(user, "Hunger"),
		hideAPIURL: process.env.NODE_ENV === "production",
	},
	access: {
		read: ({ req: { user } }) => hasAccess(user, "Hunger"),
		update: ({ req: { user } }) => hasAccess(user, "Hunger"),
		...page.access,
	},
	hooks: {
		afterChange: [
			({ doc }): GlobalAfterChangeHook => {
				triggerHungerRegeneration()
				return doc
			},
		],
	},
}))

HungerData.collections = HungerData.collections.map((collection) => ({
	...collection,
	admin: {
		...collection.admin,
		hidden: ({ user }) => !hasAccess(user, "Hunger"),
		hideAPIURL: process.env.NODE_ENV === "production",
	},
	access: {
		read: ({ req: { user } }) => hasAccess(user, "Hunger"),
		update: ({ req: { user } }) => hasAccess(user, "Hunger"),
		...collection.access,
	},
	hooks: {
		afterChange: [
			({ doc }): CollectionAfterChangeHook => {
				triggerHungerRegeneration()
				return doc
			},
		],
		afterDelete: [triggerHungerRegeneration],
	},
}))

export default HungerData
