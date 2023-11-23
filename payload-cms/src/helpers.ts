/**
 * Triggers hunger regeneration.
 * @returns {Promise<boolean>} A promise that resolves to a boolean indicating if the request was successful.
 */
export async function triggerHungerRegeneration(): Promise<boolean> {
	if (process.env.TRIGGER_HUNGER_REGENERATION_URL) {
		const res = await fetch(process.env.TRIGGER_HUNGER_REGENERATION_URL)
		return res.ok
	}

	return false
}
