import * as React from "react"
import { Field } from "payload/types"
import { CcDataCategory } from "payload/generated-types"
import { PaginatedDocs } from "payload/database"
import { SelectInput, useField } from "payload/components/forms"
import { toKebabCase } from "@/utils/caseTransformers"

const CategorySelectComponent: React.FC<{ path: string }> = ({ path }) => {
	const { value, setValue } = useField<string>({ path })
	const [options, setOptions] = React.useState([])

	React.useEffect(() => {
		const loadOptions = async () => {
			try {
				const tagsRes = await fetch(
					`${window.location.origin}/api/cc-data-categories?sort=name`
				)
				const tags: PaginatedDocs<CcDataCategory> = await tagsRes.json()

				const tagOptions = tags.docs.map((tag) => ({
					label: tag.name,
					value: toKebabCase(tag.name),
				}))

				setOptions(tagOptions)
			} catch (error) {
				console.log("Error loading tags:", error)
			}
		}

		loadOptions()
	}, [])

	return (
		<div>
			<label className="field-label">Category</label>
			<SelectInput
				path={path}
				name={path}
				options={options}
				value={value}
				onChange={(e) => setValue(e?.value ?? null)}
			/>
		</div>
	)
}

const CategorySelectField: Field = {
	name: "category",
	type: "text",
	admin: {
		components: {
			Field: CategorySelectComponent,
		},
	},
}

export default CategorySelectField
