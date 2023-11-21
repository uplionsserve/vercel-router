--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: enum_users_website_access; Type: TYPE; Schema: public; Owner: payload
--

CREATE TYPE public.enum_users_website_access AS ENUM (
    'U.P. Lions Serve',
    'Childhood Cancer',
    'Hunger'
);


ALTER TYPE public.enum_users_website_access OWNER TO payload;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: hunger_data_media; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.hunger_data_media (
    id integer NOT NULL,
    alt character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    url character varying,
    filename character varying,
    mime_type character varying,
    filesize numeric,
    width numeric,
    height numeric,
    sizes_thumbnail_url character varying,
    sizes_thumbnail_width numeric,
    sizes_thumbnail_height numeric,
    sizes_thumbnail_mime_type character varying,
    sizes_thumbnail_filesize numeric,
    sizes_thumbnail_filename character varying,
    sizes_logo_url character varying,
    sizes_logo_width numeric,
    sizes_logo_height numeric,
    sizes_logo_mime_type character varying,
    sizes_logo_filesize numeric,
    sizes_logo_filename character varying
);


ALTER TABLE public.hunger_data_media OWNER TO payload;

--
-- Name: hunger_data_media_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.hunger_data_media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hunger_data_media_id_seq OWNER TO payload;

--
-- Name: hunger_data_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.hunger_data_media_id_seq OWNED BY public.hunger_data_media.id;


--
-- Name: hunger_data_partners; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.hunger_data_partners (
    id integer NOT NULL,
    name character varying NOT NULL,
    link character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.hunger_data_partners OWNER TO payload;

--
-- Name: hunger_data_partners_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.hunger_data_partners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hunger_data_partners_id_seq OWNER TO payload;

--
-- Name: hunger_data_partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.hunger_data_partners_id_seq OWNED BY public.hunger_data_partners.id;


--
-- Name: hunger_data_partners_rels; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.hunger_data_partners_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    hunger_data_media_id integer
);


ALTER TABLE public.hunger_data_partners_rels OWNER TO payload;

--
-- Name: hunger_data_partners_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.hunger_data_partners_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hunger_data_partners_rels_id_seq OWNER TO payload;

--
-- Name: hunger_data_partners_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.hunger_data_partners_rels_id_seq OWNED BY public.hunger_data_partners_rels.id;


--
-- Name: hunger_data_programs; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.hunger_data_programs (
    id integer NOT NULL,
    title character varying NOT NULL,
    title_id character varying,
    home_page_description character varying NOT NULL,
    description jsonb NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    description_html character varying,
    cta_button_text character varying,
    cta_button_url character varying,
    cta_button_full_url character varying
);


ALTER TABLE public.hunger_data_programs OWNER TO payload;

--
-- Name: hunger_data_programs_rels; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.hunger_data_programs_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    hunger_data_media_id integer
);


ALTER TABLE public.hunger_data_programs_rels OWNER TO payload;

--
-- Name: hunger_data_programs_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.hunger_data_programs_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hunger_data_programs_rels_id_seq OWNER TO payload;

--
-- Name: hunger_data_programs_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.hunger_data_programs_rels_id_seq OWNED BY public.hunger_data_programs_rels.id;


