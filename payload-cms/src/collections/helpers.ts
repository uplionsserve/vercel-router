import { User } from "payload/auth"

export function isAdmin(user: any): boolean {
	return user.roles?.admin ?? false
}

export function hasAccess(user: any, website: string): boolean {
	return user.website_access?.includes(website) || false
}

export function toKebabCase(str: string): string {
	return (
		str &&
		str
			.match(
				/[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+/g
			)
			.map((x) => x.toLowerCase())
			.join("-")
	)
}
