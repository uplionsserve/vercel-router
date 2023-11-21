import path from "path"

import { postgresAdapter } from "@payloadcms/db-postgres"
import { webpackBundler } from "@payloadcms/bundler-webpack"
import {
	HTMLConverterFeature,
	lexicalEditor,
} from "@payloadcms/richtext-lexical"
import { buildConfig } from "payload/config"

/* App-wide */
import Users from "./collections/Users"

import cc from "./collections/childhood-cancer/pages"

/* Hunger */
import hunger from "./collections/hunger"

export default buildConfig({
	admin: {
		user: Users.slug,
		bundler: webpackBundler(),
	},
	db: postgresAdapter({
		pool: {
			connectionString:
				process.env.NODE_ENV === "development"
					? process.env.DATABASE_URI_DEV
					: process.env.DATABASE_URI_PROD,
		},
	}),

	editor: lexicalEditor({
		features: ({ defaultFeatures }) => [
			...defaultFeatures,
			// The HTMLConverter Feature is the feature which manages the HTML serializers. If you do not pass any arguments to it, it will use the default serializers.
			HTMLConverterFeature(),
		],
	}),

	collections: [Users, ...hunger.collections],
	globals: [...hunger.pages],

	typescript: {
		outputFile: path.resolve(__dirname, "payload-types.ts"),
	},
	graphQL: {
		schemaOutputFile: path.resolve(__dirname, "generated-schema.graphql"),
	},
})
