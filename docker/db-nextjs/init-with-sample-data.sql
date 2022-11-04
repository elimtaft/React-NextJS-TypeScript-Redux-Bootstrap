--
/* nextjs-app local db */
GRANT CREATE ON SCHEMA __NEXTJS_DB_SCHEMA__ TO __NEXTJS_DB_USER__;
GRANT USAGE ON SCHEMA __NEXTJS_DB_SCHEMA__ TO __NEXTJS_DB_USER__;

-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Debian 13.5-1.pgdg110+1)
-- Dumped by pg_dump version 13.5 (Debian 13.5-1.pgdg110+1)

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
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: __NEXTJS_DB_USER__
--

CREATE TABLE __NEXTJS_DB_SCHEMA__._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE __NEXTJS_DB_SCHEMA__._prisma_migrations OWNER TO __NEXTJS_DB_USER__;

--
-- Name: users; Type: TABLE; Schema: public; Owner: __NEXTJS_DB_USER__
--

CREATE TABLE __NEXTJS_DB_SCHEMA__.users (
    id integer NOT NULL,
    username text,
    password text,
    "firstName" text,
    "lastName" text,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    access_token text
);


ALTER TABLE __NEXTJS_DB_SCHEMA__.users OWNER TO __NEXTJS_DB_USER__;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: __NEXTJS_DB_USER__
--

CREATE SEQUENCE __NEXTJS_DB_SCHEMA__.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE __NEXTJS_DB_SCHEMA__.users_id_seq OWNER TO __NEXTJS_DB_USER__;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __NEXTJS_DB_USER__
--

ALTER SEQUENCE __NEXTJS_DB_SCHEMA__.users_id_seq OWNED BY __NEXTJS_DB_SCHEMA__.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: __NEXTJS_DB_USER__
--

ALTER TABLE ONLY __NEXTJS_DB_SCHEMA__.users ALTER COLUMN id SET DEFAULT nextval('__NEXTJS_DB_SCHEMA__.users_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: __NEXTJS_DB_USER__
--

COPY __NEXTJS_DB_SCHEMA__._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
d4adcd9a-7753-4f84-9797-15dc5d6a0783	9c66ecbfa5481300cb416bcff900c4f9d997d1f4cc41754268121d73397abeb5	2021-12-23 03:47:54.942831+00	20210804194243_0001	\N	\N	2021-12-23 03:47:54.912897+00	1
d69cb6e3-dfbc-46b4-beea-4138abd27d3a	8f5f77de73c77db566e7e86f73385f6bc13a3d065d03ff309715fa86f167c25b	2021-12-23 03:47:54.960136+00	20210811150637_add_tokens	\N	\N	2021-12-23 03:47:54.947067+00	1
fe039c05-f1c2-443a-955f-6fdfa98e5058	43935952f67184d8619c03437aab56bdb18989c4d8e848411a54f069a08de871	2021-12-23 03:47:54.981063+00	20210812190942_remove_refresh_token	\N	\N	2021-12-23 03:47:54.964515+00	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: __NEXTJS_DB_USER__
--

COPY __NEXTJS_DB_SCHEMA__.users (id, username, password, "firstName", "lastName", created_at, updated_at, access_token) FROM stdin;
1	username	$2a$12$URkgzaSWw.mQi9tW/KXw3esW/H9pWHcsbOqWt6BIdSgUfsqIvcEda	Local	User	2021-12-23 19:01:51.76	2021-12-23 19:02:11.196	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __NEXTJS_DB_USER__
--

SELECT pg_catalog.setval('__NEXTJS_DB_SCHEMA__.users_id_seq', 1, true);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: __NEXTJS_DB_USER__
--

ALTER TABLE ONLY __NEXTJS_DB_SCHEMA__._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: __NEXTJS_DB_USER__
--

ALTER TABLE ONLY __NEXTJS_DB_SCHEMA__.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users.username_unique; Type: INDEX; Schema: public; Owner: __NEXTJS_DB_USER__
--

CREATE UNIQUE INDEX "users.username_unique" ON __NEXTJS_DB_SCHEMA__.users USING btree (username);


--
-- PostgreSQL database dump complete
--

