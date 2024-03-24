import { MigrateUpArgs, MigrateDownArgs } from '@payloadcms/db-postgres'
import { sql } from 'drizzle-orm'

export async function up({ payload }: MigrateUpArgs): Promise<void> {
await payload.db.drizzle.execute(sql`

DO $$ BEGIN
 CREATE TYPE "enum_api_keys_website_access" AS ENUM('U.P. Lions Serve', 'Childhood Cancer', 'Hunger');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

CREATE TABLE IF NOT EXISTS "api_keys_website_access" (
	"order" integer NOT NULL,
	"parent_id" integer NOT NULL,
	"value" "enum_api_keys_website_access",
	"id" serial PRIMARY KEY NOT NULL
);

CREATE INDEX IF NOT EXISTS "order_idx" ON "api_keys_website_access" ("order");
CREATE INDEX IF NOT EXISTS "parent_idx" ON "api_keys_website_access" ("parent_id");
DO $$ BEGIN
 ALTER TABLE "api_keys_website_access" ADD CONSTRAINT "api_keys_website_access_parent_id_api_keys_id_fk" FOREIGN KEY ("parent_id") REFERENCES "api_keys"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
`);

};

export async function down({ payload }: MigrateDownArgs): Promise<void> {
await payload.db.drizzle.execute(sql`

DROP TABLE "api_keys_website_access";`);

};
