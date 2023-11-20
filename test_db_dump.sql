--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Homebrew)
-- Dumped by pg_dump version 14.9 (Homebrew)

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
-- Name: enum_users_website_access; Type: TYPE; Schema: public; Owner: harrisonbouche
--

CREATE TYPE public.enum_users_website_access AS ENUM (
    'U.P. Lions Serve',
    'Childhood Cancer',
    'Hunger'
);


ALTER TYPE public.enum_users_website_access OWNER TO harrisonbouche;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: home; Type: TABLE; Schema: public; Owner: harrisonbouche
--

CREATE TABLE public.home (
    id integer NOT NULL,
    hero_banner_title character varying NOT NULL,
    hero_banner_subtitle_1 character varying NOT NULL,
    hero_banner_subtitle_2 character varying NOT NULL,
    hero_banner_cta_button_text character varying NOT NULL,
    hero_banner_cta_button_link character varying NOT NULL,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.home OWNER TO harrisonbouche;

--
-- Name: home_id_seq; Type: SEQUENCE; Schema: public; Owner: harrisonbouche
--

CREATE SEQUENCE public.home_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_id_seq OWNER TO harrisonbouche;

--
-- Name: home_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: harrisonbouche
--

ALTER SEQUENCE public.home_id_seq OWNED BY public.home.id;


--
-- Name: home_our_heroes; Type: TABLE; Schema: public; Owner: harrisonbouche
--

CREATE TABLE public.home_our_heroes (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    name character varying NOT NULL,
    summary character varying NOT NULL,
    story character varying NOT NULL
);


ALTER TABLE public.home_our_heroes OWNER TO harrisonbouche;

--
-- Name: home_rels; Type: TABLE; Schema: public; Owner: harrisonbouche
--

CREATE TABLE public.home_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    media_id integer
);


ALTER TABLE public.home_rels OWNER TO harrisonbouche;

--
-- Name: home_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: harrisonbouche
--

CREATE SEQUENCE public.home_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_rels_id_seq OWNER TO harrisonbouche;

--
-- Name: home_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: harrisonbouche
--

ALTER SEQUENCE public.home_rels_id_seq OWNED BY public.home_rels.id;


--
-- Name: hunger_home; Type: TABLE; Schema: public; Owner: harrisonbouche
--

