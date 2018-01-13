--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin_profiles; Type: TABLE; Schema: public; Owner: paveltkachenko
--

CREATE TABLE admin_profiles (
    id bigint NOT NULL,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE admin_profiles OWNER TO paveltkachenko;

--
-- Name: admin_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: paveltkachenko
--

CREATE SEQUENCE admin_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin_profiles_id_seq OWNER TO paveltkachenko;

--
-- Name: admin_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paveltkachenko
--

ALTER SEQUENCE admin_profiles_id_seq OWNED BY admin_profiles.id;


--
-- Name: adverts; Type: TABLE; Schema: public; Owner: paveltkachenko
--

CREATE TABLE adverts (
    id bigint NOT NULL,
    advertable_type character varying,
    advertable_id integer,
    title character varying,
    content text,
    author_id integer,
    pinned boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE adverts OWNER TO paveltkachenko;

--
-- Name: adverts_id_seq; Type: SEQUENCE; Schema: public; Owner: paveltkachenko
--

CREATE SEQUENCE adverts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adverts_id_seq OWNER TO paveltkachenko;

--
-- Name: adverts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paveltkachenko
--

ALTER SEQUENCE adverts_id_seq OWNED BY adverts.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: paveltkachenko
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO paveltkachenko;

--
-- Name: custodian_profiles; Type: TABLE; Schema: public; Owner: paveltkachenko
--

CREATE TABLE custodian_profiles (
    id bigint NOT NULL,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE custodian_profiles OWNER TO paveltkachenko;

--
-- Name: custodian_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: paveltkachenko
--

CREATE SEQUENCE custodian_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE custodian_profiles_id_seq OWNER TO paveltkachenko;

--
-- Name: custodian_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paveltkachenko
--

ALTER SEQUENCE custodian_profiles_id_seq OWNED BY custodian_profiles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: paveltkachenko
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO paveltkachenko;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: paveltkachenko
--

CREATE TABLE settings (
    id bigint NOT NULL,
    var character varying NOT NULL,
    value text,
    thing_id integer,
    thing_type character varying(30),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE settings OWNER TO paveltkachenko;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: paveltkachenko
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE settings_id_seq OWNER TO paveltkachenko;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paveltkachenko
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- Name: student_profiles; Type: TABLE; Schema: public; Owner: paveltkachenko
--

CREATE TABLE student_profiles (
    id bigint NOT NULL,
    user_id integer,
    date_of_admission date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE student_profiles OWNER TO paveltkachenko;

--
-- Name: student_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: paveltkachenko
--

CREATE SEQUENCE student_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE student_profiles_id_seq OWNER TO paveltkachenko;

--
-- Name: student_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paveltkachenko
--

ALTER SEQUENCE student_profiles_id_seq OWNED BY student_profiles.id;


--
-- Name: study_group_students; Type: TABLE; Schema: public; Owner: paveltkachenko
--

CREATE TABLE study_group_students (
    id bigint NOT NULL,
    user_id integer,
    study_group_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE study_group_students OWNER TO paveltkachenko;

--
-- Name: study_group_students_id_seq; Type: SEQUENCE; Schema: public; Owner: paveltkachenko
--

CREATE SEQUENCE study_group_students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE study_group_students_id_seq OWNER TO paveltkachenko;

--
-- Name: study_group_students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paveltkachenko
--

ALTER SEQUENCE study_group_students_id_seq OWNED BY study_group_students.id;


--
-- Name: study_group_supervisors; Type: TABLE; Schema: public; Owner: paveltkachenko
--

CREATE TABLE study_group_supervisors (
    id bigint NOT NULL,
    user_id integer,
    study_group_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE study_group_supervisors OWNER TO paveltkachenko;

--
-- Name: study_group_supervisors_id_seq; Type: SEQUENCE; Schema: public; Owner: paveltkachenko
--

CREATE SEQUENCE study_group_supervisors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE study_group_supervisors_id_seq OWNER TO paveltkachenko;

--
-- Name: study_group_supervisors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paveltkachenko
--

ALTER SEQUENCE study_group_supervisors_id_seq OWNED BY study_group_supervisors.id;


--
-- Name: study_groups; Type: TABLE; Schema: public; Owner: paveltkachenko
--

CREATE TABLE study_groups (
    id bigint NOT NULL,
    title character varying,
    level character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    avatar character varying
);


ALTER TABLE study_groups OWNER TO paveltkachenko;

--
-- Name: study_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: paveltkachenko
--

CREATE SEQUENCE study_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE study_groups_id_seq OWNER TO paveltkachenko;

--
-- Name: study_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paveltkachenko
--

ALTER SEQUENCE study_groups_id_seq OWNED BY study_groups.id;


--
-- Name: subjects; Type: TABLE; Schema: public; Owner: paveltkachenko
--

CREATE TABLE subjects (
    id bigint NOT NULL,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE subjects OWNER TO paveltkachenko;

--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: paveltkachenko
--

CREATE SEQUENCE subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subjects_id_seq OWNER TO paveltkachenko;

--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paveltkachenko
--

ALTER SEQUENCE subjects_id_seq OWNED BY subjects.id;


--
-- Name: teacher_profiles; Type: TABLE; Schema: public; Owner: paveltkachenko
--

CREATE TABLE teacher_profiles (
    id bigint NOT NULL,
    user_id integer,
    date_of_admission date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    edu_work_experience integer,
    total_work_experience integer
);


ALTER TABLE teacher_profiles OWNER TO paveltkachenko;

--
-- Name: teacher_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: paveltkachenko
--

CREATE SEQUENCE teacher_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teacher_profiles_id_seq OWNER TO paveltkachenko;

--
-- Name: teacher_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paveltkachenko
--

ALTER SEQUENCE teacher_profiles_id_seq OWNED BY teacher_profiles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: paveltkachenko
--

CREATE TABLE users (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    middle_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    iin character varying DEFAULT ''::character varying NOT NULL,
    config jsonb DEFAULT '{}'::jsonb,
    date_of_birth date,
    gender character varying,
    temp_password character varying,
    avatar character varying
);


ALTER TABLE users OWNER TO paveltkachenko;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: paveltkachenko
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO paveltkachenko;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paveltkachenko
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: admin_profiles id; Type: DEFAULT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY admin_profiles ALTER COLUMN id SET DEFAULT nextval('admin_profiles_id_seq'::regclass);


--
-- Name: adverts id; Type: DEFAULT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY adverts ALTER COLUMN id SET DEFAULT nextval('adverts_id_seq'::regclass);


--
-- Name: custodian_profiles id; Type: DEFAULT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY custodian_profiles ALTER COLUMN id SET DEFAULT nextval('custodian_profiles_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- Name: student_profiles id; Type: DEFAULT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY student_profiles ALTER COLUMN id SET DEFAULT nextval('student_profiles_id_seq'::regclass);


--
-- Name: study_group_students id; Type: DEFAULT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY study_group_students ALTER COLUMN id SET DEFAULT nextval('study_group_students_id_seq'::regclass);


--
-- Name: study_group_supervisors id; Type: DEFAULT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY study_group_supervisors ALTER COLUMN id SET DEFAULT nextval('study_group_supervisors_id_seq'::regclass);


--
-- Name: study_groups id; Type: DEFAULT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY study_groups ALTER COLUMN id SET DEFAULT nextval('study_groups_id_seq'::regclass);


--
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY subjects ALTER COLUMN id SET DEFAULT nextval('subjects_id_seq'::regclass);


--
-- Name: teacher_profiles id; Type: DEFAULT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY teacher_profiles ALTER COLUMN id SET DEFAULT nextval('teacher_profiles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: admin_profiles; Type: TABLE DATA; Schema: public; Owner: paveltkachenko
--

COPY admin_profiles (id, user_id, created_at, updated_at) FROM stdin;
1	1	2018-01-08 09:48:15.298143	2018-01-08 09:48:15.298143
\.


--
-- Name: admin_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paveltkachenko
--

SELECT pg_catalog.setval('admin_profiles_id_seq', 1, true);


--
-- Data for Name: adverts; Type: TABLE DATA; Schema: public; Owner: paveltkachenko
--

COPY adverts (id, advertable_type, advertable_id, title, content, author_id, pinned, created_at, updated_at) FROM stdin;
\.


--
-- Name: adverts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paveltkachenko
--

SELECT pg_catalog.setval('adverts_id_seq', 2, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: paveltkachenko
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2018-01-08 08:21:31.688359	2018-01-08 08:21:31.688359
\.


--
-- Data for Name: custodian_profiles; Type: TABLE DATA; Schema: public; Owner: paveltkachenko
--

COPY custodian_profiles (id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: custodian_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paveltkachenko
--

SELECT pg_catalog.setval('custodian_profiles_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: paveltkachenko
--

COPY schema_migrations (version) FROM stdin;
20180108081529
20180108081708
20180108083502
20180108093953
20180108094428
20180108095641
20180108101254
20180108160042
20180109083631
20180109083643
20180109084110
20180110044603
20180110091702
20180111062729
20180111072315
20180111072850
20180111095937
20180111133554
20180111202225
20180111212519
20180112094059
20180112104659
20180113035644
20180113044141
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: paveltkachenko
--

COPY settings (id, var, value, thing_id, thing_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paveltkachenko
--

SELECT pg_catalog.setval('settings_id_seq', 1, false);


--
-- Data for Name: student_profiles; Type: TABLE DATA; Schema: public; Owner: paveltkachenko
--

COPY student_profiles (id, user_id, date_of_admission, created_at, updated_at, deleted_at) FROM stdin;
9	3	2018-01-03	2018-01-11 06:24:27.474185	2018-01-11 22:24:49.059958	\N
10	4	2018-01-02	2018-01-11 07:37:07.225251	2018-01-12 08:57:27.526777	\N
12	5	\N	2018-01-11 21:58:06.512589	2018-01-12 09:11:44.452868	\N
11	1	\N	2018-01-11 08:10:59.600934	2018-01-12 09:46:05.200418	\N
1	2	2018-01-10	2018-01-10 10:00:34.184559	2018-01-11 06:49:29.440375	\N
\.


--
-- Name: student_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paveltkachenko
--

SELECT pg_catalog.setval('student_profiles_id_seq', 12, true);


--
-- Data for Name: study_group_students; Type: TABLE DATA; Schema: public; Owner: paveltkachenko
--

COPY study_group_students (id, user_id, study_group_id, created_at, updated_at) FROM stdin;
44	2	1	2018-01-12 09:08:35.128876	2018-01-12 09:08:35.128876
47	5	1	2018-01-12 09:31:32.830595	2018-01-12 09:31:32.830595
48	1	1	2018-01-12 09:46:25.679598	2018-01-12 09:46:25.679598
49	3	1	2018-01-12 10:21:17.370511	2018-01-12 10:21:17.370511
50	4	1	2018-01-12 10:21:19.564375	2018-01-12 10:21:19.564375
\.


--
-- Name: study_group_students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paveltkachenko
--

SELECT pg_catalog.setval('study_group_students_id_seq', 50, true);


--
-- Data for Name: study_group_supervisors; Type: TABLE DATA; Schema: public; Owner: paveltkachenko
--

COPY study_group_supervisors (id, user_id, study_group_id, created_at, updated_at) FROM stdin;
4	4	2	2018-01-12 10:16:07.841385	2018-01-12 10:16:07.841385
5	1	1	2018-01-13 03:38:20.36215	2018-01-13 03:38:20.36215
6	3	1	2018-01-13 07:20:49.859372	2018-01-13 07:20:49.859372
\.


--
-- Name: study_group_supervisors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paveltkachenko
--

SELECT pg_catalog.setval('study_group_supervisors_id_seq', 6, true);


--
-- Data for Name: study_groups; Type: TABLE DATA; Schema: public; Owner: paveltkachenko
--

COPY study_groups (id, title, level, created_at, updated_at, avatar) FROM stdin;
1	А	1	2018-01-11 10:21:59.07474	2018-01-11 10:21:59.07474	\N
2	Б	2	2018-01-11 22:24:05.040813	2018-01-11 22:24:05.040813	\N
\.


--
-- Name: study_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paveltkachenko
--

SELECT pg_catalog.setval('study_groups_id_seq', 2, true);


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: paveltkachenko
--

COPY subjects (id, title, created_at, updated_at) FROM stdin;
1	Математика	2018-01-12 11:53:17.591524	2018-01-12 11:53:17.591524
\.


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paveltkachenko
--

SELECT pg_catalog.setval('subjects_id_seq', 1, true);


--
-- Data for Name: teacher_profiles; Type: TABLE DATA; Schema: public; Owner: paveltkachenko
--

COPY teacher_profiles (id, user_id, date_of_admission, created_at, updated_at, deleted_at, edu_work_experience, total_work_experience) FROM stdin;
1	3	2018-01-11	2018-01-11 07:26:46.319328	2018-01-11 07:34:16.064306	\N	1	2
2	4	\N	2018-01-11 07:37:08.54075	2018-01-11 07:37:08.54075	\N	\N	\N
3	1	\N	2018-01-11 08:11:03.581046	2018-01-11 08:11:03.581046	\N	\N	\N
4	2	\N	2018-01-11 13:54:11.613187	2018-01-11 13:54:11.613187	\N	\N	\N
\.


--
-- Name: teacher_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paveltkachenko
--

SELECT pg_catalog.setval('teacher_profiles_id_seq', 4, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: paveltkachenko
--

COPY users (id, first_name, last_name, middle_name, created_at, updated_at, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, iin, config, date_of_birth, gender, temp_password, avatar) FROM stdin;
4	Илья	Тимченко 	Александрович	2018-01-11 07:37:00.712269	2018-01-11 22:13:04.82552		$2a$10$8ENEbHRtR6ThgS0iF5X6r..NfDPcynZdCYUwxrhCWJtbMPOeL.faK	\N	\N	\N	0	\N	\N	\N	\N	870801300212	{}	1987-08-01	male	16946569	0eac2697-97e3-4956-a6b0-88721a5a1a73.png
3	Борис	Стуков	Евгеньевич	2018-01-10 09:15:19.272298	2018-01-11 22:13:10.805513		$2a$10$WWa5/TT9iJb1rgE4gPaJ.eNXbOLY1zIlTA/5.lrhc1nE/bEk2l/1y	\N	\N	\N	0	\N	\N	\N	\N	880218300275	{}	2018-01-10	male	90389048	cf2c3ab3-9392-42fa-84b8-1beda1b20be0.png
2	Вячеслав	Ткаченко		2018-01-08 10:03:54.498977	2018-01-11 22:13:17.140478		$2a$10$LJsmhjs1eOPx3VXAtNMPju1uMXvDsa4xUE2amgv0TYs8iPejni5.C	\N	\N	\N	0	\N	\N	\N	\N	910326300657	{}	2018-01-10	male	96977243	8b4e4a58-3eed-42c5-9359-914832bb5f36.png
5	Иван	Иванов	Иванович	2018-01-11 21:57:45.849544	2018-01-11 22:13:29.954133		$2a$10$36QDKFFWO3n/0RrzwYuY4.2lFptbuT5oAM6mQ48K6Kz64UMoRNhtu	\N	\N	\N	0	\N	\N	\N	\N	990909300200	{}	2018-01-12	male	61715823	46705437-b02a-4c82-9cb6-3fa66fc0f185.png
1	Павел	Ткаченко	Евгеньевич	2018-01-08 09:08:05.66988	2018-01-13 03:38:05.632125	tpepost@gmail.com	$2a$10$Bf5k61RlowqCKshoSo5qGu5IaHvRCN.PAecHxjWkDxDHw7s7sA/IS	\N	\N	\N	19	2018-01-11 21:42:53.216343	2018-01-08 09:41:32.230486	127.0.0.1	127.0.0.1	880909300211	{}	1988-09-09	male	\N	f74b8b79-b203-435f-a5a0-90f9045e4ec7.png
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paveltkachenko
--

SELECT pg_catalog.setval('users_id_seq', 5, true);


--
-- Name: admin_profiles admin_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY admin_profiles
    ADD CONSTRAINT admin_profiles_pkey PRIMARY KEY (id);


--
-- Name: adverts adverts_pkey; Type: CONSTRAINT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY adverts
    ADD CONSTRAINT adverts_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: custodian_profiles custodian_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY custodian_profiles
    ADD CONSTRAINT custodian_profiles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: student_profiles student_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY student_profiles
    ADD CONSTRAINT student_profiles_pkey PRIMARY KEY (id);


--
-- Name: study_group_students study_group_students_pkey; Type: CONSTRAINT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY study_group_students
    ADD CONSTRAINT study_group_students_pkey PRIMARY KEY (id);


--
-- Name: study_group_supervisors study_group_supervisors_pkey; Type: CONSTRAINT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY study_group_supervisors
    ADD CONSTRAINT study_group_supervisors_pkey PRIMARY KEY (id);


--
-- Name: study_groups study_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY study_groups
    ADD CONSTRAINT study_groups_pkey PRIMARY KEY (id);


--
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- Name: teacher_profiles teacher_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY teacher_profiles
    ADD CONSTRAINT teacher_profiles_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: paveltkachenko
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_admin_profiles_on_user_id; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE INDEX index_admin_profiles_on_user_id ON admin_profiles USING btree (user_id);


--
-- Name: index_adverts_on_advertable_id; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE INDEX index_adverts_on_advertable_id ON adverts USING btree (advertable_id);


--
-- Name: index_adverts_on_advertable_type; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE INDEX index_adverts_on_advertable_type ON adverts USING btree (advertable_type);


--
-- Name: index_adverts_on_advertable_type_and_advertable_id; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE INDEX index_adverts_on_advertable_type_and_advertable_id ON adverts USING btree (advertable_type, advertable_id);


--
-- Name: index_adverts_on_author_id; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE INDEX index_adverts_on_author_id ON adverts USING btree (author_id);


--
-- Name: index_adverts_on_pinned; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE INDEX index_adverts_on_pinned ON adverts USING btree (pinned);


--
-- Name: index_custodian_profiles_on_user_id; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE INDEX index_custodian_profiles_on_user_id ON custodian_profiles USING btree (user_id);


--
-- Name: index_settings_on_thing_type_and_thing_id_and_var; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE UNIQUE INDEX index_settings_on_thing_type_and_thing_id_and_var ON settings USING btree (thing_type, thing_id, var);


--
-- Name: index_student_profiles_on_date_of_admission; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE INDEX index_student_profiles_on_date_of_admission ON student_profiles USING btree (date_of_admission);


--
-- Name: index_student_profiles_on_deleted_at; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE INDEX index_student_profiles_on_deleted_at ON student_profiles USING btree (deleted_at);


--
-- Name: index_student_profiles_on_user_id; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE INDEX index_student_profiles_on_user_id ON student_profiles USING btree (user_id);


--
-- Name: index_study_group_students_on_study_group_id; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE INDEX index_study_group_students_on_study_group_id ON study_group_students USING btree (study_group_id);


--
-- Name: index_study_group_students_on_user_id; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE UNIQUE INDEX index_study_group_students_on_user_id ON study_group_students USING btree (user_id);


--
-- Name: index_study_group_supervisors_on_user_id_and_study_group_id; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE UNIQUE INDEX index_study_group_supervisors_on_user_id_and_study_group_id ON study_group_supervisors USING btree (user_id, study_group_id);


--
-- Name: index_study_groups_on_title_and_level; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE UNIQUE INDEX index_study_groups_on_title_and_level ON study_groups USING btree (title, level);


--
-- Name: index_subjects_on_title; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE UNIQUE INDEX index_subjects_on_title ON subjects USING btree (title);


--
-- Name: index_teacher_profiles_on_date_of_admission; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE INDEX index_teacher_profiles_on_date_of_admission ON teacher_profiles USING btree (date_of_admission);


--
-- Name: index_teacher_profiles_on_deleted_at; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE INDEX index_teacher_profiles_on_deleted_at ON teacher_profiles USING btree (deleted_at);


--
-- Name: index_teacher_profiles_on_user_id; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE INDEX index_teacher_profiles_on_user_id ON teacher_profiles USING btree (user_id);


--
-- Name: index_users_on_date_of_birth; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE INDEX index_users_on_date_of_birth ON users USING btree (date_of_birth);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_gender; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE INDEX index_users_on_gender ON users USING btree (gender);


--
-- Name: index_users_on_iin; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE UNIQUE INDEX index_users_on_iin ON users USING btree (iin);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: paveltkachenko
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- PostgreSQL database dump complete
--

