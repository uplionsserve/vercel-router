import { MigrateUpArgs, MigrateDownArgs } from "@payloadcms/db-postgres"
import { sql } from "drizzle-orm"

export async function up({ payload }: MigrateUpArgs): Promise<void> {
	await payload.db.drizzle.execute(sql`

CREATE TABLE IF NOT EXISTS "cc_data_media" (
	"id" serial PRIMARY KEY NOT NULL,
	"alt" varchar,
	"category" varchar,
	"photo_gallery" boolean,
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
	"sizes_thumbnail_filename" varchar
);

CREATE TABLE IF NOT EXISTS "cc_data_heroes" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"summary" varchar NOT NULL,
	"story" varchar NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);

CREATE TABLE IF NOT EXISTS "cc_data_heroes_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"cc_data_media_id" integer
);

CREATE TABLE IF NOT EXISTS "cc_data_page_banners" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"url" varchar NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);

CREATE TABLE IF NOT EXISTS "cc_data_page_banners_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"cc_data_media_id" integer
);

CREATE TABLE IF NOT EXISTS "cc_data_newsletters" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"volume" numeric NOT NULL,
	"issue" numeric NOT NULL,
	"date" timestamp(3) with time zone,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);

CREATE TABLE IF NOT EXISTS "cc_data_newsletters_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"cc_data_media_id" integer
);

CREATE TABLE IF NOT EXISTS "cc_data_categories" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);

DROP INDEX IF EXISTS "order_idx";
DROP INDEX IF EXISTS "parent_idx";
DROP INDEX IF EXISTS "created_at_idx";
DROP INDEX IF EXISTS "email_idx";
DROP INDEX IF EXISTS "_order_idx";
DROP INDEX IF EXISTS "_parent_id_idx";
DROP INDEX IF EXISTS "path_idx";
DROP INDEX IF EXISTS "sizes_logo_filename_idx";
CREATE INDEX IF NOT EXISTS "cc_data_media_created_at_idx" ON "cc_data_media" ("created_at");
CREATE UNIQUE INDEX IF NOT EXISTS "cc_data_media_filename_idx" ON "cc_data_media" ("filename");
CREATE INDEX IF NOT EXISTS "cc_data_media_sizes_thumbnail_sizes_thumbnail_filename_idx" ON "cc_data_media" ("sizes_thumbnail_filename");
CREATE INDEX IF NOT EXISTS "cc_data_heroes_created_at_idx" ON "cc_data_heroes" ("created_at");
CREATE INDEX IF NOT EXISTS "cc_data_heroes_rels_order_idx" ON "cc_data_heroes_rels" ("order");
CREATE INDEX IF NOT EXISTS "cc_data_heroes_rels_parent_idx" ON "cc_data_heroes_rels" ("parent_id");
CREATE INDEX IF NOT EXISTS "cc_data_heroes_rels_path_idx" ON "cc_data_heroes_rels" ("path");
CREATE INDEX IF NOT EXISTS "cc_data_page_banners_created_at_idx" ON "cc_data_page_banners" ("created_at");
CREATE INDEX IF NOT EXISTS "cc_data_page_banners_rels_order_idx" ON "cc_data_page_banners_rels" ("order");
CREATE INDEX IF NOT EXISTS "cc_data_page_banners_rels_parent_idx" ON "cc_data_page_banners_rels" ("parent_id");
CREATE INDEX IF NOT EXISTS "cc_data_page_banners_rels_path_idx" ON "cc_data_page_banners_rels" ("path");
CREATE INDEX IF NOT EXISTS "cc_data_newsletters_created_at_idx" ON "cc_data_newsletters" ("created_at");
CREATE INDEX IF NOT EXISTS "cc_data_newsletters_rels_order_idx" ON "cc_data_newsletters_rels" ("order");
CREATE INDEX IF NOT EXISTS "cc_data_newsletters_rels_parent_idx" ON "cc_data_newsletters_rels" ("parent_id");
CREATE INDEX IF NOT EXISTS "cc_data_newsletters_rels_path_idx" ON "cc_data_newsletters_rels" ("path");
CREATE UNIQUE INDEX IF NOT EXISTS "cc_data_categories_name_idx" ON "cc_data_categories" ("name");
CREATE INDEX IF NOT EXISTS "cc_data_categories_created_at_idx" ON "cc_data_categories" ("created_at");
CREATE INDEX IF NOT EXISTS "users_website_access_order_idx" ON "users_website_access" ("order");
CREATE INDEX IF NOT EXISTS "users_website_access_parent_idx" ON "users_website_access" ("parent_id");
CREATE INDEX IF NOT EXISTS "users_created_at_idx" ON "users" ("created_at");
CREATE UNIQUE INDEX IF NOT EXISTS "users_email_idx" ON "users" ("email");
CREATE INDEX IF NOT EXISTS "api_keys_website_access_order_idx" ON "api_keys_website_access" ("order");
CREATE INDEX IF NOT EXISTS "api_keys_website_access_parent_idx" ON "api_keys_website_access" ("parent_id");
CREATE INDEX IF NOT EXISTS "api_keys_created_at_idx" ON "api_keys" ("created_at");
CREATE INDEX IF NOT EXISTS "hunger_data_programs_gallery_images_order_idx" ON "hunger_data_programs_gallery_images" ("_order");
CREATE INDEX IF NOT EXISTS "hunger_data_programs_gallery_images_parent_id_idx" ON "hunger_data_programs_gallery_images" ("_parent_id");
CREATE INDEX IF NOT EXISTS "hunger_data_programs_created_at_idx" ON "hunger_data_programs" ("created_at");
CREATE INDEX IF NOT EXISTS "hunger_data_programs_rels_order_idx" ON "hunger_data_programs_rels" ("order");
CREATE INDEX IF NOT EXISTS "hunger_data_programs_rels_parent_idx" ON "hunger_data_programs_rels" ("parent_id");
CREATE INDEX IF NOT EXISTS "hunger_data_programs_rels_path_idx" ON "hunger_data_programs_rels" ("path");
CREATE INDEX IF NOT EXISTS "hunger_data_partners_created_at_idx" ON "hunger_data_partners" ("created_at");
CREATE INDEX IF NOT EXISTS "hunger_data_partners_rels_order_idx" ON "hunger_data_partners_rels" ("order");
CREATE INDEX IF NOT EXISTS "hunger_data_partners_rels_parent_idx" ON "hunger_data_partners_rels" ("parent_id");
CREATE INDEX IF NOT EXISTS "hunger_data_partners_rels_path_idx" ON "hunger_data_partners_rels" ("path");
CREATE INDEX IF NOT EXISTS "hunger_data_media_created_at_idx" ON "hunger_data_media" ("created_at");
CREATE UNIQUE INDEX IF NOT EXISTS "hunger_data_media_filename_idx" ON "hunger_data_media" ("filename");
CREATE INDEX IF NOT EXISTS "hunger_data_media_sizes_thumbnail_sizes_thumbnail_filename_idx" ON "hunger_data_media" ("sizes_thumbnail_filename");
CREATE INDEX IF NOT EXISTS "hunger_data_media_sizes_logo_sizes_logo_filename_idx" ON "hunger_data_media" ("sizes_logo_filename");
CREATE INDEX IF NOT EXISTS "payload_preferences_key_idx" ON "payload_preferences" ("key");
CREATE INDEX IF NOT EXISTS "payload_preferences_created_at_idx" ON "payload_preferences" ("created_at");
CREATE INDEX IF NOT EXISTS "payload_preferences_rels_order_idx" ON "payload_preferences_rels" ("order");
CREATE INDEX IF NOT EXISTS "payload_preferences_rels_parent_idx" ON "payload_preferences_rels" ("parent_id");
CREATE INDEX IF NOT EXISTS "payload_preferences_rels_path_idx" ON "payload_preferences_rels" ("path");
CREATE INDEX IF NOT EXISTS "payload_migrations_created_at_idx" ON "payload_migrations" ("created_at");
DO $$ BEGIN
 ALTER TABLE "cc_data_heroes_rels" ADD CONSTRAINT "cc_data_heroes_rels_parent_id_cc_data_heroes_id_fk" FOREIGN KEY ("parent_id") REFERENCES "cc_data_heroes"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
 ALTER TABLE "cc_data_heroes_rels" ADD CONSTRAINT "cc_data_heroes_rels_cc_data_media_id_cc_data_media_id_fk" FOREIGN KEY ("cc_data_media_id") REFERENCES "cc_data_media"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
 ALTER TABLE "cc_data_page_banners_rels" ADD CONSTRAINT "cc_data_page_banners_rels_parent_id_cc_data_page_banners_id_fk" FOREIGN KEY ("parent_id") REFERENCES "cc_data_page_banners"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
 ALTER TABLE "cc_data_page_banners_rels" ADD CONSTRAINT "cc_data_page_banners_rels_cc_data_media_id_cc_data_media_id_fk" FOREIGN KEY ("cc_data_media_id") REFERENCES "cc_data_media"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
 ALTER TABLE "cc_data_newsletters_rels" ADD CONSTRAINT "cc_data_newsletters_rels_parent_id_cc_data_newsletters_id_fk" FOREIGN KEY ("parent_id") REFERENCES "cc_data_newsletters"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
 ALTER TABLE "cc_data_newsletters_rels" ADD CONSTRAINT "cc_data_newsletters_rels_cc_data_media_id_cc_data_media_id_fk" FOREIGN KEY ("cc_data_media_id") REFERENCES "cc_data_media"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
`)
}