CREATE TABLE public.hunger_home (
    id integer NOT NULL,
    title character varying NOT NULL,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.hunger_home OWNER TO harrisonbouche;

--
-- Name: hunger_home_id_seq; Type: SEQUENCE; Schema: public; Owner: harrisonbouche
--

CREATE SEQUENCE public.hunger_home_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hunger_home_id_seq OWNER TO harrisonbouche;

--
-- Name: hunger_home_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: harrisonbouche
--

ALTER SEQUENCE public.hunger_home_id_seq OWNED BY public.hunger_home.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: harrisonbouche
--

CREATE TABLE public.media (
    id integer NOT NULL,
    alt character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    url character varying,
    filename character varying,
    mime_type character varying,
    filesize numeric,
    width numeric,
    height numeric
);


ALTER TABLE public.media OWNER TO harrisonbouche;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: harrisonbouche
--

CREATE SEQUENCE public.media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_id_seq OWNER TO harrisonbouche;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: harrisonbouche
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: payload_migrations; Type: TABLE; Schema: public; Owner: harrisonbouche
--

CREATE TABLE public.payload_migrations (
    id integer NOT NULL,
    name character varying,
    batch numeric,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_migrations OWNER TO harrisonbouche;

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: harrisonbouche
--

CREATE SEQUENCE public.payload_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payload_migrations_id_seq OWNER TO harrisonbouche;

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: harrisonbouche
--

ALTER SEQUENCE public.payload_migrations_id_seq OWNED BY public.payload_migrations.id;


--
-- Name: payload_preferences; Type: TABLE; Schema: public; Owner: harrisonbouche
--

CREATE TABLE public.payload_preferences (
    id integer NOT NULL,
    key character varying,
    value jsonb,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_preferences OWNER TO harrisonbouche;

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: harrisonbouche
--

CREATE SEQUENCE public.payload_preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payload_preferences_id_seq OWNER TO harrisonbouche;

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: harrisonbouche
--

ALTER SEQUENCE public.payload_preferences_id_seq OWNED BY public.payload_preferences.id;


--
-- Name: payload_preferences_rels; Type: TABLE; Schema: public; Owner: harrisonbouche
--

CREATE TABLE public.payload_preferences_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer
);


ALTER TABLE public.payload_preferences_rels OWNER TO harrisonbouche;

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: harrisonbouche
--

CREATE SEQUENCE public.payload_preferences_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payload_preferences_rels_id_seq OWNER TO harrisonbouche;

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: harrisonbouche
--

ALTER SEQUENCE public.payload_preferences_rels_id_seq OWNED BY public.payload_preferences_rels.id;


--
-- Name: programs; Type: TABLE; Schema: public; Owner: harrisonbouche
--

CREATE TABLE public.programs (
    id integer NOT NULL,
    title character varying NOT NULL,
    title_id character varying,
    home_page_description character varying NOT NULL,
    description jsonb NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.programs OWNER TO harrisonbouche;

--
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: harrisonbouche
--

CREATE SEQUENCE public.programs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programs_id_seq OWNER TO harrisonbouche;

--
-- Name: programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: harrisonbouche
--

ALTER SEQUENCE public.programs_id_seq OWNED BY public.programs.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: harrisonbouche
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


ALTER TABLE public.users OWNER TO harrisonbouche;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: harrisonbouche
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO harrisonbouche;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: harrisonbouche
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_website_access; Type: TABLE; Schema: public; Owner: harrisonbouche
--

CREATE TABLE public.users_website_access (
    "order" integer NOT NULL,
    parent_id integer NOT NULL,
    value public.enum_users_website_access,
    id integer NOT NULL
);


ALTER TABLE public.users_website_access OWNER TO harrisonbouche;

--
-- Name: users_website_access_id_seq; Type: SEQUENCE; Schema: public; Owner: harrisonbouche
--

CREATE SEQUENCE public.users_website_access_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_website_access_id_seq OWNER TO harrisonbouche;

--
-- Name: users_website_access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: harrisonbouche
--

ALTER SEQUENCE public.users_website_access_id_seq OWNED BY public.users_website_access.id;


--
-- Name: home id; Type: DEFAULT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.home ALTER COLUMN id SET DEFAULT nextval('public.home_id_seq'::regclass);


--
-- Name: home_rels id; Type: DEFAULT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.home_rels ALTER COLUMN id SET DEFAULT nextval('public.home_rels_id_seq'::regclass);


--
-- Name: hunger_home id; Type: DEFAULT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.hunger_home ALTER COLUMN id SET DEFAULT nextval('public.hunger_home_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: payload_migrations id; Type: DEFAULT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.payload_migrations ALTER COLUMN id SET DEFAULT nextval('public.payload_migrations_id_seq'::regclass);


--
-- Name: payload_preferences id; Type: DEFAULT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.payload_preferences ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_id_seq'::regclass);


--
-- Name: payload_preferences_rels id; Type: DEFAULT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.payload_preferences_rels ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_rels_id_seq'::regclass);


--
-- Name: programs id; Type: DEFAULT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.programs ALTER COLUMN id SET DEFAULT nextval('public.programs_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_website_access id; Type: DEFAULT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.users_website_access ALTER COLUMN id SET DEFAULT nextval('public.users_website_access_id_seq'::regclass);


--
-- Data for Name: home; Type: TABLE DATA; Schema: public; Owner: harrisonbouche
--

COPY public.home (id, hero_banner_title, hero_banner_subtitle_1, hero_banner_subtitle_2, hero_banner_cta_button_text, hero_banner_cta_button_link, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: home_our_heroes; Type: TABLE DATA; Schema: public; Owner: harrisonbouche
--

COPY public.home_our_heroes (_order, _parent_id, id, name, summary, story) FROM stdin;
\.


--
-- Data for Name: home_rels; Type: TABLE DATA; Schema: public; Owner: harrisonbouche
--

COPY public.home_rels (id, "order", parent_id, path, media_id) FROM stdin;
\.


--
-- Data for Name: hunger_home; Type: TABLE DATA; Schema: public; Owner: harrisonbouche
--

COPY public.hunger_home (id, title, updated_at, created_at) FROM stdin;
2	_Healthy Food_ For All.	2023-11-16 16:03:49.706-05	\N
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: harrisonbouche
--

COPY public.media (id, alt, updated_at, created_at, url, filename, mime_type, filesize, width, height) FROM stdin;
\.


--
-- Data for Name: payload_migrations; Type: TABLE DATA; Schema: public; Owner: harrisonbouche
--

COPY public.payload_migrations (id, name, batch, updated_at, created_at) FROM stdin;
1	dev	-1	2023-11-16 16:32:48.399-05	2023-11-07 11:16:55.444-05
\.


--
-- Data for Name: payload_preferences; Type: TABLE DATA; Schema: public; Owner: harrisonbouche
--

COPY public.payload_preferences (id, key, value, updated_at, created_at) FROM stdin;
4	global-hunger_home	{"fields": {"programs": {"collapsed": []}}}	2023-11-16 09:13:09.641-05	2023-11-16 09:13:09.641-05
1	users-list	{"limit": "10", "columns": [{"active": true, "accessor": "_select"}, {"active": true, "accessor": "email"}, {"active": true, "accessor": "id"}, {"active": true, "accessor": "updatedAt"}, {"active": true, "accessor": "createdAt"}, {"active": false, "accessor": "Name"}, {"active": false, "accessor": "roles"}]}	2023-11-07 11:17:43.215-05	2023-11-07 11:17:43.215-05
3	collapsed-Hunger-groups	[]	2023-11-16 09:10:58.682-05	2023-11-16 09:10:58.682-05
5	hunger_home-list	{"limit": "10", "columns": [{"active": true, "accessor": "_select"}, {"active": true, "accessor": "id"}, {"active": true, "accessor": "title"}, {"active": true, "accessor": "programs"}, {"active": true, "accessor": "titleHtml"}, {"active": false, "accessor": "updatedAt"}, {"active": false, "accessor": "createdAt"}]}	2023-11-16 15:35:10.266-05	2023-11-16 15:35:10.266-05
2	collapsed-Childhood Cancer-groups	["Childhood Cancer"]	2023-11-16 08:58:00.524-05	2023-11-16 08:58:00.524-05
6	programs-list	{"columns": [{"active": true, "accessor": "_select"}, {"active": true, "accessor": "id"}, {"active": true, "accessor": "title"}, {"active": true, "accessor": "home_page_description"}, {"active": true, "accessor": "description"}, {"active": false, "accessor": "updatedAt"}, {"active": false, "accessor": "createdAt"}]}	2023-11-16 16:05:05.916-05	2023-11-16 16:05:05.916-05
\.


--
-- Data for Name: payload_preferences_rels; Type: TABLE DATA; Schema: public; Owner: harrisonbouche
--

COPY public.payload_preferences_rels (id, "order", parent_id, path, users_id) FROM stdin;
11	\N	4	user	1
12	\N	1	user	1
14	\N	3	user	1
15	\N	5	user	1
20	\N	2	user	1
24	\N	6	user	1
\.


--
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: harrisonbouche
--

COPY public.programs (id, title, title_id, home_page_description, description, updated_at, created_at) FROM stdin;
1	Let's Seed U.P.	let-s-seed-u-p	Let’s Seed U.P.! is a seed distribution/garden building and support project funded through a grant provided by District 10.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Let's Seed U.P.! is a seed distribution / garden building / community support project funded through a grant provided by District 10. The project provides U.P. Smart* vegetable, herb, and other seed varieties to communities throughout the U.P. in partnership with U.P. Lion's Clubs.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "U.P.-Smart™ seeds are short season, cooler climate seeds. They are a diverse collection of food crops that have a higher degree of growth success in the U.P. U.P. Smart seeds are more hearty with better yields growing in the U.P. High yields address better garden results, food insecurity, food scarcity, fresh produce access, nutrition and childhood health.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "LSUP will provide access to free online courses and site visits to train Lion's to build sustainable, nutritious food gardens in their community.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Farm To School (F2S) / Community Gardens", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "LSUP works in conjunction with Farm To School and Community Garden projects in D10 through Lions Clubs. The F2S program is run through Partridge Creek Farms, a partially funded UPLionsServe foundation organization. The F2S program works with schools to determine garden boxes, arrangement and training. LSUP will, through the local Lions Club for the school, provide the seed \\"package\\" and training for planting seeds. Students gain access to healthy local foods as well as educational opportunities such as school gardens, seed saving, cooking lessons, and farm field trips.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	2023-11-16 16:37:14.867-05	2023-11-16 16:32:00.382-05
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: harrisonbouche
--

COPY public.users (id, updated_at, created_at, email, reset_password_token, reset_password_expiration, salt, hash, login_attempts, lock_until, name_first, name_last, roles_admin, name_full) FROM stdin;
1	2023-11-16 14:58:01.903-05	2023-11-07 11:17:38.043-05	harrison@sm.media	\N	\N	e183de142d0e82b187f4c584497d7376e23d2b619c2449b951361fb43f1b817f	7cbb8adf45c4a44c6afc9c83d56c2399858d30489d712bf2c3244697c6a60b6975244dbd7aa699ef85d9d8f6e4dd869d7caca765456c79ffdb14dceb7b9f85eb09efb6299f7c3fd7a7f478663cdb64c0e3a5043fcee8c4171cf8726ff2208e164179ba23d141e828709d85926e120cd904b9bf6baf6e2044c9ff0fd9e7564ccd201d7c8c027a3ed0d1e7d941b1fabea966e5c203be0d6ab03b8690d807b1c2a4ac872041368baee4a8823d4f0b6c4c3c95a404d4e8189f68074990b044f57c2dea2ee1737b0b421d9d874e5ed4e70d8e40fbbc312c77b26793f6f60b28c626473e2bd7d1e82f363fa57d3d3836f9d32cc94b1b45b9e24b09d411fd9d05b5d42bfbb25180eab8740d95705464e2b57a89a364901cc4befb3bcf2d7f5ae2a5d4980ab8000d3f83f5d8cfa33c2977c292d1936e6b1352b5709766ee8bf5c8b09807bfc16d49fce2ddda91a4bc0a324925e4fe5c4fdcedd1df80393c37705ac2daef8e47a83ceb1f77559514c95c88e55f5afae56cda9ff1150e74f2bf65ea9b9f040a50aff7891d0edeb10f63176fa08f5eda2ba45f04b90b0bd3b5ec5a7b348f8cc4f91a5eb4b30591d5955581eb06ffa0d7c63e8ba911be7e2eb60471f405242707c95d0a4ae1beacb64f2602717ceedec95daead5b5ba7b80c3552c644d464252688588f65283aa1f628259346d9fd5c975dd9a4c26ee96e44537b2eef8bcaee	0	\N	Harrison	Bouche	t	Harrison Bouche
\.


--
-- Data for Name: users_website_access; Type: TABLE DATA; Schema: public; Owner: harrisonbouche
--

COPY public.users_website_access ("order", parent_id, value, id) FROM stdin;
1	1	U.P. Lions Serve	15
\.


--
-- Name: home_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harrisonbouche
--

SELECT pg_catalog.setval('public.home_id_seq', 1, false);


--
-- Name: home_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harrisonbouche
--

SELECT pg_catalog.setval('public.home_rels_id_seq', 1, false);


--
-- Name: hunger_home_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harrisonbouche
--

SELECT pg_catalog.setval('public.hunger_home_id_seq', 2, true);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harrisonbouche
--

SELECT pg_catalog.setval('public.media_id_seq', 1, false);


--
-- Name: payload_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harrisonbouche
--

SELECT pg_catalog.setval('public.payload_migrations_id_seq', 1, true);


--
-- Name: payload_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harrisonbouche
--

SELECT pg_catalog.setval('public.payload_preferences_id_seq', 6, true);


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harrisonbouche
--

SELECT pg_catalog.setval('public.payload_preferences_rels_id_seq', 24, true);


--
-- Name: programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harrisonbouche
--

SELECT pg_catalog.setval('public.programs_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harrisonbouche
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: users_website_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harrisonbouche
--

SELECT pg_catalog.setval('public.users_website_access_id_seq', 15, true);


--
-- Name: home_our_heroes home_our_heroes_pkey; Type: CONSTRAINT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.home_our_heroes
    ADD CONSTRAINT home_our_heroes_pkey PRIMARY KEY (id);


--
-- Name: home home_pkey; Type: CONSTRAINT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.home
    ADD CONSTRAINT home_pkey PRIMARY KEY (id);


--
-- Name: home_rels home_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.home_rels
    ADD CONSTRAINT home_rels_pkey PRIMARY KEY (id);


--
-- Name: hunger_home hunger_home_pkey; Type: CONSTRAINT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.hunger_home
    ADD CONSTRAINT hunger_home_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: payload_migrations payload_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.payload_migrations
    ADD CONSTRAINT payload_migrations_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences payload_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.payload_preferences
    ADD CONSTRAINT payload_preferences_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences_rels payload_preferences_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_pkey PRIMARY KEY (id);


--
-- Name: programs programs_pkey; Type: CONSTRAINT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_website_access users_website_access_pkey; Type: CONSTRAINT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.users_website_access
    ADD CONSTRAINT users_website_access_pkey PRIMARY KEY (id);


--
-- Name: _order_idx; Type: INDEX; Schema: public; Owner: harrisonbouche
--

CREATE INDEX _order_idx ON public.home_our_heroes USING btree (_order);


--
-- Name: _parent_id_idx; Type: INDEX; Schema: public; Owner: harrisonbouche
--

CREATE INDEX _parent_id_idx ON public.home_our_heroes USING btree (_parent_id);


--
-- Name: created_at_idx; Type: INDEX; Schema: public; Owner: harrisonbouche
--

CREATE INDEX created_at_idx ON public.users USING btree (created_at);


--
-- Name: email_idx; Type: INDEX; Schema: public; Owner: harrisonbouche
--

CREATE UNIQUE INDEX email_idx ON public.users USING btree (email);


--
-- Name: filename_idx; Type: INDEX; Schema: public; Owner: harrisonbouche
--

CREATE UNIQUE INDEX filename_idx ON public.media USING btree (filename);


--
-- Name: order_idx; Type: INDEX; Schema: public; Owner: harrisonbouche
--

CREATE INDEX order_idx ON public.payload_preferences_rels USING btree ("order");


--
-- Name: parent_idx; Type: INDEX; Schema: public; Owner: harrisonbouche
--

CREATE INDEX parent_idx ON public.payload_preferences_rels USING btree (parent_id);


--
-- Name: path_idx; Type: INDEX; Schema: public; Owner: harrisonbouche
--

CREATE INDEX path_idx ON public.payload_preferences_rels USING btree (path);


--
-- Name: home_our_heroes home_our_heroes__parent_id_home_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.home_our_heroes
    ADD CONSTRAINT home_our_heroes__parent_id_home_id_fk FOREIGN KEY (_parent_id) REFERENCES public.home(id) ON DELETE CASCADE;


--
-- Name: home_rels home_rels_media_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.home_rels
    ADD CONSTRAINT home_rels_media_id_media_id_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: home_rels home_rels_parent_id_home_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.home_rels
    ADD CONSTRAINT home_rels_parent_id_home_id_fk FOREIGN KEY (parent_id) REFERENCES public.home(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_parent_id_payload_preferences_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_parent_id_payload_preferences_id_fk FOREIGN KEY (parent_id) REFERENCES public.payload_preferences(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_users_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_users_id_users_id_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users_website_access users_website_access_parent_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: harrisonbouche
--

ALTER TABLE ONLY public.users_website_access
    ADD CONSTRAINT users_website_access_parent_id_users_id_fk FOREIGN KEY (parent_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

