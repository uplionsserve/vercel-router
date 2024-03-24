import { MigrateUpArgs, MigrateDownArgs } from '@payloadcms/db-postgres'
import { sql } from 'drizzle-orm'

export async function up({ payload }: MigrateUpArgs): Promise<void> {
await payload.db.drizzle.execute(sql`

CREATE TABLE IF NOT EXISTS "hunger_pages_donate" (
	"id" serial PRIMARY KEY NOT NULL,
	"donate_statement" jsonb,
	"donate_cta_button_text" varchar,
	"donate_cta_button_url" varchar,
	"donate_statement_html" varchar,
	"updated_at" timestamp(3) with time zone,
	"created_at" timestamp(3) with time zone
);
`);

};

export async function down({ payload }: MigrateDownArgs): Promise<void> {
await payload.db.drizzle.execute(sql`

DROP TABLE "hunger_pages_donate";`);

};
