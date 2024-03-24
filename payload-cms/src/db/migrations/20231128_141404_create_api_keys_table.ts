import { MigrateUpArgs, MigrateDownArgs } from '@payloadcms/db-postgres'
import { sql } from 'drizzle-orm'

export async function up({ payload }: MigrateUpArgs): Promise<void> {
await payload.db.drizzle.execute(sql`

CREATE TABLE IF NOT EXISTS "api_keys" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"enable_a_p_i_key" boolean,
	"api_key" varchar,
	"api_key_index" varchar
);

ALTER TABLE "payload_preferences_rels" ADD COLUMN "api_keys_id" integer;
CREATE INDEX IF NOT EXISTS "created_at_idx" ON "api_keys" ("created_at");
DO $$ BEGIN
 ALTER TABLE "payload_preferences_rels" ADD CONSTRAINT "payload_preferences_rels_api_keys_id_api_keys_id_fk" FOREIGN KEY ("api_keys_id") REFERENCES "api_keys"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
`);

};

export async function down({ payload }: MigrateDownArgs): Promise<void> {
await payload.db.drizzle.execute(sql`

ALTER TABLE "payload_preferences_rels" DROP CONSTRAINT "payload_preferences_rels_api_keys_id_api_keys_id_fk";

DROP TABLE "api_keys";
ALTER TABLE "payload_preferences_rels" DROP COLUMN IF EXISTS "api_keys_id";`);

};