--
-- Name: hunger_pages_home; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.hunger_pages_home (
    id integer NOT NULL,
    title character varying NOT NULL,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.hunger_pages_home OWNER TO payload;

--
-- Name: hunger_home_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.hunger_home_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hunger_home_id_seq OWNER TO payload;

--
-- Name: hunger_home_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.hunger_home_id_seq OWNED BY public.hunger_pages_home.id;


--
-- Name: hunger_pages_about; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.hunger_pages_about (
    id integer NOT NULL,
    mission_statement jsonb,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone,
    vision_statement jsonb,
    mission_statement_html character varying,
    vision_statement_html character varying,
    mission_cta_button_text character varying,
    mission_cta_button_url character varying
);


ALTER TABLE public.hunger_pages_about OWNER TO payload;

--
-- Name: hunger_pages_about_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.hunger_pages_about_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hunger_pages_about_id_seq OWNER TO payload;

--
-- Name: hunger_pages_about_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.hunger_pages_about_id_seq OWNED BY public.hunger_pages_about.id;


--
-- Name: payload_migrations; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.payload_migrations (
    id integer NOT NULL,
    name character varying,
    batch numeric,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_migrations OWNER TO payload;

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.payload_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payload_migrations_id_seq OWNER TO payload;

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.payload_migrations_id_seq OWNED BY public.payload_migrations.id;


--
-- Name: payload_preferences; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.payload_preferences (
    id integer NOT NULL,
    key character varying,
    value jsonb,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_preferences OWNER TO payload;

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.payload_preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payload_preferences_id_seq OWNER TO payload;

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.payload_preferences_id_seq OWNED BY public.payload_preferences.id;


--
-- Name: payload_preferences_rels; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.payload_preferences_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer
);


ALTER TABLE public.payload_preferences_rels OWNER TO payload;

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.payload_preferences_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payload_preferences_rels_id_seq OWNER TO payload;

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.payload_preferences_rels_id_seq OWNED BY public.payload_preferences_rels.id;


--
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.programs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programs_id_seq OWNER TO payload;

--
-- Name: programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.programs_id_seq OWNED BY public.hunger_data_programs.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.users (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    email character varying NOT NULL,
    reset_password_token character varying,
    reset_password_expiration timestamp(3) with time zone,
    salt character varying,
    hash character varying,
    login_attempts numeric,
    lock_until timestamp(3) with time zone,
    name_first character varying,
    name_last character varying,
    roles_admin boolean,
    name_full character varying
);


ALTER TABLE public.users OWNER TO payload;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO payload;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_website_access; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.users_website_access (
    "order" integer NOT NULL,
    parent_id integer NOT NULL,
    value public.enum_users_website_access,
    id integer NOT NULL
);


ALTER TABLE public.users_website_access OWNER TO payload;

--
-- Name: users_website_access_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.users_website_access_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_website_access_id_seq OWNER TO payload;

--
-- Name: users_website_access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.users_website_access_id_seq OWNED BY public.users_website_access.id;


--
-- Name: hunger_data_media id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.hunger_data_media ALTER COLUMN id SET DEFAULT nextval('public.hunger_data_media_id_seq'::regclass);


--
-- Name: hunger_data_partners id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.hunger_data_partners ALTER COLUMN id SET DEFAULT nextval('public.hunger_data_partners_id_seq'::regclass);


--
-- Name: hunger_data_partners_rels id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.hunger_data_partners_rels ALTER COLUMN id SET DEFAULT nextval('public.hunger_data_partners_rels_id_seq'::regclass);


--
-- Name: hunger_data_programs id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.hunger_data_programs ALTER COLUMN id SET DEFAULT nextval('public.programs_id_seq'::regclass);


--
-- Name: hunger_data_programs_rels id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.hunger_data_programs_rels ALTER COLUMN id SET DEFAULT nextval('public.hunger_data_programs_rels_id_seq'::regclass);


--
-- Name: hunger_pages_about id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.hunger_pages_about ALTER COLUMN id SET DEFAULT nextval('public.hunger_pages_about_id_seq'::regclass);


--
-- Name: hunger_pages_home id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.hunger_pages_home ALTER COLUMN id SET DEFAULT nextval('public.hunger_home_id_seq'::regclass);


--
-- Name: payload_migrations id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_migrations ALTER COLUMN id SET DEFAULT nextval('public.payload_migrations_id_seq'::regclass);


--
-- Name: payload_preferences id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_preferences ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_id_seq'::regclass);


--
-- Name: payload_preferences_rels id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_preferences_rels ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_rels_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_website_access id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.users_website_access ALTER COLUMN id SET DEFAULT nextval('public.users_website_access_id_seq'::regclass);


--
-- Data for Name: hunger_data_media; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.hunger_data_media (id, alt, updated_at, created_at, url, filename, mime_type, filesize, width, height, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_logo_url, sizes_logo_width, sizes_logo_height, sizes_logo_mime_type, sizes_logo_filesize, sizes_logo_filename) FROM stdin;
1	Lions Clubs International logo	2023-11-20 13:16:09.606-05	2023-11-20 13:16:09.606-05	\N	lionsinternationallogo.png	image/png	222768	1200	1119	\N	400	300	image/png	74755	lionsinternationallogo-400x300.png	\N	512	512	image/png	130335	lionsinternationallogo-512x512.png
3	UPCAP logo	2023-11-21 09:38:00.415-05	2023-11-21 09:38:00.415-05	\N	upcaplogo.png	image/png	25796	309	165	\N	\N	\N	\N	\N	\N	\N	512	512	image/png	141580	upcaplogo-512x512.png
4	District 10 Lions logo	2023-11-21 09:51:33.127-05	2023-11-21 09:51:33.127-05	\N	d10lions.png	image/png	19215	225	225	\N	\N	\N	\N	\N	\N	\N	512	512	image/png	284794	d10lions-512x512.png
5	Let's Seed U.P.! logo	2023-11-21 09:59:52.475-05	2023-11-21 09:59:52.475-05	\N	image1.jpg	image/jpeg	91271	825	825	\N	400	300	image/jpeg	13867	image1-400x300.jpg	\N	512	512	image/jpeg	23658	image1-512x512.jpg
6	Partridge Creek Farm logo	2023-11-21 10:06:24.592-05	2023-11-21 10:06:24.592-05	\N	pcf.png	image/png	59635	242	242	\N	\N	\N	\N	\N	\N	\N	512	512	image/png	224329	pcf-512x512.png
7	Cornucopia of fruits and vegetables	2023-11-21 10:11:42.559-05	2023-11-21 10:11:42.559-05	\N	Depositphotos_27322811_m-e1646670821430.jpg	image/jpeg	58635	600	399	\N	400	300	image/jpeg	33244	Depositphotos_27322811_m-e1646670821430-400x300.jpg	\N	512	512	image/jpeg	54960	Depositphotos_27322811_m-e1646670821430-512x512.jpg
8	\N	2023-11-21 10:40:07.534-05	2023-11-21 10:40:07.534-05	\N	district-10-garden-grant.pdf	application/pdf	1336697	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	\N	2023-11-21 10:56:40.249-05	2023-11-21 10:56:40.249-05	\N	Funding Request Letter 2023.pdf	application/pdf	210887	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	\N	2023-11-21 10:59:52.237-05	2023-11-21 10:59:52.237-05	\N	food-driver-delivery-agreement.pdf	application/pdf	604073	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	Food As Medicine logo	2023-11-21 11:03:03.059-05	2023-11-21 11:03:03.059-05	\N	logo fam.png	image/png	25739	378	378	\N	400	300	image/png	29604	logo fam-400x300.png	\N	512	512	image/png	47280	logo fam-512x512.png
\.


--
-- Data for Name: hunger_data_partners; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.hunger_data_partners (id, name, link, updated_at, created_at) FROM stdin;
1	Lions International	https://www.lionsclubs.org/en	2023-11-20 13:16:25.582-05	2023-11-20 13:16:25.582-05
2	UPCAP	http://upcap.org/	2023-11-21 09:38:50.393-05	2023-11-20 13:20:54.02-05
3	District 10 Lions	https://district10lions.org	2023-11-21 09:51:57.373-05	2023-11-21 09:51:38.22-05
4	Let's Seed U.P.!	https://uplionsserve.org/hunger/programs#let-s-seed-u-p	2023-11-21 10:00:31.709-05	2023-11-21 10:00:31.709-05
5	Partridge Creek Farm	https://partridgecreekfarm.org/	2023-11-21 10:06:27.447-05	2023-11-21 10:06:27.447-05
6	Gwinn Seed Library	https://forsythtwplibrary.org/gwinn-seed-library/	2023-11-21 10:11:50.698-05	2023-11-21 10:11:50.698-05
\.


--
-- Data for Name: hunger_data_partners_rels; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.hunger_data_partners_rels (id, "order", parent_id, path, hunger_data_media_id) FROM stdin;
1	\N	1	logo_image	1
3	\N	2	logo_image	3
5	\N	3	logo_image	4
6	\N	4	logo_image	5
7	\N	5	logo_image	6
8	\N	6	logo_image	7
\.


--
-- Data for Name: hunger_data_programs; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.hunger_data_programs (id, title, title_id, home_page_description, description, updated_at, created_at, description_html, cta_button_text, cta_button_url, cta_button_full_url) FROM stdin;
2	Kids Backpack Program	kids-backpack-program	U.P. Lions Serve Hunger's mission is to fight against hunger by providing food & life-changing aid. We've realized that schools are the perfect target for the Backpack program - they are the gathered location for children in need.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Schools are the perfect target for the Backpack program - they are the gathered location for children in need. Our backpack program provides children with food that can go home with them for the evening and weekend. We do not want to see any child go without. Lasting impact is made by nourishing lives, empowering communities & emergency relief.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	2023-11-20 12:00:20.87-05	2023-11-20 11:27:48.516-05	<p>Schools are the perfect target for the Backpack program - they are the gathered location for children in need. Our backpack program provides children with food that can go home with them for the evening and weekend. We do not want to see any child go without. Lasting impact is made by nourishing lives, empowering communities & emergency relief.</p>	\N	\N	\N
3	UP Food As Medicine / UP Fresh Food Access	up-food-as-medicine-up-fresh-food-access	It is a practice that is built on the knowledge that food and diet play important roles in disease prevention and management by prioritizing food and diet in an individual's health plan, with the goal of overall health. U.P. Lions Serve Hunger is in partnership with UPCAP on these programs. 	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Receive $300 of fresh fruits and vegetables from local markets! Qualifying individuals receive $15 in produce vouchers for 20 weeks. Additional vouchers may be available by participating in nutrition education.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Prescription for Health is a practice built on the knowledge that food and diet play important roles in disease prevention and management by prioritizing food and diet in an individual's health plan, with the goal of overall health. District 10 Lions and the UPLionsServe Foundation have partnered with UPCAP and other organizations to make this program a part of our service commitment to the U.P.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Currently, in Michigan's Upper Peninsula, 1 in 7 individuals or 14% of residents are food insecure! In 2021, an effort to address this issue and improve health and wellness of residents throughout the Upper Peninsula, resulted in the development and implementation of The Upper Peninsula Food As Medicine (UPFAM) / Prescription For Health program.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This large collaborative effort consists of 25 partner organizations and agencies throughout the region committed to the on-going coordination and support of this initiative. The program, generously funded by the Superior Health Foundation of Marquette County, is based on a prescription for health model designed to address and improve food security of individuals that are at risk for or diagnosed with a chronic health condition, face economic barriers to food access and are 18 years of age or older.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "As a member of the UP Food As Medicine Program, you have the opportunity to participate in nutrition education sessions provided by Michigan State University Extension Educators! The one-hour virtual sessions are held once a week for six-weeks and are currently virtual (CLICK HERE FOR A DESCRIPTION OF THE CLASS). There is no cost to attend these sessions and participants that complete 4 of the 6 sessions can earn an additional $40 in product vouchers! Topics covered include:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Quick, Healthy Meals and Snacks", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Eating Healthy on a Budget", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Tips for Losing Weight and Keeping It Off", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Making Healthy Eating Part of Your Lifestyle", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Beginning Summer of 2023, UPCAP will partner with the Food Bank Council of Michigan (FBCM) to increase access to locally sourced fresh and healthy foods, targeting economically challenged and food insecure residents. This new initiative known as “The UP Fresh Food Access Program”, is Funded through the Food Bank Council of Michigan, a grantee of the Michigan Department of Education (MDE) and the USDA. This partnership will help establish and implement the new Local Food Purchase Assistance Cooperative Agreement Program (LFPA), an innovative program allowing state and tribal governments to procure and distribute local foods and beverages unique to their geographic area.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "As a regional partner, UPCAP will utilize a variety of methods and work with local producers to provide access to fresh, healthy foods for residents in underserved communities. The UP Fresh Food Access Program is scheduled to start in the Upper Peninsula mid- Summer, and will run through September of 2025.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	2023-11-21 11:04:14.496-05	2023-11-20 11:29:18.255-05	<p><strong>Receive $300 of fresh fruits and vegetables from local markets! Qualifying individuals receive $15 in produce vouchers for 20 weeks. Additional vouchers may be available by participating in nutrition education.</strong></p><p>Prescription for Health is a practice built on the knowledge that food and diet play important roles in disease prevention and management by prioritizing food and diet in an individual's health plan, with the goal of overall health. District 10 Lions and the UPLionsServe Foundation have partnered with UPCAP and other organizations to make this program a part of our service commitment to the U.P.</p><p>Currently, in Michigan's Upper Peninsula, 1 in 7 individuals or 14% of residents are food insecure! In 2021, an effort to address this issue and improve health and wellness of residents throughout the Upper Peninsula, resulted in the development and implementation of The Upper Peninsula Food As Medicine (UPFAM) / Prescription For Health program.</p><p>This large collaborative effort consists of 25 partner organizations and agencies throughout the region committed to the on-going coordination and support of this initiative. The program, generously funded by the Superior Health Foundation of Marquette County, is based on a prescription for health model designed to address and improve food security of individuals that are at risk for or diagnosed with a chronic health condition, face economic barriers to food access and are 18 years of age or older.</p><p>As a member of the UP Food As Medicine Program, you have the opportunity to participate in nutrition education sessions provided by Michigan State University Extension Educators! The one-hour virtual sessions are held once a week for six-weeks and are currently virtual (CLICK HERE FOR A DESCRIPTION OF THE CLASS). There is no cost to attend these sessions and participants that complete 4 of the 6 sessions can earn an additional $40 in product vouchers! Topics covered include:</p><ul class="bullet"><li value=1>Quick, Healthy Meals and Snacks</li><li value=2>Eating Healthy on a Budget</li><li value=3>Tips for Losing Weight and Keeping It Off</li><li value=4>Making Healthy Eating Part of Your Lifestyle</li></ul><p>Beginning Summer of 2023, UPCAP will partner with the Food Bank Council of Michigan (FBCM) to increase access to locally sourced fresh and healthy foods, targeting economically challenged and food insecure residents. This new initiative known as “The UP Fresh Food Access Program”, is Funded through the Food Bank Council of Michigan, a grantee of the Michigan Department of Education (MDE) and the USDA. This partnership will help establish and implement the new Local Food Purchase Assistance Cooperative Agreement Program (LFPA), an innovative program allowing state and tribal governments to procure and distribute local foods and beverages unique to their geographic area.</p><p>As a regional partner, UPCAP will utilize a variety of methods and work with local producers to provide access to fresh, healthy foods for residents in underserved communities. The UP Fresh Food Access Program is scheduled to start in the Upper Peninsula mid- Summer, and will run through September of 2025.</p>	\N	\N	http://localhost:3000null
4	Food Transportation Service	food-transportation-service	Since 2019, consumer demand for food delivery has grown and access to healthy food is critical. The ability to transport healthy food food from one location to individuals and families in need in a community is our goal.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Since 2019, consumer demand for food delivery has grown and access to healthy food is critical. The ability to transport healthy food food from one location to individuals and families in need in a community is our goal. This project is a partnership with UPCAP / Food as Medicine / District 10 Lions that began in May 2023. It was started as a Pilot Project in D10 that UPFAM identified Farmers Markets in the U.P. willing to accept vouchers they receive from a participating practitioner in the program for fresh produce that ‘clients’ in the program will receive for five months.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A qualifying process through UPCAP identifies clients who become part of the program. The 2023 program saw over 140 clients qualified. CALL 2-1-1.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Lions Club members are volunteering as drivers between clients and markets to make this possible. We are looking for more volunteers to grow this program U.P.-wide!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you are interested in becoming a driver, p", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "lease fill out the following form and contact the Hunger team at ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "autolink", "fields": {"url": "mailto:hunger@uplionsserve.org", "linkType": "custom"}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "hunger@uplionsserve.org", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	2023-11-21 11:00:12.112-05	2023-11-20 11:32:23.344-05	<p>Since 2019, consumer demand for food delivery has grown and access to healthy food is critical. The ability to transport healthy food food from one location to individuals and families in need in a community is our goal. This project is a partnership with UPCAP / Food as Medicine / District 10 Lions that began in May 2023. It was started as a Pilot Project in D10 that UPFAM identified Farmers Markets in the U.P. willing to accept vouchers they receive from a participating practitioner in the program for fresh produce that ‘clients’ in the program will receive for five months.</p><p>A qualifying process through UPCAP identifies clients who become part of the program. The 2023 program saw over 140 clients qualified. CALL 2-1-1.</p><p>Lions Club members are volunteering as drivers between clients and markets to make this possible. We are looking for more volunteers to grow this program U.P.-wide!</p><p><strong>If you are interested in becoming a driver, p</strong>lease fill out the following form and contact the Hunger team at <a href="mailto:hunger@uplionsserve.org">hunger@uplionsserve.org</a>.</p>	Delivery Agreement Form	http://localhost:3000/hunger-data-media/food-driver-delivery-agreement.pdf	http://localhost:3000/
1	Let's Seed U.P.!	let-s-seed-u-p	Let’s Seed U.P.! is a seed distribution/garden building and support project funded through a grant provided by LCIF District Pilot Grant.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Let's Seed U.P.! is a seed distribution / garden building / community support project funded through a grant provided by District 10. The project provides U.P. Smart* vegetable, herb, and other seed varieties to communities throughout the U.P. in partnership with U.P. Lion's Clubs.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "U.P.-Smart™ seeds are short season, cooler climate seeds. They are a diverse collection of food crops that have a higher degree of growth success in the U.P. U.P. Smart seeds are more hearty with better yields growing in the U.P. High yields address better garden results, food insecurity, food scarcity, fresh produce access, nutrition and childhood health.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "LSUP will provide access to free online courses and site visits to train Lion's to build sustainable, nutritious food gardens in their community.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Farm To School (F2S) / Community Gardens", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "LSUP works in conjunction with Farm To School and Community Garden projects in D10 through Lions Clubs. The F2S program is run through Partridge Creek Farms, a partially funded UPLionsServe foundation organization. The F2S program works with schools to determine garden boxes, arrangement and training. LSUP will, through the local Lions Club for the school, provide the seed \\"package\\" and training for planting seeds. Students gain access to healthy local foods as well as educational opportunities such as school gardens, seed saving, cooking lessons, and farm field trips. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.miningjournal.net/news/local/2023/11/growing-accessibility/", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Read about our recent project at Lakeview Elementary School in Negaunee, MI.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Interested in starting your own community garden?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Download the District 10 Garden Grant below.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	2023-11-21 10:51:13.286-05	2023-11-16 16:32:00.382-05	<p>Let's Seed U.P.! is a seed distribution / garden building / community support project funded through a grant provided by District 10. The project provides U.P. Smart* vegetable, herb, and other seed varieties to communities throughout the U.P. in partnership with U.P. Lion's Clubs.</p><p>U.P.-Smart™ seeds are short season, cooler climate seeds. They are a diverse collection of food crops that have a higher degree of growth success in the U.P. U.P. Smart seeds are more hearty with better yields growing in the U.P. High yields address better garden results, food insecurity, food scarcity, fresh produce access, nutrition and childhood health.</p><p>LSUP will provide access to free online courses and site visits to train Lion's to build sustainable, nutritious food gardens in their community.</p><h3>Farm To School (F2S) / Community Gardens</h3><p>LSUP works in conjunction with Farm To School and Community Garden projects in D10 through Lions Clubs. The F2S program is run through Partridge Creek Farms, a partially funded UPLionsServe foundation organization. The F2S program works with schools to determine garden boxes, arrangement and training. LSUP will, through the local Lions Club for the school, provide the seed "package" and training for planting seeds. Students gain access to healthy local foods as well as educational opportunities such as school gardens, seed saving, cooking lessons, and farm field trips. <a href="https://www.miningjournal.net/news/local/2023/11/growing-accessibility/" rel="noopener noreferrer">Read about our recent project at Lakeview Elementary School in Negaunee, MI.</a></p><p><strong>Interested in starting your own community garden?</strong> Download the District 10 Garden Grant below.</p>	District 10 Garden Grant	http://localhost:3000/hunger-data-media/district-10-garden-grant.pdf	http://localhost:3000//hunger-data-media/district-10-garden-grant.pdf
\.


--
-- Data for Name: hunger_data_programs_rels; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.hunger_data_programs_rels (id, "order", parent_id, path, hunger_data_media_id) FROM stdin;
6	\N	1	logo_image	5
7	\N	3	logo_image	11
\.


--
-- Data for Name: hunger_pages_about; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.hunger_pages_about (id, mission_statement, updated_at, created_at, vision_statement, mission_statement_html, vision_statement_html, mission_cta_button_text, mission_cta_button_url) FROM stdin;
1	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "To alleviate Food Insecurity and Hunger in the Upper Peninsula by partnering across communities to obtain and provide affordable and nutritious food and education.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "About U.P. Lions Serve Foundation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "U.P. LIONS SERVE is a 501c3 foundation that provides financial support for many projects and programs through District 10 Lions Clubs. UP Lions Serve focuses support in the areas of eliminating food insecurity and hunger and improving the health and well- being of communities through access to healthy and nutritious foods, community education and advocacy.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We see how the hunger and nutrition crisis affects local communities and believe true community improvement depends on the thriving of its members through access to nutritious, healthy, fresh foods.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We support hands-on, classroom and online education that teaches people of all ages how to grow, utilize and preserve their own grown food.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We serve to improve human flourishing!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	2023-11-21 10:57:47.222-05	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Identify and address food scarcity", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Improve Health Outcomes", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Provide resources to Lions in D10 to empower clubs and communities", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Collaborate with other Lions Districts to build stronger programs", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Focus energies and resources on our 4 buckets/Initiatives", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Build greater awareness of the UPLionsServe Foundation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 7, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Provide micro-grant access for D10 Lions Clubs that align with our mission", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 8, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Meet Food needs on an emergency basis", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 9, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Partner with agencies in the Upper Peninsula that align with our mission", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 10, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Strengthen local food system through long term infrastructure and sustainability", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 11, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Increase access to nutrition education and training", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "To achieve our mission of making nutritious food accessible to every community in the Upper Peninsula HUNGER collaborates with community partners and agencies to create programs that aim to empower individuals to act on their own behalf. Hunger is an everyday presence for some, stressful both physically and mentally. We are on a Mission To Serve! Lions serve it's that simple, and it has been since we first began in 1917.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We can provide the seed, the soil, the compost, the education and the manpower to strengthen our local food system.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	<p><strong>To alleviate Food Insecurity and Hunger in the Upper Peninsula by partnering across communities to obtain and provide affordable and nutritious food and education.</strong></p><h3>About U.P. Lions Serve Foundation</h3><p>U.P. LIONS SERVE is a 501c3 foundation that provides financial support for many projects and programs through District 10 Lions Clubs. UP Lions Serve focuses support in the areas of eliminating food insecurity and hunger and improving the health and well- being of communities through access to healthy and nutritious foods, community education and advocacy.</p><p>We see how the hunger and nutrition crisis affects local communities and believe true community improvement depends on the thriving of its members through access to nutritious, healthy, fresh foods.</p><p>We support hands-on, classroom and online education that teaches people of all ages how to grow, utilize and preserve their own grown food.</p><p>We serve to improve human flourishing!</p>	<ul class="bullet"><li value=1>Identify and address food scarcity</li><li value=2>Improve Health Outcomes</li><li value=3>Provide resources to Lions in D10 to empower clubs and communities</li><li value=4>Collaborate with other Lions Districts to build stronger programs</li><li value=5>Focus energies and resources on our 4 buckets/Initiatives</li><li value=6>Build greater awareness of the UPLionsServe Foundation</li><li value=7>Provide micro-grant access for D10 Lions Clubs that align with our mission</li><li value=8>Meet Food needs on an emergency basis</li><li value=9>Partner with agencies in the Upper Peninsula that align with our mission</li><li value=10>Strengthen local food system through long term infrastructure and sustainability</li><li value=11>Increase access to nutrition education and training</li></ul><p>To achieve our mission of making nutritious food accessible to every community in the Upper Peninsula HUNGER collaborates with community partners and agencies to create programs that aim to empower individuals to act on their own behalf. Hunger is an everyday presence for some, stressful both physically and mentally. We are on a Mission To Serve! Lions serve it's that simple, and it has been since we first began in 1917.</p><p>We can provide the seed, the soil, the compost, the education and the manpower to strengthen our local food system.</p>	Funding Request Flyer 	http://localhost:3000/hunger-data-media/Funding%20Request%20Letter%202023.pdf
\.


--
-- Data for Name: hunger_pages_home; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.hunger_pages_home (id, title, updated_at, created_at) FROM stdin;
2	Healthy Food _For All._	2023-11-20 11:56:23.497-05	\N
\.


--
-- Data for Name: payload_migrations; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.payload_migrations (id, name, batch, updated_at, created_at) FROM stdin;
1	dev	-1	2023-11-21 10:55:25.926-05	2023-11-07 11:16:55.444-05
\.


--
-- Data for Name: payload_preferences; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.payload_preferences (id, key, value, updated_at, created_at) FROM stdin;
4	global-hunger_home	{"fields": {"programs": {"collapsed": []}}}	2023-11-16 09:13:09.641-05	2023-11-16 09:13:09.641-05
1	users-list	{"limit": "10", "columns": [{"active": true, "accessor": "_select"}, {"active": true, "accessor": "email"}, {"active": true, "accessor": "id"}, {"active": true, "accessor": "updatedAt"}, {"active": true, "accessor": "createdAt"}, {"active": false, "accessor": "Name"}, {"active": false, "accessor": "roles"}]}	2023-11-07 11:17:43.215-05	2023-11-07 11:17:43.215-05
5	hunger_home-list	{"limit": "10", "columns": [{"active": true, "accessor": "_select"}, {"active": true, "accessor": "id"}, {"active": true, "accessor": "title"}, {"active": true, "accessor": "programs"}, {"active": true, "accessor": "titleHtml"}, {"active": false, "accessor": "updatedAt"}, {"active": false, "accessor": "createdAt"}]}	2023-11-16 15:35:10.266-05	2023-11-16 15:35:10.266-05
12	hunger-data-programs-list	{"limit": "10", "columns": [{"active": true, "accessor": "_select"}, {"active": true, "accessor": "id"}, {"active": true, "accessor": "title"}, {"active": true, "accessor": "home_page_description"}, {"active": true, "accessor": "description"}, {"active": false, "accessor": "description_html"}, {"active": false, "accessor": "updatedAt"}, {"active": false, "accessor": "createdAt"}, {"active": false, "accessor": "logo_image"}, {"active": false, "accessor": "cta_button"}]}	2023-11-20 11:59:18.645-05	2023-11-20 11:59:18.645-05
10	collapsed-Hunger Data-groups	[]	2023-11-20 11:57:31.093-05	2023-11-20 11:57:31.093-05
14	hunger-data-media-list	{"sort": "", "columns": [{"active": true, "accessor": "_select"}, {"active": true, "accessor": "filename"}, {"active": true, "accessor": "id"}, {"active": true, "accessor": "alt"}, {"active": true, "accessor": "updatedAt"}, {"active": false, "accessor": "createdAt"}, {"active": false, "accessor": "url"}, {"active": false, "accessor": "mimeType"}, {"active": false, "accessor": "filesize"}, {"active": false, "accessor": "width"}, {"active": false, "accessor": "height"}, {"active": false, "accessor": "sizes"}]}	2023-11-20 13:16:33.073-05	2023-11-20 13:16:33.073-05
11	collapsed-Collections-groups	[]	2023-11-20 11:57:35.611-05	2023-11-20 11:57:35.611-05
6	programs-list	{"limit": "10", "columns": [{"active": true, "accessor": "_select"}, {"active": true, "accessor": "id"}, {"active": true, "accessor": "title"}, {"active": true, "accessor": "home_page_description"}, {"active": true, "accessor": "description"}, {"active": false, "accessor": "updatedAt"}, {"active": false, "accessor": "createdAt"}]}	2023-11-16 16:05:05.916-05	2023-11-16 16:05:05.916-05
8	collapsed-Hunger Collections-groups	[]	2023-11-20 11:38:21.551-05	2023-11-20 11:38:21.551-05
7	hunger-programs-list	{"columns": [{"active": true, "accessor": "_select"}, {"active": true, "accessor": "id"}, {"active": true, "accessor": "title"}, {"active": true, "accessor": "home_page_description"}, {"active": true, "accessor": "description"}, {"active": false, "accessor": "description_html"}, {"active": false, "accessor": "updatedAt"}, {"active": false, "accessor": "createdAt"}]}	2023-11-20 11:38:10.935-05	2023-11-20 11:38:10.935-05
3	collapsed-Hunger-groups	[]	2023-11-16 09:10:58.682-05	2023-11-16 09:10:58.682-05
13	hunger-data-partners-list	{"limit": "10", "columns": [{"active": true, "accessor": "_select"}, {"active": true, "accessor": "id"}, {"active": true, "accessor": "logo_image"}, {"active": true, "accessor": "name"}, {"active": true, "accessor": "link"}, {"active": false, "accessor": "updatedAt"}, {"active": false, "accessor": "createdAt"}]}	2023-11-20 13:14:08.022-05	2023-11-20 13:14:08.022-05
2	collapsed-Childhood Cancer-groups	["Childhood Cancer"]	2023-11-16 08:58:00.524-05	2023-11-16 08:58:00.524-05
9	collapsed-Hunger Pages-groups	[]	2023-11-20 11:57:28.12-05	2023-11-20 11:57:28.12-05
\.


--
-- Data for Name: payload_preferences_rels; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.payload_preferences_rels (id, "order", parent_id, path, users_id) FROM stdin;
11	\N	4	user	1
12	\N	1	user	1
15	\N	5	user	1
34	\N	6	user	1
37	\N	8	user	1
38	\N	7	user	1
39	\N	3	user	1
44	\N	2	user	1
51	\N	9	user	1
56	\N	10	user	1
63	\N	11	user	1
94	\N	14	user	1
96	\N	13	user	1
97	\N	12	user	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.users (id, updated_at, created_at, email, reset_password_token, reset_password_expiration, salt, hash, login_attempts, lock_until, name_first, name_last, roles_admin, name_full) FROM stdin;
1	2023-11-21 09:34:09.563-05	2023-11-07 11:17:38.043-05	harrison@sm.media	\N	\N	e183de142d0e82b187f4c584497d7376e23d2b619c2449b951361fb43f1b817f	7cbb8adf45c4a44c6afc9c83d56c2399858d30489d712bf2c3244697c6a60b6975244dbd7aa699ef85d9d8f6e4dd869d7caca765456c79ffdb14dceb7b9f85eb09efb6299f7c3fd7a7f478663cdb64c0e3a5043fcee8c4171cf8726ff2208e164179ba23d141e828709d85926e120cd904b9bf6baf6e2044c9ff0fd9e7564ccd201d7c8c027a3ed0d1e7d941b1fabea966e5c203be0d6ab03b8690d807b1c2a4ac872041368baee4a8823d4f0b6c4c3c95a404d4e8189f68074990b044f57c2dea2ee1737b0b421d9d874e5ed4e70d8e40fbbc312c77b26793f6f60b28c626473e2bd7d1e82f363fa57d3d3836f9d32cc94b1b45b9e24b09d411fd9d05b5d42bfbb25180eab8740d95705464e2b57a89a364901cc4befb3bcf2d7f5ae2a5d4980ab8000d3f83f5d8cfa33c2977c292d1936e6b1352b5709766ee8bf5c8b09807bfc16d49fce2ddda91a4bc0a324925e4fe5c4fdcedd1df80393c37705ac2daef8e47a83ceb1f77559514c95c88e55f5afae56cda9ff1150e74f2bf65ea9b9f040a50aff7891d0edeb10f63176fa08f5eda2ba45f04b90b0bd3b5ec5a7b348f8cc4f91a5eb4b30591d5955581eb06ffa0d7c63e8ba911be7e2eb60471f405242707c95d0a4ae1beacb64f2602717ceedec95daead5b5ba7b80c3552c644d464252688588f65283aa1f628259346d9fd5c975dd9a4c26ee96e44537b2eef8bcaee	0	\N	Harrison	Bouche	t	Harrison Bouche
\.


--
-- Data for Name: users_website_access; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.users_website_access ("order", parent_id, value, id) FROM stdin;
1	1	U.P. Lions Serve	18
\.


--
-- Name: hunger_data_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.hunger_data_media_id_seq', 11, true);


--
-- Name: hunger_data_partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.hunger_data_partners_id_seq', 6, true);


--
-- Name: hunger_data_partners_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.hunger_data_partners_rels_id_seq', 8, true);


--
-- Name: hunger_data_programs_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.hunger_data_programs_rels_id_seq', 7, true);


--
-- Name: hunger_home_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.hunger_home_id_seq', 2, true);


--
-- Name: hunger_pages_about_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.hunger_pages_about_id_seq', 1, true);


--
-- Name: payload_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.payload_migrations_id_seq', 1, true);


--
-- Name: payload_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.payload_preferences_id_seq', 14, true);


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.payload_preferences_rels_id_seq', 97, true);


--
-- Name: programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.programs_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: users_website_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.users_website_access_id_seq', 18, true);


--
-- Name: hunger_data_media hunger_data_media_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.hunger_data_media
    ADD CONSTRAINT hunger_data_media_pkey PRIMARY KEY (id);


--
-- Name: hunger_data_partners hunger_data_partners_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.hunger_data_partners
    ADD CONSTRAINT hunger_data_partners_pkey PRIMARY KEY (id);


--
-- Name: hunger_data_partners_rels hunger_data_partners_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.hunger_data_partners_rels
    ADD CONSTRAINT hunger_data_partners_rels_pkey PRIMARY KEY (id);


--
-- Name: hunger_data_programs_rels hunger_data_programs_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.hunger_data_programs_rels
    ADD CONSTRAINT hunger_data_programs_rels_pkey PRIMARY KEY (id);


--
-- Name: hunger_pages_home hunger_home_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.hunger_pages_home
    ADD CONSTRAINT hunger_home_pkey PRIMARY KEY (id);


--
-- Name: hunger_pages_about hunger_pages_about_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.hunger_pages_about
    ADD CONSTRAINT hunger_pages_about_pkey PRIMARY KEY (id);


--
-- Name: payload_migrations payload_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_migrations
    ADD CONSTRAINT payload_migrations_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences payload_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_preferences
    ADD CONSTRAINT payload_preferences_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences_rels payload_preferences_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_pkey PRIMARY KEY (id);


--
-- Name: hunger_data_programs programs_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.hunger_data_programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_website_access users_website_access_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.users_website_access
    ADD CONSTRAINT users_website_access_pkey PRIMARY KEY (id);


--
-- Name: created_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX created_at_idx ON public.users USING btree (created_at);


--
-- Name: email_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE UNIQUE INDEX email_idx ON public.users USING btree (email);


--
-- Name: order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX order_idx ON public.payload_preferences_rels USING btree ("order");


--
-- Name: parent_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX parent_idx ON public.payload_preferences_rels USING btree (parent_id);


--
-- Name: path_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX path_idx ON public.payload_preferences_rels USING btree (path);


--
-- Name: sizes_logo_filename_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX sizes_logo_filename_idx ON public.hunger_data_media USING btree (sizes_logo_filename);


--
-- Name: hunger_data_partners_rels hunger_data_partners_rels_hunger_data_media_id_hunger_data_medi; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.hunger_data_partners_rels
    ADD CONSTRAINT hunger_data_partners_rels_hunger_data_media_id_hunger_data_medi FOREIGN KEY (hunger_data_media_id) REFERENCES public.hunger_data_media(id) ON DELETE CASCADE;


--
-- Name: hunger_data_partners_rels hunger_data_partners_rels_parent_id_hunger_data_partners_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.hunger_data_partners_rels
    ADD CONSTRAINT hunger_data_partners_rels_parent_id_hunger_data_partners_id_fk FOREIGN KEY (parent_id) REFERENCES public.hunger_data_partners(id) ON DELETE CASCADE;


--
-- Name: hunger_data_programs_rels hunger_data_programs_rels_hunger_data_media_id_hunger_data_medi; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.hunger_data_programs_rels
    ADD CONSTRAINT hunger_data_programs_rels_hunger_data_media_id_hunger_data_medi FOREIGN KEY (hunger_data_media_id) REFERENCES public.hunger_data_media(id) ON DELETE CASCADE;


--
-- Name: hunger_data_programs_rels hunger_data_programs_rels_parent_id_hunger_data_programs_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.hunger_data_programs_rels
    ADD CONSTRAINT hunger_data_programs_rels_parent_id_hunger_data_programs_id_fk FOREIGN KEY (parent_id) REFERENCES public.hunger_data_programs(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_parent_id_payload_preferences_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_parent_id_payload_preferences_id_fk FOREIGN KEY (parent_id) REFERENCES public.payload_preferences(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_users_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_users_id_users_id_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users_website_access users_website_access_parent_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.users_website_access
    ADD CONSTRAINT users_website_access_parent_id_users_id_fk FOREIGN KEY (parent_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

