--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: achievements; Type: TABLE; Schema: public; Owner: Dana; Tablespace: 
--

CREATE TABLE achievements (
    id integer NOT NULL,
    name character varying,
    description character varying,
    education_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE achievements OWNER TO "Dana";

--
-- Name: achievements_id_seq; Type: SEQUENCE; Schema: public; Owner: Dana
--

CREATE SEQUENCE achievements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE achievements_id_seq OWNER TO "Dana";

--
-- Name: achievements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dana
--

ALTER SEQUENCE achievements_id_seq OWNED BY achievements.id;


--
-- Name: degrees; Type: TABLE; Schema: public; Owner: Dana; Tablespace: 
--

CREATE TABLE degrees (
    id integer NOT NULL,
    level character varying,
    completed boolean,
    education_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE degrees OWNER TO "Dana";

--
-- Name: degrees_id_seq; Type: SEQUENCE; Schema: public; Owner: Dana
--

CREATE SEQUENCE degrees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE degrees_id_seq OWNER TO "Dana";

--
-- Name: degrees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dana
--

ALTER SEQUENCE degrees_id_seq OWNED BY degrees.id;


--
-- Name: educations; Type: TABLE; Schema: public; Owner: Dana; Tablespace: 
--

CREATE TABLE educations (
    id integer NOT NULL,
    name character varying,
    "startDate" date,
    "endDate" date,
    gpa numeric,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE educations OWNER TO "Dana";

--
-- Name: educations_id_seq; Type: SEQUENCE; Schema: public; Owner: Dana
--

CREATE SEQUENCE educations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educations_id_seq OWNER TO "Dana";

--
-- Name: educations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dana
--

ALTER SEQUENCE educations_id_seq OWNED BY educations.id;


--
-- Name: employments; Type: TABLE; Schema: public; Owner: Dana; Tablespace: 
--

CREATE TABLE employments (
    id integer NOT NULL,
    name character varying,
    "startDate" date,
    "endDate" date,
    address character varying,
    phone character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE employments OWNER TO "Dana";

--
-- Name: employments_id_seq; Type: SEQUENCE; Schema: public; Owner: Dana
--

CREATE SEQUENCE employments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE employments_id_seq OWNER TO "Dana";

--
-- Name: employments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dana
--

ALTER SEQUENCE employments_id_seq OWNED BY employments.id;


--
-- Name: interests; Type: TABLE; Schema: public; Owner: Dana; Tablespace: 
--

CREATE TABLE interests (
    id integer NOT NULL,
    name character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE interests OWNER TO "Dana";

--
-- Name: interests_id_seq; Type: SEQUENCE; Schema: public; Owner: Dana
--

CREATE SEQUENCE interests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE interests_id_seq OWNER TO "Dana";

--
-- Name: interests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dana
--

ALTER SEQUENCE interests_id_seq OWNED BY interests.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: Dana; Tablespace: 
--

CREATE TABLE languages (
    id integer NOT NULL,
    language character varying,
    fluency character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE languages OWNER TO "Dana";

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: Dana
--

CREATE SEQUENCE languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE languages_id_seq OWNER TO "Dana";

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dana
--

ALTER SEQUENCE languages_id_seq OWNED BY languages.id;


--
-- Name: positions; Type: TABLE; Schema: public; Owner: Dana; Tablespace: 
--

CREATE TABLE positions (
    id integer NOT NULL,
    title character varying,
    "startDate" date,
    "endDate" date,
    employment_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE positions OWNER TO "Dana";

--
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: Dana
--

CREATE SEQUENCE positions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE positions_id_seq OWNER TO "Dana";

--
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dana
--

ALTER SEQUENCE positions_id_seq OWNED BY positions.id;


--
-- Name: responsibilities; Type: TABLE; Schema: public; Owner: Dana; Tablespace: 
--

CREATE TABLE responsibilities (
    id integer NOT NULL,
    description text,
    position_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE responsibilities OWNER TO "Dana";

--
-- Name: responsibilities_id_seq; Type: SEQUENCE; Schema: public; Owner: Dana
--

CREATE SEQUENCE responsibilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE responsibilities_id_seq OWNER TO "Dana";

--
-- Name: responsibilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dana
--

ALTER SEQUENCE responsibilities_id_seq OWNED BY responsibilities.id;


--
-- Name: resumes; Type: TABLE; Schema: public; Owner: Dana; Tablespace: 
--

CREATE TABLE resumes (
    id integer NOT NULL,
    name character varying,
    skills character varying,
    languages character varying,
    interests character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    education character varying,
    employment character varying
);


ALTER TABLE resumes OWNER TO "Dana";

--
-- Name: resumes_id_seq; Type: SEQUENCE; Schema: public; Owner: Dana
--

CREATE SEQUENCE resumes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resumes_id_seq OWNER TO "Dana";

--
-- Name: resumes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dana
--

ALTER SEQUENCE resumes_id_seq OWNED BY resumes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: Dana; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "Dana";

--
-- Name: skills; Type: TABLE; Schema: public; Owner: Dana; Tablespace: 
--

CREATE TABLE skills (
    id integer NOT NULL,
    name character varying,
    skilltype_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE skills OWNER TO "Dana";

--
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: Dana
--

CREATE SEQUENCE skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE skills_id_seq OWNER TO "Dana";

--
-- Name: skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dana
--

ALTER SEQUENCE skills_id_seq OWNED BY skills.id;


--
-- Name: skilltypes; Type: TABLE; Schema: public; Owner: Dana; Tablespace: 
--

CREATE TABLE skilltypes (
    id integer NOT NULL,
    name character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE skilltypes OWNER TO "Dana";

--
-- Name: skilltypes_id_seq; Type: SEQUENCE; Schema: public; Owner: Dana
--

CREATE SEQUENCE skilltypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE skilltypes_id_seq OWNER TO "Dana";

--
-- Name: skilltypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dana
--

ALTER SEQUENCE skilltypes_id_seq OWNED BY skilltypes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: Dana; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    fname character varying,
    lname character varying,
    email character varying,
    password_digest character varying,
    phone character varying,
    url character varying,
    linkedin character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO "Dana";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Dana
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "Dana";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dana
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY achievements ALTER COLUMN id SET DEFAULT nextval('achievements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY degrees ALTER COLUMN id SET DEFAULT nextval('degrees_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY educations ALTER COLUMN id SET DEFAULT nextval('educations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY employments ALTER COLUMN id SET DEFAULT nextval('employments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY interests ALTER COLUMN id SET DEFAULT nextval('interests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY languages ALTER COLUMN id SET DEFAULT nextval('languages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY positions ALTER COLUMN id SET DEFAULT nextval('positions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY responsibilities ALTER COLUMN id SET DEFAULT nextval('responsibilities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY resumes ALTER COLUMN id SET DEFAULT nextval('resumes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY skills ALTER COLUMN id SET DEFAULT nextval('skills_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY skilltypes ALTER COLUMN id SET DEFAULT nextval('skilltypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: achievements; Type: TABLE DATA; Schema: public; Owner: Dana
--

COPY achievements (id, name, description, education_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: achievements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dana
--

SELECT pg_catalog.setval('achievements_id_seq', 1, false);


--
-- Data for Name: degrees; Type: TABLE DATA; Schema: public; Owner: Dana
--

COPY degrees (id, level, completed, education_id, created_at, updated_at) FROM stdin;
1	Masters	t	1	2016-03-03 02:08:20.76808	2016-03-03 02:08:20.76808
2	PHD	t	1	2016-03-03 03:12:32.098661	2016-03-03 03:12:32.098661
3	Associates	t	2	2016-03-03 19:44:07.808024	2016-03-03 19:44:07.808024
\.


--
-- Name: degrees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dana
--

SELECT pg_catalog.setval('degrees_id_seq', 3, true);


--
-- Data for Name: educations; Type: TABLE DATA; Schema: public; Owner: Dana
--

COPY educations (id, name, "startDate", "endDate", gpa, user_id, created_at, updated_at) FROM stdin;
1	General Assembly	2015-11-01	2016-03-05	5.5	3	2016-03-03 01:51:40.683762	2016-03-03 01:51:40.683762
2	New York University	2012-09-15	2014-06-30	3.5	3	2016-03-03 19:43:35.064886	2016-03-03 19:43:35.064886
\.


--
-- Name: educations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dana
--

SELECT pg_catalog.setval('educations_id_seq', 2, true);


--
-- Data for Name: employments; Type: TABLE DATA; Schema: public; Owner: Dana
--

COPY employments (id, name, "startDate", "endDate", address, phone, user_id, created_at, updated_at) FROM stdin;
1	TacoBell	2014-03-02	2015-02-05	123 happy street	555-555-1234	3	2016-03-02 02:39:41.703512	2016-03-02 02:47:38.616126
3	USCSS Nostromo	1979-08-01	1986-07-01	Planetoid LV426	547-342-3456	3	2016-03-02 12:23:52.401852	2016-03-02 12:23:52.401852
2	Weyland-Yutani	2006-06-02	2012-07-13	LV426	555-123-55235	3	2016-03-02 12:22:52.401852	2016-03-04 05:38:49.805777
\.


--
-- Name: employments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dana
--

SELECT pg_catalog.setval('employments_id_seq', 2, true);


--
-- Data for Name: interests; Type: TABLE DATA; Schema: public; Owner: Dana
--

COPY interests (id, name, user_id, created_at, updated_at) FROM stdin;
1	cats, any kind	3	2016-03-03 01:41:14.348555	2016-03-03 01:41:14.348555
2	LEGO bricks	3	2016-03-03 01:42:17.306985	2016-03-03 01:42:30.857898
\.


--
-- Name: interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dana
--

SELECT pg_catalog.setval('interests_id_seq', 2, true);


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: Dana
--

COPY languages (id, language, fluency, user_id, created_at, updated_at) FROM stdin;
2	Japanese	getting better	3	2016-03-03 01:33:02.498546	2016-03-03 01:36:44.531546
3	Spanish	mui mal	3	2016-03-03 01:37:45.464288	2016-03-03 01:37:45.464288
\.


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dana
--

SELECT pg_catalog.setval('languages_id_seq', 3, true);


--
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: Dana
--

COPY positions (id, title, "startDate", "endDate", employment_id, created_at, updated_at) FROM stdin;
1	Drive Through	2015-03-06	2015-07-03	1	2016-03-03 00:52:56.945931	2016-03-03 00:52:56.945931
3	Manager	2016-03-04	2016-03-04	1	2016-03-04 02:21:33.682526	2016-03-04 02:22:40.415707
2	Colonial Marines Special Advisor	2008-03-03	2011-03-03	2	2016-03-03 02:53:41.539499	2016-03-04 05:39:26.886825
\.


--
-- Name: positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dana
--

SELECT pg_catalog.setval('positions_id_seq', 3, true);


--
-- Data for Name: responsibilities; Type: TABLE DATA; Schema: public; Owner: Dana
--

COPY responsibilities (id, description, position_id, created_at, updated_at) FROM stdin;
1	Only living person which has experience dealing with the Xenomorph.	2	2016-03-03 01:21:50.514039	2016-03-03 01:21:50.514039
3	worked register	3	2016-03-03 01:22:17.059266	2016-03-03 01:22:17.059266
4	gave customers food	3	2016-03-03 01:22:24.130097	2016-03-03 01:22:24.130097
2	special advisor in the rescue and recovery mission	2	2016-03-03 01:22:11.436045	2016-03-03 01:22:11.436045
\.


--
-- Name: responsibilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dana
--

SELECT pg_catalog.setval('responsibilities_id_seq', 4, true);


--
-- Data for Name: resumes; Type: TABLE DATA; Schema: public; Owner: Dana
--

COPY resumes (id, name, skills, languages, interests, user_id, created_at, updated_at, education, employment) FROM stdin;
1	No one can hear you apply	["1",{"skill":["4","5","8"]},"2",{"skill":["1","2","3"]}]	["2"]	["1"]	3	2016-03-04 05:58:46.204586	2016-03-04 05:58:46.204586	["1",{"degree":["1","2"]},"2",{"degree":["3"]}]	["3","2",{"position":["2",{"responsibility":["1","2"]}]}]
2	Get away from her you hiring director!	["1",{"skill":["6"]}]	["2"]	["1"]	3	2016-03-04 06:06:12.082017	2016-03-04 06:06:12.082017	["1",{"degree":["1","2"]},"2",{"degree":["3"]}]	["1",{"position":["1","3",{"responsibility":["4"]}]},"2",{"position":["2",{"responsibility":["2"]}]}]
3	GAME OVER MAN! Time to get a job!	["1",{"skill":["7"]},"2",{"skill":["2"]}]	["3"]	["2"]	3	2016-03-04 06:09:14.55792	2016-03-04 06:09:14.55792	["2",{"degree":["3"]}]	["1",{"position":["3",{"responsibility":["3"]}]},"2",{"position":["2",{"responsibility":["1"]}]}]
\.


--
-- Name: resumes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dana
--

SELECT pg_catalog.setval('resumes_id_seq', 3, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: Dana
--

COPY schema_migrations (version) FROM stdin;
20160229150542
20160229153344
20160229153446
20160229153532
20160229153623
20160229153700
20160229153734
20160229153859
20160229153950
20160229154054
20160229154234
20160301020516
20160301023213
20160301023638
20160302024556
20160303014900
20160303021736
20160303021757
\.


--
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: Dana
--

COPY skills (id, name, skilltype_id, created_at, updated_at) FROM stdin;
1	Ruby	2	2016-03-02 02:03:48.807579	2016-03-02 02:03:48.807579
3	Rails	2	2016-03-02 02:14:49.595966	2016-03-02 02:25:59.409421
2	Sinatra	2	2016-03-02 02:13:22.733742	2016-03-02 02:27:16.776317
4	Photoshop	1	2016-03-03 00:49:57.140119	2016-03-03 02:40:06.939854
5	Illustrator	1	2016-03-04 02:38:04.558421	2016-03-04 02:38:04.558421
6	Acrobat	1	2016-03-04 02:39:34.93517	2016-03-04 02:39:34.93517
7	Sublime	1	2016-03-04 02:39:35.556876	2016-03-04 03:10:31.495512
8	InDesign	1	2016-03-04 03:24:55.484342	2016-03-04 03:31:35.780272
\.


--
-- Name: skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dana
--

SELECT pg_catalog.setval('skills_id_seq', 8, true);


--
-- Data for Name: skilltypes; Type: TABLE DATA; Schema: public; Owner: Dana
--

COPY skilltypes (id, name, user_id, created_at, updated_at) FROM stdin;
2	Programing Languages	3	2016-03-02 02:03:41.206761	2016-03-02 02:03:41.206761
1	Software	3	2016-03-02 01:36:19.847721	2016-03-04 03:07:59.719674
\.


--
-- Name: skilltypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dana
--

SELECT pg_catalog.setval('skilltypes_id_seq', 2, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Dana
--

COPY users (id, fname, lname, email, password_digest, phone, url, linkedin, created_at, updated_at) FROM stdin;
3	Ellen	Ripley	jd2@gmail.com	$2a$10$mBvcP036AxloIfBO1eliOumFNBvlT4pWaE.incYRf0TyhXChk0Us6	1234567890	http://avp.wikia.com/wiki/Ellen_Ripley	https://www.linkedin.com/in/ellen-ripley-lion-49a79242	2016-03-01 02:47:04.329833	2016-03-01 02:47:04.329833
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dana
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: achievements_pkey; Type: CONSTRAINT; Schema: public; Owner: Dana; Tablespace: 
--

ALTER TABLE ONLY achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);


--
-- Name: degrees_pkey; Type: CONSTRAINT; Schema: public; Owner: Dana; Tablespace: 
--

ALTER TABLE ONLY degrees
    ADD CONSTRAINT degrees_pkey PRIMARY KEY (id);


--
-- Name: educations_pkey; Type: CONSTRAINT; Schema: public; Owner: Dana; Tablespace: 
--

ALTER TABLE ONLY educations
    ADD CONSTRAINT educations_pkey PRIMARY KEY (id);


--
-- Name: employments_pkey; Type: CONSTRAINT; Schema: public; Owner: Dana; Tablespace: 
--

ALTER TABLE ONLY employments
    ADD CONSTRAINT employments_pkey PRIMARY KEY (id);


--
-- Name: interests_pkey; Type: CONSTRAINT; Schema: public; Owner: Dana; Tablespace: 
--

ALTER TABLE ONLY interests
    ADD CONSTRAINT interests_pkey PRIMARY KEY (id);


--
-- Name: languages_pkey; Type: CONSTRAINT; Schema: public; Owner: Dana; Tablespace: 
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: positions_pkey; Type: CONSTRAINT; Schema: public; Owner: Dana; Tablespace: 
--

ALTER TABLE ONLY positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);


--
-- Name: responsibilities_pkey; Type: CONSTRAINT; Schema: public; Owner: Dana; Tablespace: 
--

ALTER TABLE ONLY responsibilities
    ADD CONSTRAINT responsibilities_pkey PRIMARY KEY (id);


--
-- Name: resumes_pkey; Type: CONSTRAINT; Schema: public; Owner: Dana; Tablespace: 
--

ALTER TABLE ONLY resumes
    ADD CONSTRAINT resumes_pkey PRIMARY KEY (id);


--
-- Name: skills_pkey; Type: CONSTRAINT; Schema: public; Owner: Dana; Tablespace: 
--

ALTER TABLE ONLY skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);


--
-- Name: skilltypes_pkey; Type: CONSTRAINT; Schema: public; Owner: Dana; Tablespace: 
--

ALTER TABLE ONLY skilltypes
    ADD CONSTRAINT skilltypes_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: Dana; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_achievements_on_education_id; Type: INDEX; Schema: public; Owner: Dana; Tablespace: 
--

CREATE INDEX index_achievements_on_education_id ON achievements USING btree (education_id);


--
-- Name: index_degrees_on_education_id; Type: INDEX; Schema: public; Owner: Dana; Tablespace: 
--

CREATE INDEX index_degrees_on_education_id ON degrees USING btree (education_id);


--
-- Name: index_educations_on_user_id; Type: INDEX; Schema: public; Owner: Dana; Tablespace: 
--

CREATE INDEX index_educations_on_user_id ON educations USING btree (user_id);


--
-- Name: index_employments_on_user_id; Type: INDEX; Schema: public; Owner: Dana; Tablespace: 
--

CREATE INDEX index_employments_on_user_id ON employments USING btree (user_id);


--
-- Name: index_interests_on_user_id; Type: INDEX; Schema: public; Owner: Dana; Tablespace: 
--

CREATE INDEX index_interests_on_user_id ON interests USING btree (user_id);


--
-- Name: index_languages_on_user_id; Type: INDEX; Schema: public; Owner: Dana; Tablespace: 
--

CREATE INDEX index_languages_on_user_id ON languages USING btree (user_id);


--
-- Name: index_positions_on_employment_id; Type: INDEX; Schema: public; Owner: Dana; Tablespace: 
--

CREATE INDEX index_positions_on_employment_id ON positions USING btree (employment_id);


--
-- Name: index_responsibilities_on_position_id; Type: INDEX; Schema: public; Owner: Dana; Tablespace: 
--

CREATE INDEX index_responsibilities_on_position_id ON responsibilities USING btree (position_id);


--
-- Name: index_resumes_on_user_id; Type: INDEX; Schema: public; Owner: Dana; Tablespace: 
--

CREATE INDEX index_resumes_on_user_id ON resumes USING btree (user_id);


--
-- Name: index_skills_on_skilltype_id; Type: INDEX; Schema: public; Owner: Dana; Tablespace: 
--

CREATE INDEX index_skills_on_skilltype_id ON skills USING btree (skilltype_id);


--
-- Name: index_skilltypes_on_user_id; Type: INDEX; Schema: public; Owner: Dana; Tablespace: 
--

CREATE INDEX index_skilltypes_on_user_id ON skilltypes USING btree (user_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: Dana; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_19190a6ae4; Type: FK CONSTRAINT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY employments
    ADD CONSTRAINT fk_rails_19190a6ae4 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_33511b833c; Type: FK CONSTRAINT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT fk_rails_33511b833c FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_52843a393a; Type: FK CONSTRAINT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY responsibilities
    ADD CONSTRAINT fk_rails_52843a393a FOREIGN KEY (position_id) REFERENCES positions(id);


--
-- Name: fk_rails_5cdcdb8bda; Type: FK CONSTRAINT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY achievements
    ADD CONSTRAINT fk_rails_5cdcdb8bda FOREIGN KEY (education_id) REFERENCES educations(id);


--
-- Name: fk_rails_5d76e0e36c; Type: FK CONSTRAINT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY skills
    ADD CONSTRAINT fk_rails_5d76e0e36c FOREIGN KEY (skilltype_id) REFERENCES skilltypes(id);


--
-- Name: fk_rails_867611551d; Type: FK CONSTRAINT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY resumes
    ADD CONSTRAINT fk_rails_867611551d FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_b5d3578a60; Type: FK CONSTRAINT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY positions
    ADD CONSTRAINT fk_rails_b5d3578a60 FOREIGN KEY (employment_id) REFERENCES employments(id);


--
-- Name: fk_rails_cadf99b62b; Type: FK CONSTRAINT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY degrees
    ADD CONSTRAINT fk_rails_cadf99b62b FOREIGN KEY (education_id) REFERENCES educations(id);


--
-- Name: fk_rails_f18eeff57c; Type: FK CONSTRAINT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY educations
    ADD CONSTRAINT fk_rails_f18eeff57c FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_fae09e9455; Type: FK CONSTRAINT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY skilltypes
    ADD CONSTRAINT fk_rails_fae09e9455 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_fba4c79abd; Type: FK CONSTRAINT; Schema: public; Owner: Dana
--

ALTER TABLE ONLY interests
    ADD CONSTRAINT fk_rails_fba4c79abd FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: Dana
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "Dana";
GRANT ALL ON SCHEMA public TO "Dana";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