export async function down({ payload }: MigrateDownArgs): Promise<void> {
	await payload.db.drizzle.execute(sql`

DROP TABLE "cc_data_media";
DROP TABLE "cc_data_heroes";
DROP TABLE "cc_data_heroes_rels";
DROP TABLE "cc_data_page_banners";
DROP TABLE "cc_data_page_banners_rels";
DROP TABLE "cc_data_newsletters";
DROP TABLE "cc_data_newsletters_rels";
DROP TABLE "cc_data_categories";
DROP INDEX IF EXISTS "users_website_access_order_idx";
DROP INDEX IF EXISTS "users_website_access_parent_idx";
DROP INDEX IF EXISTS "users_created_at_idx";
DROP INDEX IF EXISTS "users_email_idx";
DROP INDEX IF EXISTS "api_keys_website_access_order_idx";
DROP INDEX IF EXISTS "api_keys_website_access_parent_idx";
DROP INDEX IF EXISTS "api_keys_created_at_idx";
DROP INDEX IF EXISTS "hunger_data_programs_gallery_images_order_idx";
DROP INDEX IF EXISTS "hunger_data_programs_gallery_images_parent_id_idx";
DROP INDEX IF EXISTS "hunger_data_programs_created_at_idx";
DROP INDEX IF EXISTS "hunger_data_programs_rels_order_idx";
DROP INDEX IF EXISTS "hunger_data_programs_rels_parent_idx";
DROP INDEX IF EXISTS "hunger_data_programs_rels_path_idx";
DROP INDEX IF EXISTS "hunger_data_partners_created_at_idx";
DROP INDEX IF EXISTS "hunger_data_partners_rels_order_idx";
DROP INDEX IF EXISTS "hunger_data_partners_rels_parent_idx";
DROP INDEX IF EXISTS "hunger_data_partners_rels_path_idx";
DROP INDEX IF EXISTS "hunger_data_media_created_at_idx";
DROP INDEX IF EXISTS "hunger_data_media_filename_idx";
DROP INDEX IF EXISTS "hunger_data_media_sizes_thumbnail_sizes_thumbnail_filename_idx";
DROP INDEX IF EXISTS "hunger_data_media_sizes_logo_sizes_logo_filename_idx";
DROP INDEX IF EXISTS "payload_preferences_key_idx";
DROP INDEX IF EXISTS "payload_preferences_created_at_idx";
DROP INDEX IF EXISTS "payload_preferences_rels_order_idx";
DROP INDEX IF EXISTS "payload_preferences_rels_parent_idx";
DROP INDEX IF EXISTS "payload_preferences_rels_path_idx";
DROP INDEX IF EXISTS "payload_migrations_created_at_idx";
CREATE INDEX IF NOT EXISTS "order_idx" ON "users_website_access" ("order");
CREATE INDEX IF NOT EXISTS "parent_idx" ON "users_website_access" ("parent_id");
CREATE INDEX IF NOT EXISTS "created_at_idx" ON "users" ("created_at");
CREATE UNIQUE INDEX IF NOT EXISTS "email_idx" ON "users" ("email");
CREATE INDEX IF NOT EXISTS "order_idx" ON "api_keys_website_access" ("order");
CREATE INDEX IF NOT EXISTS "parent_idx" ON "api_keys_website_access" ("parent_id");
CREATE INDEX IF NOT EXISTS "created_at_idx" ON "api_keys" ("created_at");
CREATE INDEX IF NOT EXISTS "_order_idx" ON "hunger_data_programs_gallery_images" ("_order");
CREATE INDEX IF NOT EXISTS "_parent_id_idx" ON "hunger_data_programs_gallery_images" ("_parent_id");
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
CREATE INDEX IF NOT EXISTS "created_at_idx" ON "payload_migrations" ("created_at");`)
}
