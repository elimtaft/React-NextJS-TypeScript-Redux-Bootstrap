/* strapi db */
GRANT CREATE ON SCHEMA __STRAPI_DB_SCHEMA__ TO __STRAPI_DB_USER__;
GRANT USAGE ON SCHEMA __STRAPI_DB_SCHEMA__ TO __STRAPI_DB_USER__;


--
-- PostgreSQL database dump
--

-- Dumped from database version 13.8 (Debian 13.8-1.pgdg110+1)
-- Dumped by pg_dump version 13.8 (Debian 13.8-1.pgdg110+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE __STRAPI_DB_SCHEMA__.admin_permissions OWNER TO __STRAPI_DB_USER__;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE SEQUENCE __STRAPI_DB_SCHEMA__.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE __STRAPI_DB_SCHEMA__.admin_permissions_id_seq OWNER TO __STRAPI_DB_USER__;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER SEQUENCE __STRAPI_DB_SCHEMA__.admin_permissions_id_seq OWNED BY __STRAPI_DB_SCHEMA__.admin_permissions.id;


--
-- Name: admin_permissions_role_links; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.admin_permissions_role_links (
    permission_id integer,
    role_id integer
);


ALTER TABLE __STRAPI_DB_SCHEMA__.admin_permissions_role_links OWNER TO __STRAPI_DB_USER__;

--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE __STRAPI_DB_SCHEMA__.admin_roles OWNER TO __STRAPI_DB_USER__;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE SEQUENCE __STRAPI_DB_SCHEMA__.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE __STRAPI_DB_SCHEMA__.admin_roles_id_seq OWNER TO __STRAPI_DB_USER__;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER SEQUENCE __STRAPI_DB_SCHEMA__.admin_roles_id_seq OWNED BY __STRAPI_DB_SCHEMA__.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE __STRAPI_DB_SCHEMA__.admin_users OWNER TO __STRAPI_DB_USER__;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE SEQUENCE __STRAPI_DB_SCHEMA__.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE __STRAPI_DB_SCHEMA__.admin_users_id_seq OWNER TO __STRAPI_DB_USER__;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER SEQUENCE __STRAPI_DB_SCHEMA__.admin_users_id_seq OWNED BY __STRAPI_DB_SCHEMA__.admin_users.id;


--
-- Name: admin_users_roles_links; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.admin_users_roles_links (
    user_id integer,
    role_id integer
);


ALTER TABLE __STRAPI_DB_SCHEMA__.admin_users_roles_links OWNER TO __STRAPI_DB_USER__;

--
-- Name: files; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE __STRAPI_DB_SCHEMA__.files OWNER TO __STRAPI_DB_USER__;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE SEQUENCE __STRAPI_DB_SCHEMA__.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE __STRAPI_DB_SCHEMA__.files_id_seq OWNER TO __STRAPI_DB_USER__;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER SEQUENCE __STRAPI_DB_SCHEMA__.files_id_seq OWNED BY __STRAPI_DB_SCHEMA__.files.id;


--
-- Name: files_related_morphs; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.files_related_morphs (
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" integer
);


ALTER TABLE __STRAPI_DB_SCHEMA__.files_related_morphs OWNER TO __STRAPI_DB_USER__;

--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE __STRAPI_DB_SCHEMA__.i18n_locale OWNER TO __STRAPI_DB_USER__;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE SEQUENCE __STRAPI_DB_SCHEMA__.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE __STRAPI_DB_SCHEMA__.i18n_locale_id_seq OWNER TO __STRAPI_DB_USER__;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER SEQUENCE __STRAPI_DB_SCHEMA__.i18n_locale_id_seq OWNED BY __STRAPI_DB_SCHEMA__.i18n_locale.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.pages (
    id integer NOT NULL,
    title character varying(255),
    content text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    slug character varying(255)
);


ALTER TABLE __STRAPI_DB_SCHEMA__.pages OWNER TO __STRAPI_DB_USER__;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE SEQUENCE __STRAPI_DB_SCHEMA__.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE __STRAPI_DB_SCHEMA__.pages_id_seq OWNER TO __STRAPI_DB_USER__;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER SEQUENCE __STRAPI_DB_SCHEMA__.pages_id_seq OWNED BY __STRAPI_DB_SCHEMA__.pages.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE __STRAPI_DB_SCHEMA__.strapi_api_tokens OWNER TO __STRAPI_DB_USER__;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE SEQUENCE __STRAPI_DB_SCHEMA__.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE __STRAPI_DB_SCHEMA__.strapi_api_tokens_id_seq OWNER TO __STRAPI_DB_USER__;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER SEQUENCE __STRAPI_DB_SCHEMA__.strapi_api_tokens_id_seq OWNED BY __STRAPI_DB_SCHEMA__.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE __STRAPI_DB_SCHEMA__.strapi_core_store_settings OWNER TO __STRAPI_DB_USER__;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE SEQUENCE __STRAPI_DB_SCHEMA__.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE __STRAPI_DB_SCHEMA__.strapi_core_store_settings_id_seq OWNER TO __STRAPI_DB_USER__;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER SEQUENCE __STRAPI_DB_SCHEMA__.strapi_core_store_settings_id_seq OWNED BY __STRAPI_DB_SCHEMA__.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE __STRAPI_DB_SCHEMA__.strapi_database_schema OWNER TO __STRAPI_DB_USER__;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE SEQUENCE __STRAPI_DB_SCHEMA__.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE __STRAPI_DB_SCHEMA__.strapi_database_schema_id_seq OWNER TO __STRAPI_DB_USER__;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER SEQUENCE __STRAPI_DB_SCHEMA__.strapi_database_schema_id_seq OWNED BY __STRAPI_DB_SCHEMA__.strapi_database_schema.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE __STRAPI_DB_SCHEMA__.strapi_migrations OWNER TO __STRAPI_DB_USER__;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE SEQUENCE __STRAPI_DB_SCHEMA__.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE __STRAPI_DB_SCHEMA__.strapi_migrations_id_seq OWNER TO __STRAPI_DB_USER__;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER SEQUENCE __STRAPI_DB_SCHEMA__.strapi_migrations_id_seq OWNED BY __STRAPI_DB_SCHEMA__.strapi_migrations.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE __STRAPI_DB_SCHEMA__.strapi_webhooks OWNER TO __STRAPI_DB_USER__;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE SEQUENCE __STRAPI_DB_SCHEMA__.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE __STRAPI_DB_SCHEMA__.strapi_webhooks_id_seq OWNER TO __STRAPI_DB_USER__;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER SEQUENCE __STRAPI_DB_SCHEMA__.strapi_webhooks_id_seq OWNED BY __STRAPI_DB_SCHEMA__.strapi_webhooks.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE __STRAPI_DB_SCHEMA__.up_permissions OWNER TO __STRAPI_DB_USER__;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE SEQUENCE __STRAPI_DB_SCHEMA__.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE __STRAPI_DB_SCHEMA__.up_permissions_id_seq OWNER TO __STRAPI_DB_USER__;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER SEQUENCE __STRAPI_DB_SCHEMA__.up_permissions_id_seq OWNED BY __STRAPI_DB_SCHEMA__.up_permissions.id;


--
-- Name: up_permissions_role_links; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.up_permissions_role_links (
    permission_id integer,
    role_id integer
);


ALTER TABLE __STRAPI_DB_SCHEMA__.up_permissions_role_links OWNER TO __STRAPI_DB_USER__;

--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE __STRAPI_DB_SCHEMA__.up_roles OWNER TO __STRAPI_DB_USER__;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE SEQUENCE __STRAPI_DB_SCHEMA__.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE __STRAPI_DB_SCHEMA__.up_roles_id_seq OWNER TO __STRAPI_DB_USER__;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER SEQUENCE __STRAPI_DB_SCHEMA__.up_roles_id_seq OWNED BY __STRAPI_DB_SCHEMA__.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE __STRAPI_DB_SCHEMA__.up_users OWNER TO __STRAPI_DB_USER__;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE SEQUENCE __STRAPI_DB_SCHEMA__.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE __STRAPI_DB_SCHEMA__.up_users_id_seq OWNER TO __STRAPI_DB_USER__;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER SEQUENCE __STRAPI_DB_SCHEMA__.up_users_id_seq OWNED BY __STRAPI_DB_SCHEMA__.up_users.id;


--
-- Name: up_users_role_links; Type: TABLE; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE TABLE __STRAPI_DB_SCHEMA__.up_users_role_links (
    user_id integer,
    role_id integer
);


ALTER TABLE __STRAPI_DB_SCHEMA__.up_users_role_links OWNER TO __STRAPI_DB_USER__;

--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.admin_permissions ALTER COLUMN id SET DEFAULT nextval('__STRAPI_DB_SCHEMA__.admin_permissions_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.admin_roles ALTER COLUMN id SET DEFAULT nextval('__STRAPI_DB_SCHEMA__.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.admin_users ALTER COLUMN id SET DEFAULT nextval('__STRAPI_DB_SCHEMA__.admin_users_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.files ALTER COLUMN id SET DEFAULT nextval('__STRAPI_DB_SCHEMA__.files_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.i18n_locale ALTER COLUMN id SET DEFAULT nextval('__STRAPI_DB_SCHEMA__.i18n_locale_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.pages ALTER COLUMN id SET DEFAULT nextval('__STRAPI_DB_SCHEMA__.pages_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('__STRAPI_DB_SCHEMA__.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('__STRAPI_DB_SCHEMA__.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('__STRAPI_DB_SCHEMA__.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('__STRAPI_DB_SCHEMA__.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('__STRAPI_DB_SCHEMA__.strapi_webhooks_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.up_permissions ALTER COLUMN id SET DEFAULT nextval('__STRAPI_DB_SCHEMA__.up_permissions_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.up_roles ALTER COLUMN id SET DEFAULT nextval('__STRAPI_DB_SCHEMA__.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.up_users ALTER COLUMN id SET DEFAULT nextval('__STRAPI_DB_SCHEMA__.up_users_id_seq'::regclass);


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::upload.read	\N	{}	[]	2022-08-16 09:33:34.581	2022-08-16 09:33:34.581	\N	\N
2	plugin::upload.assets.create	\N	{}	[]	2022-08-16 09:33:34.586	2022-08-16 09:33:34.586	\N	\N
3	plugin::upload.assets.update	\N	{}	[]	2022-08-16 09:33:34.591	2022-08-16 09:33:34.591	\N	\N
4	plugin::upload.assets.download	\N	{}	[]	2022-08-16 09:33:34.595	2022-08-16 09:33:34.595	\N	\N
5	plugin::upload.assets.copy-link	\N	{}	[]	2022-08-16 09:33:34.604	2022-08-16 09:33:34.604	\N	\N
6	plugin::upload.read	\N	{}	["admin::is-creator"]	2022-08-16 09:33:34.609	2022-08-16 09:33:34.609	\N	\N
7	plugin::upload.assets.create	\N	{}	[]	2022-08-16 09:33:34.614	2022-08-16 09:33:34.614	\N	\N
8	plugin::upload.assets.update	\N	{}	["admin::is-creator"]	2022-08-16 09:33:34.618	2022-08-16 09:33:34.618	\N	\N
9	plugin::upload.assets.download	\N	{}	[]	2022-08-16 09:33:34.623	2022-08-16 09:33:34.623	\N	\N
10	plugin::upload.assets.copy-link	\N	{}	[]	2022-08-16 09:33:34.627	2022-08-16 09:33:34.627	\N	\N
11	plugin::content-manager.explorer.create	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2022-08-16 09:33:34.656	2022-08-16 09:33:34.656	\N	\N
12	plugin::content-manager.explorer.read	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2022-08-16 09:33:34.661	2022-08-16 09:33:34.661	\N	\N
13	plugin::content-manager.explorer.update	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2022-08-16 09:33:34.666	2022-08-16 09:33:34.666	\N	\N
14	plugin::content-manager.explorer.delete	plugin::users-permissions.user	{}	[]	2022-08-16 09:33:34.671	2022-08-16 09:33:34.671	\N	\N
15	plugin::content-manager.single-types.configure-view	\N	{}	[]	2022-08-16 09:33:34.676	2022-08-16 09:33:34.676	\N	\N
16	plugin::content-manager.collection-types.configure-view	\N	{}	[]	2022-08-16 09:33:34.681	2022-08-16 09:33:34.681	\N	\N
17	plugin::content-manager.components.configure-layout	\N	{}	[]	2022-08-16 09:33:34.686	2022-08-16 09:33:34.686	\N	\N
18	plugin::content-type-builder.read	\N	{}	[]	2022-08-16 09:33:34.69	2022-08-16 09:33:34.69	\N	\N
19	plugin::email.settings.read	\N	{}	[]	2022-08-16 09:33:34.695	2022-08-16 09:33:34.695	\N	\N
20	plugin::upload.read	\N	{}	[]	2022-08-16 09:33:34.701	2022-08-16 09:33:34.701	\N	\N
21	plugin::upload.assets.create	\N	{}	[]	2022-08-16 09:33:34.706	2022-08-16 09:33:34.706	\N	\N
22	plugin::upload.assets.update	\N	{}	[]	2022-08-16 09:33:34.711	2022-08-16 09:33:34.711	\N	\N
23	plugin::upload.assets.download	\N	{}	[]	2022-08-16 09:33:34.716	2022-08-16 09:33:34.716	\N	\N
24	plugin::upload.assets.copy-link	\N	{}	[]	2022-08-16 09:33:34.72	2022-08-16 09:33:34.72	\N	\N
25	plugin::upload.settings.read	\N	{}	[]	2022-08-16 09:33:34.727	2022-08-16 09:33:34.727	\N	\N
26	plugin::i18n.locale.create	\N	{}	[]	2022-08-16 09:33:34.735	2022-08-16 09:33:34.735	\N	\N
27	plugin::i18n.locale.read	\N	{}	[]	2022-08-16 09:33:34.74	2022-08-16 09:33:34.74	\N	\N
28	plugin::i18n.locale.update	\N	{}	[]	2022-08-16 09:33:34.745	2022-08-16 09:33:34.745	\N	\N
29	plugin::i18n.locale.delete	\N	{}	[]	2022-08-16 09:33:34.749	2022-08-16 09:33:34.749	\N	\N
30	plugin::users-permissions.roles.create	\N	{}	[]	2022-08-16 09:33:34.756	2022-08-16 09:33:34.756	\N	\N
31	plugin::users-permissions.roles.read	\N	{}	[]	2022-08-16 09:33:34.762	2022-08-16 09:33:34.762	\N	\N
32	plugin::users-permissions.roles.update	\N	{}	[]	2022-08-16 09:33:34.767	2022-08-16 09:33:34.767	\N	\N
33	plugin::users-permissions.roles.delete	\N	{}	[]	2022-08-16 09:33:34.772	2022-08-16 09:33:34.772	\N	\N
34	plugin::users-permissions.providers.read	\N	{}	[]	2022-08-16 09:33:34.776	2022-08-16 09:33:34.776	\N	\N
35	plugin::users-permissions.providers.update	\N	{}	[]	2022-08-16 09:33:34.78	2022-08-16 09:33:34.78	\N	\N
36	plugin::users-permissions.email-templates.read	\N	{}	[]	2022-08-16 09:33:34.786	2022-08-16 09:33:34.786	\N	\N
37	plugin::users-permissions.email-templates.update	\N	{}	[]	2022-08-16 09:33:34.799	2022-08-16 09:33:34.799	\N	\N
38	plugin::users-permissions.advanced-settings.read	\N	{}	[]	2022-08-16 09:33:34.808	2022-08-16 09:33:34.808	\N	\N
39	plugin::users-permissions.advanced-settings.update	\N	{}	[]	2022-08-16 09:33:34.818	2022-08-16 09:33:34.818	\N	\N
40	admin::marketplace.read	\N	{}	[]	2022-08-16 09:33:34.825	2022-08-16 09:33:34.825	\N	\N
41	admin::marketplace.plugins.install	\N	{}	[]	2022-08-16 09:33:34.833	2022-08-16 09:33:34.833	\N	\N
42	admin::marketplace.plugins.uninstall	\N	{}	[]	2022-08-16 09:33:34.84	2022-08-16 09:33:34.84	\N	\N
43	admin::webhooks.create	\N	{}	[]	2022-08-16 09:33:34.847	2022-08-16 09:33:34.847	\N	\N
44	admin::webhooks.read	\N	{}	[]	2022-08-16 09:33:34.862	2022-08-16 09:33:34.862	\N	\N
45	admin::webhooks.update	\N	{}	[]	2022-08-16 09:33:34.868	2022-08-16 09:33:34.868	\N	\N
46	admin::webhooks.delete	\N	{}	[]	2022-08-16 09:33:34.873	2022-08-16 09:33:34.873	\N	\N
47	admin::users.create	\N	{}	[]	2022-08-16 09:33:34.879	2022-08-16 09:33:34.879	\N	\N
48	admin::users.read	\N	{}	[]	2022-08-16 09:33:34.884	2022-08-16 09:33:34.884	\N	\N
49	admin::users.update	\N	{}	[]	2022-08-16 09:33:34.888	2022-08-16 09:33:34.888	\N	\N
50	admin::users.delete	\N	{}	[]	2022-08-16 09:33:34.893	2022-08-16 09:33:34.893	\N	\N
51	admin::roles.create	\N	{}	[]	2022-08-16 09:33:34.898	2022-08-16 09:33:34.898	\N	\N
52	admin::roles.read	\N	{}	[]	2022-08-16 09:33:34.902	2022-08-16 09:33:34.902	\N	\N
53	admin::roles.update	\N	{}	[]	2022-08-16 09:33:34.907	2022-08-16 09:33:34.907	\N	\N
54	admin::roles.delete	\N	{}	[]	2022-08-16 09:33:34.912	2022-08-16 09:33:34.912	\N	\N
55	admin::api-tokens.create	\N	{}	[]	2022-08-16 09:33:34.916	2022-08-16 09:33:34.916	\N	\N
56	admin::api-tokens.read	\N	{}	[]	2022-08-16 09:33:34.921	2022-08-16 09:33:34.921	\N	\N
57	admin::api-tokens.update	\N	{}	[]	2022-08-16 09:33:34.926	2022-08-16 09:33:34.926	\N	\N
58	admin::api-tokens.delete	\N	{}	[]	2022-08-16 09:33:34.931	2022-08-16 09:33:34.931	\N	\N
62	plugin::content-manager.explorer.delete	api::page.page	{}	[]	2022-08-16 09:37:35.856	2022-08-16 09:37:35.856	\N	\N
63	plugin::content-manager.explorer.publish	api::page.page	{}	[]	2022-08-16 09:37:35.863	2022-08-16 09:37:35.863	\N	\N
70	plugin::content-manager.explorer.create	api::page.page	{"fields": ["title", "content", "slug"]}	[]	2022-08-16 10:32:11.102	2022-08-16 10:32:11.102	\N	\N
71	plugin::content-manager.explorer.read	api::page.page	{"fields": ["title", "content", "slug"]}	[]	2022-08-16 10:32:11.108	2022-08-16 10:32:11.108	\N	\N
72	plugin::content-manager.explorer.update	api::page.page	{"fields": ["title", "content", "slug"]}	[]	2022-08-16 10:32:11.113	2022-08-16 10:32:11.113	\N	\N
\.


--
-- Data for Name: admin_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.admin_permissions_role_links (permission_id, role_id) FROM stdin;
1	2
2	2
3	2
4	2
5	2
6	3
7	3
8	3
9	3
10	3
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
52	1
53	1
54	1
55	1
56	1
57	1
58	1
62	1
63	1
70	1
71	1
72	1
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2022-08-16 09:33:34.567	2022-08-16 09:33:34.567	\N	\N
2	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2022-08-16 09:33:34.572	2022-08-16 09:33:34.572	\N	\N
3	Author	strapi-author	Authors can manage the content they have created.	2022-08-16 09:33:34.576	2022-08-16 09:33:34.576	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.admin_users (id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Company	Admin	\N	admin1@some-email.com	$2a$10$DSLqoKyf9/nwDH6Mt/6t6eEhJZrqoaos0aYYOfQlMCgfYinBpsxTC	\N	\N	t	f	\N	2022-08-16 09:34:15.197	2022-08-16 09:34:15.197	\N	\N
\.


--
-- Data for Name: admin_users_roles_links; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.admin_users_roles_links (user_id, role_id) FROM stdin;
1	1
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.files_related_morphs (file_id, related_id, related_type, field, "order") FROM stdin;
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	English (en)	en	2022-08-16 09:33:34.462	2022-08-16 09:33:34.462	\N	\N
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.pages (id, title, content, created_at, updated_at, published_at, created_by_id, updated_by_id, slug) FROM stdin;
1	Strapi Sample Homepage Content	Congratulations! You are seeing this message because this Next.JS page successfully obtained information from Strapi.\n\n![Logo](https://some-domain.com/public/assets/company--logo--light.webp)\n \n	2022-08-16 09:39:13.829	2022-08-16 10:29:36.21	2022-08-16 09:42:29.619	1	1	strapi-sample-homepage-content
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.strapi_api_tokens (id, name, description, type, access_key, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Next.JS App	API Key used by the Next.JS App front-end to communicate with Strapi. Only use in server-side calls; never expose this key in the browser!	full-access	6a57725acde48aeef81b5098389bb2f7b381608529e7f4051f1dee8be4f7116ef74009987b99b3e49c8f83742a12fabe25f476aa42238d67bc906b6a91326245	2022-08-17 11:06:42.434	2022-08-17 11:06:42.434	\N	\N
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
2	plugin_content_manager_configuration_content_types::admin::permission	{"uid":"admin::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"editRelations":["role"],"edit":[[{"name":"action","size":6},{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}]]}}	object	\N	\N
3	plugin_content_manager_configuration_content_types::admin::user	{"uid":"admin::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"editRelations":["roles"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"resetPasswordToken","size":6}],[{"name":"registrationToken","size":6},{"name":"isActive","size":4}],[{"name":"blocked","size":4},{"name":"preferedLanguage","size":6}]]}}	object	\N	\N
4	plugin_content_manager_configuration_content_types::admin::role	{"uid":"admin::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"editRelations":["users","permissions"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6}]]}}	object	\N	\N
5	plugin_content_manager_configuration_content_types::admin::api-token	{"uid":"admin::api-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"editRelations":[],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}]]}}	object	\N	\N
6	plugin_content_manager_configuration_content_types::plugin::upload.file	{"uid":"plugin::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"editRelations":[],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}]]}}	object	\N	\N
7	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"uid":"plugin::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"editRelations":[],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}	object	\N	\N
16	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null}}	object	\N	\N
8	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"uid":"plugin::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"editRelations":["role"],"edit":[[{"name":"action","size":6}]]}}	object	\N	\N
9	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"uid":"plugin::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"editRelations":["permissions","users"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6}]]}}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"uid":"plugin::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"editRelations":["role"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4}]]}}	object	\N	\N
11	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}	object	\N	\N
12	plugin_i18n_default_locale	"en"	string	\N	\N
13	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"api/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"api/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"api/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"api/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"}}	object	\N	\N
14	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
15	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
1	strapi_content_types_schema	{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access"],"configurable":false,"required":false,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access"],"configurable":false,"required":false,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"api::page.page":{"kind":"collectionType","collectionName":"pages","info":{"singularName":"page","pluralName":"pages","displayName":"Page","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"content":{"type":"richtext"},"slug":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"pages","info":{"singularName":"page","pluralName":"pages","displayName":"Page","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"content":{"type":"richtext"},"slug":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"page","connection":"default","uid":"api::page.page","apiName":"page","globalId":"Page","actions":{},"lifecycles":{}},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__filename__":"schema.json","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"}}	object	\N	\N
17	plugin_content_manager_configuration_content_types::api::page.page	{"uid":"api::page.page","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":false,"sortable":false}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"title","size":6}],[{"name":"slug","size":6}],[{"name":"content","size":12}]],"editRelations":[],"list":["id","createdAt","updatedAt","title"]}}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.strapi_database_schema (id, schema, "time", hash) FROM stdin;
3	{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"pages","indexes":[{"name":"pages_created_by_id_fk","columns":["created_by_id"]},{"name":"pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2022-08-16 09:38:20.394	abc4811c9e5288efcbb4950b9d6b7b14
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::users-permissions.auth.connect	2022-08-16 09:33:34.525	2022-08-16 09:33:34.525	\N	\N
2	plugin::users-permissions.user.me	2022-08-16 09:33:34.525	2022-08-16 09:33:34.525	\N	\N
5	plugin::users-permissions.auth.callback	2022-08-16 09:33:34.532	2022-08-16 09:33:34.532	\N	\N
6	plugin::users-permissions.auth.connect	2022-08-16 09:33:34.532	2022-08-16 09:33:34.532	\N	\N
9	plugin::users-permissions.auth.register	2022-08-16 09:33:34.532	2022-08-16 09:33:34.532	\N	\N
11	plugin::users-permissions.user.me	2022-08-16 09:33:34.532	2022-08-16 09:33:34.532	\N	\N
12	api::page.page.find	2022-08-16 09:39:57.475	2022-08-16 09:39:57.475	\N	\N
13	api::page.page.findOne	2022-08-16 09:39:57.475	2022-08-16 09:39:57.475	\N	\N
\.


--
-- Data for Name: up_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.up_permissions_role_links (permission_id, role_id) FROM stdin;
1	1
2	1
5	2
6	2
9	2
11	2
12	2
13	2
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Authenticated	Default role given to authenticated user.	authenticated	2022-08-16 09:33:34.514	2022-08-16 09:33:34.514	\N	\N
2	Public	Default role given to unauthenticated user.	public	2022-08-16 09:33:34.518	2022-08-16 09:39:57.464	\N	\N
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.up_users (id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: up_users_role_links; Type: TABLE DATA; Schema: public; Owner: __STRAPI_DB_USER__
--

COPY __STRAPI_DB_SCHEMA__.up_users_role_links (user_id, role_id) FROM stdin;
\.


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __STRAPI_DB_USER__
--

SELECT pg_catalog.setval('__STRAPI_DB_SCHEMA__.admin_permissions_id_seq', 72, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __STRAPI_DB_USER__
--

SELECT pg_catalog.setval('__STRAPI_DB_SCHEMA__.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __STRAPI_DB_USER__
--

SELECT pg_catalog.setval('__STRAPI_DB_SCHEMA__.admin_users_id_seq', 1, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __STRAPI_DB_USER__
--

SELECT pg_catalog.setval('__STRAPI_DB_SCHEMA__.files_id_seq', 1, false);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __STRAPI_DB_USER__
--

SELECT pg_catalog.setval('__STRAPI_DB_SCHEMA__.i18n_locale_id_seq', 1, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __STRAPI_DB_USER__
--

SELECT pg_catalog.setval('__STRAPI_DB_SCHEMA__.pages_id_seq', 4, true);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __STRAPI_DB_USER__
--

SELECT pg_catalog.setval('__STRAPI_DB_SCHEMA__.strapi_api_tokens_id_seq', 1, true);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __STRAPI_DB_USER__
--

SELECT pg_catalog.setval('__STRAPI_DB_SCHEMA__.strapi_core_store_settings_id_seq', 17, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __STRAPI_DB_USER__
--

SELECT pg_catalog.setval('__STRAPI_DB_SCHEMA__.strapi_database_schema_id_seq', 3, true);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __STRAPI_DB_USER__
--

SELECT pg_catalog.setval('__STRAPI_DB_SCHEMA__.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __STRAPI_DB_USER__
--

SELECT pg_catalog.setval('__STRAPI_DB_SCHEMA__.strapi_webhooks_id_seq', 1, false);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __STRAPI_DB_USER__
--

SELECT pg_catalog.setval('__STRAPI_DB_SCHEMA__.up_permissions_id_seq', 13, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __STRAPI_DB_USER__
--

SELECT pg_catalog.setval('__STRAPI_DB_SCHEMA__.up_roles_id_seq', 2, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __STRAPI_DB_USER__
--

SELECT pg_catalog.setval('__STRAPI_DB_SCHEMA__.up_users_id_seq', 1, false);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX admin_permissions_created_by_id_fk ON __STRAPI_DB_SCHEMA__.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX admin_permissions_role_links_fk ON __STRAPI_DB_SCHEMA__.admin_permissions_role_links USING btree (permission_id);


--
-- Name: admin_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX admin_permissions_role_links_inv_fk ON __STRAPI_DB_SCHEMA__.admin_permissions_role_links USING btree (role_id);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX admin_permissions_updated_by_id_fk ON __STRAPI_DB_SCHEMA__.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX admin_roles_created_by_id_fk ON __STRAPI_DB_SCHEMA__.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX admin_roles_updated_by_id_fk ON __STRAPI_DB_SCHEMA__.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX admin_users_created_by_id_fk ON __STRAPI_DB_SCHEMA__.admin_users USING btree (created_by_id);


--
-- Name: admin_users_roles_links_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX admin_users_roles_links_fk ON __STRAPI_DB_SCHEMA__.admin_users_roles_links USING btree (user_id);


--
-- Name: admin_users_roles_links_inv_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX admin_users_roles_links_inv_fk ON __STRAPI_DB_SCHEMA__.admin_users_roles_links USING btree (role_id);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX admin_users_updated_by_id_fk ON __STRAPI_DB_SCHEMA__.admin_users USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX files_created_by_id_fk ON __STRAPI_DB_SCHEMA__.files USING btree (created_by_id);


--
-- Name: files_related_morphs_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX files_related_morphs_fk ON __STRAPI_DB_SCHEMA__.files_related_morphs USING btree (file_id);


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX files_updated_by_id_fk ON __STRAPI_DB_SCHEMA__.files USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX i18n_locale_created_by_id_fk ON __STRAPI_DB_SCHEMA__.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX i18n_locale_updated_by_id_fk ON __STRAPI_DB_SCHEMA__.i18n_locale USING btree (updated_by_id);


--
-- Name: pages_created_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX pages_created_by_id_fk ON __STRAPI_DB_SCHEMA__.pages USING btree (created_by_id);


--
-- Name: pages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX pages_updated_by_id_fk ON __STRAPI_DB_SCHEMA__.pages USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON __STRAPI_DB_SCHEMA__.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON __STRAPI_DB_SCHEMA__.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX up_permissions_created_by_id_fk ON __STRAPI_DB_SCHEMA__.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX up_permissions_role_links_fk ON __STRAPI_DB_SCHEMA__.up_permissions_role_links USING btree (permission_id);


--
-- Name: up_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX up_permissions_role_links_inv_fk ON __STRAPI_DB_SCHEMA__.up_permissions_role_links USING btree (role_id);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX up_permissions_updated_by_id_fk ON __STRAPI_DB_SCHEMA__.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX up_roles_created_by_id_fk ON __STRAPI_DB_SCHEMA__.up_roles USING btree (created_by_id);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX up_roles_updated_by_id_fk ON __STRAPI_DB_SCHEMA__.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX up_users_created_by_id_fk ON __STRAPI_DB_SCHEMA__.up_users USING btree (created_by_id);


--
-- Name: up_users_role_links_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX up_users_role_links_fk ON __STRAPI_DB_SCHEMA__.up_users_role_links USING btree (user_id);


--
-- Name: up_users_role_links_inv_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX up_users_role_links_inv_fk ON __STRAPI_DB_SCHEMA__.up_users_role_links USING btree (role_id);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: __STRAPI_DB_USER__
--

CREATE INDEX up_users_updated_by_id_fk ON __STRAPI_DB_SCHEMA__.up_users USING btree (updated_by_id);


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_links admin_users_roles_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_links admin_users_roles_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_related_morphs files_related_morphs_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES __STRAPI_DB_SCHEMA__.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: pages pages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.pages
    ADD CONSTRAINT pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: pages pages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.pages
    ADD CONSTRAINT pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_links up_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES __STRAPI_DB_SCHEMA__.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_links up_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES __STRAPI_DB_SCHEMA__.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_links up_users_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES __STRAPI_DB_SCHEMA__.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_links up_users_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES __STRAPI_DB_SCHEMA__.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __STRAPI_DB_USER__
--

ALTER TABLE ONLY __STRAPI_DB_SCHEMA__.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES __STRAPI_DB_SCHEMA__.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

