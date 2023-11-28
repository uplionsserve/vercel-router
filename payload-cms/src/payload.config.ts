import path from "path"

import { postgresAdapter } from "@payloadcms/db-postgres"
import { webpackBundler } from "@payloadcms/bundler-webpack"
import {
	HTMLConverterFeature,
	lexicalEditor,
} from "@payloadcms/richtext-lexical"
import { buildConfig } from "payload/config"

/* App-wide */
import { Icon, Logo } from "./components/Icon"
import Users from "./collections/Users"
import Keys from "./collections/Keys"

import cc from "./collections/childhood-cancer/pages"
import hunger from "./collections/hunger"

export default buildConfig({
	serverURL: process.env.SERVER_URL,
	admin: {
		user: Users.slug,
		bundler: webpackBundler(),
		meta: {
			titleSuffix: "- U.P. Lions Serve CMS",
			favicon: "/assets/icon-circle.png",
		},
		components: {
			graphics: { Icon, Logo },
		},
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

	collections: [Users, Keys, ...hunger.collections],
	globals: [...hunger.pages],

	typescript: {
		outputFile: path.resolve(__dirname, "payload-types.ts"),
	},
	graphQL: {
		schemaOutputFile: path.resolve(__dirname, "generated-schema.graphql"),
	},
})
