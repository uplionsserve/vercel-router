import Media from "./Media"
import About from "./About"
import Home from "./Home"
import Partners from "./Partners"
import Programs from "./Programs"
import Donate from "./Donate"
import { hasAccess, isAdmin } from "../helpers"

const HungerData = {
	pages: [Home, About, Donate],
	collections: [Programs, Partners, Media],
}

HungerData.pages = HungerData.pages.map((page) => ({
	...page,
	admin: {
		...page.admin,
		hidden: ({ user }) => !hasAccess(user, "Hunger"),
		hideAPIURL: true,
	},
	access: {
		read: () => true,
		update: ({ req: { user } }) => hasAccess(user, "Hunger"),
	},
}))

HungerData.collections = HungerData.collections.map((collection) => ({
	...collection,
	admin: {
		...collection.admin,
		hidden: ({ user }) => !hasAccess(user, "Hunger"),
		hideAPIURL: true,
	},
	access: {
		read: () => true,
		update: ({ req: { user } }) => hasAccess(user, "Hunger"),
	},
}))

export default HungerData
