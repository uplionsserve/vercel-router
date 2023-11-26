import { MigrateUpArgs, MigrateDownArgs } from '@payloadcms/db-postgres'
import { sql } from 'drizzle-orm'

export async function up({ payload }: MigrateUpArgs): Promise<void> {
await payload.db.drizzle.execute(sql`

CREATE TABLE IF NOT EXISTS "hunger_data_programs_gallery_images" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"caption" varchar
);

CREATE INDEX IF NOT EXISTS "_order_idx" ON "hunger_data_programs_gallery_images" ("_order");
CREATE INDEX IF NOT EXISTS "_parent_id_idx" ON "hunger_data_programs_gallery_images" ("_parent_id");
DO $$ BEGIN
 ALTER TABLE "hunger_data_programs_gallery_images" ADD CONSTRAINT "hunger_data_programs_gallery_images__parent_id_hunger_data_programs_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "hunger_data_programs"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
`);

};

export async function down({ payload }: MigrateDownArgs): Promise<void> {
await payload.db.drizzle.execute(sql`

DROP TABLE "hunger_data_programs_gallery_images";`);

};
