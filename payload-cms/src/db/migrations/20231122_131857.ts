import { MigrateUpArgs, MigrateDownArgs } from '@payloadcms/db-postgres'
import { sql } from 'drizzle-orm'

export async function up({ payload }: MigrateUpArgs): Promise<void> {
await payload.db.drizzle.execute(sql`

DO $$ BEGIN
 CREATE TYPE "enum_users_website_access" AS ENUM('U.P. Lions Serve', 'Childhood Cancer', 'Hunger');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

CREATE TABLE IF NOT EXISTS "users_website_access" (
	"order" integer NOT NULL,
	"parent_id" integer NOT NULL,
	"value" "enum_users_website_access",
	"id" serial PRIMARY KEY NOT NULL
);

CREATE TABLE IF NOT EXISTS "users" (
	"id" serial PRIMARY KEY NOT NULL,
	"name_first" varchar,
	"name_last" varchar,
	"name_full" varchar,
	"roles_admin" boolean,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"email" varchar NOT NULL,
	"reset_password_token" varchar,
	"reset_password_expiration" timestamp(3) with time zone,
	"salt" varchar,
	"hash" varchar,
	"login_attempts" numeric,
	"lock_until" timestamp(3) with time zone
);

CREATE TABLE IF NOT EXISTS "hunger_data_programs" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" varchar NOT NULL,
	"title_id" varchar,
	"home_page_description" varchar NOT NULL,
	"description" jsonb NOT NULL,
	"cta_button_text" varchar,
	"cta_button_url" varchar,
	"description_html" varchar,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);

CREATE TABLE IF NOT EXISTS "hunger_data_programs_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"hunger_data_media_id" integer
);

CREATE TABLE IF NOT EXISTS "hunger_data_partners" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"link" varchar,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);

CREATE TABLE IF NOT EXISTS "hunger_data_partners_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"hunger_data_media_id" integer
);

CREATE TABLE IF NOT EXISTS "hunger_data_media" (
	"id" serial PRIMARY KEY NOT NULL,
	"alt" varchar,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"url" varchar,
	"filename" varchar,
	"mime_type" varchar,
	"filesize" numeric,
	"width" numeric,
	"height" numeric,
	"sizes_thumbnail_url" varchar,
	"sizes_thumbnail_width" numeric,
	"sizes_thumbnail_height" numeric,
	"sizes_thumbnail_mime_type" varchar,
	"sizes_thumbnail_filesize" numeric,
	"sizes_thumbnail_filename" varchar,
	"sizes_logo_url" varchar,
	"sizes_logo_width" numeric,
	"sizes_logo_height" numeric,
	"sizes_logo_mime_type" varchar,
	"sizes_logo_filesize" numeric,
	"sizes_logo_filename" varchar
);

CREATE TABLE IF NOT EXISTS "payload_preferences" (
	"id" serial PRIMARY KEY NOT NULL,
	"key" varchar,
	"value" jsonb,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);

CREATE TABLE IF NOT EXISTS "payload_preferences_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"users_id" integer
);

CREATE TABLE IF NOT EXISTS "payload_migrations" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar,
	"batch" numeric,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);

CREATE TABLE IF NOT EXISTS "hunger_pages_home" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" varchar NOT NULL,
	"updated_at" timestamp(3) with time zone,
	"created_at" timestamp(3) with time zone
);

CREATE TABLE IF NOT EXISTS "hunger_pages_about" (
	"id" serial PRIMARY KEY NOT NULL,
	"mission_statement" jsonb,
	"mission_cta_button_text" varchar,
	"mission_cta_button_url" varchar,
	"vision_statement" jsonb,
	"mission_statement_html" varchar,
	"vision_statement_html" varchar,
	"updated_at" timestamp(3) with time zone,
	"created_at" timestamp(3) with time zone
);

CREATE INDEX IF NOT EXISTS "order_idx" ON "users_website_access" ("order");
CREATE INDEX IF NOT EXISTS "parent_idx" ON "users_website_access" ("parent_id");
CREATE INDEX IF NOT EXISTS "created_at_idx" ON "users" ("created_at");
CREATE UNIQUE INDEX IF NOT EXISTS "email_idx" ON "users" ("email");
CREATE INDEX IF NOT EXISTS "created_at_idx" ON "hunger_data_programs" ("created_at");
CREATE INDEX IF NOT EXISTS "order_idx" ON "hunger_data_programs_rels" ("order");
CREATE INDEX IF NOT EXISTS "parent_idx" ON "hunger_data_programs_rels" ("parent_id");
CREATE INDEX IF NOT EXISTS "path_idx" ON "hunger_data_programs_rels" ("path");
CREATE INDEX IF NOT EXISTS "created_at_idx" ON "hunger_data_partners" ("created_at");
CREATE INDEX IF NOT EXISTS "order_idx" ON "hunger_data_partners_rels" ("order");
CREATE INDEX IF NOT EXISTS "parent_idx" ON "hunger_data_partners_rels" ("parent_id");
CREATE INDEX IF NOT EXISTS "path_idx" ON "hunger_data_partners_rels" ("path");
CREATE INDEX IF NOT EXISTS "created_at_idx" ON "hunger_data_media" ("created_at");
CREATE INDEX IF NOT EXISTS "sizes_logo_filename_idx" ON "hunger_data_media" ("sizes_logo_filename");
CREATE INDEX IF NOT EXISTS "created_at_idx" ON "payload_preferences" ("created_at");
CREATE INDEX IF NOT EXISTS "order_idx" ON "payload_preferences_rels" ("order");
CREATE INDEX IF NOT EXISTS "parent_idx" ON "payload_preferences_rels" ("parent_id");
CREATE INDEX IF NOT EXISTS "path_idx" ON "payload_preferences_rels" ("path");
CREATE INDEX IF NOT EXISTS "created_at_idx" ON "payload_migrations" ("created_at");
DO $$ BEGIN
 ALTER TABLE "users_website_access" ADD CONSTRAINT "users_website_access_parent_id_users_id_fk" FOREIGN KEY ("parent_id") REFERENCES "users"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
 ALTER TABLE "hunger_data_programs_rels" ADD CONSTRAINT "hunger_data_programs_rels_parent_id_hunger_data_programs_id_fk" FOREIGN KEY ("parent_id") REFERENCES "hunger_data_programs"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
 ALTER TABLE "hunger_data_programs_rels" ADD CONSTRAINT "hunger_data_programs_rels_hunger_data_media_id_hunger_data_media_id_fk" FOREIGN KEY ("hunger_data_media_id") REFERENCES "hunger_data_media"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
 ALTER TABLE "hunger_data_partners_rels" ADD CONSTRAINT "hunger_data_partners_rels_parent_id_hunger_data_partners_id_fk" FOREIGN KEY ("parent_id") REFERENCES "hunger_data_partners"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
 ALTER TABLE "hunger_data_partners_rels" ADD CONSTRAINT "hunger_data_partners_rels_hunger_data_media_id_hunger_data_media_id_fk" FOREIGN KEY ("hunger_data_media_id") REFERENCES "hunger_data_media"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
 ALTER TABLE "payload_preferences_rels" ADD CONSTRAINT "payload_preferences_rels_parent_id_payload_preferences_id_fk" FOREIGN KEY ("parent_id") REFERENCES "payload_preferences"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
 ALTER TABLE "payload_preferences_rels" ADD CONSTRAINT "payload_preferences_rels_users_id_users_id_fk" FOREIGN KEY ("users_id") REFERENCES "users"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
`);

};

export async function down({ payload }: MigrateDownArgs): Promise<void> {
await payload.db.drizzle.execute(sql`

DROP TABLE "users_website_access";
DROP TABLE "users";
DROP TABLE "hunger_data_programs";
DROP TABLE "hunger_data_programs_rels";
DROP TABLE "hunger_data_partners";
DROP TABLE "hunger_data_partners_rels";
DROP TABLE "hunger_data_media";
DROP TABLE "payload_preferences";
DROP TABLE "payload_preferences_rels";
DROP TABLE "payload_migrations";
DROP TABLE "hunger_pages_home";
DROP TABLE "hunger_pages_about";`);

};
