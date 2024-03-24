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
import Users from "@/db/collections/administration/Users"
import Keys from "@/db/collections/administration/Keys"

/* Websites */
import cc from "@/db/collections/childhood-cancer"
import hunger from "@/db/collections/hunger"

export default buildConfig({
	// Database objects
	collections: [Users, Keys, ...cc.collections, ...hunger.collections],
	globals: [...cc.pages, ...hunger.pages],

	// Payload Settings
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
		webpack: (config) => ({
			...config,
			resolve: {
				...config.resolve,
				alias: {
					...config.resolve.alias,
					"@": path.resolve(__dirname, "./"),
				},
			},
		}),
	},

	// Database settings
	db: postgresAdapter({
		pool: {
			connectionString:
				process.env.NODE_ENV === "development"
					? process.env.DATABASE_URI_DEV
					: process.env.DATABASE_URI_PROD,
		},
		migrationDir: "./src/db/migrations",
	}),

	// Rich Text Editor settings
	editor: lexicalEditor({
		features: ({ defaultFeatures }) => [
			...defaultFeatures,
			// The HTMLConverter Feature is the feature which manages the HTML serializers. If you do not pass any arguments to it, it will use the default serializers.
			HTMLConverterFeature(),
		],
	}),

	typescript: {
		outputFile: path.resolve(__dirname, "payload-types.ts"),
	},

	graphQL: {
		schemaOutputFile: path.resolve(__dirname, "generated-schema.graphql"),
	},
})
