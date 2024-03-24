export function isAdmin(user: any): boolean {
	return user?.roles?.admin ?? false
}

export function hasAccess(user: any, website: string): boolean {
	return user?.website_access?.includes(website) ?? false
}
