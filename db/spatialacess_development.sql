--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: annochannels; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE annochannels (
    id integer NOT NULL,
    campaign_id integer,
    channel_id integer,
    showable boolean DEFAULT true,
    header character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    comment text,
    class_name character varying(255)
);


ALTER TABLE public.annochannels OWNER TO postgres;

--
-- Name: annochannels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE annochannels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annochannels_id_seq OWNER TO postgres;

--
-- Name: annochannels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE annochannels_id_seq OWNED BY annochannels.id;


--
-- Name: annotations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE annotations (
    id integer NOT NULL,
    annochannel_id integer,
    comment text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    shape character varying(255),
    posx integer,
    posy integer,
    height integer,
    width integer,
    class_name character varying(255)
);


ALTER TABLE public.annotations OWNER TO postgres;

--
-- Name: annotations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE annotations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotations_id_seq OWNER TO postgres;

--
-- Name: annotations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE annotations_id_seq OWNED BY annotations.id;


--
-- Name: calculated_data; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE calculated_data (
    id integer NOT NULL,
    campaign_id integer,
    channel_id integer,
    channel_slots hstore,
    channel_spots hstore,
    channel_maxes hstore,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    channel_name character varying(255)
);


ALTER TABLE public.calculated_data OWNER TO postgres;

--
-- Name: calculated_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE calculated_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calculated_data_id_seq OWNER TO postgres;

--
-- Name: calculated_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE calculated_data_id_seq OWNED BY calculated_data.id;


--
-- Name: campaigns; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE campaigns (
    id integer NOT NULL,
    client_id integer,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    tg character varying(255),
    start_date date,
    end_date date,
    markets character varying(255),
    active boolean DEFAULT true,
    cfile_file_name character varying(255),
    cfile_content_type character varying(255),
    cfile_file_size integer,
    cfile_updated_at timestamp without time zone,
    sfile_file_name character varying(255),
    sfile_content_type character varying(255),
    sfile_file_size integer,
    sfile_updated_at timestamp without time zone
);


ALTER TABLE public.campaigns OWNER TO postgres;

--
-- Name: campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campaigns_id_seq OWNER TO postgres;

--
-- Name: campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE campaigns_id_seq OWNED BY campaigns.id;


--
-- Name: channels; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE channels (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.channels OWNER TO postgres;

--
-- Name: channels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channels_id_seq OWNER TO postgres;

--
-- Name: channels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE channels_id_seq OWNED BY channels.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE clients (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    subdomain character varying(255),
    internal boolean,
    icon_file_name character varying(255),
    icon_content_type character varying(255),
    icon_file_size integer,
    icon_updated_at timestamp without time zone
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clients_id_seq OWNED BY clients.id;


--
-- Name: cslides; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cslides (
    id integer NOT NULL,
    child_id integer,
    slide_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.cslides OWNER TO postgres;

--
-- Name: cslides_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cslides_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cslides_id_seq OWNER TO postgres;

--
-- Name: cslides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cslides_id_seq OWNED BY cslides.id;


--
-- Name: customizations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE customizations (
    id integer NOT NULL,
    client_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    background_file_name character varying(255),
    background_content_type character varying(255),
    background_file_size integer,
    background_updated_at timestamp without time zone
);


ALTER TABLE public.customizations OWNER TO postgres;

--
-- Name: customizations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customizations_id_seq OWNER TO postgres;

--
-- Name: customizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE customizations_id_seq OWNED BY customizations.id;


--
-- Name: delayed_jobs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE delayed_jobs (
    id integer NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    attempts integer DEFAULT 0 NOT NULL,
    handler text NOT NULL,
    last_error text,
    run_at timestamp without time zone,
    locked_at timestamp without time zone,
    failed_at timestamp without time zone,
    locked_by character varying(255),
    queue character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.delayed_jobs OWNER TO postgres;

--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE delayed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delayed_jobs_id_seq OWNER TO postgres;

--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE delayed_jobs_id_seq OWNED BY delayed_jobs.id;


--
-- Name: hours; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE hours (
    id integer NOT NULL,
    name character varying(255),
    start_time time without time zone,
    end_time time without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.hours OWNER TO postgres;

--
-- Name: hours_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hours_id_seq OWNER TO postgres;

--
-- Name: hours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE hours_id_seq OWNED BY hours.id;


--
-- Name: presentation_templates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE presentation_templates (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    footer character varying(255),
    presentation_id integer,
    slide_id integer
);


ALTER TABLE public.presentation_templates OWNER TO postgres;

--
-- Name: presentation_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE presentation_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presentation_templates_id_seq OWNER TO postgres;

--
-- Name: presentation_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE presentation_templates_id_seq OWNED BY presentation_templates.id;


--
-- Name: presentations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE presentations (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    title character varying(255)
);


ALTER TABLE public.presentations OWNER TO postgres;

--
-- Name: presentations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE presentations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presentations_id_seq OWNER TO postgres;

--
-- Name: presentations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE presentations_id_seq OWNED BY presentations.id;


--
-- Name: rails_admin_histories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rails_admin_histories (
    id integer NOT NULL,
    message text,
    username character varying(255),
    item integer,
    "table" character varying(255),
    month smallint,
    year bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.rails_admin_histories OWNER TO postgres;

--
-- Name: rails_admin_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rails_admin_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rails_admin_histories_id_seq OWNER TO postgres;

--
-- Name: rails_admin_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rails_admin_histories_id_seq OWNED BY rails_admin_histories.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: slides; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE slides (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    image_file_name character varying(255),
    image_content_type character varying(255),
    image_file_size integer,
    image_updated_at timestamp without time zone,
    name character varying(255),
    seq integer
);


ALTER TABLE public.slides OWNER TO postgres;

--
-- Name: slides_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE slides_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slides_id_seq OWNER TO postgres;

--
-- Name: slides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE slides_id_seq OWNED BY slides.id;


--
-- Name: slots; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE slots (
    id integer NOT NULL,
    channel_id integer,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    hour_id integer,
    tvr double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    campaign_id integer
);


ALTER TABLE public.slots OWNER TO postgres;

--
-- Name: slots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE slots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slots_id_seq OWNER TO postgres;

--
-- Name: slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE slots_id_seq OWNED BY slots.id;


--
-- Name: spots; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spots (
    id integer NOT NULL,
    campaign_id integer,
    hour_id integer,
    channel_id integer,
    airdate date,
    programme character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spots OWNER TO postgres;

--
-- Name: spots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spots_id_seq OWNER TO postgres;

--
-- Name: spots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spots_id_seq OWNED BY spots.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    client_id integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY annochannels ALTER COLUMN id SET DEFAULT nextval('annochannels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY annotations ALTER COLUMN id SET DEFAULT nextval('annotations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY calculated_data ALTER COLUMN id SET DEFAULT nextval('calculated_data_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campaigns ALTER COLUMN id SET DEFAULT nextval('campaigns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY channels ALTER COLUMN id SET DEFAULT nextval('channels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients ALTER COLUMN id SET DEFAULT nextval('clients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cslides ALTER COLUMN id SET DEFAULT nextval('cslides_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customizations ALTER COLUMN id SET DEFAULT nextval('customizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY delayed_jobs ALTER COLUMN id SET DEFAULT nextval('delayed_jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hours ALTER COLUMN id SET DEFAULT nextval('hours_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presentation_templates ALTER COLUMN id SET DEFAULT nextval('presentation_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presentations ALTER COLUMN id SET DEFAULT nextval('presentations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rails_admin_histories ALTER COLUMN id SET DEFAULT nextval('rails_admin_histories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY slides ALTER COLUMN id SET DEFAULT nextval('slides_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY slots ALTER COLUMN id SET DEFAULT nextval('slots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spots ALTER COLUMN id SET DEFAULT nextval('spots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: annochannels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY annochannels (id, campaign_id, channel_id, showable, header, created_at, updated_at, comment, class_name) FROM stdin;
35	3	1	t		2014-07-31 09:31:40.716425	2014-07-31 09:32:04.480603		\N
36	3	2	t	cnbc	2014-07-31 09:31:40.724721	2014-07-31 09:32:04.489537		\N
3	1	3	t	CNN IBN	2014-07-30 12:42:58.360327	2014-07-30 13:54:39.230128	CNN IBN	\N
2	1	2	t	CNBC TV18	2014-07-30 12:42:58.35737	2014-07-30 13:57:19.811683	CNBC 18	\N
4	1	4	t	DChannel	2014-07-30 12:42:58.363025	2014-07-30 13:58:12.563149	DC	\N
5	1	5	t	ET NOW	2014-07-30 12:42:58.365572	2014-07-30 13:58:12.566	ETN	\N
6	1	6	t	HBo	2014-07-30 12:42:58.368142	2014-07-30 13:58:12.567767	HBO	\N
13	1	14	t	FT	2014-07-30 12:42:58.387009	2014-07-30 13:58:12.569602	FT	\N
7	1	7	t	HTV18	2014-07-30 12:42:58.370553	2014-07-30 13:59:06.06561	HTV18	\N
15	1	16	t	Mn	2014-07-30 12:42:58.392836	2014-07-30 13:59:06.067954	Movie Now	\N
37	3	3	t		2014-07-31 09:31:40.727781	2014-07-31 09:32:04.491623		\N
8	1	8	t	NG	2014-07-30 12:42:58.373065	2014-07-30 14:28:17.695675	National Geography	\N
9	1	9	t	SM	2014-07-30 12:42:58.375429	2014-07-30 18:03:06.4039	SM	\N
10	1	10	t	SW	2014-07-30 12:42:58.377938	2014-07-30 18:03:06.409459	SW	\N
11	1	11	t	TN	2014-07-30 12:42:58.380956	2014-07-30 18:03:06.411406	TN	\N
12	1	13	t	ZC	2014-07-30 12:42:58.384369	2014-07-30 18:03:06.413057	Z cafe	\N
14	1	15	t	NDTV247	2014-07-30 12:42:58.389714	2014-07-30 18:03:06.414651	NDTV247	\N
16	1	17	t	TLC	2014-07-30 12:42:58.395204	2014-07-30 18:03:06.424475	TLC	\N
17	1	18	t	wb	2014-07-30 12:42:58.397621	2014-07-30 18:03:06.426254	WB	\N
18	2	1	t	CNN IBN	2014-07-30 18:43:07.763858	2014-07-30 18:46:18.253987	Here Comment for CNN IBN will come	\N
19	2	2	t	Discovery Channel	2014-07-30 18:43:07.774453	2014-07-30 18:46:18.25664	Here Comment for discovery channel will come	\N
20	2	3	t	Fox Traveller	2014-07-30 18:43:07.777767	2014-07-30 18:46:18.258303	Here The comment for Fox Traveller wiill come	\N
21	2	4	t		2014-07-30 18:43:07.78078	2014-07-30 18:46:18.259947		\N
38	3	4	t		2014-07-31 09:31:40.730692	2014-07-31 09:32:04.493456		\N
39	3	5	t	et now	2014-07-31 09:31:40.733455	2014-07-31 09:32:04.495161		\N
40	3	6	t		2014-07-31 09:31:40.736266	2014-07-31 09:32:04.501046		\N
25	2	8	t	AXN	2014-07-30 18:43:07.791871	2014-07-30 18:46:18.266531	This is comment for AXN	\N
26	2	9	t	CNBC TV 18	2014-07-30 18:43:07.794823	2014-07-30 18:46:18.268206	This is comment for CNBC 18	\N
27	2	10	t	ET Now	2014-07-30 18:43:07.797643	2014-07-30 18:46:18.26984	Comments for ETN	\N
41	3	7	t		2014-07-31 09:31:40.739013	2014-07-31 09:32:04.50275		\N
42	3	8	t	hist tv	2014-07-31 09:31:40.741977	2014-07-31 09:32:04.504595		\N
43	3	9	t		2014-07-31 09:31:40.744972	2014-07-31 09:32:04.513142		\N
44	3	10	t		2014-07-31 09:31:40.747728	2014-07-31 09:32:04.514946		\N
45	3	11	t		2014-07-31 09:31:40.750421	2014-07-31 09:32:04.516699		\N
46	3	13	t		2014-07-31 09:31:40.753111	2014-07-31 09:32:04.518406		\N
47	3	14	t		2014-07-31 09:31:40.755773	2014-07-31 09:32:04.52463		\N
28	2	11	t		2014-07-30 18:43:07.800435	2014-07-30 18:47:23.608551		\N
22	2	5	t	NG	2014-07-30 18:43:07.783648	2014-07-30 18:50:45.106547	NG comment	\N
23	2	6	t	NDTV 24x7	2014-07-30 18:43:07.786409	2014-07-30 18:50:45.112452	My comment for NDTV	\N
24	2	7	t	Star World	2014-07-30 18:43:07.78917	2014-07-30 18:50:45.114613	Comment For Star world	\N
29	2	13	t	MN	2014-07-30 18:43:07.803477	2014-07-30 18:50:45.11637	MN Comment	\N
30	2	14	t	Star Movies	2014-07-30 18:43:07.806628	2014-07-30 18:50:45.11805	My Comments for star Movies	\N
31	2	15	t	TLC	2014-07-30 18:43:07.809521	2014-07-30 18:50:45.119789	TLCComments	\N
32	2	16	t	Times now	2014-07-30 18:43:07.81238	2014-07-30 18:50:45.12143	Comment for times now	\N
33	2	17	t	WB	2014-07-30 18:43:07.815246	2014-07-30 18:50:45.123064	Here The comment for WB will come	\N
34	2	18	t	Z Cafe	2014-07-30 18:43:07.818159	2014-07-30 18:50:45.124761	Comment for Z cafe	\N
48	3	15	t		2014-07-31 09:31:40.758474	2014-07-31 09:32:04.526365		\N
49	3	16	t		2014-07-31 09:31:40.761228	2014-07-31 09:32:04.528044		\N
50	3	17	t		2014-07-31 09:31:40.764028	2014-07-31 09:32:04.529864		\N
51	3	18	t		2014-07-31 09:31:40.766794	2014-07-31 09:32:04.537088		\N
1	1	1	t	AXN Graph	2014-07-30 12:42:58.351958	2014-08-19 06:55:18.306417	This is the overall comment for this graph	\N
\.


--
-- Name: annochannels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('annochannels_id_seq', 51, true);


--
-- Data for Name: annotations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY annotations (id, annochannel_id, comment, created_at, updated_at, shape, posx, posy, height, width, class_name) FROM stdin;
1	28		2014-07-30 18:46:18.273525	2014-07-30 18:46:18.273525		609	119	\N	\N	\N
2	28	HHH	2014-07-30 18:47:23.614517	2014-07-30 18:47:23.614517		\N	\N	\N	\N	\N
4	1		2014-08-19 06:54:54.657702	2014-08-19 06:54:54.657702		285	141	157	100	\N
3	1	Not in line	2014-08-19 06:48:07.952895	2014-08-19 06:55:18.308447	red-circle	695	109	81	80	\N
\.


--
-- Name: annotations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('annotations_id_seq', 4, true);


--
-- Data for Name: calculated_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY calculated_data (id, campaign_id, channel_id, channel_slots, channel_spots, channel_maxes, created_at, updated_at, channel_name) FROM stdin;
1	1	1	"AXN"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.0], [9, 0.0], [10, 0.01], [11, 0.01], [12, 0.0], [13, 0.0], [14, 0.01], [15, 0.01], [16, 0.01], [17, 0.01], [18, 0.0], [19, 0.01], [20, 0.02], [21, 0.03], [22, 0.01], [23, 0.0], [24, 0.01], [25, 0.0]]"	"AXN"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 0], [9, 5], [10, 2], [11, 4], [12, 2], [13, 3], [14, 3], [15, 2], [16, 2], [17, 10], [18, 10], [19, 8], [20, 10], [21, 10], [22, 12], [23, 8], [24, 0], [25, 0]]"	"AXN"=>"12"	2014-07-30 12:42:58.641574	2014-07-30 12:42:59.509869	AXN
2	1	2	"CNBC TV18"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.0], [9, 0.01], [10, 0.01], [11, 0.0], [12, 0.0], [13, 0.01], [14, 0.01], [15, 0.01], [16, 0.0], [17, 0.0], [18, 0.0], [19, 0.0], [20, 0.0], [21, 0.0], [22, 0.0], [23, 0.0], [24, 0.0], [25, 0.0]]"	"CNBC TV18"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 7], [7, 4], [8, 4], [9, 4], [10, 7], [11, 6], [12, 7], [13, 9], [14, 8], [15, 9], [16, 7], [17, 9], [18, 3], [19, 3], [20, 2], [21, 2], [22, 3], [23, 0], [24, 0], [25, 0]]"	"CNBC TV18"=>"9"	2014-07-30 12:42:58.677666	2014-07-30 12:42:59.653527	CNBC TV18
3	1	3	"CNN IBN"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.01], [9, 0.01], [10, 0.01], [11, 0.01], [12, 0.01], [13, 0.01], [14, 0.02], [15, 0.01], [16, 0.01], [17, 0.02], [18, 0.02], [19, 0.02], [20, 0.03], [21, 0.03], [22, 0.02], [23, 0.01], [24, 0.0], [25, 0.0]]"	"CNN IBN"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 15], [8, 14], [9, 12], [10, 1], [11, 1], [12, 1], [13, 0], [14, 1], [15, 0], [16, 1], [17, 0], [18, 1], [19, 12], [20, 9], [21, 6], [22, 14], [23, 3], [24, 0], [25, 0]]"	"CNN IBN"=>"15"	2014-07-30 12:42:58.71099	2014-07-30 12:42:59.734066	CNN IBN
4	1	4	"DISCOVERY CHANNEL"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.02], [9, 0.03], [10, 0.05], [11, 0.04], [12, 0.06], [13, 0.05], [14, 0.1], [15, 0.08], [16, 0.09], [17, 0.05], [18, 0.06], [19, 0.09], [20, 0.08], [21, 0.08], [22, 0.07], [23, 0.1], [24, 0.05], [25, 0.0]]"	"DISCOVERY CHANNEL"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 2], [8, 1], [9, 3], [10, 1], [11, 1], [12, 1], [13, 1], [14, 2], [15, 2], [16, 1], [17, 15], [18, 12], [19, 10], [20, 9], [21, 9], [22, 11], [23, 14], [24, 0], [25, 0]]"	"DISCOVERY CHANNEL"=>"15"	2014-07-30 12:42:58.749438	2014-07-30 12:42:59.810355	DISCOVERY CHANNEL
5	1	5	"ET Now"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.01], [9, 0.01], [10, 0.0], [11, 0.01], [12, 0.0], [13, 0.01], [14, 0.01], [15, 0.01], [16, 0.01], [17, 0.01], [18, 0.01], [19, 0.01], [20, 0.02], [21, 0.01], [22, 0.01], [23, 0.02], [24, 0.01], [25, 0.0]]"	"ET Now"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 5], [7, 6], [8, 6], [9, 2], [10, 4], [11, 4], [12, 7], [13, 6], [14, 5], [15, 5], [16, 6], [17, 4], [18, 5], [19, 6], [20, 4], [21, 5], [22, 6], [23, 6], [24, 0], [25, 0]]"	"ET Now"=>"7"	2014-07-30 12:42:58.783537	2014-07-30 12:42:59.967883	ET Now
7	1	7	"HBO"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.01], [8, 0.02], [9, 0.02], [10, 0.04], [11, 0.03], [12, 0.02], [13, 0.04], [14, 0.03], [15, 0.02], [16, 0.02], [17, 0.02], [18, 0.02], [19, 0.04], [20, 0.07], [21, 0.05], [22, 0.07], [23, 0.05], [24, 0.03], [25, 0.02]]"	"HBO"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 4], [9, 3], [10, 3], [11, 3], [12, 3], [13, 3], [14, 3], [15, 2], [16, 7], [17, 7], [18, 7], [19, 8], [20, 13], [21, 9], [22, 12], [23, 3], [24, 5], [25, 0]]"	"HBO"=>"13"	2014-07-30 12:42:58.853986	2014-07-30 12:43:00.127535	HBO
8	1	8	"History TV18"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.01], [9, 0.01], [10, 0.02], [11, 0.03], [12, 0.03], [13, 0.04], [14, 0.04], [15, 0.05], [16, 0.06], [17, 0.04], [18, 0.06], [19, 0.05], [20, 0.03], [21, 0.06], [22, 0.07], [23, 0.06], [24, 0.05], [25, 0.01]]"	"History TV18"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 2], [9, 2], [10, 2], [11, 2], [12, 2], [13, 2], [14, 2], [15, 2], [16, 2], [17, 12], [18, 9], [19, 10], [20, 10], [21, 9], [22, 9], [23, 11], [24, 0], [25, 0]]"	"History TV18"=>"12"	2014-07-30 12:42:58.886881	2014-07-30 12:43:00.200946	History TV18
10	1	10	"NATIONAL GEOGRAPHIC"=>"[[2, 0.01], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.02], [8, 0.02], [9, 0.04], [10, 0.03], [11, 0.04], [12, 0.03], [13, 0.04], [14, 0.06], [15, 0.07], [16, 0.07], [17, 0.05], [18, 0.06], [19, 0.1], [20, 0.06], [21, 0.06], [22, 0.09], [23, 0.07], [24, 0.05], [25, 0.01]]"	"NATIONAL GEOGRAPHIC"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 2], [8, 3], [9, 3], [10, 2], [11, 2], [12, 2], [13, 1], [14, 2], [15, 1], [16, 5], [17, 17], [18, 14], [19, 12], [20, 7], [21, 6], [22, 5], [23, 10], [24, 0], [25, 0]]"	"NATIONAL GEOGRAPHIC"=>"17"	2014-07-30 12:42:58.96284	2014-07-30 12:43:00.874622	NATIONAL GEOGRAPHIC
12	1	13	"Star Movies"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.01], [8, 0.01], [9, 0.03], [10, 0.06], [11, 0.05], [12, 0.04], [13, 0.05], [14, 0.06], [15, 0.05], [16, 0.05], [17, 0.05], [18, 0.06], [19, 0.06], [20, 0.07], [21, 0.06], [22, 0.07], [23, 0.09], [24, 0.07], [25, 0.02]]"	"Star Movies"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 0], [9, 1], [10, 1], [11, 3], [12, 2], [13, 3], [14, 2], [15, 2], [16, 3], [17, 18], [18, 11], [19, 0], [20, 0], [21, 13], [22, 11], [23, 7], [24, 17], [25, 0]]"	"Star Movies"=>"18"	2014-07-30 12:42:59.032895	2014-07-30 12:43:01.36728	Star Movies
13	1	14	"Star World"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.01], [9, 0.01], [10, 0.01], [11, 0.01], [12, 0.0], [13, 0.0], [14, 0.0], [15, 0.01], [16, 0.01], [17, 0.0], [18, 0.0], [19, 0.02], [20, 0.02], [21, 0.03], [22, 0.01], [23, 0.01], [24, 0.0], [25, 0.0]]"	"Star World"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 0], [9, 0], [10, 0], [11, 0], [12, 0], [13, 0], [14, 0], [15, 0], [16, 0], [17, 0], [18, 0], [19, 41], [20, 0], [21, 58], [22, 0], [23, 0], [24, 0], [25, 0]]"	"Star World"=>"58"	2014-07-30 12:42:59.27835	2014-07-30 12:43:01.467001	Star World
15	1	16	"Times Now"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.01], [9, 0.03], [10, 0.02], [11, 0.03], [12, 0.02], [13, 0.02], [14, 0.03], [15, 0.02], [16, 0.02], [17, 0.02], [18, 0.02], [19, 0.02], [20, 0.02], [21, 0.09], [22, 0.06], [23, 0.01], [24, 0.0], [25, 0.0]]"	"Times Now"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 17], [8, 14], [9, 14], [10, 2], [11, 2], [12, 2], [13, 3], [14, 3], [15, 2], [16, 3], [17, 0], [18, 0], [19, 13], [20, 9], [21, 1], [22, 9], [23, 0], [24, 0], [25, 0]]"	"Times Now"=>"17"	2014-07-30 12:42:59.365277	2014-07-30 12:43:01.649818	Times Now
17	1	18	"Z Cafe"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.0], [9, 0.0], [10, 0.01], [11, 0.01], [12, 0.0], [13, 0.0], [14, 0.0], [15, 0.0], [16, 0.0], [17, 0.0], [18, 0.0], [19, 0.0], [20, 0.01], [21, 0.01], [22, 0.01], [23, 0.01], [24, 0.0], [25, 0.0]]"	"Z Cafe"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 5], [9, 5], [10, 5], [11, 5], [12, 3], [13, 5], [14, 4], [15, 3], [16, 3], [17, 9], [18, 8], [19, 2], [20, 5], [21, 7], [22, 6], [23, 10], [24, 7], [25, 0]]"	"Z Cafe"=>"10"	2014-07-30 12:42:59.434846	2014-07-30 12:43:01.799219	Z Cafe
6	1	6	"Fox Traveller"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.0], [9, 0.01], [10, 0.01], [11, 0.02], [12, 0.02], [13, 0.01], [14, 0.02], [15, 0.02], [16, 0.04], [17, 0.02], [18, 0.03], [19, 0.03], [20, 0.03], [21, 0.02], [22, 0.02], [23, 0.03], [24, 0.01], [25, 0.0]]"	"Fox Traveller"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 0], [9, 0], [10, 2], [11, 2], [12, 0], [13, 2], [14, 1], [15, 2], [16, 3], [17, 4], [18, 18], [19, 15], [20, 9], [21, 8], [22, 12], [23, 14], [24, 0], [25, 0]]"	"Fox Traveller"=>"18"	2014-07-30 12:42:58.815992	2014-07-30 12:43:00.050235	Fox Traveller
9	1	9	"Movies Now"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.02], [9, 0.01], [10, 0.02], [11, 0.03], [12, 0.03], [13, 0.03], [14, 0.04], [15, 0.02], [16, 0.02], [17, 0.02], [18, 0.02], [19, 0.02], [20, 0.03], [21, 0.04], [22, 0.05], [23, 0.04], [24, 0.03], [25, 0.02]]"	"Movies Now"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 6], [8, 6], [9, 4], [10, 3], [11, 4], [12, 3], [13, 1], [14, 3], [15, 3], [16, 4], [17, 9], [18, 10], [19, 8], [20, 8], [21, 4], [22, 7], [23, 8], [24, 0], [25, 0]]"	"Movies Now"=>"10"	2014-07-30 12:42:58.920006	2014-07-30 12:43:00.275959	Movies Now
11	1	11	"NDTV 24x7"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.01], [9, 0.01], [10, 0.02], [11, 0.01], [12, 0.01], [13, 0.01], [14, 0.01], [15, 0.01], [16, 0.01], [17, 0.01], [18, 0.01], [19, 0.02], [20, 0.02], [21, 0.03], [22, 0.03], [23, 0.01], [24, 0.0], [25, 0.0]]"	"NDTV 24x7"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 12], [8, 10], [9, 10], [10, 12], [11, 1], [12, 0], [13, 0], [14, 0], [15, 0], [16, 1], [17, 0], [18, 9], [19, 6], [20, 6], [21, 5], [22, 5], [23, 15], [24, 0], [25, 0]]"	"NDTV 24x7"=>"15"	2014-07-30 12:42:58.995196	2014-07-30 12:43:01.263219	NDTV 24x7
14	1	15	"TLC"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.01], [8, 0.0], [9, 0.0], [10, 0.0], [11, 0.01], [12, 0.01], [13, 0.02], [14, 0.01], [15, 0.02], [16, 0.01], [17, 0.01], [18, 0.01], [19, 0.03], [20, 0.01], [21, 0.01], [22, 0.01], [23, 0.03], [24, 0.02], [25, 0.01]]"	"TLC"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 2], [8, 2], [9, 1], [10, 2], [11, 2], [12, 1], [13, 1], [14, 2], [15, 2], [16, 1], [17, 12], [18, 12], [19, 10], [20, 10], [21, 11], [22, 12], [23, 11], [24, 0], [25, 0]]"	"TLC"=>"12"	2014-07-30 12:42:59.324218	2014-07-30 12:43:01.552294	TLC
16	1	17	"WB"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.01], [8, 0.02], [9, 0.03], [10, 0.04], [11, 0.04], [12, 0.02], [13, 0.02], [14, 0.03], [15, 0.06], [16, 0.05], [17, 0.04], [18, 0.03], [19, 0.04], [20, 0.04], [21, 0.05], [22, 0.04], [23, 0.04], [24, 0.02], [25, 0.01]]"	"WB"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 4], [8, 2], [9, 1], [10, 1], [11, 0], [12, 0], [13, 1], [14, 0], [15, 0], [16, 15], [17, 8], [18, 10], [19, 5], [20, 8], [21, 8], [22, 6], [23, 9], [24, 10], [25, 0]]"	"WB"=>"15"	2014-07-30 12:42:59.400498	2014-07-30 12:43:01.725006	WB
20	2	3	"CNN IBN"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.01], [9, 0.01], [10, 0.01], [11, 0.01], [12, 0.01], [13, 0.01], [14, 0.02], [15, 0.01], [16, 0.01], [17, 0.02], [18, 0.02], [19, 0.02], [20, 0.03], [21, 0.03], [22, 0.02], [23, 0.01], [24, 0.0], [25, 0.0]]"	"CNN IBN"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 15], [8, 14], [9, 12], [10, 1], [11, 1], [12, 1], [13, 0], [14, 1], [15, 0], [16, 1], [17, 0], [18, 1], [19, 12], [20, 9], [21, 6], [22, 14], [23, 3], [24, 0], [25, 0]]"	"CNN IBN"=>"15"	2014-07-30 18:43:08.038981	2014-07-30 18:43:08.8568	CNN IBN
21	2	4	"DISCOVERY CHANNEL"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.02], [9, 0.03], [10, 0.05], [11, 0.04], [12, 0.06], [13, 0.05], [14, 0.1], [15, 0.08], [16, 0.09], [17, 0.05], [18, 0.06], [19, 0.09], [20, 0.08], [21, 0.08], [22, 0.07], [23, 0.1], [24, 0.05], [25, 0.0]]"	"DISCOVERY CHANNEL"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 2], [8, 1], [9, 3], [10, 1], [11, 1], [12, 1], [13, 1], [14, 2], [15, 2], [16, 1], [17, 15], [18, 12], [19, 10], [20, 9], [21, 9], [22, 11], [23, 14], [24, 0], [25, 0]]"	"DISCOVERY CHANNEL"=>"15"	2014-07-30 18:43:08.075205	2014-07-30 18:43:08.92816	DISCOVERY CHANNEL
23	2	6	"Fox Traveller"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.0], [9, 0.01], [10, 0.01], [11, 0.02], [12, 0.02], [13, 0.01], [14, 0.02], [15, 0.02], [16, 0.04], [17, 0.02], [18, 0.03], [19, 0.03], [20, 0.03], [21, 0.02], [22, 0.02], [23, 0.03], [24, 0.01], [25, 0.0]]"	"Fox Traveller"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 0], [9, 0], [10, 2], [11, 2], [12, 0], [13, 2], [14, 1], [15, 2], [16, 3], [17, 4], [18, 18], [19, 15], [20, 9], [21, 8], [22, 12], [23, 14], [24, 0], [25, 0]]"	"Fox Traveller"=>"18"	2014-07-30 18:43:08.152378	2014-07-30 18:43:09.075848	Fox Traveller
25	2	8	"History TV18"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.01], [9, 0.01], [10, 0.02], [11, 0.03], [12, 0.03], [13, 0.04], [14, 0.04], [15, 0.05], [16, 0.06], [17, 0.04], [18, 0.06], [19, 0.05], [20, 0.03], [21, 0.06], [22, 0.07], [23, 0.06], [24, 0.05], [25, 0.01]]"	"History TV18"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 2], [9, 2], [10, 2], [11, 2], [12, 2], [13, 2], [14, 2], [15, 2], [16, 2], [17, 12], [18, 9], [19, 10], [20, 10], [21, 9], [22, 9], [23, 11], [24, 0], [25, 0]]"	"History TV18"=>"12"	2014-07-30 18:43:08.224376	2014-07-30 18:43:09.231347	History TV18
27	2	10	"NATIONAL GEOGRAPHIC"=>"[[2, 0.01], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.02], [8, 0.02], [9, 0.04], [10, 0.03], [11, 0.04], [12, 0.03], [13, 0.04], [14, 0.06], [15, 0.07], [16, 0.07], [17, 0.05], [18, 0.06], [19, 0.1], [20, 0.06], [21, 0.06], [22, 0.09], [23, 0.07], [24, 0.05], [25, 0.01]]"	"NATIONAL GEOGRAPHIC"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 2], [8, 3], [9, 3], [10, 2], [11, 2], [12, 2], [13, 1], [14, 2], [15, 1], [16, 5], [17, 17], [18, 14], [19, 12], [20, 7], [21, 6], [22, 5], [23, 10], [24, 0], [25, 0]]"	"NATIONAL GEOGRAPHIC"=>"17"	2014-07-30 18:43:08.292619	2014-07-30 18:43:09.373616	NATIONAL GEOGRAPHIC
28	2	11	"NDTV 24x7"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.01], [9, 0.01], [10, 0.02], [11, 0.01], [12, 0.01], [13, 0.01], [14, 0.01], [15, 0.01], [16, 0.01], [17, 0.01], [18, 0.01], [19, 0.02], [20, 0.02], [21, 0.03], [22, 0.03], [23, 0.01], [24, 0.0], [25, 0.0]]"	"NDTV 24x7"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 12], [8, 10], [9, 10], [10, 12], [11, 1], [12, 0], [13, 0], [14, 0], [15, 0], [16, 1], [17, 0], [18, 9], [19, 6], [20, 6], [21, 5], [22, 5], [23, 15], [24, 0], [25, 0]]"	"NDTV 24x7"=>"15"	2014-07-30 18:43:08.335391	2014-07-30 18:43:09.446954	NDTV 24x7
30	2	14	"Star World"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.01], [9, 0.01], [10, 0.01], [11, 0.01], [12, 0.0], [13, 0.0], [14, 0.0], [15, 0.01], [16, 0.01], [17, 0.0], [18, 0.0], [19, 0.02], [20, 0.02], [21, 0.03], [22, 0.01], [23, 0.01], [24, 0.0], [25, 0.0]]"	"Star World"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 0], [9, 0], [10, 0], [11, 0], [12, 0], [13, 0], [14, 0], [15, 0], [16, 0], [17, 0], [18, 0], [19, 41], [20, 0], [21, 58], [22, 0], [23, 0], [24, 0], [25, 0]]"	"Star World"=>"58"	2014-07-30 18:43:08.403308	2014-07-30 18:43:09.588896	Star World
18	2	1	"AXN"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.0], [9, 0.0], [10, 0.01], [11, 0.01], [12, 0.0], [13, 0.0], [14, 0.01], [15, 0.01], [16, 0.01], [17, 0.01], [18, 0.0], [19, 0.01], [20, 0.02], [21, 0.03], [22, 0.01], [23, 0.0], [24, 0.01], [25, 0.0]]"	"AXN"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 0], [9, 5], [10, 2], [11, 4], [12, 2], [13, 3], [14, 3], [15, 2], [16, 2], [17, 10], [18, 10], [19, 8], [20, 10], [21, 10], [22, 12], [23, 8], [24, 0], [25, 0]]"	"AXN"=>"12"	2014-07-30 18:43:07.964298	2014-07-30 18:43:08.699853	AXN
19	2	2	"CNBC TV18"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.0], [9, 0.01], [10, 0.01], [11, 0.0], [12, 0.0], [13, 0.01], [14, 0.01], [15, 0.01], [16, 0.0], [17, 0.0], [18, 0.0], [19, 0.0], [20, 0.0], [21, 0.0], [22, 0.0], [23, 0.0], [24, 0.0], [25, 0.0]]"	"CNBC TV18"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 7], [7, 4], [8, 4], [9, 4], [10, 7], [11, 6], [12, 7], [13, 9], [14, 8], [15, 9], [16, 7], [17, 9], [18, 3], [19, 3], [20, 2], [21, 2], [22, 3], [23, 0], [24, 0], [25, 0]]"	"CNBC TV18"=>"9"	2014-07-30 18:43:08.004383	2014-07-30 18:43:08.781493	CNBC TV18
22	2	5	"ET Now"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.01], [9, 0.01], [10, 0.0], [11, 0.01], [12, 0.0], [13, 0.01], [14, 0.01], [15, 0.01], [16, 0.01], [17, 0.01], [18, 0.01], [19, 0.01], [20, 0.02], [21, 0.01], [22, 0.01], [23, 0.02], [24, 0.01], [25, 0.0]]"	"ET Now"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 5], [7, 6], [8, 6], [9, 2], [10, 4], [11, 4], [12, 7], [13, 6], [14, 5], [15, 5], [16, 6], [17, 4], [18, 5], [19, 6], [20, 4], [21, 5], [22, 6], [23, 6], [24, 0], [25, 0]]"	"ET Now"=>"7"	2014-07-30 18:43:08.109069	2014-07-30 18:43:08.99832	ET Now
24	2	7	"HBO"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.01], [8, 0.02], [9, 0.02], [10, 0.04], [11, 0.03], [12, 0.02], [13, 0.04], [14, 0.03], [15, 0.02], [16, 0.02], [17, 0.02], [18, 0.02], [19, 0.04], [20, 0.07], [21, 0.05], [22, 0.07], [23, 0.05], [24, 0.03], [25, 0.02]]"	"HBO"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 4], [9, 3], [10, 3], [11, 3], [12, 3], [13, 3], [14, 3], [15, 2], [16, 7], [17, 7], [18, 7], [19, 8], [20, 13], [21, 9], [22, 12], [23, 3], [24, 5], [25, 0]]"	"HBO"=>"13"	2014-07-30 18:43:08.18844	2014-07-30 18:43:09.152889	HBO
26	2	9	"Movies Now"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.02], [9, 0.01], [10, 0.02], [11, 0.03], [12, 0.03], [13, 0.03], [14, 0.04], [15, 0.02], [16, 0.02], [17, 0.02], [18, 0.02], [19, 0.02], [20, 0.03], [21, 0.04], [22, 0.05], [23, 0.04], [24, 0.03], [25, 0.02]]"	"Movies Now"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 6], [8, 6], [9, 4], [10, 3], [11, 4], [12, 3], [13, 1], [14, 3], [15, 3], [16, 4], [17, 9], [18, 10], [19, 8], [20, 8], [21, 4], [22, 7], [23, 8], [24, 0], [25, 0]]"	"Movies Now"=>"10"	2014-07-30 18:43:08.259247	2014-07-30 18:43:09.300288	Movies Now
29	2	13	"Star Movies"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.01], [8, 0.01], [9, 0.03], [10, 0.06], [11, 0.05], [12, 0.04], [13, 0.05], [14, 0.06], [15, 0.05], [16, 0.05], [17, 0.05], [18, 0.06], [19, 0.06], [20, 0.07], [21, 0.06], [22, 0.07], [23, 0.09], [24, 0.07], [25, 0.02]]"	"Star Movies"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 0], [9, 1], [10, 1], [11, 3], [12, 2], [13, 3], [14, 2], [15, 2], [16, 3], [17, 18], [18, 11], [19, 0], [20, 0], [21, 13], [22, 11], [23, 7], [24, 17], [25, 0]]"	"Star Movies"=>"18"	2014-07-30 18:43:08.369508	2014-07-30 18:43:09.515927	Star Movies
31	2	15	"TLC"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.01], [8, 0.0], [9, 0.0], [10, 0.0], [11, 0.01], [12, 0.01], [13, 0.02], [14, 0.01], [15, 0.02], [16, 0.01], [17, 0.01], [18, 0.01], [19, 0.03], [20, 0.01], [21, 0.01], [22, 0.01], [23, 0.03], [24, 0.02], [25, 0.01]]"	"TLC"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 2], [8, 2], [9, 1], [10, 2], [11, 2], [12, 1], [13, 1], [14, 2], [15, 2], [16, 1], [17, 12], [18, 12], [19, 10], [20, 10], [21, 11], [22, 12], [23, 11], [24, 0], [25, 0]]"	"TLC"=>"12"	2014-07-30 18:43:08.511535	2014-07-30 18:43:09.662081	TLC
32	2	16	"Times Now"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.01], [9, 0.03], [10, 0.02], [11, 0.03], [12, 0.02], [13, 0.02], [14, 0.03], [15, 0.02], [16, 0.02], [17, 0.02], [18, 0.02], [19, 0.02], [20, 0.02], [21, 0.09], [22, 0.06], [23, 0.01], [24, 0.0], [25, 0.0]]"	"Times Now"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 17], [8, 14], [9, 14], [10, 2], [11, 2], [12, 2], [13, 3], [14, 3], [15, 2], [16, 3], [17, 0], [18, 0], [19, 13], [20, 9], [21, 1], [22, 9], [23, 0], [24, 0], [25, 0]]"	"Times Now"=>"17"	2014-07-30 18:43:08.551629	2014-07-30 18:43:09.736181	Times Now
33	2	17	"WB"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.01], [8, 0.02], [9, 0.03], [10, 0.04], [11, 0.04], [12, 0.02], [13, 0.02], [14, 0.03], [15, 0.06], [16, 0.05], [17, 0.04], [18, 0.03], [19, 0.04], [20, 0.04], [21, 0.05], [22, 0.04], [23, 0.04], [24, 0.02], [25, 0.01]]"	"WB"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 4], [8, 2], [9, 1], [10, 1], [11, 0], [12, 0], [13, 1], [14, 0], [15, 0], [16, 15], [17, 8], [18, 10], [19, 5], [20, 8], [21, 8], [22, 6], [23, 9], [24, 10], [25, 0]]"	"WB"=>"15"	2014-07-30 18:43:08.585899	2014-07-30 18:43:09.806392	WB
34	2	18	"Z Cafe"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.0], [9, 0.0], [10, 0.01], [11, 0.01], [12, 0.0], [13, 0.0], [14, 0.0], [15, 0.0], [16, 0.0], [17, 0.0], [18, 0.0], [19, 0.0], [20, 0.01], [21, 0.01], [22, 0.01], [23, 0.01], [24, 0.0], [25, 0.0]]"	"Z Cafe"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 5], [9, 5], [10, 5], [11, 5], [12, 3], [13, 5], [14, 4], [15, 3], [16, 3], [17, 9], [18, 8], [19, 2], [20, 5], [21, 7], [22, 6], [23, 10], [24, 7], [25, 0]]"	"Z Cafe"=>"10"	2014-07-30 18:43:08.624489	2014-07-30 18:43:09.880356	Z Cafe
35	3	1	"AXN"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.0], [9, 0.0], [10, 0.01], [11, 0.01], [12, 0.0], [13, 0.0], [14, 0.01], [15, 0.01], [16, 0.01], [17, 0.01], [18, 0.0], [19, 0.01], [20, 0.02], [21, 0.03], [22, 0.01], [23, 0.0], [24, 0.01], [25, 0.0]]"	"AXN"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 0], [9, 5], [10, 2], [11, 4], [12, 2], [13, 3], [14, 3], [15, 2], [16, 2], [17, 10], [18, 10], [19, 8], [20, 10], [21, 10], [22, 12], [23, 8], [24, 0], [25, 0]]"	"AXN"=>"12"	2014-07-31 09:31:40.924458	2014-07-31 09:31:41.681406	AXN
36	3	2	"CNBC TV18"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.0], [9, 0.01], [10, 0.01], [11, 0.0], [12, 0.0], [13, 0.01], [14, 0.01], [15, 0.01], [16, 0.0], [17, 0.0], [18, 0.0], [19, 0.0], [20, 0.0], [21, 0.0], [22, 0.0], [23, 0.0], [24, 0.0], [25, 0.0]]"	"CNBC TV18"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 7], [7, 4], [8, 4], [9, 4], [10, 7], [11, 6], [12, 7], [13, 9], [14, 8], [15, 9], [16, 7], [17, 9], [18, 3], [19, 3], [20, 2], [21, 2], [22, 3], [23, 0], [24, 0], [25, 0]]"	"CNBC TV18"=>"9"	2014-07-31 09:31:40.962339	2014-07-31 09:31:41.759799	CNBC TV18
37	3	3	"CNN IBN"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.01], [9, 0.01], [10, 0.01], [11, 0.01], [12, 0.01], [13, 0.01], [14, 0.02], [15, 0.01], [16, 0.01], [17, 0.02], [18, 0.02], [19, 0.02], [20, 0.03], [21, 0.03], [22, 0.02], [23, 0.01], [24, 0.0], [25, 0.0]]"	"CNN IBN"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 15], [8, 14], [9, 12], [10, 1], [11, 1], [12, 1], [13, 0], [14, 1], [15, 0], [16, 1], [17, 0], [18, 1], [19, 12], [20, 9], [21, 6], [22, 14], [23, 3], [24, 0], [25, 0]]"	"CNN IBN"=>"15"	2014-07-31 09:31:40.997154	2014-07-31 09:31:41.836664	CNN IBN
38	3	4	"DISCOVERY CHANNEL"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.02], [9, 0.03], [10, 0.05], [11, 0.04], [12, 0.06], [13, 0.05], [14, 0.1], [15, 0.08], [16, 0.09], [17, 0.05], [18, 0.06], [19, 0.09], [20, 0.08], [21, 0.08], [22, 0.07], [23, 0.1], [24, 0.05], [25, 0.0]]"	"DISCOVERY CHANNEL"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 2], [8, 1], [9, 3], [10, 1], [11, 1], [12, 1], [13, 1], [14, 2], [15, 2], [16, 1], [17, 15], [18, 12], [19, 10], [20, 9], [21, 9], [22, 11], [23, 14], [24, 0], [25, 0]]"	"DISCOVERY CHANNEL"=>"15"	2014-07-31 09:31:41.04203	2014-07-31 09:31:41.907564	DISCOVERY CHANNEL
39	3	5	"ET Now"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.01], [9, 0.01], [10, 0.0], [11, 0.01], [12, 0.0], [13, 0.01], [14, 0.01], [15, 0.01], [16, 0.01], [17, 0.01], [18, 0.01], [19, 0.01], [20, 0.02], [21, 0.01], [22, 0.01], [23, 0.02], [24, 0.01], [25, 0.0]]"	"ET Now"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 5], [7, 6], [8, 6], [9, 2], [10, 4], [11, 4], [12, 7], [13, 6], [14, 5], [15, 5], [16, 6], [17, 4], [18, 5], [19, 6], [20, 4], [21, 5], [22, 6], [23, 6], [24, 0], [25, 0]]"	"ET Now"=>"7"	2014-07-31 09:31:41.076752	2014-07-31 09:31:41.986982	ET Now
40	3	6	"Fox Traveller"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.0], [9, 0.01], [10, 0.01], [11, 0.02], [12, 0.02], [13, 0.01], [14, 0.02], [15, 0.02], [16, 0.04], [17, 0.02], [18, 0.03], [19, 0.03], [20, 0.03], [21, 0.02], [22, 0.02], [23, 0.03], [24, 0.01], [25, 0.0]]"	"Fox Traveller"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 0], [9, 0], [10, 2], [11, 2], [12, 0], [13, 2], [14, 1], [15, 2], [16, 3], [17, 4], [18, 18], [19, 15], [20, 9], [21, 8], [22, 12], [23, 14], [24, 0], [25, 0]]"	"Fox Traveller"=>"18"	2014-07-31 09:31:41.111347	2014-07-31 09:31:42.058651	Fox Traveller
41	3	7	"HBO"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.01], [8, 0.02], [9, 0.02], [10, 0.04], [11, 0.03], [12, 0.02], [13, 0.04], [14, 0.03], [15, 0.02], [16, 0.02], [17, 0.02], [18, 0.02], [19, 0.04], [20, 0.07], [21, 0.05], [22, 0.07], [23, 0.05], [24, 0.03], [25, 0.02]]"	"HBO"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 4], [9, 3], [10, 3], [11, 3], [12, 3], [13, 3], [14, 3], [15, 2], [16, 7], [17, 7], [18, 7], [19, 8], [20, 13], [21, 9], [22, 12], [23, 3], [24, 5], [25, 0]]"	"HBO"=>"13"	2014-07-31 09:31:41.150539	2014-07-31 09:31:42.139278	HBO
42	3	8	"History TV18"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.01], [9, 0.01], [10, 0.02], [11, 0.03], [12, 0.03], [13, 0.04], [14, 0.04], [15, 0.05], [16, 0.06], [17, 0.04], [18, 0.06], [19, 0.05], [20, 0.03], [21, 0.06], [22, 0.07], [23, 0.06], [24, 0.05], [25, 0.01]]"	"History TV18"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 2], [9, 2], [10, 2], [11, 2], [12, 2], [13, 2], [14, 2], [15, 2], [16, 2], [17, 12], [18, 9], [19, 10], [20, 10], [21, 9], [22, 9], [23, 11], [24, 0], [25, 0]]"	"History TV18"=>"12"	2014-07-31 09:31:41.185212	2014-07-31 09:31:42.214004	History TV18
43	3	9	"Movies Now"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.02], [9, 0.01], [10, 0.02], [11, 0.03], [12, 0.03], [13, 0.03], [14, 0.04], [15, 0.02], [16, 0.02], [17, 0.02], [18, 0.02], [19, 0.02], [20, 0.03], [21, 0.04], [22, 0.05], [23, 0.04], [24, 0.03], [25, 0.02]]"	"Movies Now"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 6], [8, 6], [9, 4], [10, 3], [11, 4], [12, 3], [13, 1], [14, 3], [15, 3], [16, 4], [17, 9], [18, 10], [19, 8], [20, 8], [21, 4], [22, 7], [23, 8], [24, 0], [25, 0]]"	"Movies Now"=>"10"	2014-07-31 09:31:41.301743	2014-07-31 09:31:42.291947	Movies Now
44	3	10	"NATIONAL GEOGRAPHIC"=>"[[2, 0.01], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.02], [8, 0.02], [9, 0.04], [10, 0.03], [11, 0.04], [12, 0.03], [13, 0.04], [14, 0.06], [15, 0.07], [16, 0.07], [17, 0.05], [18, 0.06], [19, 0.1], [20, 0.06], [21, 0.06], [22, 0.09], [23, 0.07], [24, 0.05], [25, 0.01]]"	"NATIONAL GEOGRAPHIC"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 2], [8, 3], [9, 3], [10, 2], [11, 2], [12, 2], [13, 1], [14, 2], [15, 1], [16, 5], [17, 17], [18, 14], [19, 12], [20, 7], [21, 6], [22, 5], [23, 10], [24, 0], [25, 0]]"	"NATIONAL GEOGRAPHIC"=>"17"	2014-07-31 09:31:41.341961	2014-07-31 09:31:42.36921	NATIONAL GEOGRAPHIC
46	3	13	"Star Movies"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.01], [8, 0.01], [9, 0.03], [10, 0.06], [11, 0.05], [12, 0.04], [13, 0.05], [14, 0.06], [15, 0.05], [16, 0.05], [17, 0.05], [18, 0.06], [19, 0.06], [20, 0.07], [21, 0.06], [22, 0.07], [23, 0.09], [24, 0.07], [25, 0.02]]"	"Star Movies"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 0], [9, 1], [10, 1], [11, 3], [12, 2], [13, 3], [14, 2], [15, 2], [16, 3], [17, 18], [18, 11], [19, 0], [20, 0], [21, 13], [22, 11], [23, 7], [24, 17], [25, 0]]"	"Star Movies"=>"18"	2014-07-31 09:31:41.412592	2014-07-31 09:31:42.524293	Star Movies
48	3	15	"TLC"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.01], [8, 0.0], [9, 0.0], [10, 0.0], [11, 0.01], [12, 0.01], [13, 0.02], [14, 0.01], [15, 0.02], [16, 0.01], [17, 0.01], [18, 0.01], [19, 0.03], [20, 0.01], [21, 0.01], [22, 0.01], [23, 0.03], [24, 0.02], [25, 0.01]]"	"TLC"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 2], [8, 2], [9, 1], [10, 2], [11, 2], [12, 1], [13, 1], [14, 2], [15, 2], [16, 1], [17, 12], [18, 12], [19, 10], [20, 10], [21, 11], [22, 12], [23, 11], [24, 0], [25, 0]]"	"TLC"=>"12"	2014-07-31 09:31:41.485096	2014-07-31 09:31:42.663476	TLC
49	3	16	"Times Now"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.01], [9, 0.03], [10, 0.02], [11, 0.03], [12, 0.02], [13, 0.02], [14, 0.03], [15, 0.02], [16, 0.02], [17, 0.02], [18, 0.02], [19, 0.02], [20, 0.02], [21, 0.09], [22, 0.06], [23, 0.01], [24, 0.0], [25, 0.0]]"	"Times Now"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 17], [8, 14], [9, 14], [10, 2], [11, 2], [12, 2], [13, 3], [14, 3], [15, 2], [16, 3], [17, 0], [18, 0], [19, 13], [20, 9], [21, 1], [22, 9], [23, 0], [24, 0], [25, 0]]"	"Times Now"=>"17"	2014-07-31 09:31:41.523452	2014-07-31 09:31:42.741271	Times Now
51	3	18	"Z Cafe"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.0], [9, 0.0], [10, 0.01], [11, 0.01], [12, 0.0], [13, 0.0], [14, 0.0], [15, 0.0], [16, 0.0], [17, 0.0], [18, 0.0], [19, 0.0], [20, 0.01], [21, 0.01], [22, 0.01], [23, 0.01], [24, 0.0], [25, 0.0]]"	"Z Cafe"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 5], [9, 5], [10, 5], [11, 5], [12, 3], [13, 5], [14, 4], [15, 3], [16, 3], [17, 9], [18, 8], [19, 2], [20, 5], [21, 7], [22, 6], [23, 10], [24, 7], [25, 0]]"	"Z Cafe"=>"10"	2014-07-31 09:31:41.591999	2014-07-31 09:31:42.979539	Z Cafe
45	3	11	"NDTV 24x7"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.01], [9, 0.01], [10, 0.02], [11, 0.01], [12, 0.01], [13, 0.01], [14, 0.01], [15, 0.01], [16, 0.01], [17, 0.01], [18, 0.01], [19, 0.02], [20, 0.02], [21, 0.03], [22, 0.03], [23, 0.01], [24, 0.0], [25, 0.0]]"	"NDTV 24x7"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 12], [8, 10], [9, 10], [10, 12], [11, 1], [12, 0], [13, 0], [14, 0], [15, 0], [16, 1], [17, 0], [18, 9], [19, 6], [20, 6], [21, 5], [22, 5], [23, 15], [24, 0], [25, 0]]"	"NDTV 24x7"=>"15"	2014-07-31 09:31:41.377812	2014-07-31 09:31:42.449195	NDTV 24x7
47	3	14	"Star World"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.01], [9, 0.01], [10, 0.01], [11, 0.01], [12, 0.0], [13, 0.0], [14, 0.0], [15, 0.01], [16, 0.01], [17, 0.0], [18, 0.0], [19, 0.02], [20, 0.02], [21, 0.03], [22, 0.01], [23, 0.01], [24, 0.0], [25, 0.0]]"	"Star World"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 0], [9, 0], [10, 0], [11, 0], [12, 0], [13, 0], [14, 0], [15, 0], [16, 0], [17, 0], [18, 0], [19, 41], [20, 0], [21, 58], [22, 0], [23, 0], [24, 0], [25, 0]]"	"Star World"=>"58"	2014-07-31 09:31:41.45101	2014-07-31 09:31:42.591307	Star World
50	3	17	"WB"=>"[[2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.01], [8, 0.02], [9, 0.03], [10, 0.04], [11, 0.04], [12, 0.02], [13, 0.02], [14, 0.03], [15, 0.06], [16, 0.05], [17, 0.04], [18, 0.03], [19, 0.04], [20, 0.04], [21, 0.05], [22, 0.04], [23, 0.04], [24, 0.02], [25, 0.01]]"	"WB"=>"[[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 4], [8, 2], [9, 1], [10, 1], [11, 0], [12, 0], [13, 1], [14, 0], [15, 0], [16, 15], [17, 8], [18, 10], [19, 5], [20, 8], [21, 8], [22, 6], [23, 9], [24, 10], [25, 0]]"	"WB"=>"15"	2014-07-31 09:31:41.557998	2014-07-31 09:31:42.814147	WB
\.


--
-- Name: calculated_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('calculated_data_id_seq', 51, true);


--
-- Data for Name: campaigns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY campaigns (id, client_id, name, created_at, updated_at, tg, start_date, end_date, markets, active, cfile_file_name, cfile_content_type, cfile_file_size, cfile_updated_at, sfile_file_name, sfile_content_type, sfile_file_size, sfile_updated_at) FROM stdin;
1	1	C1	2014-07-30 12:30:05.665596	2014-07-30 12:30:28.146479	T1	2014-07-30	2014-07-30	M1	t	Adspotlisting.xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	522402	2014-07-30 12:30:28.108752	TAM1.xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	27772	2014-07-30 12:30:27.706108
2	1	C1	2014-07-30 18:34:24.696783	2014-07-30 18:35:14.345409	T1	2014-07-30	2014-07-30	M1	t	Adspotlisting.xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	522402	2014-07-30 18:35:14.208084	TAM1.xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	27772	2014-07-30 18:35:14.192294
3	1	C23	2014-07-31 09:21:29.020984	2014-07-31 09:21:45.395317	T23	2014-07-31	2014-08-01	Mk23	t	Adspotlisting.xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	522402	2014-07-31 09:21:45.366237	TAM1.xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	27772	2014-07-31 09:21:45.35426
4	1	Fortune	2014-08-19 07:13:16.969526	2014-08-19 07:13:16.969526	TG1	2014-08-19	2014-08-22	Mk1	t	\N	\N	\N	\N	\N	\N	\N	\N
5	1	Latest Campaign	2014-08-31 11:39:15.597795	2014-08-31 11:43:10.180838	Target1	2014-08-31	2014-08-31	Market1	t	Adspotlisting.xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	522402	2014-08-31 11:43:10.142063	TAM1.xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	27772	2014-08-31 11:43:10.119161
\.


--
-- Name: campaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('campaigns_id_seq', 5, true);


--
-- Data for Name: channels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY channels (id, name, created_at, updated_at) FROM stdin;
1	AXN	2014-07-30 12:30:33.991631	2014-07-30 12:30:33.991631
2	CNBC TV18	2014-07-30 12:30:34.640138	2014-07-30 12:30:34.640138
3	CNN IBN	2014-07-30 12:30:35.118154	2014-07-30 12:30:35.118154
4	DISCOVERY CHANNEL	2014-07-30 12:30:35.580273	2014-07-30 12:30:35.580273
5	ET Now	2014-07-30 12:30:36.078891	2014-07-30 12:30:36.078891
6	Fox Traveller	2014-07-30 12:30:36.555208	2014-07-30 12:30:36.555208
7	HBO	2014-07-30 12:30:37.115428	2014-07-30 12:30:37.115428
8	History TV18	2014-07-30 12:30:37.604626	2014-07-30 12:30:37.604626
9	Movies Now	2014-07-30 12:30:38.085877	2014-07-30 12:30:38.085877
10	NATIONAL GEOGRAPHIC	2014-07-30 12:30:38.588877	2014-07-30 12:30:38.588877
11	NDTV 24x7	2014-07-30 12:30:39.076879	2014-07-30 12:30:39.076879
12	NDTV Good Times	2014-07-30 12:30:39.586836	2014-07-30 12:30:39.586836
13	Star Movies	2014-07-30 12:30:40.123751	2014-07-30 12:30:40.123751
14	Star World	2014-07-30 12:30:40.708541	2014-07-30 12:30:40.708541
15	TLC	2014-07-30 12:30:41.222493	2014-07-30 12:30:41.222493
16	Times Now	2014-07-30 12:30:41.716621	2014-07-30 12:30:41.716621
17	WB	2014-07-30 12:30:42.218806	2014-07-30 12:30:42.218806
18	Z Cafe	2014-07-30 12:30:42.796151	2014-07-30 12:30:42.796151
19	Z Studio	2014-07-30 12:30:43.361795	2014-07-30 12:30:43.361795
20	Any Channel	2014-07-30 12:30:43.841062	2014-07-30 12:30:43.841062
21	\N	2014-07-30 12:30:44.400421	2014-07-30 12:30:44.400421
\.


--
-- Name: channels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('channels_id_seq', 21, true);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clients (id, name, created_at, updated_at, subdomain, internal, icon_file_name, icon_content_type, icon_file_size, icon_updated_at) FROM stdin;
1	Home	2014-07-30 12:26:27.054342	2014-07-30 12:26:27.054342	www	\N	\N	\N	\N	\N
2	Adani Group	2014-08-19 07:03:05.296459	2014-08-19 07:03:05.296459	adani	\N	\N	\N	\N	\N
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clients_id_seq', 2, true);


--
-- Data for Name: cslides; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cslides (id, child_id, slide_id, created_at, updated_at) FROM stdin;
1	23	7	2014-07-31 06:37:00.532116	2014-07-31 06:37:00.532116
2	22	7	2014-07-31 06:37:00.536846	2014-07-31 06:37:00.536846
3	21	7	2014-07-31 06:37:00.538828	2014-07-31 06:37:00.538828
4	20	7	2014-07-31 06:37:00.540528	2014-07-31 06:37:00.540528
5	19	7	2014-07-31 06:37:00.542151	2014-07-31 06:37:00.542151
6	18	7	2014-07-31 06:37:00.543785	2014-07-31 06:37:00.543785
7	17	7	2014-07-31 06:37:00.545432	2014-07-31 06:37:00.545432
8	16	7	2014-07-31 06:37:00.547219	2014-07-31 06:37:00.547219
9	15	7	2014-07-31 06:37:00.548879	2014-07-31 06:37:00.548879
10	14	7	2014-07-31 06:37:00.550496	2014-07-31 06:37:00.550496
11	13	7	2014-07-31 06:37:00.552164	2014-07-31 06:37:00.552164
12	12	7	2014-07-31 06:37:00.553769	2014-07-31 06:37:00.553769
13	11	7	2014-07-31 06:37:00.555398	2014-07-31 06:37:00.555398
14	10	7	2014-07-31 06:37:00.557024	2014-07-31 06:37:00.557024
15	9	3	2014-07-31 06:43:34.658981	2014-07-31 06:43:34.658981
16	8	3	2014-07-31 06:43:34.663351	2014-07-31 06:43:34.663351
17	7	3	2014-07-31 06:43:34.665539	2014-07-31 06:43:34.665539
18	27	8	2014-07-31 06:51:14.691182	2014-07-31 06:51:14.691182
19	26	8	2014-07-31 06:51:14.695641	2014-07-31 06:51:14.695641
20	25	8	2014-07-31 06:51:14.697571	2014-07-31 06:51:14.697571
21	24	8	2014-07-31 06:51:14.699298	2014-07-31 06:51:14.699298
22	42	9	2014-07-31 06:58:09.093633	2014-07-31 06:58:09.093633
23	41	9	2014-07-31 06:58:09.095702	2014-07-31 06:58:09.095702
24	40	9	2014-07-31 06:58:09.098093	2014-07-31 06:58:09.098093
25	39	9	2014-07-31 06:58:09.100089	2014-07-31 06:58:09.100089
26	38	9	2014-07-31 06:58:09.101925	2014-07-31 06:58:09.101925
27	37	9	2014-07-31 06:58:09.103581	2014-07-31 06:58:09.103581
28	36	9	2014-07-31 06:58:09.105422	2014-07-31 06:58:09.105422
29	35	9	2014-07-31 06:58:09.107328	2014-07-31 06:58:09.107328
30	34	9	2014-07-31 06:58:09.109094	2014-07-31 06:58:09.109094
31	33	9	2014-07-31 06:58:09.110797	2014-07-31 06:58:09.110797
32	32	9	2014-07-31 06:58:09.113311	2014-07-31 06:58:09.113311
33	31	9	2014-07-31 06:58:09.115198	2014-07-31 06:58:09.115198
34	30	9	2014-07-31 06:58:09.117682	2014-07-31 06:58:09.117682
35	29	9	2014-07-31 06:58:09.119511	2014-07-31 06:58:09.119511
36	28	9	2014-07-31 06:58:09.121169	2014-07-31 06:58:09.121169
37	45	4	2014-07-31 07:00:45.356928	2014-07-31 07:00:45.356928
38	44	4	2014-07-31 07:00:45.359013	2014-07-31 07:00:45.359013
39	43	4	2014-07-31 07:00:45.360749	2014-07-31 07:00:45.360749
40	59	43	2014-07-31 07:05:45.473467	2014-07-31 07:05:45.473467
41	58	43	2014-07-31 07:05:45.475715	2014-07-31 07:05:45.475715
42	57	43	2014-07-31 07:05:45.477424	2014-07-31 07:05:45.477424
43	56	43	2014-07-31 07:05:45.479239	2014-07-31 07:05:45.479239
44	55	43	2014-07-31 07:05:45.481111	2014-07-31 07:05:45.481111
45	54	43	2014-07-31 07:05:45.483039	2014-07-31 07:05:45.483039
46	53	43	2014-07-31 07:05:45.484998	2014-07-31 07:05:45.484998
47	52	43	2014-07-31 07:05:45.486819	2014-07-31 07:05:45.486819
48	51	43	2014-07-31 07:05:45.488545	2014-07-31 07:05:45.488545
49	50	43	2014-07-31 07:05:45.490295	2014-07-31 07:05:45.490295
50	49	43	2014-07-31 07:05:45.491976	2014-07-31 07:05:45.491976
51	48	43	2014-07-31 07:05:45.493734	2014-07-31 07:05:45.493734
52	47	43	2014-07-31 07:05:45.495465	2014-07-31 07:05:45.495465
53	46	43	2014-07-31 07:05:45.497276	2014-07-31 07:05:45.497276
54	65	44	2014-07-31 07:08:38.633977	2014-07-31 07:08:38.633977
55	64	44	2014-07-31 07:08:38.636192	2014-07-31 07:08:38.636192
56	63	44	2014-07-31 07:08:38.637847	2014-07-31 07:08:38.637847
57	62	44	2014-07-31 07:08:38.639492	2014-07-31 07:08:38.639492
58	61	44	2014-07-31 07:08:38.641143	2014-07-31 07:08:38.641143
59	60	44	2014-07-31 07:08:38.642784	2014-07-31 07:08:38.642784
60	75	45	2014-07-31 07:12:25.219505	2014-07-31 07:12:25.219505
61	74	45	2014-07-31 07:12:25.221699	2014-07-31 07:12:25.221699
62	73	45	2014-07-31 07:12:25.223489	2014-07-31 07:12:25.223489
63	72	45	2014-07-31 07:12:25.225343	2014-07-31 07:12:25.225343
64	71	45	2014-07-31 07:12:25.227088	2014-07-31 07:12:25.227088
65	70	45	2014-07-31 07:12:25.22896	2014-07-31 07:12:25.22896
66	69	45	2014-07-31 07:12:25.230704	2014-07-31 07:12:25.230704
67	68	45	2014-07-31 07:12:25.232474	2014-07-31 07:12:25.232474
68	67	45	2014-07-31 07:12:25.234242	2014-07-31 07:12:25.234242
69	66	45	2014-07-31 07:12:25.235983	2014-07-31 07:12:25.235983
70	78	5	2014-07-31 07:14:19.63107	2014-07-31 07:14:19.63107
71	77	5	2014-07-31 07:14:19.635298	2014-07-31 07:14:19.635298
72	76	5	2014-07-31 07:14:19.638852	2014-07-31 07:14:19.638852
73	86	76	2014-07-31 07:17:11.658242	2014-07-31 07:17:11.658242
74	85	76	2014-07-31 07:17:11.660485	2014-07-31 07:17:11.660485
75	84	76	2014-07-31 07:17:11.662176	2014-07-31 07:17:11.662176
76	83	76	2014-07-31 07:17:11.663842	2014-07-31 07:17:11.663842
77	82	76	2014-07-31 07:17:11.665578	2014-07-31 07:17:11.665578
78	81	76	2014-07-31 07:17:11.667332	2014-07-31 07:17:11.667332
79	80	76	2014-07-31 07:17:11.669112	2014-07-31 07:17:11.669112
80	79	76	2014-07-31 07:17:11.670863	2014-07-31 07:17:11.670863
81	100	77	2014-07-31 07:22:18.89686	2014-07-31 07:22:18.89686
82	99	77	2014-07-31 07:22:18.899285	2014-07-31 07:22:18.899285
83	98	77	2014-07-31 07:22:18.90105	2014-07-31 07:22:18.90105
84	97	77	2014-07-31 07:22:18.902688	2014-07-31 07:22:18.902688
85	96	77	2014-07-31 07:22:18.904384	2014-07-31 07:22:18.904384
86	95	77	2014-07-31 07:22:18.906035	2014-07-31 07:22:18.906035
87	94	77	2014-07-31 07:22:18.907687	2014-07-31 07:22:18.907687
88	93	77	2014-07-31 07:22:18.909518	2014-07-31 07:22:18.909518
89	92	77	2014-07-31 07:22:18.911458	2014-07-31 07:22:18.911458
90	91	77	2014-07-31 07:22:18.913132	2014-07-31 07:22:18.913132
91	90	77	2014-07-31 07:22:18.914844	2014-07-31 07:22:18.914844
92	89	77	2014-07-31 07:22:18.916582	2014-07-31 07:22:18.916582
93	88	77	2014-07-31 07:22:18.918277	2014-07-31 07:22:18.918277
94	87	77	2014-07-31 07:22:18.919935	2014-07-31 07:22:18.919935
95	104	78	2014-07-31 07:24:25.720681	2014-07-31 07:24:25.720681
96	103	78	2014-07-31 07:24:25.722847	2014-07-31 07:24:25.722847
97	102	78	2014-07-31 07:24:25.724752	2014-07-31 07:24:25.724752
98	101	78	2014-07-31 07:24:25.726667	2014-07-31 07:24:25.726667
\.


--
-- Name: cslides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cslides_id_seq', 98, true);


--
-- Data for Name: customizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customizations (id, client_id, created_at, updated_at, background_file_name, background_content_type, background_file_size, background_updated_at) FROM stdin;
\.


--
-- Name: customizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customizations_id_seq', 1, false);


--
-- Data for Name: delayed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY delayed_jobs (id, priority, attempts, handler, last_error, run_at, locked_at, failed_at, locked_by, queue, created_at, updated_at) FROM stdin;
\.


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('delayed_jobs_id_seq', 31, true);


--
-- Data for Name: hours; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hours (id, name, start_time, end_time, created_at, updated_at) FROM stdin;
1	2	02:00:00	02:59:59	2014-07-30 12:26:27.63352	2014-07-30 12:26:27.63352
2	3	03:00:00	03:59:59	2014-07-30 12:26:27.639635	2014-07-30 12:26:27.639635
3	4	04:00:00	04:59:59	2014-07-30 12:26:27.642964	2014-07-30 12:26:27.642964
4	5	05:00:00	05:59:59	2014-07-30 12:26:27.646365	2014-07-30 12:26:27.646365
5	6	06:00:00	06:59:59	2014-07-30 12:26:27.649593	2014-07-30 12:26:27.649593
6	7	07:00:00	07:59:59	2014-07-30 12:26:27.652718	2014-07-30 12:26:27.652718
7	8	08:00:00	08:59:59	2014-07-30 12:26:27.655725	2014-07-30 12:26:27.655725
8	9	09:00:00	09:59:59	2014-07-30 12:26:27.658606	2014-07-30 12:26:27.658606
9	10	10:00:00	10:59:59	2014-07-30 12:26:27.661521	2014-07-30 12:26:27.661521
10	11	11:00:00	11:59:59	2014-07-30 12:26:27.664423	2014-07-30 12:26:27.664423
11	12	12:00:00	12:59:59	2014-07-30 12:26:27.667297	2014-07-30 12:26:27.667297
12	13	13:00:00	13:59:59	2014-07-30 12:26:27.670359	2014-07-30 12:26:27.670359
13	14	14:00:00	14:59:59	2014-07-30 12:26:27.6733	2014-07-30 12:26:27.6733
14	15	15:00:00	15:59:59	2014-07-30 12:26:27.676252	2014-07-30 12:26:27.676252
15	16	16:00:00	16:59:59	2014-07-30 12:26:27.679228	2014-07-30 12:26:27.679228
16	17	17:00:00	17:59:59	2014-07-30 12:26:27.682123	2014-07-30 12:26:27.682123
17	18	18:00:00	18:59:59	2014-07-30 12:26:27.685057	2014-07-30 12:26:27.685057
18	19	19:00:00	19:59:59	2014-07-30 12:26:27.688005	2014-07-30 12:26:27.688005
19	20	20:00:00	20:59:59	2014-07-30 12:26:27.691281	2014-07-30 12:26:27.691281
20	21	21:00:00	21:59:59	2014-07-30 12:26:27.694168	2014-07-30 12:26:27.694168
21	22	22:00:00	22:59:59	2014-07-30 12:26:27.697209	2014-07-30 12:26:27.697209
22	23	23:00:00	23:59:59	2014-07-30 12:26:27.700086	2014-07-30 12:26:27.700086
23	24	00:00:00	00:59:59	2014-07-30 12:26:27.703057	2014-07-30 12:26:27.703057
24	25	01:00:00	01:59:59	2014-07-30 12:26:27.705955	2014-07-30 12:26:27.705955
\.


--
-- Name: hours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hours_id_seq', 24, true);


--
-- Data for Name: presentation_templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY presentation_templates (id, created_at, updated_at, footer, presentation_id, slide_id) FROM stdin;
\.


--
-- Name: presentation_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('presentation_templates_id_seq', 1, false);


--
-- Data for Name: presentations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY presentations (id, created_at, updated_at, title) FROM stdin;
1	2014-07-31 04:47:37.539637	2014-07-31 04:47:37.539637	Presentation1
2	2014-07-31 06:42:27.286887	2014-07-31 06:42:27.286887	P1
3	2014-07-31 09:23:17.525731	2014-07-31 09:23:17.525731	Presentation123
4	2014-07-31 11:23:09.662139	2014-07-31 11:23:09.662139	
5	2014-07-31 13:00:02.861548	2014-07-31 13:00:02.861548	
6	2014-07-31 13:07:48.455811	2014-07-31 13:07:48.455811	P2
7	2014-08-19 06:18:27.214518	2014-08-19 06:18:27.214518	
8	2014-08-19 06:23:17.153272	2014-08-19 06:23:17.153272	
9	2014-08-19 07:41:17.00139	2014-08-19 07:41:17.00139	Presentation1
10	2014-08-20 08:42:52.888361	2014-08-20 08:42:52.888361	p
11	2014-08-26 05:27:00.752258	2014-08-26 05:27:00.752258	
\.


--
-- Name: presentations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('presentations_id_seq', 11, true);


--
-- Data for Name: rails_admin_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rails_admin_histories (id, message, username, item, "table", month, year, created_at, updated_at) FROM stdin;
\.


--
-- Name: rails_admin_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rails_admin_histories_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20140304194844
20140304194845
20140307123544
20140326201327
20140326201856
20140326220522
20140330202806
20140330202937
20140508031611
20140508032756
20140530120042
20140530144925
20140530145033
20140530145320
20140530145453
20140530145845
20140601213042
20140601213812
20140602012405
20140603015715
20140603142542
20140604032955
20140607073249
20140607091607
20140611155123
20140611155124
20140611155125
20140624141637
20140625053527
20140701051442
20140701051754
20140701054225
20140701054405
20140701055122
20140701055956
20140701060548
20140702134731
20140702140821
20140703043110
20140703135408
\.


--
-- Data for Name: slides; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY slides (id, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at, name, seq) FROM stdin;
1	2014-07-31 06:25:31.029586	2014-07-31 06:25:31.029586	\N	\N	\N	\N	Dummy Slide 01	\N
2	2014-07-31 06:25:43.336737	2014-07-31 06:25:43.336737	\N	\N	\N	\N	Dummy Slide 02	\N
3	2014-07-31 06:26:40.371533	2014-07-31 06:26:40.371533	\N	\N	\N	\N	Marketing Audit	\N
4	2014-07-31 06:27:16.194176	2014-07-31 06:27:16.194176	\N	\N	\N	\N	Media Audit	\N
5	2014-07-31 06:27:41.685741	2014-07-31 06:27:41.685741	\N	\N	\N	\N	Partner Advisory	\N
6	2014-07-31 06:27:56.826115	2014-07-31 06:27:56.826115	\N	\N	\N	\N	Technology Solutions	\N
10	2014-07-31 06:31:42.197466	2014-07-31 06:31:42.197466	Slide1.JPG	image/jpeg	43707	2014-07-31 06:31:41.694126	IA1	1
11	2014-07-31 06:32:38.318794	2014-07-31 06:32:38.318794	Slide2.JPG	image/jpeg	55878	2014-07-31 06:32:38.010344	IA2	2
12	2014-07-31 06:32:55.307436	2014-07-31 06:32:55.307436	Slide3.JPG	image/jpeg	102071	2014-07-31 06:32:54.976797	IA3	3
13	2014-07-31 06:33:11.272825	2014-07-31 06:33:11.272825	Slide4.JPG	image/jpeg	81300	2014-07-31 06:33:10.907362	IA4	4
14	2014-07-31 06:33:29.355268	2014-07-31 06:33:29.355268	Slide5.JPG	image/jpeg	99153	2014-07-31 06:33:29.064323	IA5	5
15	2014-07-31 06:33:59.906944	2014-07-31 06:33:59.906944	Slide6.JPG	image/jpeg	74814	2014-07-31 06:33:59.540248	IA6	6
16	2014-07-31 06:34:18.511361	2014-07-31 06:34:18.511361	Slide7.JPG	image/jpeg	37150	2014-07-31 06:34:18.142654	IA7	7
17	2014-07-31 06:34:35.23717	2014-07-31 06:34:35.23717	Slide8.JPG	image/jpeg	81749	2014-07-31 06:34:34.918497	IA8	8
18	2014-07-31 06:34:53.94304	2014-07-31 06:34:53.94304	Slide9.JPG	image/jpeg	147052	2014-07-31 06:34:53.646285	IA9	9
19	2014-07-31 06:35:11.582104	2014-07-31 06:35:11.582104	Slide10.JPG	image/jpeg	118533	2014-07-31 06:35:11.277252	IA10	10
20	2014-07-31 06:35:28.209871	2014-07-31 06:35:28.209871	Slide11.JPG	image/jpeg	71959	2014-07-31 06:35:27.848139	IA11	11
21	2014-07-31 06:35:46.341685	2014-07-31 06:35:46.341685	Slide12.JPG	image/jpeg	87106	2014-07-31 06:35:46.029208	IA12	12
22	2014-07-31 06:36:03.78726	2014-07-31 06:36:03.78726	Slide13.JPG	image/jpeg	103381	2014-07-31 06:36:03.385083	IA13	13
23	2014-07-31 06:36:18.82325	2014-07-31 06:36:18.82325	Slide14.JPG	image/jpeg	132124	2014-07-31 06:36:18.436426	IA14	14
7	2014-07-31 06:29:35.60723	2014-07-31 06:40:02.216804	\N	\N	\N	\N	Investment Analysis	1
8	2014-07-31 06:30:01.730145	2014-07-31 06:40:15.612793	\N	\N	\N	\N	Procurement Audit	2
9	2014-07-31 06:30:26.837725	2014-07-31 06:40:38.786372	\N	\N	\N	\N	TVC Production Audit Services	3
24	2014-07-31 06:49:19.502927	2014-07-31 06:49:19.502927	Slide1.JPG	image/jpeg	42068	2014-07-31 06:49:19.106864	PA1	1
25	2014-07-31 06:49:49.253104	2014-07-31 06:49:49.253104	Slide2.JPG	image/jpeg	53920	2014-07-31 06:49:48.946962	PA2	2
26	2014-07-31 06:50:05.712191	2014-07-31 06:50:05.712191	Slide3.JPG	image/jpeg	173596	2014-07-31 06:50:05.328149	PA3	3
27	2014-07-31 06:50:21.580312	2014-07-31 06:50:21.580312	Slide4.JPG	image/jpeg	155590	2014-07-31 06:50:21.136733	PA4	4
28	2014-07-31 06:53:03.996793	2014-07-31 06:53:03.996793	Slide1.JPG	image/jpeg	52981	2014-07-31 06:53:03.703087	TPAS1	1
29	2014-07-31 06:53:17.956291	2014-07-31 06:53:17.956291	Slide2.JPG	image/jpeg	76380	2014-07-31 06:53:17.668598	TPAS2	2
30	2014-07-31 06:53:33.155463	2014-07-31 06:53:33.155463	Slide3.JPG	image/jpeg	108342	2014-07-31 06:53:32.779662	TPAS3	3
31	2014-07-31 06:53:48.210869	2014-07-31 06:53:48.210869	Slide4.JPG	image/jpeg	122133	2014-07-31 06:53:47.89074	TPAS4	4
32	2014-07-31 06:54:02.904977	2014-07-31 06:54:02.904977	Slide5.JPG	image/jpeg	106343	2014-07-31 06:54:02.587876	TPAS5	5
33	2014-07-31 06:54:18.238475	2014-07-31 06:54:18.238475	Slide6.JPG	image/jpeg	89401	2014-07-31 06:54:17.929911	TPAS6	6
34	2014-07-31 06:54:33.091244	2014-07-31 06:54:33.091244	Slide7.JPG	image/jpeg	102242	2014-07-31 06:54:32.794383	TPAS7	7
35	2014-07-31 06:54:46.131793	2014-07-31 06:54:46.131793	Slide8.JPG	image/jpeg	95852	2014-07-31 06:54:45.759894	TPAS8	8
36	2014-07-31 06:55:03.745283	2014-07-31 06:55:03.745283	Slide9.JPG	image/jpeg	96105	2014-07-31 06:55:03.350824	TPAS9	9
37	2014-07-31 06:55:19.281262	2014-07-31 06:55:19.281262	Slide10.JPG	image/jpeg	118280	2014-07-31 06:55:18.955538	TPAS10	10
38	2014-07-31 06:55:42.957613	2014-07-31 06:55:42.957613	Slide11.JPG	image/jpeg	82624	2014-07-31 06:55:42.59833	TPAS11	11
39	2014-07-31 06:56:03.524197	2014-07-31 06:56:03.524197	Slide12.JPG	image/jpeg	143082	2014-07-31 06:56:03.128209	TPAS12	12
40	2014-07-31 06:56:20.803757	2014-07-31 06:56:20.803757	Slide13.JPG	image/jpeg	112873	2014-07-31 06:56:20.49277	TPAS13	13
41	2014-07-31 06:57:00.847508	2014-07-31 06:57:00.847508	Slide14.JPG	image/jpeg	179448	2014-07-31 06:57:00.514779	TPAS14	14
42	2014-07-31 06:57:18.954086	2014-07-31 06:57:18.954086	Slide15.JPG	image/jpeg	93618	2014-07-31 06:57:18.658326	TPAS15	15
43	2014-07-31 06:59:36.359858	2014-07-31 06:59:36.359858	\N	\N	\N	\N	Digital Audit and Advisory	1
44	2014-07-31 06:59:57.221945	2014-07-31 06:59:57.221945	\N	\N	\N	\N	Print, Radio & OOH	2
45	2014-07-31 07:00:10.380418	2014-07-31 07:00:10.380418	\N	\N	\N	\N	TV Planning	3
46	2014-07-31 07:02:02.971211	2014-07-31 07:02:02.971211	Slide1.JPG	image/jpeg	54769	2014-07-31 07:02:02.553479	DAA1	1
47	2014-07-31 07:02:18.504326	2014-07-31 07:02:18.504326	Slide2.JPG	image/jpeg	93089	2014-07-31 07:02:18.086895	DAA2	2
48	2014-07-31 07:02:32.360613	2014-07-31 07:02:32.360613	Slide3.JPG	image/jpeg	138360	2014-07-31 07:02:32.039138	DAA3	3
49	2014-07-31 07:02:51.833883	2014-07-31 07:02:51.833883	Slide4.JPG	image/jpeg	102677	2014-07-31 07:02:51.504325	DAA4	4
50	2014-07-31 07:03:06.934563	2014-07-31 07:03:06.934563	Slide5.JPG	image/jpeg	194075	2014-07-31 07:03:06.560686	DAA5	5
51	2014-07-31 07:03:21.221337	2014-07-31 07:03:21.221337	Slide6.JPG	image/jpeg	181859	2014-07-31 07:03:20.844164	DAA6	6
52	2014-07-31 07:03:35.322978	2014-07-31 07:03:35.322978	Slide7.JPG	image/jpeg	173541	2014-07-31 07:03:34.97619	DAA7	7
53	2014-07-31 07:03:50.505153	2014-07-31 07:03:50.505153	Slide8.JPG	image/jpeg	103135	2014-07-31 07:03:50.197447	DAA8	8
54	2014-07-31 07:04:03.968489	2014-07-31 07:04:03.968489	Slide9.JPG	image/jpeg	144919	2014-07-31 07:04:03.640205	DAA9	9
55	2014-07-31 07:04:17.99197	2014-07-31 07:04:17.99197	Slide10.JPG	image/jpeg	117606	2014-07-31 07:04:17.615984	DAA10	10
56	2014-07-31 07:04:33.569087	2014-07-31 07:04:33.569087	Slide11.JPG	image/jpeg	188951	2014-07-31 07:04:33.256285	DAA11	11
57	2014-07-31 07:04:47.260051	2014-07-31 07:04:47.260051	Slide12.JPG	image/jpeg	191111	2014-07-31 07:04:46.840699	DAA12	12
58	2014-07-31 07:05:03.286477	2014-07-31 07:05:03.286477	Slide13.JPG	image/jpeg	127744	2014-07-31 07:05:02.935085	DAA13	13
59	2014-07-31 07:05:19.236578	2014-07-31 07:05:19.236578	Slide14.JPG	image/jpeg	131684	2014-07-31 07:05:18.920533	DAA14	14
60	2014-07-31 07:06:41.556993	2014-07-31 07:06:41.556993	Slide1.JPG	image/jpeg	45089	2014-07-31 07:06:41.209952	PRO1	1
61	2014-07-31 07:06:58.199472	2014-07-31 07:06:58.199472	Slide2.JPG	image/jpeg	193908	2014-07-31 07:06:57.894695	PRO2	2
62	2014-07-31 07:07:12.253023	2014-07-31 07:07:12.253023	Slide3.JPG	image/jpeg	53724	2014-07-31 07:07:11.574453	PRO3	3
63	2014-07-31 07:07:26.091803	2014-07-31 07:07:26.091803	Slide4.JPG	image/jpeg	134756	2014-07-31 07:07:25.778012	PRO4	4
64	2014-07-31 07:07:39.277873	2014-07-31 07:07:39.277873	Slide5.JPG	image/jpeg	112837	2014-07-31 07:07:38.862751	PRO5	5
65	2014-07-31 07:08:06.390683	2014-07-31 07:08:06.390683	Slide6.JPG	image/jpeg	115107	2014-07-31 07:08:05.986948	PRO6	6
66	2014-07-31 07:09:44.597122	2014-07-31 07:09:44.597122	Slide1.JPG	image/jpeg	38440	2014-07-31 07:09:44.218485	TP1	1
67	2014-07-31 07:09:59.510547	2014-07-31 07:09:59.510547	Slide2.JPG	image/jpeg	72234	2014-07-31 07:09:59.145477	TP2	2
68	2014-07-31 07:10:17.455985	2014-07-31 07:10:17.455985	Slide3.JPG	image/jpeg	94328	2014-07-31 07:10:17.137194	TP3	3
69	2014-07-31 07:10:32.598092	2014-07-31 07:10:32.598092	Slide4.JPG	image/jpeg	95464	2014-07-31 07:10:32.189831	TP4	4
70	2014-07-31 07:10:49.792833	2014-07-31 07:10:49.792833	Slide5.JPG	image/jpeg	145293	2014-07-31 07:10:49.352664	TP5	5
71	2014-07-31 07:11:04.090376	2014-07-31 07:11:04.090376	Slide6.JPG	image/jpeg	119651	2014-07-31 07:11:03.678386	TP6	6
72	2014-07-31 07:11:17.541411	2014-07-31 07:11:17.541411	Slide7.JPG	image/jpeg	59610	2014-07-31 07:11:17.248385	TP7	7
73	2014-07-31 07:11:30.581799	2014-07-31 07:11:30.581799	Slide8.JPG	image/jpeg	114764	2014-07-31 07:11:30.274208	TP8	8
74	2014-07-31 07:11:43.422064	2014-07-31 07:11:43.422064	Slide9.JPG	image/jpeg	115682	2014-07-31 07:11:43.027051	TP9	9
75	2014-07-31 07:11:57.501601	2014-07-31 07:11:57.501601	Slide10.JPG	image/jpeg	124425	2014-07-31 07:11:57.124781	TP10	10
76	2014-07-31 07:12:50.337493	2014-07-31 07:12:50.337493	\N	\N	\N	\N	Compensation Advisory	1
77	2014-07-31 07:13:05.078655	2014-07-31 07:13:05.078655	\N	\N	\N	\N	Pitch Management	2
78	2014-07-31 07:13:18.005259	2014-07-31 07:13:18.005259	\N	\N	\N	\N	Rate Card Rationalization	3
79	2014-07-31 07:14:46.68879	2014-07-31 07:14:46.68879	Slide1.JPG	image/jpeg	47994	2014-07-31 07:14:46.392587	CA1	1
80	2014-07-31 07:15:01.101163	2014-07-31 07:15:01.101163	Slide2.JPG	image/jpeg	157790	2014-07-31 07:15:00.766361	CA2	2
81	2014-07-31 07:15:13.761763	2014-07-31 07:15:13.761763	Slide3.JPG	image/jpeg	116644	2014-07-31 07:15:13.377091	CA3	3
82	2014-07-31 07:15:47.345388	2014-07-31 07:15:47.345388	Slide4.JPG	image/jpeg	149879	2014-07-31 07:15:47.04377	CA4	4
83	2014-07-31 07:16:01.481014	2014-07-31 07:16:01.481014	Slide5.JPG	image/jpeg	253805	2014-07-31 07:16:01.175195	CA5	5
84	2014-07-31 07:16:15.918162	2014-07-31 07:16:15.918162	Slide6.JPG	image/jpeg	105637	2014-07-31 07:16:15.596852	CA6	6
85	2014-07-31 07:16:29.564637	2014-07-31 07:16:29.564637	Slide7.JPG	image/jpeg	184080	2014-07-31 07:16:29.155232	CA7	7
86	2014-07-31 07:16:44.989962	2014-07-31 07:16:44.989962	Slide8.JPG	image/jpeg	126961	2014-07-31 07:16:44.596266	CA8	8
87	2014-07-31 07:18:00.326594	2014-07-31 07:18:00.326594	Slide1.JPG	image/jpeg	42588	2014-07-31 07:17:59.987676	PM1	1
88	2014-07-31 07:18:18.249361	2014-07-31 07:18:18.249361	Slide2.JPG	image/jpeg	98863	2014-07-31 07:18:17.886542	PM2	2
89	2014-07-31 07:19:04.142277	2014-07-31 07:19:04.142277	Slide3.JPG	image/jpeg	132834	2014-07-31 07:19:03.814308	PM3	3
90	2014-07-31 07:19:18.530576	2014-07-31 07:19:18.530576	Slide4.JPG	image/jpeg	136784	2014-07-31 07:19:18.119552	PM4	4
91	2014-07-31 07:19:39.960427	2014-07-31 07:19:39.960427	Slide5.JPG	image/jpeg	71165	2014-07-31 07:19:39.65936	PM5	5
93	2014-07-31 07:20:06.464045	2014-07-31 07:20:06.464045	Slide7.JPG	image/jpeg	110990	2014-07-31 07:20:06.056305	PM7	7
95	2014-07-31 07:20:47.811341	2014-07-31 07:20:47.811341	Slide9.JPG	image/jpeg	137045	2014-07-31 07:20:47.40242	PM9	9
97	2014-07-31 07:21:14.107317	2014-07-31 07:21:14.107317	Slide11.JPG	image/jpeg	173206	2014-07-31 07:21:13.674407	PM11	11
98	2014-07-31 07:21:27.784035	2014-07-31 07:21:27.784035	Slide12.JPG	image/jpeg	77045	2014-07-31 07:21:27.495127	PM12	12
99	2014-07-31 07:21:41.183574	2014-07-31 07:21:41.183574	Slide13.JPG	image/jpeg	170783	2014-07-31 07:21:40.817431	PM13	13
101	2014-07-31 07:23:13.079814	2014-07-31 07:23:13.079814	Slide1.JPG	image/jpeg	48985	2014-07-31 07:23:12.78573	RCR1	1
102	2014-07-31 07:23:27.201494	2014-07-31 07:23:27.201494	Slide2.JPG	image/jpeg	77221	2014-07-31 07:23:26.860839	RCR2	2
103	2014-07-31 07:23:39.280685	2014-07-31 07:23:39.280685	Slide3.JPG	image/jpeg	101303	2014-07-31 07:23:38.863571	RCR3	3
92	2014-07-31 07:19:53.554513	2014-07-31 07:19:53.554513	Slide6.JPG	image/jpeg	114112	2014-07-31 07:19:53.153101	PM6	6
96	2014-07-31 07:21:00.337193	2014-07-31 07:21:00.337193	Slide10.JPG	image/jpeg	115440	2014-07-31 07:20:59.908794	PM10	10
100	2014-07-31 07:21:53.941556	2014-07-31 07:21:53.941556	Slide14.JPG	image/jpeg	116436	2014-07-31 07:21:53.559585	PM14	14
94	2014-07-31 07:20:20.110701	2014-07-31 07:20:20.110701	Slide8.JPG	image/jpeg	76275	2014-07-31 07:20:19.664457	PM8	8
104	2014-07-31 07:24:08.610191	2014-07-31 07:24:08.610191	Slide4.JPG	image/jpeg	145335	2014-07-31 07:24:08.278987	RCR4	4
\.


--
-- Name: slides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('slides_id_seq', 104, true);


--
-- Data for Name: slots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY slots (id, channel_id, start_date, end_date, hour_id, tvr, created_at, updated_at, campaign_id) FROM stdin;
1447	1	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0	2014-08-31 11:43:15.411629	2014-08-31 11:43:15.411629	5
1448	1	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:15.423179	2014-08-31 11:43:15.423179	5
1449	1	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:15.434264	2014-08-31 11:43:15.434264	5
1450	1	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:15.448292	2014-08-31 11:43:15.448292	5
1451	1	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:15.459133	2014-08-31 11:43:15.459133	5
1452	1	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0	2014-08-31 11:43:15.471137	2014-08-31 11:43:15.471137	5
1453	1	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0	2014-08-31 11:43:15.481844	2014-08-31 11:43:15.481844	5
1454	1	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0	2014-08-31 11:43:15.493677	2014-08-31 11:43:15.493677	5
1455	1	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0.0100000000000000002	2014-08-31 11:43:15.504202	2014-08-31 11:43:15.504202	5
1456	1	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0.0100000000000000002	2014-08-31 11:43:15.514639	2014-08-31 11:43:15.514639	5
1457	1	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0	2014-08-31 11:43:15.630028	2014-08-31 11:43:15.630028	5
1458	1	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0	2014-08-31 11:43:15.642599	2014-08-31 11:43:15.642599	5
1459	1	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0.0100000000000000002	2014-08-31 11:43:15.653674	2014-08-31 11:43:15.653674	5
1460	1	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0.0100000000000000002	2014-08-31 11:43:15.664828	2014-08-31 11:43:15.664828	5
1461	1	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0.0100000000000000002	2014-08-31 11:43:15.678648	2014-08-31 11:43:15.678648	5
1462	1	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0.0100000000000000002	2014-08-31 11:43:15.690839	2014-08-31 11:43:15.690839	5
1463	1	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0	2014-08-31 11:43:15.701671	2014-08-31 11:43:15.701671	5
1464	1	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0.0100000000000000002	2014-08-31 11:43:15.71471	2014-08-31 11:43:15.71471	5
1465	1	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0.0200000000000000004	2014-08-31 11:43:15.73367	2014-08-31 11:43:15.73367	5
1466	1	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0.0299999999999999989	2014-08-31 11:43:15.744575	2014-08-31 11:43:15.744575	5
1467	1	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0.0100000000000000002	2014-08-31 11:43:15.755563	2014-08-31 11:43:15.755563	5
1468	1	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0	2014-08-31 11:43:15.7659	2014-08-31 11:43:15.7659	5
1469	1	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0.0100000000000000002	2014-08-31 11:43:15.776483	2014-08-31 11:43:15.776483	5
1470	1	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0	2014-08-31 11:43:15.786699	2014-08-31 11:43:15.786699	5
1471	2	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0	2014-08-31 11:43:15.797731	2014-08-31 11:43:15.797731	5
1472	2	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:15.810746	2014-08-31 11:43:15.810746	5
1473	2	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:15.826658	2014-08-31 11:43:15.826658	5
1474	2	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:15.838847	2014-08-31 11:43:15.838847	5
1475	2	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:15.850604	2014-08-31 11:43:15.850604	5
1476	2	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0	2014-08-31 11:43:15.861692	2014-08-31 11:43:15.861692	5
1477	2	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0	2014-08-31 11:43:15.872787	2014-08-31 11:43:15.872787	5
1478	2	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0.0100000000000000002	2014-08-31 11:43:15.885455	2014-08-31 11:43:15.885455	5
1479	2	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0.0100000000000000002	2014-08-31 11:43:15.898006	2014-08-31 11:43:15.898006	5
1480	2	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0	2014-08-31 11:43:15.908764	2014-08-31 11:43:15.908764	5
1481	2	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0	2014-08-31 11:43:15.924868	2014-08-31 11:43:15.924868	5
1482	2	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0.0100000000000000002	2014-08-31 11:43:15.936035	2014-08-31 11:43:15.936035	5
1483	2	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0.0100000000000000002	2014-08-31 11:43:16.073816	2014-08-31 11:43:16.073816	5
1484	2	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0.0100000000000000002	2014-08-31 11:43:16.087978	2014-08-31 11:43:16.087978	5
1485	2	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0	2014-08-31 11:43:16.100151	2014-08-31 11:43:16.100151	5
1486	2	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0	2014-08-31 11:43:16.112697	2014-08-31 11:43:16.112697	5
1487	2	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0	2014-08-31 11:43:16.132751	2014-08-31 11:43:16.132751	5
1488	2	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0	2014-08-31 11:43:16.144512	2014-08-31 11:43:16.144512	5
1489	2	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0	2014-08-31 11:43:16.155993	2014-08-31 11:43:16.155993	5
1490	2	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0	2014-08-31 11:43:16.166279	2014-08-31 11:43:16.166279	5
1491	2	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0	2014-08-31 11:43:16.176743	2014-08-31 11:43:16.176743	5
1492	2	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0	2014-08-31 11:43:16.18743	2014-08-31 11:43:16.18743	5
1493	2	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0	2014-08-31 11:43:16.197766	2014-08-31 11:43:16.197766	5
1494	2	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0	2014-08-31 11:43:16.208059	2014-08-31 11:43:16.208059	5
1495	3	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0	2014-08-31 11:43:16.226832	2014-08-31 11:43:16.226832	5
1496	3	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:16.23748	2014-08-31 11:43:16.23748	5
1497	3	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:16.247568	2014-08-31 11:43:16.247568	5
1498	3	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:16.257612	2014-08-31 11:43:16.257612	5
1499	3	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:16.267529	2014-08-31 11:43:16.267529	5
1500	3	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0	2014-08-31 11:43:16.277473	2014-08-31 11:43:16.277473	5
1501	3	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0.0100000000000000002	2014-08-31 11:43:16.288309	2014-08-31 11:43:16.288309	5
1502	3	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0.0100000000000000002	2014-08-31 11:43:16.298415	2014-08-31 11:43:16.298415	5
1503	3	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0.0100000000000000002	2014-08-31 11:43:16.308461	2014-08-31 11:43:16.308461	5
1504	3	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0.0100000000000000002	2014-08-31 11:43:16.318537	2014-08-31 11:43:16.318537	5
1505	3	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0.0100000000000000002	2014-08-31 11:43:16.333122	2014-08-31 11:43:16.333122	5
1506	3	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0.0100000000000000002	2014-08-31 11:43:16.343211	2014-08-31 11:43:16.343211	5
1507	3	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0.0200000000000000004	2014-08-31 11:43:16.353286	2014-08-31 11:43:16.353286	5
1508	3	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0.0100000000000000002	2014-08-31 11:43:16.363303	2014-08-31 11:43:16.363303	5
1509	3	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0.0100000000000000002	2014-08-31 11:43:16.373288	2014-08-31 11:43:16.373288	5
1510	3	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0.0200000000000000004	2014-08-31 11:43:16.475158	2014-08-31 11:43:16.475158	5
1511	3	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0.0200000000000000004	2014-08-31 11:43:16.487437	2014-08-31 11:43:16.487437	5
1512	3	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0.0200000000000000004	2014-08-31 11:43:16.498541	2014-08-31 11:43:16.498541	5
1513	3	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0.0299999999999999989	2014-08-31 11:43:16.50961	2014-08-31 11:43:16.50961	5
1514	3	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0.0299999999999999989	2014-08-31 11:43:16.525196	2014-08-31 11:43:16.525196	5
1515	3	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0.0200000000000000004	2014-08-31 11:43:16.536946	2014-08-31 11:43:16.536946	5
1516	3	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0.0100000000000000002	2014-08-31 11:43:16.548465	2014-08-31 11:43:16.548465	5
1517	3	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0	2014-08-31 11:43:16.559894	2014-08-31 11:43:16.559894	5
1518	3	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0	2014-08-31 11:43:16.570949	2014-08-31 11:43:16.570949	5
1519	4	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0	2014-08-31 11:43:16.581328	2014-08-31 11:43:16.581328	5
1520	4	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:16.591502	2014-08-31 11:43:16.591502	5
1521	4	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:16.601751	2014-08-31 11:43:16.601751	5
1522	4	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:16.61209	2014-08-31 11:43:16.61209	5
1523	4	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:16.630526	2014-08-31 11:43:16.630526	5
1524	4	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0	2014-08-31 11:43:16.641281	2014-08-31 11:43:16.641281	5
1525	4	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0.0200000000000000004	2014-08-31 11:43:16.653497	2014-08-31 11:43:16.653497	5
1526	4	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0.0299999999999999989	2014-08-31 11:43:16.664502	2014-08-31 11:43:16.664502	5
1527	4	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0.0500000000000000028	2014-08-31 11:43:16.674773	2014-08-31 11:43:16.674773	5
1528	4	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0.0400000000000000008	2014-08-31 11:43:16.685679	2014-08-31 11:43:16.685679	5
1529	4	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0.0599999999999999978	2014-08-31 11:43:16.696238	2014-08-31 11:43:16.696238	5
1530	4	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0.0500000000000000028	2014-08-31 11:43:16.706511	2014-08-31 11:43:16.706511	5
1531	4	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0.100000000000000006	2014-08-31 11:43:16.717205	2014-08-31 11:43:16.717205	5
1532	4	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0.0800000000000000017	2014-08-31 11:43:16.731762	2014-08-31 11:43:16.731762	5
1533	4	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0.0899999999999999967	2014-08-31 11:43:16.742213	2014-08-31 11:43:16.742213	5
1534	4	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0.0500000000000000028	2014-08-31 11:43:16.752354	2014-08-31 11:43:16.752354	5
1535	4	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0.0599999999999999978	2014-08-31 11:43:16.762415	2014-08-31 11:43:16.762415	5
1536	4	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0.0899999999999999967	2014-08-31 11:43:16.865233	2014-08-31 11:43:16.865233	5
1537	4	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0.0800000000000000017	2014-08-31 11:43:16.87814	2014-08-31 11:43:16.87814	5
1538	4	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0.0800000000000000017	2014-08-31 11:43:16.889166	2014-08-31 11:43:16.889166	5
1539	4	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0.0700000000000000067	2014-08-31 11:43:16.900067	2014-08-31 11:43:16.900067	5
1540	4	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0.100000000000000006	2014-08-31 11:43:16.911095	2014-08-31 11:43:16.911095	5
1541	4	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0.0500000000000000028	2014-08-31 11:43:16.9329	2014-08-31 11:43:16.9329	5
1542	4	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0	2014-08-31 11:43:16.943966	2014-08-31 11:43:16.943966	5
1543	5	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0	2014-08-31 11:43:16.95474	2014-08-31 11:43:16.95474	5
1544	5	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:16.965373	2014-08-31 11:43:16.965373	5
1545	5	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:16.976144	2014-08-31 11:43:16.976144	5
1546	5	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:16.987807	2014-08-31 11:43:16.987807	5
1547	5	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:16.998332	2014-08-31 11:43:16.998332	5
1548	5	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0	2014-08-31 11:43:17.008784	2014-08-31 11:43:17.008784	5
1549	5	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0.0100000000000000002	2014-08-31 11:43:17.023243	2014-08-31 11:43:17.023243	5
1550	5	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0.0100000000000000002	2014-08-31 11:43:17.033575	2014-08-31 11:43:17.033575	5
1551	5	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0	2014-08-31 11:43:17.043632	2014-08-31 11:43:17.043632	5
1552	5	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0.0100000000000000002	2014-08-31 11:43:17.053765	2014-08-31 11:43:17.053765	5
1553	5	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0	2014-08-31 11:43:17.06388	2014-08-31 11:43:17.06388	5
1554	5	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0.0100000000000000002	2014-08-31 11:43:17.074134	2014-08-31 11:43:17.074134	5
1555	5	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0.0100000000000000002	2014-08-31 11:43:17.084469	2014-08-31 11:43:17.084469	5
1556	5	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0.0100000000000000002	2014-08-31 11:43:17.094543	2014-08-31 11:43:17.094543	5
1557	5	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0.0100000000000000002	2014-08-31 11:43:17.105003	2014-08-31 11:43:17.105003	5
1558	5	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0.0100000000000000002	2014-08-31 11:43:17.115186	2014-08-31 11:43:17.115186	5
1559	5	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0.0100000000000000002	2014-08-31 11:43:17.131644	2014-08-31 11:43:17.131644	5
1560	5	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0.0100000000000000002	2014-08-31 11:43:17.142928	2014-08-31 11:43:17.142928	5
1561	5	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0.0200000000000000004	2014-08-31 11:43:17.152918	2014-08-31 11:43:17.152918	5
1562	5	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0.0100000000000000002	2014-08-31 11:43:17.162764	2014-08-31 11:43:17.162764	5
1563	5	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0.0100000000000000002	2014-08-31 11:43:17.345792	2014-08-31 11:43:17.345792	5
1564	5	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0.0200000000000000004	2014-08-31 11:43:17.366034	2014-08-31 11:43:17.366034	5
1565	5	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0.0100000000000000002	2014-08-31 11:43:17.394444	2014-08-31 11:43:17.394444	5
1566	5	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0	2014-08-31 11:43:17.487963	2014-08-31 11:43:17.487963	5
1567	6	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0	2014-08-31 11:43:17.505877	2014-08-31 11:43:17.505877	5
1568	6	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:17.600549	2014-08-31 11:43:17.600549	5
1569	6	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:17.622601	2014-08-31 11:43:17.622601	5
1570	6	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:17.642792	2014-08-31 11:43:17.642792	5
1571	6	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:17.663444	2014-08-31 11:43:17.663444	5
1572	6	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0	2014-08-31 11:43:17.683517	2014-08-31 11:43:17.683517	5
1573	6	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0	2014-08-31 11:43:17.702427	2014-08-31 11:43:17.702427	5
1574	6	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0.0100000000000000002	2014-08-31 11:43:17.724657	2014-08-31 11:43:17.724657	5
1575	6	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0.0100000000000000002	2014-08-31 11:43:17.739267	2014-08-31 11:43:17.739267	5
1576	6	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0.0200000000000000004	2014-08-31 11:43:17.795853	2014-08-31 11:43:17.795853	5
1577	6	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0.0200000000000000004	2014-08-31 11:43:17.823462	2014-08-31 11:43:17.823462	5
1578	6	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0.0100000000000000002	2014-08-31 11:43:17.839567	2014-08-31 11:43:17.839567	5
1579	6	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0.0200000000000000004	2014-08-31 11:43:17.883862	2014-08-31 11:43:17.883862	5
1580	6	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0.0200000000000000004	2014-08-31 11:43:17.910539	2014-08-31 11:43:17.910539	5
1581	6	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0.0400000000000000008	2014-08-31 11:43:17.94185	2014-08-31 11:43:17.94185	5
1582	6	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0.0200000000000000004	2014-08-31 11:43:17.961718	2014-08-31 11:43:17.961718	5
1583	6	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0.0299999999999999989	2014-08-31 11:43:17.982624	2014-08-31 11:43:17.982624	5
1584	6	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0.0299999999999999989	2014-08-31 11:43:18.004264	2014-08-31 11:43:18.004264	5
1585	6	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0.0299999999999999989	2014-08-31 11:43:18.036903	2014-08-31 11:43:18.036903	5
1586	6	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0.0200000000000000004	2014-08-31 11:43:18.05911	2014-08-31 11:43:18.05911	5
1587	6	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0.0200000000000000004	2014-08-31 11:43:18.078972	2014-08-31 11:43:18.078972	5
1588	6	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0.0299999999999999989	2014-08-31 11:43:18.101201	2014-08-31 11:43:18.101201	5
1589	6	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0.0100000000000000002	2014-08-31 11:43:18.305245	2014-08-31 11:43:18.305245	5
1590	6	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0	2014-08-31 11:43:18.344531	2014-08-31 11:43:18.344531	5
1591	7	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0	2014-08-31 11:43:18.3626	2014-08-31 11:43:18.3626	5
1592	7	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:18.384331	2014-08-31 11:43:18.384331	5
1593	7	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:18.406015	2014-08-31 11:43:18.406015	5
1594	7	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:18.436347	2014-08-31 11:43:18.436347	5
1595	7	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:18.458479	2014-08-31 11:43:18.458479	5
1596	7	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0.0100000000000000002	2014-08-31 11:43:18.47476	2014-08-31 11:43:18.47476	5
1597	7	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0.0200000000000000004	2014-08-31 11:43:18.487263	2014-08-31 11:43:18.487263	5
1598	7	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0.0200000000000000004	2014-08-31 11:43:18.49822	2014-08-31 11:43:18.49822	5
1599	7	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0.0400000000000000008	2014-08-31 11:43:18.528572	2014-08-31 11:43:18.528572	5
1600	7	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0.0299999999999999989	2014-08-31 11:43:18.548547	2014-08-31 11:43:18.548547	5
1601	7	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0.0200000000000000004	2014-08-31 11:43:18.565904	2014-08-31 11:43:18.565904	5
1602	7	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0.0400000000000000008	2014-08-31 11:43:18.589436	2014-08-31 11:43:18.589436	5
1603	7	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0.0299999999999999989	2014-08-31 11:43:18.607544	2014-08-31 11:43:18.607544	5
1604	7	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0.0200000000000000004	2014-08-31 11:43:18.629543	2014-08-31 11:43:18.629543	5
1605	7	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0.0200000000000000004	2014-08-31 11:43:18.649874	2014-08-31 11:43:18.649874	5
1606	7	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0.0200000000000000004	2014-08-31 11:43:18.66959	2014-08-31 11:43:18.66959	5
1607	7	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0.0200000000000000004	2014-08-31 11:43:18.688198	2014-08-31 11:43:18.688198	5
1608	7	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0.0400000000000000008	2014-08-31 11:43:18.710223	2014-08-31 11:43:18.710223	5
1609	7	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0.0700000000000000067	2014-08-31 11:43:18.738562	2014-08-31 11:43:18.738562	5
1610	7	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0.0500000000000000028	2014-08-31 11:43:18.763048	2014-08-31 11:43:18.763048	5
1611	7	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0.0700000000000000067	2014-08-31 11:43:18.783956	2014-08-31 11:43:18.783956	5
1612	7	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0.0500000000000000028	2014-08-31 11:43:18.802429	2014-08-31 11:43:18.802429	5
1613	7	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0.0299999999999999989	2014-08-31 11:43:18.82573	2014-08-31 11:43:18.82573	5
1614	7	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0.0200000000000000004	2014-08-31 11:43:18.845702	2014-08-31 11:43:18.845702	5
1615	8	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0	2014-08-31 11:43:18.868544	2014-08-31 11:43:18.868544	5
1616	8	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:19.090849	2014-08-31 11:43:19.090849	5
1617	8	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:19.117542	2014-08-31 11:43:19.117542	5
1618	8	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:19.143088	2014-08-31 11:43:19.143088	5
1619	8	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:19.165571	2014-08-31 11:43:19.165571	5
1620	8	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0	2014-08-31 11:43:19.19172	2014-08-31 11:43:19.19172	5
1621	8	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0.0100000000000000002	2014-08-31 11:43:19.232664	2014-08-31 11:43:19.232664	5
1622	8	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0.0100000000000000002	2014-08-31 11:43:19.254775	2014-08-31 11:43:19.254775	5
1623	8	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0.0200000000000000004	2014-08-31 11:43:19.284637	2014-08-31 11:43:19.284637	5
1624	8	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0.0299999999999999989	2014-08-31 11:43:19.30761	2014-08-31 11:43:19.30761	5
1625	8	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0.0299999999999999989	2014-08-31 11:43:19.340599	2014-08-31 11:43:19.340599	5
1626	8	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0.0400000000000000008	2014-08-31 11:43:19.36594	2014-08-31 11:43:19.36594	5
1627	8	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0.0400000000000000008	2014-08-31 11:43:19.389293	2014-08-31 11:43:19.389293	5
1628	8	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0.0500000000000000028	2014-08-31 11:43:19.412528	2014-08-31 11:43:19.412528	5
1629	8	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0.0599999999999999978	2014-08-31 11:43:19.444613	2014-08-31 11:43:19.444613	5
1630	8	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0.0400000000000000008	2014-08-31 11:43:19.460487	2014-08-31 11:43:19.460487	5
1631	8	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0.0599999999999999978	2014-08-31 11:43:19.480532	2014-08-31 11:43:19.480532	5
1632	8	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0.0500000000000000028	2014-08-31 11:43:19.505205	2014-08-31 11:43:19.505205	5
1633	8	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0.0299999999999999989	2014-08-31 11:43:19.536541	2014-08-31 11:43:19.536541	5
1634	8	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0.0599999999999999978	2014-08-31 11:43:19.554733	2014-08-31 11:43:19.554733	5
1635	8	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0.0700000000000000067	2014-08-31 11:43:19.578418	2014-08-31 11:43:19.578418	5
1636	8	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0.0599999999999999978	2014-08-31 11:43:19.595693	2014-08-31 11:43:19.595693	5
1637	8	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0.0500000000000000028	2014-08-31 11:43:19.614843	2014-08-31 11:43:19.614843	5
1638	8	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0.0100000000000000002	2014-08-31 11:43:19.649315	2014-08-31 11:43:19.649315	5
1639	9	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0	2014-08-31 11:43:19.671843	2014-08-31 11:43:19.671843	5
1640	9	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:19.689604	2014-08-31 11:43:19.689604	5
1641	9	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:19.723423	2014-08-31 11:43:19.723423	5
1642	9	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:19.936782	2014-08-31 11:43:19.936782	5
1643	9	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:19.962568	2014-08-31 11:43:19.962568	5
1644	9	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0	2014-08-31 11:43:19.983949	2014-08-31 11:43:19.983949	5
1645	9	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0.0200000000000000004	2014-08-31 11:43:20.012673	2014-08-31 11:43:20.012673	5
1646	9	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0.0100000000000000002	2014-08-31 11:43:20.044727	2014-08-31 11:43:20.044727	5
1647	9	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0.0200000000000000004	2014-08-31 11:43:20.062799	2014-08-31 11:43:20.062799	5
1648	9	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0.0299999999999999989	2014-08-31 11:43:20.086654	2014-08-31 11:43:20.086654	5
1649	9	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0.0299999999999999989	2014-08-31 11:43:20.106436	2014-08-31 11:43:20.106436	5
1650	9	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0.0299999999999999989	2014-08-31 11:43:20.145863	2014-08-31 11:43:20.145863	5
1651	9	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0.0400000000000000008	2014-08-31 11:43:20.1676	2014-08-31 11:43:20.1676	5
1652	9	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0.0200000000000000004	2014-08-31 11:43:20.190781	2014-08-31 11:43:20.190781	5
1653	9	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0.0200000000000000004	2014-08-31 11:43:20.212442	2014-08-31 11:43:20.212442	5
1654	9	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0.0200000000000000004	2014-08-31 11:43:20.230235	2014-08-31 11:43:20.230235	5
1655	9	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0.0200000000000000004	2014-08-31 11:43:20.25037	2014-08-31 11:43:20.25037	5
1656	9	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0.0200000000000000004	2014-08-31 11:43:20.270714	2014-08-31 11:43:20.270714	5
1657	9	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0.0299999999999999989	2014-08-31 11:43:20.292216	2014-08-31 11:43:20.292216	5
1658	9	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0.0400000000000000008	2014-08-31 11:43:20.310361	2014-08-31 11:43:20.310361	5
1659	9	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0.0500000000000000028	2014-08-31 11:43:20.333883	2014-08-31 11:43:20.333883	5
1660	9	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0.0400000000000000008	2014-08-31 11:43:20.354553	2014-08-31 11:43:20.354553	5
1661	9	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0.0299999999999999989	2014-08-31 11:43:20.374544	2014-08-31 11:43:20.374544	5
1662	9	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0.0200000000000000004	2014-08-31 11:43:20.396446	2014-08-31 11:43:20.396446	5
1663	10	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0.0100000000000000002	2014-08-31 11:43:20.443599	2014-08-31 11:43:20.443599	5
1664	10	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:20.465767	2014-08-31 11:43:20.465767	5
1665	10	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:20.485694	2014-08-31 11:43:20.485694	5
1666	10	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:20.506105	2014-08-31 11:43:20.506105	5
1667	10	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:20.525446	2014-08-31 11:43:20.525446	5
1668	10	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0.0200000000000000004	2014-08-31 11:43:20.546945	2014-08-31 11:43:20.546945	5
1669	10	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0.0200000000000000004	2014-08-31 11:43:20.795509	2014-08-31 11:43:20.795509	5
1670	10	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0.0400000000000000008	2014-08-31 11:43:20.823372	2014-08-31 11:43:20.823372	5
1671	10	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0.0299999999999999989	2014-08-31 11:43:20.844578	2014-08-31 11:43:20.844578	5
1672	10	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0.0400000000000000008	2014-08-31 11:43:20.866659	2014-08-31 11:43:20.866659	5
1673	10	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0.0299999999999999989	2014-08-31 11:43:20.892616	2014-08-31 11:43:20.892616	5
1674	10	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0.0400000000000000008	2014-08-31 11:43:20.910068	2014-08-31 11:43:20.910068	5
1675	10	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0.0599999999999999978	2014-08-31 11:43:20.96049	2014-08-31 11:43:20.96049	5
1676	10	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0.0700000000000000067	2014-08-31 11:43:20.983947	2014-08-31 11:43:20.983947	5
1677	10	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0.0700000000000000067	2014-08-31 11:43:21.00848	2014-08-31 11:43:21.00848	5
1678	10	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0.0500000000000000028	2014-08-31 11:43:21.040605	2014-08-31 11:43:21.040605	5
1679	10	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0.0599999999999999978	2014-08-31 11:43:21.070511	2014-08-31 11:43:21.070511	5
1680	10	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0.100000000000000006	2014-08-31 11:43:21.094929	2014-08-31 11:43:21.094929	5
1681	10	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0.0599999999999999978	2014-08-31 11:43:21.132635	2014-08-31 11:43:21.132635	5
1682	10	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0.0599999999999999978	2014-08-31 11:43:21.154575	2014-08-31 11:43:21.154575	5
1683	10	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0.0899999999999999967	2014-08-31 11:43:21.178057	2014-08-31 11:43:21.178057	5
1684	10	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0.0700000000000000067	2014-08-31 11:43:21.198906	2014-08-31 11:43:21.198906	5
1685	10	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0.0500000000000000028	2014-08-31 11:43:21.218171	2014-08-31 11:43:21.218171	5
1686	10	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0.0100000000000000002	2014-08-31 11:43:21.24648	2014-08-31 11:43:21.24648	5
1687	11	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0	2014-08-31 11:43:21.269294	2014-08-31 11:43:21.269294	5
1688	11	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:21.290466	2014-08-31 11:43:21.290466	5
1689	11	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:21.310258	2014-08-31 11:43:21.310258	5
1690	11	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:21.340555	2014-08-31 11:43:21.340555	5
1691	11	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:21.358705	2014-08-31 11:43:21.358705	5
1692	11	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0	2014-08-31 11:43:21.384683	2014-08-31 11:43:21.384683	5
1693	11	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0.0100000000000000002	2014-08-31 11:43:21.402598	2014-08-31 11:43:21.402598	5
1694	11	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0.0100000000000000002	2014-08-31 11:43:21.44056	2014-08-31 11:43:21.44056	5
1695	11	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0.0200000000000000004	2014-08-31 11:43:21.670869	2014-08-31 11:43:21.670869	5
1696	11	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0.0100000000000000002	2014-08-31 11:43:21.696935	2014-08-31 11:43:21.696935	5
1697	11	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0.0100000000000000002	2014-08-31 11:43:21.725688	2014-08-31 11:43:21.725688	5
1698	11	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0.0100000000000000002	2014-08-31 11:43:21.752568	2014-08-31 11:43:21.752568	5
1699	11	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0.0100000000000000002	2014-08-31 11:43:21.772488	2014-08-31 11:43:21.772488	5
1700	11	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0.0100000000000000002	2014-08-31 11:43:21.794419	2014-08-31 11:43:21.794419	5
1701	11	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0.0100000000000000002	2014-08-31 11:43:21.814466	2014-08-31 11:43:21.814466	5
1702	11	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0.0100000000000000002	2014-08-31 11:43:21.855314	2014-08-31 11:43:21.855314	5
1703	11	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0.0100000000000000002	2014-08-31 11:43:21.886349	2014-08-31 11:43:21.886349	5
1704	11	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0.0200000000000000004	2014-08-31 11:43:21.940661	2014-08-31 11:43:21.940661	5
1705	11	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0.0200000000000000004	2014-08-31 11:43:21.964308	2014-08-31 11:43:21.964308	5
1706	11	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0.0299999999999999989	2014-08-31 11:43:21.983804	2014-08-31 11:43:21.983804	5
1707	11	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0.0299999999999999989	2014-08-31 11:43:22.004028	2014-08-31 11:43:22.004028	5
1708	11	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0.0100000000000000002	2014-08-31 11:43:22.026959	2014-08-31 11:43:22.026959	5
1709	11	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0	2014-08-31 11:43:22.043773	2014-08-31 11:43:22.043773	5
1710	11	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0	2014-08-31 11:43:22.06458	2014-08-31 11:43:22.06458	5
1711	12	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0	2014-08-31 11:43:22.084773	2014-08-31 11:43:22.084773	5
1712	12	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:22.106324	2014-08-31 11:43:22.106324	5
1713	12	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:22.125565	2014-08-31 11:43:22.125565	5
1714	12	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:22.145295	2014-08-31 11:43:22.145295	5
1715	12	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:22.172828	2014-08-31 11:43:22.172828	5
1716	12	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0	2014-08-31 11:43:22.195783	2014-08-31 11:43:22.195783	5
1717	12	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0	2014-08-31 11:43:22.214556	2014-08-31 11:43:22.214556	5
1718	12	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0	2014-08-31 11:43:22.239037	2014-08-31 11:43:22.239037	5
1719	12	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0	2014-08-31 11:43:22.264606	2014-08-31 11:43:22.264606	5
1720	12	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0.0100000000000000002	2014-08-31 11:43:22.282362	2014-08-31 11:43:22.282362	5
1721	12	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0	2014-08-31 11:43:22.30444	2014-08-31 11:43:22.30444	5
1722	12	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0.0100000000000000002	2014-08-31 11:43:22.524597	2014-08-31 11:43:22.524597	5
1723	12	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0	2014-08-31 11:43:22.542708	2014-08-31 11:43:22.542708	5
1724	12	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0	2014-08-31 11:43:22.565438	2014-08-31 11:43:22.565438	5
1725	12	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0	2014-08-31 11:43:22.586799	2014-08-31 11:43:22.586799	5
1726	12	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0	2014-08-31 11:43:22.607794	2014-08-31 11:43:22.607794	5
1727	12	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0.0100000000000000002	2014-08-31 11:43:22.639233	2014-08-31 11:43:22.639233	5
1728	12	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0	2014-08-31 11:43:22.662739	2014-08-31 11:43:22.662739	5
1729	12	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0	2014-08-31 11:43:22.686312	2014-08-31 11:43:22.686312	5
1730	12	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0.0100000000000000002	2014-08-31 11:43:22.708508	2014-08-31 11:43:22.708508	5
1731	12	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0	2014-08-31 11:43:22.740574	2014-08-31 11:43:22.740574	5
1732	12	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0.0100000000000000002	2014-08-31 11:43:22.760549	2014-08-31 11:43:22.760549	5
1733	12	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0	2014-08-31 11:43:22.788563	2014-08-31 11:43:22.788563	5
1734	12	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0	2014-08-31 11:43:22.812546	2014-08-31 11:43:22.812546	5
1735	13	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0	2014-08-31 11:43:22.837817	2014-08-31 11:43:22.837817	5
1736	13	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:22.86168	2014-08-31 11:43:22.86168	5
1737	13	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:22.884524	2014-08-31 11:43:22.884524	5
1738	13	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:22.901912	2014-08-31 11:43:22.901912	5
1739	13	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:22.929141	2014-08-31 11:43:22.929141	5
1740	13	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0.0100000000000000002	2014-08-31 11:43:22.945748	2014-08-31 11:43:22.945748	5
1741	13	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0.0100000000000000002	2014-08-31 11:43:22.972553	2014-08-31 11:43:22.972553	5
1742	13	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0.0299999999999999989	2014-08-31 11:43:22.990445	2014-08-31 11:43:22.990445	5
1743	13	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0.0599999999999999978	2014-08-31 11:43:23.014203	2014-08-31 11:43:23.014203	5
1744	13	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0.0500000000000000028	2014-08-31 11:43:23.048532	2014-08-31 11:43:23.048532	5
1745	13	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0.0400000000000000008	2014-08-31 11:43:23.072527	2014-08-31 11:43:23.072527	5
1746	13	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0.0500000000000000028	2014-08-31 11:43:23.095066	2014-08-31 11:43:23.095066	5
1747	13	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0.0599999999999999978	2014-08-31 11:43:23.123127	2014-08-31 11:43:23.123127	5
1748	13	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0.0500000000000000028	2014-08-31 11:43:23.342932	2014-08-31 11:43:23.342932	5
1749	13	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0.0500000000000000028	2014-08-31 11:43:23.372519	2014-08-31 11:43:23.372519	5
1750	13	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0.0500000000000000028	2014-08-31 11:43:23.396529	2014-08-31 11:43:23.396529	5
1751	13	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0.0599999999999999978	2014-08-31 11:43:23.423469	2014-08-31 11:43:23.423469	5
1752	13	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0.0599999999999999978	2014-08-31 11:43:23.442806	2014-08-31 11:43:23.442806	5
1753	13	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0.0700000000000000067	2014-08-31 11:43:23.463762	2014-08-31 11:43:23.463762	5
1754	13	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0.0599999999999999978	2014-08-31 11:43:23.482382	2014-08-31 11:43:23.482382	5
1755	13	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0.0700000000000000067	2014-08-31 11:43:23.504209	2014-08-31 11:43:23.504209	5
1756	13	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0.0899999999999999967	2014-08-31 11:43:23.528198	2014-08-31 11:43:23.528198	5
1757	13	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0.0700000000000000067	2014-08-31 11:43:23.545784	2014-08-31 11:43:23.545784	5
1758	13	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0.0200000000000000004	2014-08-31 11:43:23.566716	2014-08-31 11:43:23.566716	5
1759	14	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0	2014-08-31 11:43:23.592639	2014-08-31 11:43:23.592639	5
1760	14	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:23.612501	2014-08-31 11:43:23.612501	5
1761	14	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:23.63054	2014-08-31 11:43:23.63054	5
1762	14	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:23.654477	2014-08-31 11:43:23.654477	5
1763	14	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:23.67453	2014-08-31 11:43:23.67453	5
1764	14	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0	2014-08-31 11:43:23.690493	2014-08-31 11:43:23.690493	5
1765	14	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0.0100000000000000002	2014-08-31 11:43:23.723468	2014-08-31 11:43:23.723468	5
1766	14	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0.0100000000000000002	2014-08-31 11:43:23.740527	2014-08-31 11:43:23.740527	5
1767	14	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0.0100000000000000002	2014-08-31 11:43:23.762718	2014-08-31 11:43:23.762718	5
1768	14	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0.0100000000000000002	2014-08-31 11:43:23.794079	2014-08-31 11:43:23.794079	5
1769	14	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0	2014-08-31 11:43:23.825518	2014-08-31 11:43:23.825518	5
1770	14	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0	2014-08-31 11:43:23.844262	2014-08-31 11:43:23.844262	5
1771	14	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0	2014-08-31 11:43:23.862896	2014-08-31 11:43:23.862896	5
1772	14	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0.0100000000000000002	2014-08-31 11:43:23.885865	2014-08-31 11:43:23.885865	5
1773	14	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0.0100000000000000002	2014-08-31 11:43:23.908551	2014-08-31 11:43:23.908551	5
1774	14	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0	2014-08-31 11:43:23.928862	2014-08-31 11:43:23.928862	5
1775	14	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0	2014-08-31 11:43:24.155222	2014-08-31 11:43:24.155222	5
1776	14	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0.0200000000000000004	2014-08-31 11:43:24.183325	2014-08-31 11:43:24.183325	5
1777	14	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0.0200000000000000004	2014-08-31 11:43:24.202786	2014-08-31 11:43:24.202786	5
1778	14	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0.0299999999999999989	2014-08-31 11:43:24.228618	2014-08-31 11:43:24.228618	5
1779	14	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0.0100000000000000002	2014-08-31 11:43:24.246242	2014-08-31 11:43:24.246242	5
1780	14	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0.0100000000000000002	2014-08-31 11:43:24.272604	2014-08-31 11:43:24.272604	5
1781	14	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0	2014-08-31 11:43:24.293032	2014-08-31 11:43:24.293032	5
1782	14	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0	2014-08-31 11:43:24.31519	2014-08-31 11:43:24.31519	5
1783	15	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0	2014-08-31 11:43:24.346708	2014-08-31 11:43:24.346708	5
1784	15	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:24.366656	2014-08-31 11:43:24.366656	5
1785	15	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:24.398234	2014-08-31 11:43:24.398234	5
1786	15	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:24.449048	2014-08-31 11:43:24.449048	5
1787	15	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:24.496869	2014-08-31 11:43:24.496869	5
1788	15	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0.0100000000000000002	2014-08-31 11:43:24.533843	2014-08-31 11:43:24.533843	5
1789	15	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0	2014-08-31 11:43:24.572906	2014-08-31 11:43:24.572906	5
1790	15	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0	2014-08-31 11:43:24.612839	2014-08-31 11:43:24.612839	5
1791	15	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0	2014-08-31 11:43:24.655497	2014-08-31 11:43:24.655497	5
1792	15	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0.0100000000000000002	2014-08-31 11:43:24.695108	2014-08-31 11:43:24.695108	5
1793	15	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0.0100000000000000002	2014-08-31 11:43:24.744926	2014-08-31 11:43:24.744926	5
1794	15	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0.0200000000000000004	2014-08-31 11:43:24.784715	2014-08-31 11:43:24.784715	5
1795	15	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0.0100000000000000002	2014-08-31 11:43:24.827747	2014-08-31 11:43:24.827747	5
1796	15	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0.0200000000000000004	2014-08-31 11:43:24.86499	2014-08-31 11:43:24.86499	5
1797	15	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0.0100000000000000002	2014-08-31 11:43:24.901342	2014-08-31 11:43:24.901342	5
1798	15	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0.0100000000000000002	2014-08-31 11:43:24.94384	2014-08-31 11:43:24.94384	5
1799	15	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0.0100000000000000002	2014-08-31 11:43:24.981522	2014-08-31 11:43:24.981522	5
1800	15	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0.0299999999999999989	2014-08-31 11:43:25.011791	2014-08-31 11:43:25.011791	5
1801	15	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0.0100000000000000002	2014-08-31 11:43:25.335715	2014-08-31 11:43:25.335715	5
1802	15	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0.0100000000000000002	2014-08-31 11:43:25.376782	2014-08-31 11:43:25.376782	5
1803	15	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0.0100000000000000002	2014-08-31 11:43:25.409081	2014-08-31 11:43:25.409081	5
1804	15	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0.0299999999999999989	2014-08-31 11:43:25.452692	2014-08-31 11:43:25.452692	5
1805	15	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0.0200000000000000004	2014-08-31 11:43:25.476227	2014-08-31 11:43:25.476227	5
1806	15	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0.0100000000000000002	2014-08-31 11:43:25.508606	2014-08-31 11:43:25.508606	5
1807	16	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0	2014-08-31 11:43:25.531873	2014-08-31 11:43:25.531873	5
1808	16	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:25.560647	2014-08-31 11:43:25.560647	5
1809	16	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:25.587426	2014-08-31 11:43:25.587426	5
1810	16	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:25.615451	2014-08-31 11:43:25.615451	5
1811	16	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:25.644622	2014-08-31 11:43:25.644622	5
1812	16	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0	2014-08-31 11:43:25.66835	2014-08-31 11:43:25.66835	5
1813	16	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0.0100000000000000002	2014-08-31 11:43:25.696797	2014-08-31 11:43:25.696797	5
1814	16	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0.0299999999999999989	2014-08-31 11:43:25.735518	2014-08-31 11:43:25.735518	5
1815	16	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0.0200000000000000004	2014-08-31 11:43:25.764716	2014-08-31 11:43:25.764716	5
1816	16	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0.0299999999999999989	2014-08-31 11:43:25.792692	2014-08-31 11:43:25.792692	5
1817	16	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0.0200000000000000004	2014-08-31 11:43:25.832246	2014-08-31 11:43:25.832246	5
1818	16	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0.0200000000000000004	2014-08-31 11:43:25.856665	2014-08-31 11:43:25.856665	5
1819	16	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0.0299999999999999989	2014-08-31 11:43:25.882288	2014-08-31 11:43:25.882288	5
1820	16	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0.0200000000000000004	2014-08-31 11:43:25.905195	2014-08-31 11:43:25.905195	5
1821	16	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0.0200000000000000004	2014-08-31 11:43:25.948813	2014-08-31 11:43:25.948813	5
1822	16	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0.0200000000000000004	2014-08-31 11:43:25.972586	2014-08-31 11:43:25.972586	5
1823	16	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0.0200000000000000004	2014-08-31 11:43:25.994528	2014-08-31 11:43:25.994528	5
1824	16	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0.0200000000000000004	2014-08-31 11:43:26.030484	2014-08-31 11:43:26.030484	5
1825	16	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0.0200000000000000004	2014-08-31 11:43:26.064327	2014-08-31 11:43:26.064327	5
1826	16	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0.0899999999999999967	2014-08-31 11:43:26.098834	2014-08-31 11:43:26.098834	5
1827	16	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0.0599999999999999978	2014-08-31 11:43:26.132625	2014-08-31 11:43:26.132625	5
1828	16	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0.0100000000000000002	2014-08-31 11:43:26.393465	2014-08-31 11:43:26.393465	5
1829	16	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0	2014-08-31 11:43:26.418827	2014-08-31 11:43:26.418827	5
1830	16	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0	2014-08-31 11:43:26.447488	2014-08-31 11:43:26.447488	5
1831	17	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0	2014-08-31 11:43:26.472537	2014-08-31 11:43:26.472537	5
1832	17	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:26.489733	2014-08-31 11:43:26.489733	5
1833	17	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:26.514093	2014-08-31 11:43:26.514093	5
1834	17	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:26.552529	2014-08-31 11:43:26.552529	5
1835	17	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:26.569928	2014-08-31 11:43:26.569928	5
1836	17	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0.0100000000000000002	2014-08-31 11:43:26.591162	2014-08-31 11:43:26.591162	5
1837	17	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0.0200000000000000004	2014-08-31 11:43:26.636773	2014-08-31 11:43:26.636773	5
1838	17	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0.0299999999999999989	2014-08-31 11:43:26.654512	2014-08-31 11:43:26.654512	5
1839	17	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0.0400000000000000008	2014-08-31 11:43:26.674446	2014-08-31 11:43:26.674446	5
1840	17	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0.0400000000000000008	2014-08-31 11:43:26.700604	2014-08-31 11:43:26.700604	5
1841	17	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0.0200000000000000004	2014-08-31 11:43:26.734069	2014-08-31 11:43:26.734069	5
1842	17	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0.0200000000000000004	2014-08-31 11:43:26.754442	2014-08-31 11:43:26.754442	5
1843	17	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0.0299999999999999989	2014-08-31 11:43:26.780631	2014-08-31 11:43:26.780631	5
1844	17	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0.0599999999999999978	2014-08-31 11:43:26.797375	2014-08-31 11:43:26.797375	5
1845	17	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0.0500000000000000028	2014-08-31 11:43:26.825328	2014-08-31 11:43:26.825328	5
1846	17	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0.0400000000000000008	2014-08-31 11:43:26.848471	2014-08-31 11:43:26.848471	5
1847	17	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0.0299999999999999989	2014-08-31 11:43:26.865582	2014-08-31 11:43:26.865582	5
1848	17	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0.0400000000000000008	2014-08-31 11:43:26.886481	2014-08-31 11:43:26.886481	5
1849	17	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0.0400000000000000008	2014-08-31 11:43:26.906451	2014-08-31 11:43:26.906451	5
1850	17	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0.0500000000000000028	2014-08-31 11:43:26.934391	2014-08-31 11:43:26.934391	5
1851	17	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0.0400000000000000008	2014-08-31 11:43:26.954947	2014-08-31 11:43:26.954947	5
1852	17	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0.0400000000000000008	2014-08-31 11:43:26.965937	2014-08-31 11:43:26.965937	5
1853	17	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0.0200000000000000004	2014-08-31 11:43:26.976201	2014-08-31 11:43:26.976201	5
1854	17	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0.0100000000000000002	2014-08-31 11:43:27.093065	2014-08-31 11:43:27.093065	5
1855	18	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0	2014-08-31 11:43:27.106547	2014-08-31 11:43:27.106547	5
1856	18	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:27.117629	2014-08-31 11:43:27.117629	5
1857	18	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:27.133245	2014-08-31 11:43:27.133245	5
1858	18	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:27.144632	2014-08-31 11:43:27.144632	5
1859	18	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:27.155112	2014-08-31 11:43:27.155112	5
1860	18	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0	2014-08-31 11:43:27.166184	2014-08-31 11:43:27.166184	5
1861	18	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0	2014-08-31 11:43:27.176991	2014-08-31 11:43:27.176991	5
1862	18	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0	2014-08-31 11:43:27.187728	2014-08-31 11:43:27.187728	5
1863	18	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0.0100000000000000002	2014-08-31 11:43:27.198398	2014-08-31 11:43:27.198398	5
1864	18	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0.0100000000000000002	2014-08-31 11:43:27.209266	2014-08-31 11:43:27.209266	5
1865	18	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0	2014-08-31 11:43:27.227905	2014-08-31 11:43:27.227905	5
1866	18	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0	2014-08-31 11:43:27.240073	2014-08-31 11:43:27.240073	5
1867	18	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0	2014-08-31 11:43:27.251798	2014-08-31 11:43:27.251798	5
1868	18	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0	2014-08-31 11:43:27.263223	2014-08-31 11:43:27.263223	5
1869	18	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0	2014-08-31 11:43:27.274739	2014-08-31 11:43:27.274739	5
1870	18	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0	2014-08-31 11:43:27.285162	2014-08-31 11:43:27.285162	5
1871	18	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0	2014-08-31 11:43:27.295246	2014-08-31 11:43:27.295246	5
1872	18	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0	2014-08-31 11:43:27.305407	2014-08-31 11:43:27.305407	5
1873	18	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0.0100000000000000002	2014-08-31 11:43:27.323521	2014-08-31 11:43:27.323521	5
1874	18	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0.0100000000000000002	2014-08-31 11:43:27.333801	2014-08-31 11:43:27.333801	5
1875	18	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0.0100000000000000002	2014-08-31 11:43:27.344861	2014-08-31 11:43:27.344861	5
1876	18	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0.0100000000000000002	2014-08-31 11:43:27.355305	2014-08-31 11:43:27.355305	5
1877	18	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0	2014-08-31 11:43:27.365191	2014-08-31 11:43:27.365191	5
1878	18	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0	2014-08-31 11:43:27.376296	2014-08-31 11:43:27.376296	5
1879	19	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0	2014-08-31 11:43:27.387344	2014-08-31 11:43:27.387344	5
1880	19	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0	2014-08-31 11:43:27.398433	2014-08-31 11:43:27.398433	5
1881	19	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0	2014-08-31 11:43:27.507806	2014-08-31 11:43:27.507806	5
1882	19	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0	2014-08-31 11:43:27.523149	2014-08-31 11:43:27.523149	5
1883	19	2013-11-29 00:00:00	2013-12-26 00:00:00	5	0	2014-08-31 11:43:27.534335	2014-08-31 11:43:27.534335	5
1884	19	2013-11-29 00:00:00	2013-12-26 00:00:00	6	0	2014-08-31 11:43:27.545062	2014-08-31 11:43:27.545062	5
1885	19	2013-11-29 00:00:00	2013-12-26 00:00:00	7	0.0100000000000000002	2014-08-31 11:43:27.555419	2014-08-31 11:43:27.555419	5
1886	19	2013-11-29 00:00:00	2013-12-26 00:00:00	8	0.0200000000000000004	2014-08-31 11:43:27.566932	2014-08-31 11:43:27.566932	5
1887	19	2013-11-29 00:00:00	2013-12-26 00:00:00	9	0.0100000000000000002	2014-08-31 11:43:27.578101	2014-08-31 11:43:27.578101	5
1888	19	2013-11-29 00:00:00	2013-12-26 00:00:00	10	0.0100000000000000002	2014-08-31 11:43:27.589157	2014-08-31 11:43:27.589157	5
1889	19	2013-11-29 00:00:00	2013-12-26 00:00:00	11	0.0100000000000000002	2014-08-31 11:43:27.599804	2014-08-31 11:43:27.599804	5
1890	19	2013-11-29 00:00:00	2013-12-26 00:00:00	12	0.0100000000000000002	2014-08-31 11:43:27.610979	2014-08-31 11:43:27.610979	5
1891	19	2013-11-29 00:00:00	2013-12-26 00:00:00	13	0.0200000000000000004	2014-08-31 11:43:27.63195	2014-08-31 11:43:27.63195	5
1892	19	2013-11-29 00:00:00	2013-12-26 00:00:00	14	0.0200000000000000004	2014-08-31 11:43:27.642256	2014-08-31 11:43:27.642256	5
1893	19	2013-11-29 00:00:00	2013-12-26 00:00:00	15	0.0200000000000000004	2014-08-31 11:43:27.653134	2014-08-31 11:43:27.653134	5
1894	19	2013-11-29 00:00:00	2013-12-26 00:00:00	16	0.0200000000000000004	2014-08-31 11:43:27.663502	2014-08-31 11:43:27.663502	5
1895	19	2013-11-29 00:00:00	2013-12-26 00:00:00	17	0.0100000000000000002	2014-08-31 11:43:27.673656	2014-08-31 11:43:27.673656	5
1896	19	2013-11-29 00:00:00	2013-12-26 00:00:00	18	0.0100000000000000002	2014-08-31 11:43:27.683738	2014-08-31 11:43:27.683738	5
1897	19	2013-11-29 00:00:00	2013-12-26 00:00:00	19	0.0100000000000000002	2014-08-31 11:43:27.693765	2014-08-31 11:43:27.693765	5
1898	19	2013-11-29 00:00:00	2013-12-26 00:00:00	20	0.0100000000000000002	2014-08-31 11:43:27.704083	2014-08-31 11:43:27.704083	5
1899	19	2013-11-29 00:00:00	2013-12-26 00:00:00	21	0.0100000000000000002	2014-08-31 11:43:27.714464	2014-08-31 11:43:27.714464	5
1900	19	2013-11-29 00:00:00	2013-12-26 00:00:00	22	0.0299999999999999989	2014-08-31 11:43:27.733515	2014-08-31 11:43:27.733515	5
1901	19	2013-11-29 00:00:00	2013-12-26 00:00:00	23	0.0100000000000000002	2014-08-31 11:43:27.74458	2014-08-31 11:43:27.74458	5
1902	19	2013-11-29 00:00:00	2013-12-26 00:00:00	24	0.0100000000000000002	2014-08-31 11:43:27.75506	2014-08-31 11:43:27.75506	5
1903	20	2013-11-29 00:00:00	2013-12-26 00:00:00	1	0.450000000000000011	2014-08-31 11:43:27.765096	2014-08-31 11:43:27.765096	5
1904	20	2013-11-29 00:00:00	2013-12-26 00:00:00	2	0.140000000000000013	2014-08-31 11:43:27.775958	2014-08-31 11:43:27.775958	5
1905	20	2013-11-29 00:00:00	2013-12-26 00:00:00	3	0.170000000000000012	2014-08-31 11:43:27.786276	2014-08-31 11:43:27.786276	5
1906	20	2013-11-29 00:00:00	2013-12-26 00:00:00	4	0.560000000000000053	2014-08-31 11:43:27.796514	2014-08-31 11:43:27.796514	5
1907	20	2013-11-29 00:00:00	2013-12-26 00:00:00	5	2.12000000000000011	2014-08-31 11:43:27.907103	2014-08-31 11:43:27.907103	5
1908	20	2013-11-29 00:00:00	2013-12-26 00:00:00	6	5.65000000000000036	2014-08-31 11:43:27.919398	2014-08-31 11:43:27.919398	5
1909	20	2013-11-29 00:00:00	2013-12-26 00:00:00	7	9.08000000000000007	2014-08-31 11:43:27.932325	2014-08-31 11:43:27.932325	5
1910	20	2013-11-29 00:00:00	2013-12-26 00:00:00	8	11.6699999999999999	2014-08-31 11:43:27.943588	2014-08-31 11:43:27.943588	5
1911	20	2013-11-29 00:00:00	2013-12-26 00:00:00	9	11.2100000000000009	2014-08-31 11:43:27.954159	2014-08-31 11:43:27.954159	5
1912	20	2013-11-29 00:00:00	2013-12-26 00:00:00	10	10.5800000000000001	2014-08-31 11:43:27.964694	2014-08-31 11:43:27.964694	5
1913	20	2013-11-29 00:00:00	2013-12-26 00:00:00	11	9.88000000000000078	2014-08-31 11:43:27.977021	2014-08-31 11:43:27.977021	5
1914	20	2013-11-29 00:00:00	2013-12-26 00:00:00	12	11.3300000000000001	2014-08-31 11:43:27.98765	2014-08-31 11:43:27.98765	5
1915	20	2013-11-29 00:00:00	2013-12-26 00:00:00	13	12.5099999999999998	2014-08-31 11:43:27.998102	2014-08-31 11:43:27.998102	5
1916	20	2013-11-29 00:00:00	2013-12-26 00:00:00	14	11.4700000000000006	2014-08-31 11:43:28.014046	2014-08-31 11:43:28.014046	5
1917	20	2013-11-29 00:00:00	2013-12-26 00:00:00	15	10.8300000000000001	2014-08-31 11:43:28.033095	2014-08-31 11:43:28.033095	5
1918	20	2013-11-29 00:00:00	2013-12-26 00:00:00	16	12.5299999999999994	2014-08-31 11:43:28.043465	2014-08-31 11:43:28.043465	5
1919	20	2013-11-29 00:00:00	2013-12-26 00:00:00	17	16.5199999999999996	2014-08-31 11:43:28.054081	2014-08-31 11:43:28.054081	5
1920	20	2013-11-29 00:00:00	2013-12-26 00:00:00	18	21.4299999999999997	2014-08-31 11:43:28.065105	2014-08-31 11:43:28.065105	5
1921	20	2013-11-29 00:00:00	2013-12-26 00:00:00	19	26.3500000000000014	2014-08-31 11:43:28.075326	2014-08-31 11:43:28.075326	5
1922	20	2013-11-29 00:00:00	2013-12-26 00:00:00	20	29.8900000000000006	2014-08-31 11:43:28.085599	2014-08-31 11:43:28.085599	5
1923	20	2013-11-29 00:00:00	2013-12-26 00:00:00	21	26.8500000000000014	2014-08-31 11:43:28.0959	2014-08-31 11:43:28.0959	5
1924	20	2013-11-29 00:00:00	2013-12-26 00:00:00	22	15.4000000000000004	2014-08-31 11:43:28.106102	2014-08-31 11:43:28.106102	5
1925	20	2013-11-29 00:00:00	2013-12-26 00:00:00	23	5.45999999999999996	2014-08-31 11:43:28.11635	2014-08-31 11:43:28.11635	5
1926	20	2013-11-29 00:00:00	2013-12-26 00:00:00	24	1.62000000000000011	2014-08-31 11:43:28.131696	2014-08-31 11:43:28.131696	5
1927	21	\N	\N	1	\N	2014-08-31 11:43:28.142551	2014-08-31 11:43:28.142551	5
1928	21	\N	\N	2	\N	2014-08-31 11:43:28.152905	2014-08-31 11:43:28.152905	5
\.


--
-- Name: slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('slots_id_seq', 1928, true);


--
-- Data for Name: spots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spots (id, campaign_id, hour_id, channel_id, airdate, programme, created_at, updated_at) FROM stdin;
14665	5	8	1	2013-11-30	E BUZZ	2014-08-31 11:43:47.377637	2014-08-31 11:43:47.377637
14666	5	8	1	2013-11-30	BLOOPERS	2014-08-31 11:43:47.405848	2014-08-31 11:43:47.405848
14667	5	10	1	2013-11-30	BREAKING THE MAGICIANS CODE	2014-08-31 11:43:47.443833	2014-08-31 11:43:47.443833
14668	5	10	1	2013-11-30	BREAKING THE MAGICIANS CODE	2014-08-31 11:43:47.479085	2014-08-31 11:43:47.479085
14669	5	12	1	2013-11-30	BREAKING THE MAGICIANS CODE	2014-08-31 11:43:47.513575	2014-08-31 11:43:47.513575
14670	5	12	1	2013-11-30	BREAKING THE MAGICIANS CODE	2014-08-31 11:43:47.556929	2014-08-31 11:43:47.556929
14671	5	13	1	2013-11-30	SUPERNATURAL	2014-08-31 11:43:47.594204	2014-08-31 11:43:47.594204
14672	5	13	1	2013-11-30	SUPERNATURAL	2014-08-31 11:43:47.623355	2014-08-31 11:43:47.623355
14673	5	15	1	2013-11-30	THE HERO	2014-08-31 11:43:47.962426	2014-08-31 11:43:47.962426
14674	5	16	1	2013-11-30	GHOST HUNTERS	2014-08-31 11:43:48.014135	2014-08-31 11:43:48.014135
14675	5	16	1	2013-11-30	GHOST HUNTERS	2014-08-31 11:43:48.075295	2014-08-31 11:43:48.075295
14676	5	17	1	2013-11-30	THE VOICE	2014-08-31 11:43:48.133012	2014-08-31 11:43:48.133012
14677	5	17	1	2013-11-30	THE VOICE	2014-08-31 11:43:48.194891	2014-08-31 11:43:48.194891
14678	5	18	1	2013-11-30	THE VOICE	2014-08-31 11:43:48.250755	2014-08-31 11:43:48.250755
14679	5	19	1	2013-11-30	THE HERO	2014-08-31 11:43:48.29866	2014-08-31 11:43:48.29866
14680	5	19	1	2013-11-30	THE HERO	2014-08-31 11:43:48.349627	2014-08-31 11:43:48.349627
14681	5	20	1	2013-11-30	EFF TEARS OF THE SUN	2014-08-31 11:43:48.87052	2014-08-31 11:43:48.87052
14682	5	20	1	2013-11-30	EFF TEARS OF THE SUN	2014-08-31 11:43:48.904676	2014-08-31 11:43:48.904676
14683	5	21	1	2013-11-30	EFF TEARS OF THE SUN	2014-08-31 11:43:48.935231	2014-08-31 11:43:48.935231
14684	5	21	1	2013-11-30	EFF TEARS OF THE SUN	2014-08-31 11:43:48.961514	2014-08-31 11:43:48.961514
14685	5	22	1	2013-11-30	MISS SUPRANATIONAL 2013	2014-08-31 11:43:48.988389	2014-08-31 11:43:48.988389
14686	5	8	1	2013-12-01	THE VOICE	2014-08-31 11:43:49.014829	2014-08-31 11:43:49.014829
14687	5	9	1	2013-12-01	THE VOICE	2014-08-31 11:43:49.046663	2014-08-31 11:43:49.046663
14688	5	10	1	2013-12-01	TOP GEAR	2014-08-31 11:43:49.075455	2014-08-31 11:43:49.075455
14689	5	11	1	2013-12-01	EFF SET UP	2014-08-31 11:43:49.102581	2014-08-31 11:43:49.102581
14690	5	12	1	2013-12-01	EFF SET UP	2014-08-31 11:43:49.397896	2014-08-31 11:43:49.397896
14691	5	12	1	2013-12-01	EFF SET UP	2014-08-31 11:43:49.429035	2014-08-31 11:43:49.429035
14692	5	13	1	2013-12-01	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:49.455719	2014-08-31 11:43:49.455719
14693	5	14	1	2013-12-01	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:49.482642	2014-08-31 11:43:49.482642
14694	5	15	1	2013-12-01	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:49.508514	2014-08-31 11:43:49.508514
14695	5	16	1	2013-12-01	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:49.537724	2014-08-31 11:43:49.537724
14696	5	17	1	2013-12-01	THE VOICE	2014-08-31 11:43:49.562563	2014-08-31 11:43:49.562563
14697	5	17	1	2013-12-01	THE VOICE	2014-08-31 11:43:49.586717	2014-08-31 11:43:49.586717
14698	5	18	1	2013-12-01	THE HERO	2014-08-31 11:43:49.886797	2014-08-31 11:43:49.886797
14699	5	18	1	2013-12-01	THE HERO	2014-08-31 11:43:49.914484	2014-08-31 11:43:49.914484
14700	5	19	1	2013-12-01	TOP GEAR	2014-08-31 11:43:49.953255	2014-08-31 11:43:49.953255
14701	5	19	1	2013-12-01	TOP GEAR	2014-08-31 11:43:49.979746	2014-08-31 11:43:49.979746
14702	5	20	1	2013-12-01	EFF SET UP	2014-08-31 11:43:50.005608	2014-08-31 11:43:50.005608
14703	5	21	1	2013-12-01	EFF SET UP	2014-08-31 11:43:50.035636	2014-08-31 11:43:50.035636
14704	5	21	1	2013-12-01	EFF SET UP	2014-08-31 11:43:50.060061	2014-08-31 11:43:50.060061
14705	5	21	1	2013-12-01	EFF SET UP	2014-08-31 11:43:50.083688	2014-08-31 11:43:50.083688
14706	5	22	1	2013-12-01	GHOST HUNTERS	2014-08-31 11:43:50.359098	2014-08-31 11:43:50.359098
14707	5	16	1	2013-12-02	NZ SMASHES GUINNESS WORLD RECO	2014-08-31 11:43:50.385509	2014-08-31 11:43:50.385509
14708	5	17	1	2013-12-02	RIPLEYS BELIEVE IT OR NO	2014-08-31 11:43:50.411469	2014-08-31 11:43:50.411469
14709	5	18	1	2013-12-02	GUINNESS WORLD RECORDS SMASHED	2014-08-31 11:43:50.44352	2014-08-31 11:43:50.44352
14710	5	19	1	2013-12-02	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:50.472007	2014-08-31 11:43:50.472007
14711	5	20	1	2013-12-02	HANNIBAL	2014-08-31 11:43:50.497817	2014-08-31 11:43:50.497817
14712	5	21	1	2013-12-02	CROSSING LINES	2014-08-31 11:43:50.527331	2014-08-31 11:43:50.527331
14713	5	22	1	2013-12-02	CHUCK	2014-08-31 11:43:50.55221	2014-08-31 11:43:50.55221
14714	5	16	1	2013-12-03	NZ SMASHES GUINNESS WORLD RECO	2014-08-31 11:43:50.833476	2014-08-31 11:43:50.833476
14715	5	17	1	2013-12-03	RIPLEYS BELIEVE IT OR NO	2014-08-31 11:43:50.860369	2014-08-31 11:43:50.860369
14716	5	18	1	2013-12-03	GUINNESS WORLD RECORDS SMASHED	2014-08-31 11:43:50.887775	2014-08-31 11:43:50.887775
14717	5	19	1	2013-12-03	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:50.91574	2014-08-31 11:43:50.91574
14718	5	20	1	2013-12-03	HANNIBAL	2014-08-31 11:43:50.948701	2014-08-31 11:43:50.948701
14719	5	21	1	2013-12-03	CROSSING LINES	2014-08-31 11:43:50.975272	2014-08-31 11:43:50.975272
14720	5	22	1	2013-12-03	CHUCK	2014-08-31 11:43:51.007996	2014-08-31 11:43:51.007996
14721	5	16	1	2013-12-04	NZ SMASHES GUINNESS WORLD RECO	2014-08-31 11:43:51.057251	2014-08-31 11:43:51.057251
14722	5	17	1	2013-12-04	RIPLEYS BELIEVE IT OR NO	2014-08-31 11:43:51.354107	2014-08-31 11:43:51.354107
14723	5	18	1	2013-12-04	BLOOPERS	2014-08-31 11:43:51.380544	2014-08-31 11:43:51.380544
14724	5	19	1	2013-12-04	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:51.406165	2014-08-31 11:43:51.406165
14725	5	20	1	2013-12-04	HANNIBAL	2014-08-31 11:43:51.43664	2014-08-31 11:43:51.43664
14726	5	21	1	2013-12-04	CROSSING LINES	2014-08-31 11:43:51.463358	2014-08-31 11:43:51.463358
14727	5	22	1	2013-12-04	CHUCK	2014-08-31 11:43:51.488995	2014-08-31 11:43:51.488995
14728	5	16	1	2013-12-05	NZ SMASHES GUINNESS WORLD RECO	2014-08-31 11:43:51.513304	2014-08-31 11:43:51.513304
14729	5	17	1	2013-12-05	RIPLEYS BELIEVE IT OR NO	2014-08-31 11:43:51.541757	2014-08-31 11:43:51.541757
14730	5	18	1	2013-12-05	BLOOPERS	2014-08-31 11:43:51.824478	2014-08-31 11:43:51.824478
14731	5	19	1	2013-12-05	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:51.851386	2014-08-31 11:43:51.851386
14732	5	20	1	2013-12-05	THE CONFESSION	2014-08-31 11:43:51.87678	2014-08-31 11:43:51.87678
14733	5	21	1	2013-12-05	CROSSING LINES	2014-08-31 11:43:51.9033	2014-08-31 11:43:51.9033
14734	5	22	1	2013-12-05	CHUCK	2014-08-31 11:43:51.934124	2014-08-31 11:43:51.934124
14735	5	16	1	2013-12-06	THE HERO	2014-08-31 11:43:51.95967	2014-08-31 11:43:51.95967
14736	5	17	1	2013-12-06	E BUZZ	2014-08-31 11:43:51.983892	2014-08-31 11:43:51.983892
14737	5	18	1	2013-12-06	TOP CHEF MASTERS	2014-08-31 11:43:52.007913	2014-08-31 11:43:52.007913
14738	5	19	1	2013-12-06	SUPERNATURAL	2014-08-31 11:43:52.035862	2014-08-31 11:43:52.035862
14739	5	20	1	2013-12-06	TOP GEAR	2014-08-31 11:43:52.32927	2014-08-31 11:43:52.32927
14740	5	21	1	2013-12-06	THE HERO	2014-08-31 11:43:52.357849	2014-08-31 11:43:52.357849
14741	5	22	1	2013-12-06	GHOST HUNTERS	2014-08-31 11:43:52.385786	2014-08-31 11:43:52.385786
14742	5	8	1	2013-12-07	E BUZZ	2014-08-31 11:43:52.412871	2014-08-31 11:43:52.412871
14743	5	8	1	2013-12-07	BLOOPERS	2014-08-31 11:43:52.453633	2014-08-31 11:43:52.453633
14744	5	9	1	2013-12-07	THE VOICE	2014-08-31 11:43:52.47817	2014-08-31 11:43:52.47817
14745	5	10	1	2013-12-07	AMERICAN NINJA WARRIOR	2014-08-31 11:43:52.50273	2014-08-31 11:43:52.50273
14746	5	11	1	2013-12-07	AMERICAN NINJA WARRIOR	2014-08-31 11:43:52.531982	2014-08-31 11:43:52.531982
14747	5	12	1	2013-12-07	AMERICAN NINJA WARRIOR	2014-08-31 11:43:52.821059	2014-08-31 11:43:52.821059
14748	5	13	1	2013-12-07	SUPERNATURAL	2014-08-31 11:43:52.847838	2014-08-31 11:43:52.847838
14749	5	14	1	2013-12-07	TOP GEAR	2014-08-31 11:43:52.87665	2014-08-31 11:43:52.87665
14750	5	15	1	2013-12-07	THE HERO	2014-08-31 11:43:52.907759	2014-08-31 11:43:52.907759
14751	5	16	1	2013-12-07	GHOST HUNTERS	2014-08-31 11:43:52.941855	2014-08-31 11:43:52.941855
14752	5	16	1	2013-12-07	GHOST HUNTERS	2014-08-31 11:43:52.967681	2014-08-31 11:43:52.967681
14753	5	17	1	2013-12-07	THE VOICE	2014-08-31 11:43:52.993338	2014-08-31 11:43:52.993338
14754	5	17	1	2013-12-07	THE VOICE	2014-08-31 11:43:53.018502	2014-08-31 11:43:53.018502
14755	5	18	1	2013-12-07	THE VOICE	2014-08-31 11:43:53.309974	2014-08-31 11:43:53.309974
14756	5	19	1	2013-12-07	THE HERO	2014-08-31 11:43:53.342889	2014-08-31 11:43:53.342889
14757	5	19	1	2013-12-07	THE HERO	2014-08-31 11:43:53.369647	2014-08-31 11:43:53.369647
14758	5	20	1	2013-12-07	EFF BANGKOK DANGEROUS	2014-08-31 11:43:53.397151	2014-08-31 11:43:53.397151
14759	5	20	1	2013-12-07	EFF BANGKOK DANGEROUS	2014-08-31 11:43:53.428053	2014-08-31 11:43:53.428053
14760	5	21	1	2013-12-07	EFF BANGKOK DANGEROUS	2014-08-31 11:43:53.455144	2014-08-31 11:43:53.455144
14761	5	22	1	2013-12-07	GHOST HUNTERS	2014-08-31 11:43:53.480525	2014-08-31 11:43:53.480525
14762	5	22	1	2013-12-07	GHOST HUNTERS	2014-08-31 11:43:53.505458	2014-08-31 11:43:53.505458
14763	5	8	1	2013-12-08	THE VOICE	2014-08-31 11:43:53.874624	2014-08-31 11:43:53.874624
14764	5	8	1	2013-12-08	THE VOICE	2014-08-31 11:43:53.904205	2014-08-31 11:43:53.904205
14765	5	10	1	2013-12-08	TOP GEAR	2014-08-31 11:43:53.93619	2014-08-31 11:43:53.93619
14766	5	12	1	2013-12-08	EFF I STILL KNOW WHAT YOU DID	2014-08-31 11:43:53.964368	2014-08-31 11:43:53.964368
14767	5	12	1	2013-12-08	EFF I STILL KNOW WHAT YOU DID	2014-08-31 11:43:53.991512	2014-08-31 11:43:53.991512
14768	5	13	1	2013-12-08	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:54.023547	2014-08-31 11:43:54.023547
14769	5	13	1	2013-12-08	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:54.049981	2014-08-31 11:43:54.049981
14770	5	14	1	2013-12-08	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:54.075282	2014-08-31 11:43:54.075282
14771	5	15	1	2013-12-08	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:54.363145	2014-08-31 11:43:54.363145
14772	5	16	1	2013-12-08	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:54.391345	2014-08-31 11:43:54.391345
14773	5	16	1	2013-12-08	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:54.418894	2014-08-31 11:43:54.418894
14774	5	17	1	2013-12-08	THE VOICE	2014-08-31 11:43:54.450867	2014-08-31 11:43:54.450867
14775	5	18	1	2013-12-08	THE HERO	2014-08-31 11:43:54.478716	2014-08-31 11:43:54.478716
14776	5	18	1	2013-12-08	THE HERO	2014-08-31 11:43:54.504016	2014-08-31 11:43:54.504016
14777	5	19	1	2013-12-08	TOP GEAR	2014-08-31 11:43:54.532189	2014-08-31 11:43:54.532189
14778	5	19	1	2013-12-08	TOP GEAR	2014-08-31 11:43:54.555958	2014-08-31 11:43:54.555958
14779	5	20	1	2013-12-08	EFF RONIN	2014-08-31 11:43:54.832657	2014-08-31 11:43:54.832657
14780	5	20	1	2013-12-08	EFF RONIN	2014-08-31 11:43:54.859172	2014-08-31 11:43:54.859172
14781	5	20	1	2013-12-08	EFF RONIN	2014-08-31 11:43:54.88467	2014-08-31 11:43:54.88467
14782	5	21	1	2013-12-08	EFF RONIN	2014-08-31 11:43:54.910537	2014-08-31 11:43:54.910537
14783	5	22	1	2013-12-08	GHOST HUNTERS	2014-08-31 11:43:54.940232	2014-08-31 11:43:54.940232
14784	5	17	1	2013-12-09	RIPLEYS BELIEVE IT OR NO	2014-08-31 11:43:54.967488	2014-08-31 11:43:54.967488
14785	5	18	1	2013-12-09	BREAKING THE MAGICIANS CODE	2014-08-31 11:43:54.993424	2014-08-31 11:43:54.993424
14786	5	19	1	2013-12-09	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:55.026714	2014-08-31 11:43:55.026714
14787	5	20	1	2013-12-09	ORPHAN BLACK	2014-08-31 11:43:55.295932	2014-08-31 11:43:55.295932
14788	5	21	1	2013-12-09	CROSSING LINES	2014-08-31 11:43:55.334469	2014-08-31 11:43:55.334469
14789	5	22	1	2013-12-09	CHUCK	2014-08-31 11:43:55.360039	2014-08-31 11:43:55.360039
14790	5	16	1	2013-12-10	NZ SMASHES GUINNESS WORLD RECO	2014-08-31 11:43:55.385891	2014-08-31 11:43:55.385891
14791	5	17	1	2013-12-10	RIPLEYS BELIEVE IT OR NO	2014-08-31 11:43:55.412053	2014-08-31 11:43:55.412053
14792	5	18	1	2013-12-10	BREAKING THE MAGICIANS CODE	2014-08-31 11:43:55.441993	2014-08-31 11:43:55.441993
14793	5	19	1	2013-12-10	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:55.467088	2014-08-31 11:43:55.467088
14794	5	21	1	2013-12-10	CROSSING LINES	2014-08-31 11:43:55.491599	2014-08-31 11:43:55.491599
14795	5	22	1	2013-12-10	CHUCK	2014-08-31 11:43:55.515364	2014-08-31 11:43:55.515364
14796	5	16	1	2013-12-11	TOTALLY INSANE GUINNESS WORLD RECORDS	2014-08-31 11:43:55.799575	2014-08-31 11:43:55.799575
14797	5	18	1	2013-12-11	BREAKING THE MAGICIANS CODE	2014-08-31 11:43:55.829984	2014-08-31 11:43:55.829984
14798	5	19	1	2013-12-11	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:55.856664	2014-08-31 11:43:55.856664
14799	5	20	1	2013-12-11	ORPHAN BLACK	2014-08-31 11:43:55.883444	2014-08-31 11:43:55.883444
14800	5	21	1	2013-12-11	CROSSING LINES	2014-08-31 11:43:55.910273	2014-08-31 11:43:55.910273
14801	5	22	1	2013-12-11	CHUCK	2014-08-31 11:43:55.940424	2014-08-31 11:43:55.940424
14802	5	17	1	2013-12-12	RIPLEYS BELIEVE IT OR NO	2014-08-31 11:43:55.964735	2014-08-31 11:43:55.964735
14803	5	18	1	2013-12-12	BREAKING THE MAGICIANS CODE	2014-08-31 11:43:55.9882	2014-08-31 11:43:55.9882
14804	5	19	1	2013-12-12	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:56.322479	2014-08-31 11:43:56.322479
14805	5	20	1	2013-12-12	ORPHAN BLACK	2014-08-31 11:43:56.349258	2014-08-31 11:43:56.349258
14806	5	21	1	2013-12-12	CROSSING LINES	2014-08-31 11:43:56.375267	2014-08-31 11:43:56.375267
14807	5	22	1	2013-12-12	CHUCK	2014-08-31 11:43:56.401287	2014-08-31 11:43:56.401287
14808	5	16	1	2013-12-13	THE HERO	2014-08-31 11:43:56.431589	2014-08-31 11:43:56.431589
14809	5	17	1	2013-12-13	BLOOPERS	2014-08-31 11:43:56.456595	2014-08-31 11:43:56.456595
14810	5	18	1	2013-12-13	TOP CHEF MASTERS	2014-08-31 11:43:56.480907	2014-08-31 11:43:56.480907
14811	5	19	1	2013-12-13	SUPERNATURAL	2014-08-31 11:43:56.505931	2014-08-31 11:43:56.505931
14812	5	20	1	2013-12-13	TOP GEAR	2014-08-31 11:43:56.799997	2014-08-31 11:43:56.799997
14813	5	21	1	2013-12-13	SHERLOCK	2014-08-31 11:43:56.831238	2014-08-31 11:43:56.831238
14814	5	8	1	2013-12-14	E BUZZ	2014-08-31 11:43:56.858485	2014-08-31 11:43:56.858485
14815	5	8	1	2013-12-14	BLOOPERS	2014-08-31 11:43:56.885041	2014-08-31 11:43:56.885041
14816	5	9	1	2013-12-14	THE VOICE	2014-08-31 11:43:56.911273	2014-08-31 11:43:56.911273
14817	5	10	1	2013-12-14	AMERICAN NINJA WARRIOR	2014-08-31 11:43:56.941907	2014-08-31 11:43:56.941907
14818	5	11	1	2013-12-14	AMERICAN NINJA WARRIOR	2014-08-31 11:43:56.968401	2014-08-31 11:43:56.968401
14819	5	12	1	2013-12-14	AMERICAN NINJA WARRIOR	2014-08-31 11:43:56.994582	2014-08-31 11:43:56.994582
14820	5	13	1	2013-12-14	SUPERNATURAL	2014-08-31 11:43:57.298767	2014-08-31 11:43:57.298767
14821	5	14	1	2013-12-14	TOP GEAR	2014-08-31 11:43:57.329243	2014-08-31 11:43:57.329243
14822	5	15	1	2013-12-14	SHERLOCK	2014-08-31 11:43:57.35573	2014-08-31 11:43:57.35573
14823	5	16	1	2013-12-14	SHERLOCK	2014-08-31 11:43:57.382121	2014-08-31 11:43:57.382121
14824	5	16	1	2013-12-14	SHERLOCK	2014-08-31 11:43:57.40851	2014-08-31 11:43:57.40851
14825	5	17	1	2013-12-14	THE VOICE	2014-08-31 11:43:57.438685	2014-08-31 11:43:57.438685
14826	5	17	1	2013-12-14	THE VOICE	2014-08-31 11:43:57.463439	2014-08-31 11:43:57.463439
14827	5	17	1	2013-12-14	THE VOICE	2014-08-31 11:43:57.487983	2014-08-31 11:43:57.487983
14828	5	19	1	2013-12-14	DESTINATION TRUTH	2014-08-31 11:43:57.769017	2014-08-31 11:43:57.769017
14829	5	19	1	2013-12-14	DESTINATION TRUTH	2014-08-31 11:43:57.796367	2014-08-31 11:43:57.796367
14830	5	20	1	2013-12-14	EFF VALKYRIE	2014-08-31 11:43:57.831304	2014-08-31 11:43:57.831304
14831	5	20	1	2013-12-14	EFF VALKYRIE	2014-08-31 11:43:57.858802	2014-08-31 11:43:57.858802
14832	5	20	1	2013-12-14	EFF VALKYRIE	2014-08-31 11:43:57.885567	2014-08-31 11:43:57.885567
14833	5	20	1	2013-12-14	EFF VALKYRIE	2014-08-31 11:43:57.913035	2014-08-31 11:43:57.913035
14834	5	22	1	2013-12-14	EFF VALKYRIE	2014-08-31 11:43:57.93998	2014-08-31 11:43:57.93998
14835	5	8	1	2013-12-15	THE VOICE	2014-08-31 11:43:57.965991	2014-08-31 11:43:57.965991
14836	5	8	1	2013-12-15	THE VOICE	2014-08-31 11:43:58.257911	2014-08-31 11:43:58.257911
14837	5	9	1	2013-12-15	BLOOPERS	2014-08-31 11:43:58.285628	2014-08-31 11:43:58.285628
14838	5	10	1	2013-12-15	TOP GEAR	2014-08-31 11:43:58.312686	2014-08-31 11:43:58.312686
14839	5	10	1	2013-12-15	TOP GEAR	2014-08-31 11:43:58.344492	2014-08-31 11:43:58.344492
14840	5	10	1	2013-12-15	TOP GEAR	2014-08-31 11:43:58.372238	2014-08-31 11:43:58.372238
14841	5	11	1	2013-12-15	EFF EVOLUTION	2014-08-31 11:43:58.399393	2014-08-31 11:43:58.399393
14842	5	13	1	2013-12-15	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:58.429947	2014-08-31 11:43:58.429947
14843	5	13	1	2013-12-15	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:58.455703	2014-08-31 11:43:58.455703
14844	5	16	1	2013-12-15	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:58.480267	2014-08-31 11:43:58.480267
14845	5	17	1	2013-12-15	THE VOICE	2014-08-31 11:43:58.780383	2014-08-31 11:43:58.780383
14846	5	17	1	2013-12-15	THE VOICE	2014-08-31 11:43:58.807419	2014-08-31 11:43:58.807419
14847	5	18	1	2013-12-15	DESTINATION TRUTH	2014-08-31 11:43:58.839906	2014-08-31 11:43:58.839906
14848	5	19	1	2013-12-15	TOP GEAR	2014-08-31 11:43:58.867413	2014-08-31 11:43:58.867413
14849	5	20	1	2013-12-15	EFF UNDERWORLD RISE OF THE LYC	2014-08-31 11:43:58.894186	2014-08-31 11:43:58.894186
14850	5	20	1	2013-12-15	EFF UNDERWORLD RISE OF THE LYC	2014-08-31 11:43:58.924482	2014-08-31 11:43:58.924482
14851	5	21	1	2013-12-15	EFF UNDERWORLD RISE OF THE LYC	2014-08-31 11:43:58.949318	2014-08-31 11:43:58.949318
14852	5	21	1	2013-12-15	EFF UNDERWORLD RISE OF THE LYC	2014-08-31 11:43:58.973949	2014-08-31 11:43:58.973949
14853	5	21	1	2013-12-15	EFF UNDERWORLD RISE OF THE LYC	2014-08-31 11:43:59.264877	2014-08-31 11:43:59.264877
14854	5	22	1	2013-12-15	GHOST HUNTERS	2014-08-31 11:43:59.291379	2014-08-31 11:43:59.291379
14855	5	22	1	2013-12-15	GHOST HUNTERS	2014-08-31 11:43:59.317552	2014-08-31 11:43:59.317552
14856	5	16	1	2013-12-16	TOTALLY INSANE GUINNESS WORLD RECORDS	2014-08-31 11:43:59.349526	2014-08-31 11:43:59.349526
14857	5	16	1	2013-12-16	TOTALLY INSANE GUINNESS WORLD RECORDS	2014-08-31 11:43:59.375566	2014-08-31 11:43:59.375566
14858	5	18	1	2013-12-16	BREAKING THE MAGICIANS CODE	2014-08-31 11:43:59.400911	2014-08-31 11:43:59.400911
14859	5	19	1	2013-12-16	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:59.430293	2014-08-31 11:43:59.430293
14860	5	21	1	2013-12-16	CROSSING LINES	2014-08-31 11:43:59.455647	2014-08-31 11:43:59.455647
14861	5	22	1	2013-12-16	CHUCK	2014-08-31 11:43:59.750376	2014-08-31 11:43:59.750376
14862	5	16	1	2013-12-17	TOTALLY INSANE GUINNESS WORLD RECORDS	2014-08-31 11:43:59.776565	2014-08-31 11:43:59.776565
14863	5	17	1	2013-12-17	RIPLEYS BELIEVE IT OR NO	2014-08-31 11:43:59.802417	2014-08-31 11:43:59.802417
14864	5	19	1	2013-12-17	SO YOU THINK YOU CAN DANCE	2014-08-31 11:43:59.832762	2014-08-31 11:43:59.832762
14865	5	20	1	2013-12-17	ORPHAN BLACK	2014-08-31 11:43:59.858976	2014-08-31 11:43:59.858976
14866	5	21	1	2013-12-17	CROSSING LINES	2014-08-31 11:43:59.884373	2014-08-31 11:43:59.884373
14867	5	22	1	2013-12-17	CHUCK	2014-08-31 11:43:59.90841	2014-08-31 11:43:59.90841
14868	5	17	1	2013-12-18	RIPLEYS BELIEVE IT OR NO	2014-08-31 11:43:59.93669	2014-08-31 11:43:59.93669
14869	5	18	1	2013-12-18	CRISS ANGEL MIND FREAK	2014-08-31 11:44:00.218814	2014-08-31 11:44:00.218814
14870	5	19	1	2013-12-18	SO YOU THINK YOU CAN DANCE	2014-08-31 11:44:00.247181	2014-08-31 11:44:00.247181
14871	5	20	1	2013-12-18	ORPHAN BLACK	2014-08-31 11:44:00.273544	2014-08-31 11:44:00.273544
14872	5	21	1	2013-12-18	TOP GEAR	2014-08-31 11:44:00.29948	2014-08-31 11:44:00.29948
14873	5	22	1	2013-12-18	CHUCK	2014-08-31 11:44:00.330169	2014-08-31 11:44:00.330169
14874	5	16	1	2013-12-19	TOTALLY INSANE GUINNESS WORLD RECORDS	2014-08-31 11:44:00.357937	2014-08-31 11:44:00.357937
14875	5	17	1	2013-12-19	RIPLEYS BELIEVE IT OR NO	2014-08-31 11:44:00.389419	2014-08-31 11:44:00.389419
14876	5	20	1	2013-12-19	ORPHAN BLACK	2014-08-31 11:44:00.414374	2014-08-31 11:44:00.414374
14877	5	21	1	2013-12-19	TOP GEAR	2014-08-31 11:44:00.703784	2014-08-31 11:44:00.703784
14878	5	22	1	2013-12-19	CHUCK	2014-08-31 11:44:00.734926	2014-08-31 11:44:00.734926
14879	5	16	1	2013-12-20	TOP GEAR	2014-08-31 11:44:00.761201	2014-08-31 11:44:00.761201
14880	5	18	1	2013-12-20	SUPERNATURAL	2014-08-31 11:44:00.787468	2014-08-31 11:44:00.787468
14881	5	18	1	2013-12-20	SUPERNATURAL	2014-08-31 11:44:00.8134	2014-08-31 11:44:00.8134
14882	5	21	1	2013-12-20	SHERLOCK	2014-08-31 11:44:00.842983	2014-08-31 11:44:00.842983
14883	5	22	1	2013-12-20	SHERLOCK	2014-08-31 11:44:00.869925	2014-08-31 11:44:00.869925
14884	5	8	1	2013-12-21	E BUZZ	2014-08-31 11:44:00.89455	2014-08-31 11:44:00.89455
14885	5	9	1	2013-12-21	THE VOICE	2014-08-31 11:44:01.217763	2014-08-31 11:44:01.217763
14886	5	10	1	2013-12-21	AMERICAN NINJA WARRIOR	2014-08-31 11:44:01.247615	2014-08-31 11:44:01.247615
14887	5	10	1	2013-12-21	AMERICAN NINJA WARRIOR	2014-08-31 11:44:01.27393	2014-08-31 11:44:01.27393
14888	5	11	1	2013-12-21	AMERICAN NINJA WARRIOR	2014-08-31 11:44:01.300372	2014-08-31 11:44:01.300372
14889	5	12	1	2013-12-21	SUPERNATURAL	2014-08-31 11:44:01.327924	2014-08-31 11:44:01.327924
14890	5	14	1	2013-12-21	TOP GEAR	2014-08-31 11:44:01.355352	2014-08-31 11:44:01.355352
14891	5	15	1	2013-12-21	SHERLOCK	2014-08-31 11:44:01.381512	2014-08-31 11:44:01.381512
14892	5	16	1	2013-12-21	SHERLOCK	2014-08-31 11:44:01.407227	2014-08-31 11:44:01.407227
14893	5	16	1	2013-12-21	SHERLOCK	2014-08-31 11:44:01.43618	2014-08-31 11:44:01.43618
14894	5	17	1	2013-12-21	THE VOICE	2014-08-31 11:44:01.725077	2014-08-31 11:44:01.725077
14895	5	17	1	2013-12-21	THE VOICE	2014-08-31 11:44:01.753429	2014-08-31 11:44:01.753429
14896	5	17	1	2013-12-21	THE VOICE	2014-08-31 11:44:01.780305	2014-08-31 11:44:01.780305
14897	5	19	1	2013-12-21	GHOST HUNTERS	2014-08-31 11:44:01.806771	2014-08-31 11:44:01.806771
14898	5	19	1	2013-12-21	GHOST HUNTERS	2014-08-31 11:44:01.837341	2014-08-31 11:44:01.837341
14899	5	20	1	2013-12-21	EFF SAHARA	2014-08-31 11:44:01.863326	2014-08-31 11:44:01.863326
14900	5	21	1	2013-12-21	EFF SAHARA	2014-08-31 11:44:01.889709	2014-08-31 11:44:01.889709
14901	5	21	1	2013-12-21	EFF SAHARA	2014-08-31 11:44:01.913904	2014-08-31 11:44:01.913904
14902	5	21	1	2013-12-21	EFF SAHARA	2014-08-31 11:44:02.201359	2014-08-31 11:44:02.201359
14903	5	8	1	2013-12-22	THE VOICE	2014-08-31 11:44:02.232667	2014-08-31 11:44:02.232667
14904	5	9	1	2013-12-22	THE VOICE	2014-08-31 11:44:02.260176	2014-08-31 11:44:02.260176
14905	5	9	1	2013-12-22	THE VOICE	2014-08-31 11:44:02.287025	2014-08-31 11:44:02.287025
14906	5	10	1	2013-12-22	TOP GEAR	2014-08-31 11:44:02.313346	2014-08-31 11:44:02.313346
14907	5	11	1	2013-12-22	EFF DRUNKEN MASTER	2014-08-31 11:44:02.343483	2014-08-31 11:44:02.343483
14908	5	12	1	2013-12-22	EFF DRUNKEN MASTER	2014-08-31 11:44:02.368568	2014-08-31 11:44:02.368568
14909	5	14	1	2013-12-22	SO YOU THINK YOU CAN DANCE	2014-08-31 11:44:02.393065	2014-08-31 11:44:02.393065
14910	5	15	1	2013-12-22	SO YOU THINK YOU CAN DANCE	2014-08-31 11:44:02.683426	2014-08-31 11:44:02.683426
14911	5	16	1	2013-12-22	SO YOU THINK YOU CAN DANCE	2014-08-31 11:44:02.709948	2014-08-31 11:44:02.709948
14912	5	16	1	2013-12-22	SO YOU THINK YOU CAN DANCE	2014-08-31 11:44:02.736534	2014-08-31 11:44:02.736534
14913	5	17	1	2013-12-22	THE VOICE	2014-08-31 11:44:02.763929	2014-08-31 11:44:02.763929
14914	5	18	1	2013-12-22	THE VOICE	2014-08-31 11:44:02.7914	2014-08-31 11:44:02.7914
14915	5	19	1	2013-12-22	TOP GEAR	2014-08-31 11:44:02.817983	2014-08-31 11:44:02.817983
14916	5	19	1	2013-12-22	TOP GEAR	2014-08-31 11:44:02.849133	2014-08-31 11:44:02.849133
14917	5	20	1	2013-12-22	EFF THE GODFATHER PART III	2014-08-31 11:44:02.875909	2014-08-31 11:44:02.875909
14918	5	21	1	2013-12-22	EFF THE GODFATHER PART III	2014-08-31 11:44:03.197819	2014-08-31 11:44:03.197819
14919	5	21	1	2013-12-22	EFF THE GODFATHER PART III	2014-08-31 11:44:03.234077	2014-08-31 11:44:03.234077
14920	5	21	1	2013-12-22	EFF THE GODFATHER PART III	2014-08-31 11:44:03.261892	2014-08-31 11:44:03.261892
14921	5	22	1	2013-12-22	EFF THE GODFATHER PART III	2014-08-31 11:44:03.288489	2014-08-31 11:44:03.288489
14922	5	5	2	2013-11-29	SQUAWK BOX	2014-08-31 11:44:03.314338	2014-08-31 11:44:03.314338
14923	5	5	2	2013-11-29	POWER BREAKFAST	2014-08-31 11:44:03.345678	2014-08-31 11:44:03.345678
14924	5	6	2	2013-11-29	POWER BREAKFAST	2014-08-31 11:44:03.372228	2014-08-31 11:44:03.372228
14925	5	7	2	2013-11-29	BAZAAR OPEN EXCHANGE	2014-08-31 11:44:03.400079	2014-08-31 11:44:03.400079
14926	5	9	2	2013-11-29	TRADERS ONLY	2014-08-31 11:44:03.708035	2014-08-31 11:44:03.708035
14927	5	10	2	2013-11-29	MARKETS AND MACROS	2014-08-31 11:44:03.735157	2014-08-31 11:44:03.735157
14928	5	11	2	2013-11-29	MARKETS AND MACROS	2014-08-31 11:44:03.763495	2014-08-31 11:44:03.763495
14929	5	11	2	2013-11-29	BUSINESS LUNCH	2014-08-31 11:44:03.792061	2014-08-31 11:44:03.792061
14930	5	12	2	2013-11-29	MIDCAP RADAR	2014-08-31 11:44:03.826052	2014-08-31 11:44:03.826052
14931	5	13	2	2013-11-29	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:03.859347	2014-08-31 11:44:03.859347
14932	5	14	2	2013-11-29	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:03.886757	2014-08-31 11:44:03.886757
14933	5	15	2	2013-11-29	AFTER THE BELL	2014-08-31 11:44:03.913359	2014-08-31 11:44:03.913359
14934	5	16	2	2013-11-29	REPORTERS DIARY	2014-08-31 11:44:04.239326	2014-08-31 11:44:04.239326
14935	5	17	2	2013-11-29	TAKING STOCK	2014-08-31 11:44:04.267461	2014-08-31 11:44:04.267461
14936	5	18	2	2013-11-29	SQUAWK ON THE STREET	2014-08-31 11:44:04.294576	2014-08-31 11:44:04.294576
14937	5	19	2	2013-11-29	INDIA BUSINESS HOUR	2014-08-31 11:44:04.324153	2014-08-31 11:44:04.324153
14938	5	20	2	2013-11-29	INDIA BUSINESS HOUR	2014-08-31 11:44:04.352646	2014-08-31 11:44:04.352646
14939	5	22	2	2013-11-29	INDIA BUSINESS HOUR	2014-08-31 11:44:04.38071	2014-08-31 11:44:04.38071
14940	5	8	2	2013-11-30	BUSINESS SATURDAY	2014-08-31 11:44:04.407411	2014-08-31 11:44:04.407411
14941	5	9	2	2013-11-30	TAKING STOCK	2014-08-31 11:44:04.437378	2014-08-31 11:44:04.437378
14942	5	10	2	2013-11-30	THE FIRM	2014-08-31 11:44:04.463295	2014-08-31 11:44:04.463295
14943	5	11	2	2013-11-30	THE FORBES INDIA SHOW	2014-08-31 11:44:04.783836	2014-08-31 11:44:04.783836
14944	5	12	2	2013-11-30	LIME SEASON 5	2014-08-31 11:44:04.813583	2014-08-31 11:44:04.813583
14945	5	13	2	2013-11-30	STORYBOARD	2014-08-31 11:44:04.845884	2014-08-31 11:44:04.845884
14946	5	15	2	2013-11-30	THE FUTURE OF BIG DATA ECO SYSTEM	2014-08-31 11:44:04.87256	2014-08-31 11:44:04.87256
14947	5	16	2	2013-11-30	TATA CRUCIBLE THE BUSI Q	2014-08-31 11:44:04.898435	2014-08-31 11:44:04.898435
14948	5	17	2	2013-11-30	30 MINUTES WITH MARTIN SORRELL	2014-08-31 11:44:04.929153	2014-08-31 11:44:04.929153
14949	5	18	2	2013-11-30	PLAN F	2014-08-31 11:44:04.956785	2014-08-31 11:44:04.956785
14950	5	18	2	2013-11-30	PRIME PROPERTY	2014-08-31 11:44:04.983887	2014-08-31 11:44:04.983887
14951	5	20	2	2013-11-30	RING FENCING MCXSX	2014-08-31 11:44:05.307954	2014-08-31 11:44:05.307954
14952	5	21	2	2013-11-30	FORBES INDIA PHILANTROPHY AWARDS 2013	2014-08-31 11:44:05.340464	2014-08-31 11:44:05.340464
14953	5	21	2	2013-11-30	LIME SEASON 5	2014-08-31 11:44:05.369292	2014-08-31 11:44:05.369292
14954	5	8	2	2013-12-01	THE FIRM	2014-08-31 11:44:05.397062	2014-08-31 11:44:05.397062
14955	5	9	2	2013-12-01	TAKING STOCK	2014-08-31 11:44:05.431302	2014-08-31 11:44:05.431302
14956	5	10	2	2013-12-01	INDIANOMICS	2014-08-31 11:44:05.458467	2014-08-31 11:44:05.458467
14957	5	10	2	2013-12-01	YOUNG TURKS	2014-08-31 11:44:05.48686	2014-08-31 11:44:05.48686
14958	5	11	2	2013-12-01	THE FORBES INDIA SHOW	2014-08-31 11:44:05.513211	2014-08-31 11:44:05.513211
14959	5	13	2	2013-12-01	THE FUTURE OF BIG DATA ECO SYSTEM	2014-08-31 11:44:05.827017	2014-08-31 11:44:05.827017
14960	5	14	2	2013-12-01	INVESTOTHON 2013	2014-08-31 11:44:05.855335	2014-08-31 11:44:05.855335
14961	5	15	2	2013-12-01	TEXTILE CONCLAVE 2013 BRAND INDIA	2014-08-31 11:44:05.884191	2014-08-31 11:44:05.884191
14962	5	17	2	2013-12-01	TATA CRUCIBLE THE BUSI Q	2014-08-31 11:44:05.910795	2014-08-31 11:44:05.910795
14963	5	17	2	2013-12-01	30 MINUTES WITH MARTIN SORRELL	2014-08-31 11:44:05.949869	2014-08-31 11:44:05.949869
14964	5	18	2	2013-12-01	PRIME PROPERTY	2014-08-31 11:44:05.978808	2014-08-31 11:44:05.978808
14965	5	19	2	2013-12-01	PLAN F	2014-08-31 11:44:06.014277	2014-08-31 11:44:06.014277
14966	5	20	2	2013-12-01	RING FENCING MCXSX	2014-08-31 11:44:06.063857	2014-08-31 11:44:06.063857
14967	5	21	2	2013-12-01	THE FORBES INDIA SHOW	2014-08-31 11:44:06.38706	2014-08-31 11:44:06.38706
14968	5	5	2	2013-12-02	CLOSINGBELL	2014-08-31 11:44:06.415159	2014-08-31 11:44:06.415159
14969	5	5	2	2013-12-02	CLOSINGBELL	2014-08-31 11:44:06.448334	2014-08-31 11:44:06.448334
14970	5	6	2	2013-12-02	POWER BREAKFAST	2014-08-31 11:44:06.476512	2014-08-31 11:44:06.476512
14971	5	7	2	2013-12-02	MORNING CALL	2014-08-31 11:44:06.504662	2014-08-31 11:44:06.504662
14972	5	8	2	2013-12-02	BAZAAR OPEN EXCHANGE	2014-08-31 11:44:06.535265	2014-08-31 11:44:06.535265
14973	5	9	2	2013-12-02	CORPORATE RADAR	2014-08-31 11:44:06.560887	2014-08-31 11:44:06.560887
14974	5	10	2	2013-12-02	MARKETS AND MACROS	2014-08-31 11:44:06.587504	2014-08-31 11:44:06.587504
14975	5	11	2	2013-12-02	MARKETS AND MACROS	2014-08-31 11:44:06.90591	2014-08-31 11:44:06.90591
14976	5	12	2	2013-12-02	BUSINESS LUNCH	2014-08-31 11:44:06.937064	2014-08-31 11:44:06.937064
14977	5	12	2	2013-12-02	YOUR STOCKS	2014-08-31 11:44:06.9655	2014-08-31 11:44:06.9655
14978	5	13	2	2013-12-02	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:06.992858	2014-08-31 11:44:06.992858
14979	5	14	2	2013-12-02	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:07.029556	2014-08-31 11:44:07.029556
14980	5	15	2	2013-12-02	AFTER THE BELL	2014-08-31 11:44:07.057198	2014-08-31 11:44:07.057198
14981	5	16	2	2013-12-02	REPORTERS DIARY	2014-08-31 11:44:07.084282	2014-08-31 11:44:07.084282
14982	5	17	2	2013-12-02	MARKET BUZZ	2014-08-31 11:44:07.109923	2014-08-31 11:44:07.109923
14983	5	18	2	2013-12-02	REPORTERS DIARY	2014-08-31 11:44:07.417732	2014-08-31 11:44:07.417732
14984	5	19	2	2013-12-02	WHATS HOT	2014-08-31 11:44:07.449133	2014-08-31 11:44:07.449133
14985	5	20	2	2013-12-02	INDIA BUSINESS HOUR	2014-08-31 11:44:07.477251	2014-08-31 11:44:07.477251
14986	5	21	2	2013-12-02	YOUR WORLD AT 10	2014-08-31 11:44:07.504086	2014-08-31 11:44:07.504086
14987	5	21	2	2013-12-02	INDIA BUSINESS HOUR	2014-08-31 11:44:07.535083	2014-08-31 11:44:07.535083
14988	5	5	2	2013-12-03	CLOSINGBELL	2014-08-31 11:44:07.562302	2014-08-31 11:44:07.562302
14989	5	5	2	2013-12-03	CLOSINGBELL	2014-08-31 11:44:07.588876	2014-08-31 11:44:07.588876
14990	5	6	2	2013-12-03	POWER BREAKFAST	2014-08-31 11:44:07.61455	2014-08-31 11:44:07.61455
14991	5	7	2	2013-12-03	BAZAAR OPEN EXCHANGE	2014-08-31 11:44:07.648928	2014-08-31 11:44:07.648928
14992	5	8	2	2013-12-03	BAZAAR OPEN EXCHANGE	2014-08-31 11:44:07.963154	2014-08-31 11:44:07.963154
14993	5	9	2	2013-12-03	MARKETS AND MACROS	2014-08-31 11:44:07.991574	2014-08-31 11:44:07.991574
14994	5	10	2	2013-12-03	MARKETS AND MACROS	2014-08-31 11:44:08.023917	2014-08-31 11:44:08.023917
14995	5	11	2	2013-12-03	BUSINESS LUNCH	2014-08-31 11:44:08.051159	2014-08-31 11:44:08.051159
14996	5	12	2	2013-12-03	MIDCAP RADAR	2014-08-31 11:44:08.078205	2014-08-31 11:44:08.078205
14997	5	13	2	2013-12-03	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:08.10357	2014-08-31 11:44:08.10357
14998	5	14	2	2013-12-03	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:08.137738	2014-08-31 11:44:08.137738
14999	5	15	2	2013-12-03	AFTER THE BELL	2014-08-31 11:44:08.163467	2014-08-31 11:44:08.163467
15000	5	15	2	2013-12-03	MARKET BUZZ	2014-08-31 11:44:08.472204	2014-08-31 11:44:08.472204
15001	5	16	2	2013-12-03	REPORTERS DIARY	2014-08-31 11:44:08.504359	2014-08-31 11:44:08.504359
15002	5	17	2	2013-12-03	REPORTERS DIARY	2014-08-31 11:44:08.539722	2014-08-31 11:44:08.539722
15003	5	18	2	2013-12-03	STORYBOARD	2014-08-31 11:44:08.568748	2014-08-31 11:44:08.568748
15004	5	19	2	2013-12-03	WHATS HOT	2014-08-31 11:44:08.597365	2014-08-31 11:44:08.597365
15005	5	20	2	2013-12-03	INDIA BUSINESS HOUR	2014-08-31 11:44:08.637735	2014-08-31 11:44:08.637735
15006	5	21	2	2013-12-03	MARKETS TODAY	2014-08-31 11:44:08.665448	2014-08-31 11:44:08.665448
15007	5	22	2	2013-12-03	INDIA BUSINESS HOUR	2014-08-31 11:44:08.692756	2014-08-31 11:44:08.692756
15008	5	5	2	2013-12-04	CLOSINGBELL	2014-08-31 11:44:09.013763	2014-08-31 11:44:09.013763
15009	5	6	2	2013-12-04	POWER BREAKFAST	2014-08-31 11:44:09.046019	2014-08-31 11:44:09.046019
15010	5	6	2	2013-12-04	POWER BREAKFAST	2014-08-31 11:44:09.078141	2014-08-31 11:44:09.078141
15011	5	7	2	2013-12-04	MORNING CALL	2014-08-31 11:44:09.105557	2014-08-31 11:44:09.105557
15012	5	7	2	2013-12-04	BAZAAR OPEN EXCHANGE	2014-08-31 11:44:09.137174	2014-08-31 11:44:09.137174
15013	5	8	2	2013-12-04	BAZAAR OPEN EXCHANGE	2014-08-31 11:44:09.16548	2014-08-31 11:44:09.16548
15014	5	9	2	2013-12-04	TRADERS ONLY	2014-08-31 11:44:09.191879	2014-08-31 11:44:09.191879
15015	5	11	2	2013-12-04	MARKETS AND MACROS	2014-08-31 11:44:09.217078	2014-08-31 11:44:09.217078
15016	5	12	2	2013-12-04	BUSINESS LUNCH	2014-08-31 11:44:09.529574	2014-08-31 11:44:09.529574
15017	5	12	2	2013-12-04	MIDCAP RADAR	2014-08-31 11:44:09.560468	2014-08-31 11:44:09.560468
15018	5	13	2	2013-12-04	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:09.586937	2014-08-31 11:44:09.586937
15019	5	14	2	2013-12-04	AFTER THE BELL	2014-08-31 11:44:09.612526	2014-08-31 11:44:09.612526
15020	5	15	2	2013-12-04	REPORTERS DIARY	2014-08-31 11:44:09.650848	2014-08-31 11:44:09.650848
15021	5	16	2	2013-12-04	BATTLE FOR THE STATES	2014-08-31 11:44:09.678668	2014-08-31 11:44:09.678668
15022	5	17	2	2013-12-04	REPORTERS DIARY	2014-08-31 11:44:09.703977	2014-08-31 11:44:09.703977
15023	5	17	2	2013-12-04	BATTLE FOR THE STATES	2014-08-31 11:44:09.734247	2014-08-31 11:44:09.734247
15024	5	18	2	2013-12-04	WHATS HOT	2014-08-31 11:44:10.037883	2014-08-31 11:44:10.037883
15025	5	19	2	2013-12-04	BATTLE FOR RAJASTHAN	2014-08-31 11:44:10.066271	2014-08-31 11:44:10.066271
15026	5	20	2	2013-12-04	INDIA BUSINESS HOUR	2014-08-31 11:44:10.093643	2014-08-31 11:44:10.093643
15027	5	21	2	2013-12-04	BATTLE FOR THE STATES	2014-08-31 11:44:10.12799	2014-08-31 11:44:10.12799
15028	5	5	2	2013-12-05	CLOSINGBELL	2014-08-31 11:44:10.154608	2014-08-31 11:44:10.154608
15029	5	5	2	2013-12-05	CLOSINGBELL	2014-08-31 11:44:10.181011	2014-08-31 11:44:10.181011
15030	5	6	2	2013-12-05	POWER BREAKFAST	2014-08-31 11:44:10.206494	2014-08-31 11:44:10.206494
15031	5	7	2	2013-12-05	BAZAAR OPEN EXCHANGE	2014-08-31 11:44:10.236385	2014-08-31 11:44:10.236385
15032	5	8	2	2013-12-05	BAZAAR OPEN EXCHANGE	2014-08-31 11:44:10.541039	2014-08-31 11:44:10.541039
15033	5	9	2	2013-12-05	TRADERS ONLY	2014-08-31 11:44:10.56922	2014-08-31 11:44:10.56922
15034	5	10	2	2013-12-05	MARKETS AND MACROS	2014-08-31 11:44:10.597299	2014-08-31 11:44:10.597299
15035	5	11	2	2013-12-05	MARKETS AND MACROS	2014-08-31 11:44:10.633406	2014-08-31 11:44:10.633406
15036	5	12	2	2013-12-05	MIDCAP RADAR	2014-08-31 11:44:10.662053	2014-08-31 11:44:10.662053
15037	5	13	2	2013-12-05	YOUR STOCKS	2014-08-31 11:44:10.694171	2014-08-31 11:44:10.694171
15038	5	14	2	2013-12-05	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:10.720799	2014-08-31 11:44:10.720799
15039	5	14	2	2013-12-05	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:10.747139	2014-08-31 11:44:10.747139
15040	5	15	2	2013-12-05	MARKET BUZZ	2014-08-31 11:44:10.771784	2014-08-31 11:44:10.771784
15041	5	16	2	2013-12-05	REPORTERS DIARY	2014-08-31 11:44:11.107392	2014-08-31 11:44:11.107392
15042	5	17	2	2013-12-05	MARKET BUZZ	2014-08-31 11:44:11.13851	2014-08-31 11:44:11.13851
15043	5	18	2	2013-12-05	LIME SEASON 5	2014-08-31 11:44:11.165384	2014-08-31 11:44:11.165384
15044	5	19	2	2013-12-05	WHATS HOT	2014-08-31 11:44:11.192045	2014-08-31 11:44:11.192045
15045	5	20	2	2013-12-05	INDIA BUSINESS HOUR	2014-08-31 11:44:11.218096	2014-08-31 11:44:11.218096
15046	5	21	2	2013-12-05	MARKETS TODAY	2014-08-31 11:44:11.248519	2014-08-31 11:44:11.248519
15047	5	5	2	2013-12-06	CLOSINGBELL	2014-08-31 11:44:11.274153	2014-08-31 11:44:11.274153
15048	5	5	2	2013-12-06	POWER BREAKFAST	2014-08-31 11:44:11.299115	2014-08-31 11:44:11.299115
15049	5	6	2	2013-12-06	POWER BREAKFAST	2014-08-31 11:44:11.608858	2014-08-31 11:44:11.608858
15050	5	7	2	2013-12-06	BAZAAR OPEN EXCHANGE	2014-08-31 11:44:11.640655	2014-08-31 11:44:11.640655
15051	5	9	2	2013-12-06	CORPORATE RADAR	2014-08-31 11:44:11.667136	2014-08-31 11:44:11.667136
15052	5	10	2	2013-12-06	MARKETS AND MACROS	2014-08-31 11:44:11.692779	2014-08-31 11:44:11.692779
15053	5	11	2	2013-12-06	MARKETS AND MACROS	2014-08-31 11:44:11.717358	2014-08-31 11:44:11.717358
15054	5	12	2	2013-12-06	BUSINESS LUNCH	2014-08-31 11:44:11.746308	2014-08-31 11:44:11.746308
15055	5	12	2	2013-12-06	MIDCAP RADAR	2014-08-31 11:44:11.772208	2014-08-31 11:44:11.772208
15056	5	13	2	2013-12-06	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:11.796549	2014-08-31 11:44:11.796549
15057	5	14	2	2013-12-06	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:12.105581	2014-08-31 11:44:12.105581
15058	5	14	2	2013-12-06	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:12.138333	2014-08-31 11:44:12.138333
15059	5	15	2	2013-12-06	AFTER THE BELL	2014-08-31 11:44:12.166356	2014-08-31 11:44:12.166356
15060	5	16	2	2013-12-06	REPORTERS DIARY	2014-08-31 11:44:12.193363	2014-08-31 11:44:12.193363
15061	5	17	2	2013-12-06	REPORTERS DIARY	2014-08-31 11:44:12.218983	2014-08-31 11:44:12.218983
15062	5	18	2	2013-12-06	SQUAWK BOX	2014-08-31 11:44:12.246552	2014-08-31 11:44:12.246552
15063	5	19	2	2013-12-06	WHATS HOT	2014-08-31 11:44:12.272088	2014-08-31 11:44:12.272088
15064	5	20	2	2013-12-06	INDIA BUSINESS HOUR	2014-08-31 11:44:12.296729	2014-08-31 11:44:12.296729
15065	5	21	2	2013-12-06	THE FIRM	2014-08-31 11:44:12.589656	2014-08-31 11:44:12.589656
15066	5	8	2	2013-12-07	BUSINESS SATURDAY	2014-08-31 11:44:12.61586	2014-08-31 11:44:12.61586
15067	5	9	2	2013-12-07	INDIANOMICS	2014-08-31 11:44:12.647014	2014-08-31 11:44:12.647014
15068	5	11	2	2013-12-07	BUSINESS SATURDAY	2014-08-31 11:44:12.673168	2014-08-31 11:44:12.673168
15069	5	12	2	2013-12-07	OVERDRIVE	2014-08-31 11:44:12.699069	2014-08-31 11:44:12.699069
15070	5	13	2	2013-12-07	STORYBOARD	2014-08-31 11:44:12.728564	2014-08-31 11:44:12.728564
15071	5	14	2	2013-12-07	YOUNG TURKS	2014-08-31 11:44:12.753561	2014-08-31 11:44:12.753561
15072	5	15	2	2013-12-07	INDIANOMICS	2014-08-31 11:44:12.778287	2014-08-31 11:44:12.778287
15073	5	16	2	2013-12-07	TEXTILE CONCLAVE 2013 BRAND INDIA	2014-08-31 11:44:13.073897	2014-08-31 11:44:13.073897
15074	5	10	2	2013-12-08	BATTLE FOR THE STATES	2014-08-31 11:44:13.100751	2014-08-31 11:44:13.100751
15075	5	11	2	2013-12-08	BATTLE FOR THE STATES	2014-08-31 11:44:13.131629	2014-08-31 11:44:13.131629
15076	5	12	2	2013-12-08	BATTLE FOR THE STATES	2014-08-31 11:44:13.157931	2014-08-31 11:44:13.157931
15077	5	13	2	2013-12-08	BATTLE FOR THE STATES	2014-08-31 11:44:13.184166	2014-08-31 11:44:13.184166
15078	5	13	2	2013-12-08	BATTLE FOR THE STATES	2014-08-31 11:44:13.210558	2014-08-31 11:44:13.210558
15079	5	14	2	2013-12-08	BATTLE FOR THE STATES	2014-08-31 11:44:13.239897	2014-08-31 11:44:13.239897
15080	5	14	2	2013-12-08	BATTLE FOR THE STATES	2014-08-31 11:44:13.265122	2014-08-31 11:44:13.265122
15081	5	5	2	2013-12-09	CLOSINGBELL	2014-08-31 11:44:13.577504	2014-08-31 11:44:13.577504
15082	5	5	2	2013-12-09	CLOSINGBELL	2014-08-31 11:44:13.605514	2014-08-31 11:44:13.605514
15083	5	6	2	2013-12-09	POWER BREAKFAST	2014-08-31 11:44:13.636964	2014-08-31 11:44:13.636964
15084	5	7	2	2013-12-09	BAZAAR OPEN EXCHANGE	2014-08-31 11:44:13.66348	2014-08-31 11:44:13.66348
15085	5	9	2	2013-12-09	CORPORATE RADAR	2014-08-31 11:44:13.690892	2014-08-31 11:44:13.690892
15086	5	10	2	2013-12-09	MARKETS AND MACROS	2014-08-31 11:44:13.725983	2014-08-31 11:44:13.725983
15087	5	12	2	2013-12-09	BUSINESS LUNCH	2014-08-31 11:44:13.751775	2014-08-31 11:44:13.751775
15088	5	13	2	2013-12-09	YOUR STOCKS	2014-08-31 11:44:13.777739	2014-08-31 11:44:13.777739
15089	5	14	2	2013-12-09	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:13.801901	2014-08-31 11:44:13.801901
15090	5	15	2	2013-12-09	AFTER THE BELL	2014-08-31 11:44:14.11834	2014-08-31 11:44:14.11834
15091	5	16	2	2013-12-09	REPORTERS DIARY	2014-08-31 11:44:14.150464	2014-08-31 11:44:14.150464
15092	5	16	2	2013-12-09	MARKETS TODAY	2014-08-31 11:44:14.180568	2014-08-31 11:44:14.180568
15093	5	5	2	2013-12-10	CLOSINGBELL	2014-08-31 11:44:14.210454	2014-08-31 11:44:14.210454
15094	5	5	2	2013-12-10	CLOSINGBELL	2014-08-31 11:44:14.243601	2014-08-31 11:44:14.243601
15095	5	6	2	2013-12-10	POWER BREAKFAST	2014-08-31 11:44:14.271811	2014-08-31 11:44:14.271811
15096	5	7	2	2013-12-10	BAZAAR OPEN EXCHANGE	2014-08-31 11:44:14.297615	2014-08-31 11:44:14.297615
15097	5	9	2	2013-12-10	CORPORATE RADAR	2014-08-31 11:44:14.327021	2014-08-31 11:44:14.327021
15098	5	10	2	2013-12-10	MARKETS AND MACROS	2014-08-31 11:44:14.771837	2014-08-31 11:44:14.771837
15099	5	11	2	2013-12-10	MARKETS AND MACROS	2014-08-31 11:44:14.82603	2014-08-31 11:44:14.82603
15100	5	12	2	2013-12-10	BUSINESS LUNCH	2014-08-31 11:44:14.877963	2014-08-31 11:44:14.877963
15101	5	13	2	2013-12-10	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:14.923389	2014-08-31 11:44:14.923389
15102	5	14	2	2013-12-10	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:14.969749	2014-08-31 11:44:14.969749
15103	5	15	2	2013-12-10	MARKET BUZZ	2014-08-31 11:44:15.012405	2014-08-31 11:44:15.012405
15104	5	16	2	2013-12-10	MARKETS TODAY	2014-08-31 11:44:15.054345	2014-08-31 11:44:15.054345
15105	5	5	2	2013-12-11	CLOSINGBELL	2014-08-31 11:44:15.090723	2014-08-31 11:44:15.090723
15106	5	5	2	2013-12-11	POWER BREAKFAST	2014-08-31 11:44:15.453036	2014-08-31 11:44:15.453036
15107	5	6	2	2013-12-11	POWER BREAKFAST	2014-08-31 11:44:15.482619	2014-08-31 11:44:15.482619
15108	5	7	2	2013-12-11	MORNING CALL	2014-08-31 11:44:15.510144	2014-08-31 11:44:15.510144
15109	5	10	2	2013-12-11	MARKETS AND MACROS	2014-08-31 11:44:15.54686	2014-08-31 11:44:15.54686
15110	5	11	2	2013-12-11	MARKETS AND MACROS	2014-08-31 11:44:15.574626	2014-08-31 11:44:15.574626
15111	5	12	2	2013-12-11	MIDCAP RADAR	2014-08-31 11:44:15.602266	2014-08-31 11:44:15.602266
15112	5	13	2	2013-12-11	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:15.631638	2014-08-31 11:44:15.631638
15113	5	14	2	2013-12-11	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:15.656444	2014-08-31 11:44:15.656444
15114	5	15	2	2013-12-11	MARKET BUZZ	2014-08-31 11:44:15.941171	2014-08-31 11:44:15.941171
15115	5	16	2	2013-12-11	MARKETS TODAY	2014-08-31 11:44:15.968302	2014-08-31 11:44:15.968302
15116	5	5	2	2013-12-12	CLOSINGBELL	2014-08-31 11:44:15.99513	2014-08-31 11:44:15.99513
15117	5	5	2	2013-12-12	POWER BREAKFAST	2014-08-31 11:44:16.053361	2014-08-31 11:44:16.053361
15118	5	6	2	2013-12-12	POWER BREAKFAST	2014-08-31 11:44:16.088223	2014-08-31 11:44:16.088223
15119	5	7	2	2013-12-12	BAZAAR OPEN EXCHANGE	2014-08-31 11:44:16.114971	2014-08-31 11:44:16.114971
15120	5	9	2	2013-12-12	TRADERS ONLY	2014-08-31 11:44:16.147024	2014-08-31 11:44:16.147024
15121	5	10	2	2013-12-12	MARKETS AND MACROS	2014-08-31 11:44:16.172799	2014-08-31 11:44:16.172799
15122	5	11	2	2013-12-12	MARKETS AND MACROS	2014-08-31 11:44:16.46116	2014-08-31 11:44:16.46116
15123	5	12	2	2013-12-12	MIDCAP RADAR	2014-08-31 11:44:16.48806	2014-08-31 11:44:16.48806
15124	5	13	2	2013-12-12	YOUR STOCKS	2014-08-31 11:44:16.514664	2014-08-31 11:44:16.514664
15125	5	14	2	2013-12-12	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:16.550402	2014-08-31 11:44:16.550402
15126	5	14	2	2013-12-12	AFTER THE BELL	2014-08-31 11:44:16.582763	2014-08-31 11:44:16.582763
15127	5	16	2	2013-12-12	REPORTERS DIARY	2014-08-31 11:44:16.618352	2014-08-31 11:44:16.618352
15128	5	5	2	2013-12-13	CLOSINGBELL	2014-08-31 11:44:16.647718	2014-08-31 11:44:16.647718
15129	5	5	2	2013-12-13	POWER BREAKFAST	2014-08-31 11:44:16.672327	2014-08-31 11:44:16.672327
15130	5	6	2	2013-12-13	POWER BREAKFAST	2014-08-31 11:44:16.953478	2014-08-31 11:44:16.953478
15131	5	7	2	2013-12-13	MORNING CALL	2014-08-31 11:44:16.981925	2014-08-31 11:44:16.981925
15132	5	9	2	2013-12-13	CORPORATE RADAR	2014-08-31 11:44:17.00833	2014-08-31 11:44:17.00833
15133	5	10	2	2013-12-13	MARKETS AND MACROS	2014-08-31 11:44:17.04339	2014-08-31 11:44:17.04339
15134	5	13	2	2013-12-13	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:17.071582	2014-08-31 11:44:17.071582
15135	5	14	2	2013-12-13	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:17.0978	2014-08-31 11:44:17.0978
15136	5	15	2	2013-12-13	AFTER THE BELL	2014-08-31 11:44:17.128037	2014-08-31 11:44:17.128037
15137	5	16	2	2013-12-13	REPORTERS DIARY	2014-08-31 11:44:17.152232	2014-08-31 11:44:17.152232
15138	5	16	2	2013-12-13	MARKETS TODAY	2014-08-31 11:44:17.177264	2014-08-31 11:44:17.177264
15139	5	8	2	2013-12-14	BUSINESS SATURDAY	2014-08-31 11:44:17.479632	2014-08-31 11:44:17.479632
15140	5	9	2	2013-12-14	INDIANOMICS	2014-08-31 11:44:17.511044	2014-08-31 11:44:17.511044
15141	5	11	2	2013-12-14	BUSINESS SATURDAY	2014-08-31 11:44:17.544615	2014-08-31 11:44:17.544615
15142	5	12	2	2013-12-14	MOTILAL OSWAL 18TH WEALTH CREATION STUDY	2014-08-31 11:44:17.572864	2014-08-31 11:44:17.572864
15143	5	13	2	2013-12-14	INDIANOMICS	2014-08-31 11:44:17.601041	2014-08-31 11:44:17.601041
15144	5	15	2	2013-12-14	TEXTILE CONCLAVE 2013 BRAND INDIA	2014-08-31 11:44:17.635765	2014-08-31 11:44:17.635765
15145	5	16	2	2013-12-14	TATA CRUCIBLE THE BUSI Q	2014-08-31 11:44:17.663447	2014-08-31 11:44:17.663447
15146	5	8	2	2013-12-15	PRIME PROPERTY	2014-08-31 11:44:17.6893	2014-08-31 11:44:17.6893
15147	5	9	2	2013-12-15	TAKING STOCK	2014-08-31 11:44:17.992395	2014-08-31 11:44:17.992395
15148	5	11	2	2013-12-15	YOUNG TURKS	2014-08-31 11:44:18.024003	2014-08-31 11:44:18.024003
15149	5	12	2	2013-12-15	MOTILAL OSWAL 18TH WEALTH CREATION STUDY	2014-08-31 11:44:18.051067	2014-08-31 11:44:18.051067
15150	5	14	2	2013-12-15	STORYBOARD	2014-08-31 11:44:18.078543	2014-08-31 11:44:18.078543
15151	5	15	2	2013-12-15	MAHINDRA THE WAR ROOM	2014-08-31 11:44:18.105445	2014-08-31 11:44:18.105445
15152	5	16	2	2013-12-15	TEXTILE CONCLAVE 2013 BRAND INDIA	2014-08-31 11:44:18.137412	2014-08-31 11:44:18.137412
15153	5	10	2	2013-12-16	MARKETS AND MACROS	2014-08-31 11:44:18.163102	2014-08-31 11:44:18.163102
15154	5	12	2	2013-12-16	MIDCAP RADAR	2014-08-31 11:44:18.191725	2014-08-31 11:44:18.191725
15155	5	13	2	2013-12-16	YOUR STOCKS	2014-08-31 11:44:18.496079	2014-08-31 11:44:18.496079
15156	5	14	2	2013-12-16	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:18.527611	2014-08-31 11:44:18.527611
15157	5	14	2	2013-12-16	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:18.555505	2014-08-31 11:44:18.555505
15158	5	15	2	2013-12-16	AFTER THE BELL	2014-08-31 11:44:18.585265	2014-08-31 11:44:18.585265
15159	5	16	2	2013-12-16	REPORTERS DIARY	2014-08-31 11:44:18.61163	2014-08-31 11:44:18.61163
15160	5	16	2	2013-12-16	MARKETS TODAY	2014-08-31 11:44:18.642507	2014-08-31 11:44:18.642507
15161	5	9	2	2013-12-17	CORPORATE RADAR	2014-08-31 11:44:18.671081	2014-08-31 11:44:18.671081
15162	5	10	2	2013-12-17	MARKETS AND MACROS	2014-08-31 11:44:18.697176	2014-08-31 11:44:18.697176
15163	5	11	2	2013-12-17	MARKETS AND MACROS	2014-08-31 11:44:19.010197	2014-08-31 11:44:19.010197
15164	5	12	2	2013-12-17	MIDCAP RADAR	2014-08-31 11:44:19.041519	2014-08-31 11:44:19.041519
15165	5	13	2	2013-12-17	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:19.070115	2014-08-31 11:44:19.070115
15166	5	14	2	2013-12-17	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:19.098074	2014-08-31 11:44:19.098074
15167	5	15	2	2013-12-17	MARKET BUZZ	2014-08-31 11:44:19.133407	2014-08-31 11:44:19.133407
15168	5	16	2	2013-12-17	MARKETS TODAY	2014-08-31 11:44:19.161627	2014-08-31 11:44:19.161627
15169	5	11	2	2013-12-18	MARKETS AND MACROS	2014-08-31 11:44:19.188951	2014-08-31 11:44:19.188951
15170	5	12	2	2013-12-18	BUSINESS LUNCH	2014-08-31 11:44:19.213718	2014-08-31 11:44:19.213718
15171	5	12	2	2013-12-18	MIDCAP RADAR	2014-08-31 11:44:19.542389	2014-08-31 11:44:19.542389
15172	5	13	2	2013-12-18	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:19.572768	2014-08-31 11:44:19.572768
15173	5	15	2	2013-12-18	AFTER THE BELL	2014-08-31 11:44:19.602716	2014-08-31 11:44:19.602716
15174	5	16	2	2013-12-18	MARKETS TODAY	2014-08-31 11:44:19.639313	2014-08-31 11:44:19.639313
15175	5	8	2	2013-12-19	BAZAAR OPEN EXCHANGE	2014-08-31 11:44:19.668758	2014-08-31 11:44:19.668758
15176	5	8	2	2013-12-19	CORPORATE RADAR	2014-08-31 11:44:19.695998	2014-08-31 11:44:19.695998
15177	5	9	2	2013-12-19	MARKETS AND MACROS	2014-08-31 11:44:19.729709	2014-08-31 11:44:19.729709
15178	5	11	2	2013-12-19	MARKETS AND MACROS	2014-08-31 11:44:19.756512	2014-08-31 11:44:19.756512
15179	5	12	2	2013-12-19	MIDCAP RADAR	2014-08-31 11:44:20.058138	2014-08-31 11:44:20.058138
15180	5	13	2	2013-12-19	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:20.084744	2014-08-31 11:44:20.084744
15181	5	14	2	2013-12-19	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:20.110685	2014-08-31 11:44:20.110685
15182	5	16	2	2013-12-19	REPORTERS DIARY	2014-08-31 11:44:20.141289	2014-08-31 11:44:20.141289
15183	5	9	2	2013-12-20	MARKETS AND MACROS	2014-08-31 11:44:20.167722	2014-08-31 11:44:20.167722
15184	5	11	2	2013-12-20	MARKETS AND MACROS	2014-08-31 11:44:20.194425	2014-08-31 11:44:20.194425
15185	5	12	2	2013-12-20	MIDCAP RADAR	2014-08-31 11:44:20.228212	2014-08-31 11:44:20.228212
15186	5	13	2	2013-12-20	YOUR STOCKS	2014-08-31 11:44:20.253153	2014-08-31 11:44:20.253153
15187	5	14	2	2013-12-20	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:20.553957	2014-08-31 11:44:20.553957
15188	5	15	2	2013-12-20	AFTER THE BELL	2014-08-31 11:44:20.590357	2014-08-31 11:44:20.590357
15189	5	16	2	2013-12-20	REPORTERS DIARY	2014-08-31 11:44:20.625355	2014-08-31 11:44:20.625355
15190	5	8	2	2013-12-21	FUNANCIAL QUEST 3	2014-08-31 11:44:20.652406	2014-08-31 11:44:20.652406
15191	5	9	2	2013-12-21	YOUNG TURKS	2014-08-31 11:44:20.679965	2014-08-31 11:44:20.679965
15192	5	11	2	2013-12-21	NSE FIN WIZ	2014-08-31 11:44:20.70783	2014-08-31 11:44:20.70783
15193	5	12	2	2013-12-21	LALIT MODI NEW INNINGS	2014-08-31 11:44:20.741885	2014-08-31 11:44:20.741885
15194	5	13	2	2013-12-21	LIME SEASON 5	2014-08-31 11:44:20.769111	2014-08-31 11:44:20.769111
15195	5	14	2	2013-12-21	INVESTOR CAMP	2014-08-31 11:44:20.793986	2014-08-31 11:44:20.793986
15196	5	16	2	2013-12-21	MAHINDRA THE WAR ROOM	2014-08-31 11:44:21.147233	2014-08-31 11:44:21.147233
15197	5	8	2	2013-12-22	THE FIRM	2014-08-31 11:44:21.176228	2014-08-31 11:44:21.176228
15198	5	10	2	2013-12-22	STORYBOARD	2014-08-31 11:44:21.204646	2014-08-31 11:44:21.204646
15199	5	11	2	2013-12-22	INDIANOMICS	2014-08-31 11:44:21.241066	2014-08-31 11:44:21.241066
15200	5	12	2	2013-12-22	CHANNEL JAPAN	2014-08-31 11:44:21.268555	2014-08-31 11:44:21.268555
15201	5	14	2	2013-12-22	INVESTOTHON 2013	2014-08-31 11:44:21.297136	2014-08-31 11:44:21.297136
15202	5	15	2	2013-12-22	MAHINDRA THE WAR ROOM	2014-08-31 11:44:21.33159	2014-08-31 11:44:21.33159
15203	5	16	2	2013-12-22	MAHINDRA THE WAR ROOM	2014-08-31 11:44:21.35734	2014-08-31 11:44:21.35734
15204	5	9	2	2013-12-23	CORPORATE RADAR	2014-08-31 11:44:21.676675	2014-08-31 11:44:21.676675
15205	5	12	2	2013-12-23	BUSINESS LUNCH	2014-08-31 11:44:21.704989	2014-08-31 11:44:21.704989
15206	5	12	2	2013-12-23	BUSINESS LUNCH	2014-08-31 11:44:21.736383	2014-08-31 11:44:21.736383
15207	5	13	2	2013-12-23	YOUR STOCKS	2014-08-31 11:44:21.764862	2014-08-31 11:44:21.764862
15208	5	14	2	2013-12-23	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:21.793788	2014-08-31 11:44:21.793788
15209	5	16	2	2013-12-23	MARKETS TODAY	2014-08-31 11:44:21.824792	2014-08-31 11:44:21.824792
15210	5	9	2	2013-12-24	TRADERS ONLY	2014-08-31 11:44:21.852019	2014-08-31 11:44:21.852019
15211	5	10	2	2013-12-24	MARKETS AND MACROS	2014-08-31 11:44:21.87884	2014-08-31 11:44:21.87884
15212	5	12	2	2013-12-24	BUSINESS LUNCH	2014-08-31 11:44:22.187204	2014-08-31 11:44:22.187204
15213	5	14	2	2013-12-24	INDIA MARKETWRAP CLOSING	2014-08-31 11:44:22.214316	2014-08-31 11:44:22.214316
15214	5	15	2	2013-12-24	MARKET BUZZ	2014-08-31 11:44:22.248412	2014-08-31 11:44:22.248412
15215	5	16	2	2013-12-24	REPORTERS DIARY	2014-08-31 11:44:22.275037	2014-08-31 11:44:22.275037
15216	5	6	3	2013-11-29	IBN MORNING	2014-08-31 11:44:22.301866	2014-08-31 11:44:22.301866
15217	5	6	3	2013-11-29	IBN MORNING	2014-08-31 11:44:22.333171	2014-08-31 11:44:22.333171
15218	5	6	3	2013-11-29	BREAKFAST WITH INDIA	2014-08-31 11:44:22.359704	2014-08-31 11:44:22.359704
15219	5	7	3	2013-11-29	BREAKFAST WITH INDIA	2014-08-31 11:44:22.385531	2014-08-31 11:44:22.385531
15220	5	7	3	2013-11-29	BREAKFAST WITH INDIA	2014-08-31 11:44:22.70889	2014-08-31 11:44:22.70889
15221	5	8	3	2013-11-29	BREAKFAST WITH INDIA	2014-08-31 11:44:22.737404	2014-08-31 11:44:22.737404
15222	5	8	3	2013-11-29	BREAKFAST WITH INDIA	2014-08-31 11:44:22.765385	2014-08-31 11:44:22.765385
15223	5	8	3	2013-11-29	NEWS	2014-08-31 11:44:22.79427	2014-08-31 11:44:22.79427
15224	5	18	3	2013-11-29	THE ANAND INTERVIEW	2014-08-31 11:44:22.829807	2014-08-31 11:44:22.829807
15225	5	18	3	2013-11-29	STOP THIS SHAME	2014-08-31 11:44:22.858972	2014-08-31 11:44:22.858972
15226	5	19	3	2013-11-29	STOP THIS SHAME	2014-08-31 11:44:22.887654	2014-08-31 11:44:22.887654
15227	5	19	3	2013-11-29	INDIA AT 9PM	2014-08-31 11:44:22.913203	2014-08-31 11:44:22.913203
15228	5	20	3	2013-11-29	INDIA AT 9PM	2014-08-31 11:44:23.240842	2014-08-31 11:44:23.240842
15229	5	20	3	2013-11-29	BATTLE FOR DELHI	2014-08-31 11:44:23.269576	2014-08-31 11:44:23.269576
15230	5	21	3	2013-11-29	BATTLE FOR DELHI	2014-08-31 11:44:23.296894	2014-08-31 11:44:23.296894
15231	5	21	3	2013-11-29	LATE NIGHT EDITION	2014-08-31 11:44:23.327658	2014-08-31 11:44:23.327658
15232	5	6	3	2013-11-30	IBN MORNING	2014-08-31 11:44:23.354588	2014-08-31 11:44:23.354588
15233	5	7	3	2013-11-30	IBN MORNING	2014-08-31 11:44:23.381692	2014-08-31 11:44:23.381692
15234	5	8	3	2013-11-30	IBN MORNING	2014-08-31 11:44:23.408287	2014-08-31 11:44:23.408287
15235	5	9	3	2013-11-30	NEWS	2014-08-31 11:44:23.43808	2014-08-31 11:44:23.43808
15236	5	10	3	2013-11-30	BATTLE FOR DELHI	2014-08-31 11:44:23.742381	2014-08-31 11:44:23.742381
15237	5	13	3	2013-11-30	NOW SHOWING	2014-08-31 11:44:23.772173	2014-08-31 11:44:23.772173
15238	5	15	3	2013-11-30	NEWS	2014-08-31 11:44:23.80034	2014-08-31 11:44:23.80034
15239	5	17	3	2013-11-30	TATA MUTUAL FUND SIMPLY FINANCE QUIZ	2014-08-31 11:44:23.830189	2014-08-31 11:44:23.830189
15240	5	17	3	2013-11-30	TATA MUTUAL FUND SIMPLY FINANCE QUIZ	2014-08-31 11:44:23.856807	2014-08-31 11:44:23.856807
15241	5	18	3	2013-11-30	BATTLE FOR DELHI	2014-08-31 11:44:23.882946	2014-08-31 11:44:23.882946
15242	5	19	3	2013-11-30	NEWS	2014-08-31 11:44:23.909783	2014-08-31 11:44:23.909783
15243	5	20	3	2013-11-30	THE WEEK THAT WASNT WITH CYRUS	2014-08-31 11:44:23.944327	2014-08-31 11:44:23.944327
15244	5	21	3	2013-11-30	E LOUNGE UNWIND	2014-08-31 11:44:23.968988	2014-08-31 11:44:23.968988
15245	5	22	3	2013-11-30	BATTLE FOR DELHI	2014-08-31 11:44:24.276226	2014-08-31 11:44:24.276226
15246	5	6	3	2013-12-01	IBN MORNING	2014-08-31 11:44:24.304501	2014-08-31 11:44:24.304501
15247	5	7	3	2013-12-01	IBN MORNING	2014-08-31 11:44:24.335583	2014-08-31 11:44:24.335583
15248	5	8	3	2013-12-01	NOW SHOWING	2014-08-31 11:44:24.362219	2014-08-31 11:44:24.362219
15249	5	8	3	2013-12-01	SENIOR CITIZEN AWARDS	2014-08-31 11:44:24.389394	2014-08-31 11:44:24.389394
15250	5	9	3	2013-12-01	THE WEEK THAT WASNT WITH CYRUS	2014-08-31 11:44:24.415601	2014-08-31 11:44:24.415601
15251	5	10	3	2013-12-01	ARCHITECTS OF CHANGE	2014-08-31 11:44:24.445688	2014-08-31 11:44:24.445688
15252	5	11	3	2013-12-01	SHINING SCHOOLS OF INDIA	2014-08-31 11:44:24.471163	2014-08-31 11:44:24.471163
15253	5	12	3	2013-12-01	E LOUNGE UNWIND	2014-08-31 11:44:24.782778	2014-08-31 11:44:24.782778
15254	5	13	3	2013-12-01	THE WEEK THAT WASNT WITH CYRUS	2014-08-31 11:44:24.810245	2014-08-31 11:44:24.810245
15255	5	15	3	2013-12-01	BATTLE FOR DELHI	2014-08-31 11:44:24.842272	2014-08-31 11:44:24.842272
15256	5	16	3	2013-12-01	TATA MUTUAL FUND SIMPLY FINANCE QUIZ	2014-08-31 11:44:24.871281	2014-08-31 11:44:24.871281
15257	5	17	3	2013-12-01	PEARSON TEACHING AWARDS	2014-08-31 11:44:24.899094	2014-08-31 11:44:24.899094
15258	5	18	3	2013-12-01	BATTLE FOR DELHI	2014-08-31 11:44:24.929692	2014-08-31 11:44:24.929692
15259	5	20	3	2013-12-01	BATTLE FOR DELHI	2014-08-31 11:44:24.95662	2014-08-31 11:44:24.95662
15260	5	6	3	2013-12-02	IBN MORNING	2014-08-31 11:44:24.982308	2014-08-31 11:44:24.982308
15261	5	6	3	2013-12-02	IBN MORNING	2014-08-31 11:44:25.289944	2014-08-31 11:44:25.289944
15262	5	6	3	2013-12-02	BREAKFAST WITH INDIA	2014-08-31 11:44:25.317359	2014-08-31 11:44:25.317359
15263	5	7	3	2013-12-02	BREAKFAST WITH INDIA	2014-08-31 11:44:25.348062	2014-08-31 11:44:25.348062
15264	5	7	3	2013-12-02	BREAKFAST WITH INDIA	2014-08-31 11:44:25.374818	2014-08-31 11:44:25.374818
15265	5	8	3	2013-12-02	BREAKFAST WITH INDIA	2014-08-31 11:44:25.401882	2014-08-31 11:44:25.401882
15266	5	8	3	2013-12-02	BREAKFAST WITH INDIA	2014-08-31 11:44:25.432304	2014-08-31 11:44:25.432304
15267	5	8	3	2013-12-02	NEWS	2014-08-31 11:44:25.458166	2014-08-31 11:44:25.458166
15268	5	18	3	2013-12-02	IBN 7	2014-08-31 11:44:25.485023	2014-08-31 11:44:25.485023
15269	5	18	3	2013-12-02	IBN SPORTS	2014-08-31 11:44:25.792366	2014-08-31 11:44:25.792366
15270	5	19	3	2013-12-02	THE LAST WORD	2014-08-31 11:44:25.823996	2014-08-31 11:44:25.823996
15271	5	20	3	2013-12-02	INDIA AT 9PM	2014-08-31 11:44:25.851123	2014-08-31 11:44:25.851123
15272	5	20	3	2013-12-02	HT LEADERSHIP SUMMIT DISCUSSIO	2014-08-31 11:44:25.878137	2014-08-31 11:44:25.878137
15273	5	21	3	2013-12-02	HT LEADERSHIP SUMMIT DISCUSSIO	2014-08-31 11:44:25.905319	2014-08-31 11:44:25.905319
15274	5	21	3	2013-12-02	HT LEADERSHIP SUMMIT DISCUSSIO	2014-08-31 11:44:25.9363	2014-08-31 11:44:25.9363
15275	5	21	3	2013-12-02	LATE NIGHT EDITION	2014-08-31 11:44:25.961722	2014-08-31 11:44:25.961722
15276	5	6	3	2013-12-03	IBN MORNING	2014-08-31 11:44:25.986634	2014-08-31 11:44:25.986634
15277	5	6	3	2013-12-03	IBN MORNING	2014-08-31 11:44:26.313915	2014-08-31 11:44:26.313915
15278	5	6	3	2013-12-03	BREAKFAST WITH INDIA	2014-08-31 11:44:26.347433	2014-08-31 11:44:26.347433
15279	5	7	3	2013-12-03	BREAKFAST WITH INDIA	2014-08-31 11:44:26.374798	2014-08-31 11:44:26.374798
15280	5	7	3	2013-12-03	BREAKFAST WITH INDIA	2014-08-31 11:44:26.401546	2014-08-31 11:44:26.401546
15281	5	7	3	2013-12-03	BREAKFAST WITH INDIA	2014-08-31 11:44:26.42803	2014-08-31 11:44:26.42803
15282	5	8	3	2013-12-03	BREAKFAST WITH INDIA	2014-08-31 11:44:26.454521	2014-08-31 11:44:26.454521
15283	5	8	3	2013-12-03	BREAKFAST WITH INDIA	2014-08-31 11:44:26.481151	2014-08-31 11:44:26.481151
15284	5	18	3	2013-12-03	IBN 7	2014-08-31 11:44:26.507175	2014-08-31 11:44:26.507175
15285	5	18	3	2013-12-03	IBN SPORTS	2014-08-31 11:44:26.81162	2014-08-31 11:44:26.81162
15286	5	18	3	2013-12-03	NEWS 360	2014-08-31 11:44:26.844465	2014-08-31 11:44:26.844465
15287	5	20	3	2013-12-03	INDIA AT 9PM	2014-08-31 11:44:26.872893	2014-08-31 11:44:26.872893
15288	5	21	3	2013-12-03	IN CONVERSATION WITH AMITABH BACHCHAN	2014-08-31 11:44:26.900179	2014-08-31 11:44:26.900179
15289	5	21	3	2013-12-03	IN CONVERSATION WITH AMITABH BACHCHAN	2014-08-31 11:44:26.931234	2014-08-31 11:44:26.931234
15290	5	21	3	2013-12-03	LATE NIGHT EDITION	2014-08-31 11:44:26.958736	2014-08-31 11:44:26.958736
15291	5	21	3	2013-12-03	LATE NIGHT EDITION	2014-08-31 11:44:26.98518	2014-08-31 11:44:26.98518
15292	5	6	3	2013-12-04	IBN MORNING	2014-08-31 11:44:27.011831	2014-08-31 11:44:27.011831
15293	5	6	3	2013-12-04	IBN MORNING	2014-08-31 11:44:27.042271	2014-08-31 11:44:27.042271
15294	5	6	3	2013-12-04	IBN MORNING	2014-08-31 11:44:27.356244	2014-08-31 11:44:27.356244
15295	5	7	3	2013-12-04	BREAKFAST WITH INDIA	2014-08-31 11:44:27.385176	2014-08-31 11:44:27.385176
15296	5	7	3	2013-12-04	BREAKFAST WITH INDIA	2014-08-31 11:44:27.413992	2014-08-31 11:44:27.413992
15297	5	7	3	2013-12-04	BREAKFAST WITH INDIA	2014-08-31 11:44:27.446884	2014-08-31 11:44:27.446884
15298	5	8	3	2013-12-04	BREAKFAST WITH INDIA	2014-08-31 11:44:27.476456	2014-08-31 11:44:27.476456
15299	5	8	3	2013-12-04	NEWS	2014-08-31 11:44:27.505185	2014-08-31 11:44:27.505185
15300	5	18	3	2013-12-04	BATTLE FOR MADHYA PRADESH	2014-08-31 11:44:27.536217	2014-08-31 11:44:27.536217
15301	5	18	3	2013-12-04	BATTLE FOR MADHYA PRADESH	2014-08-31 11:44:27.562166	2014-08-31 11:44:27.562166
15302	5	18	3	2013-12-04	BATTLE FOR RAJASTHAN	2014-08-31 11:44:27.876427	2014-08-31 11:44:27.876427
15303	5	19	3	2013-12-04	BATTLE FOR RAJASTHAN	2014-08-31 11:44:27.904241	2014-08-31 11:44:27.904241
15304	5	20	3	2013-12-04	BATTLE FOR THE STATES-ELECTION TRACKER	2014-08-31 11:44:27.936338	2014-08-31 11:44:27.936338
15305	5	20	3	2013-12-04	BATTLE FOR THE STATES-ELECTION TRACKER	2014-08-31 11:44:27.964944	2014-08-31 11:44:27.964944
15306	5	21	3	2013-12-04	BATTLE FOR THE STATES-ELECTION TRACKER	2014-08-31 11:44:27.99285	2014-08-31 11:44:27.99285
15307	5	6	3	2013-12-05	IBN MORNING	2014-08-31 11:44:28.024353	2014-08-31 11:44:28.024353
15308	5	6	3	2013-12-05	IBN MORNING	2014-08-31 11:44:28.051616	2014-08-31 11:44:28.051616
15309	5	6	3	2013-12-05	BREAKFAST WITH INDIA	2014-08-31 11:44:28.078498	2014-08-31 11:44:28.078498
15310	5	7	3	2013-12-05	BREAKFAST WITH INDIA	2014-08-31 11:44:28.396687	2014-08-31 11:44:28.396687
15311	5	7	3	2013-12-05	BREAKFAST WITH INDIA	2014-08-31 11:44:28.429449	2014-08-31 11:44:28.429449
15312	5	7	3	2013-12-05	BREAKFAST WITH INDIA	2014-08-31 11:44:28.458543	2014-08-31 11:44:28.458543
15313	5	8	3	2013-12-05	BREAKFAST WITH INDIA	2014-08-31 11:44:28.491649	2014-08-31 11:44:28.491649
15314	5	8	3	2013-12-05	NEWS	2014-08-31 11:44:28.52296	2014-08-31 11:44:28.52296
15315	5	18	3	2013-12-05	IBN 7	2014-08-31 11:44:28.551805	2014-08-31 11:44:28.551805
15316	5	18	3	2013-12-05	IN CONVERSATION WITH AMITABH BACHCHAN	2014-08-31 11:44:28.578883	2014-08-31 11:44:28.578883
15317	5	19	3	2013-12-05	INDIA AT 9PM	2014-08-31 11:44:28.604935	2014-08-31 11:44:28.604935
15318	5	20	3	2013-12-05	INDIA AT 9PM	2014-08-31 11:44:28.924445	2014-08-31 11:44:28.924445
15319	5	21	3	2013-12-05	INDIA AT 9PM	2014-08-31 11:44:28.952925	2014-08-31 11:44:28.952925
15320	5	21	3	2013-12-05	HT LEADERSHIP SUMMIT-BEST OF S	2014-08-31 11:44:28.981047	2014-08-31 11:44:28.981047
15321	5	21	3	2013-12-05	HT LEADERSHIP SUMMIT-BEST OF S	2014-08-31 11:44:29.009065	2014-08-31 11:44:29.009065
15322	5	21	3	2013-12-05	LATE NIGHT EDITION	2014-08-31 11:44:29.041408	2014-08-31 11:44:29.041408
15323	5	6	3	2013-12-06	IBN MORNING	2014-08-31 11:44:29.069974	2014-08-31 11:44:29.069974
15324	5	6	3	2013-12-06	IBN MORNING	2014-08-31 11:44:29.099622	2014-08-31 11:44:29.099622
15325	5	6	3	2013-12-06	BREAKFAST WITH INDIA	2014-08-31 11:44:29.130593	2014-08-31 11:44:29.130593
15326	5	7	3	2013-12-06	BREAKFAST WITH INDIA	2014-08-31 11:44:29.434872	2014-08-31 11:44:29.434872
15327	5	7	3	2013-12-06	BREAKFAST WITH INDIA	2014-08-31 11:44:29.463102	2014-08-31 11:44:29.463102
15328	5	7	3	2013-12-06	BREAKFAST WITH INDIA	2014-08-31 11:44:29.489717	2014-08-31 11:44:29.489717
15329	5	8	3	2013-12-06	BREAKFAST WITH INDIA	2014-08-31 11:44:29.515886	2014-08-31 11:44:29.515886
15330	5	8	3	2013-12-06	NEWS	2014-08-31 11:44:29.550686	2014-08-31 11:44:29.550686
15331	5	18	3	2013-12-06	FAREWELL MANDELA	2014-08-31 11:44:29.577799	2014-08-31 11:44:29.577799
15332	5	18	3	2013-12-06	IBN SPORTS	2014-08-31 11:44:29.604234	2014-08-31 11:44:29.604234
15333	5	19	3	2013-12-06	BATTLE FOR DELHI	2014-08-31 11:44:29.63376	2014-08-31 11:44:29.63376
15334	5	19	3	2013-12-06	BATTLE FOR DELHI	2014-08-31 11:44:29.943156	2014-08-31 11:44:29.943156
15335	5	20	3	2013-12-06	BATTLE FOR DELHI	2014-08-31 11:44:29.970797	2014-08-31 11:44:29.970797
15336	5	21	3	2013-12-06	HT LEADERSHIP SUMMIT	2014-08-31 11:44:29.998474	2014-08-31 11:44:29.998474
15337	5	21	3	2013-12-06	NOW SHOWING	2014-08-31 11:44:30.030176	2014-08-31 11:44:30.030176
15338	5	21	3	2013-12-06	LATE NIGHT EDITION	2014-08-31 11:44:30.057256	2014-08-31 11:44:30.057256
15339	5	6	3	2013-12-07	IBN MORNING	2014-08-31 11:44:30.085662	2014-08-31 11:44:30.085662
15340	5	7	3	2013-12-07	BATTLE FOR DELHI	2014-08-31 11:44:30.110935	2014-08-31 11:44:30.110935
15341	5	11	3	2013-12-07	GOOD AFTERNOON INDIA	2014-08-31 11:44:30.140914	2014-08-31 11:44:30.140914
15342	5	12	3	2013-12-07	NEWS	2014-08-31 11:44:30.165309	2014-08-31 11:44:30.165309
15343	5	13	3	2013-12-07	NEWS	2014-08-31 11:44:30.49636	2014-08-31 11:44:30.49636
15344	5	18	3	2013-12-07	HT LEADERSHIP SUMMIT	2014-08-31 11:44:30.527057	2014-08-31 11:44:30.527057
15345	5	19	3	2013-12-07	HT LEADERSHIP SUMMIT	2014-08-31 11:44:30.554767	2014-08-31 11:44:30.554767
15346	5	19	3	2013-12-07	INDIA AT 9PM	2014-08-31 11:44:30.58319	2014-08-31 11:44:30.58319
15347	5	20	3	2013-12-07	HT LEADERSHIP SUMMIT	2014-08-31 11:44:30.61008	2014-08-31 11:44:30.61008
15348	5	21	3	2013-12-07	LATE NIGHT EDITION	2014-08-31 11:44:30.641501	2014-08-31 11:44:30.641501
15349	5	22	3	2013-12-07	LATE NIGHT EDITION	2014-08-31 11:44:30.66937	2014-08-31 11:44:30.66937
15350	5	22	3	2013-12-07	NOW SHOWING	2014-08-31 11:44:30.695697	2014-08-31 11:44:30.695697
15351	5	22	3	2013-12-07	LATE NIGHT EDITION	2014-08-31 11:44:31.04957	2014-08-31 11:44:31.04957
15352	5	22	3	2013-12-08	BATTLE FOR THE STATES	2014-08-31 11:44:31.082133	2014-08-31 11:44:31.082133
15353	5	22	3	2013-12-08	BATTLE FOR THE STATES	2014-08-31 11:44:31.110537	2014-08-31 11:44:31.110537
15354	5	6	3	2013-12-09	IBN MORNING	2014-08-31 11:44:31.148819	2014-08-31 11:44:31.148819
15355	5	6	3	2013-12-09	IBN MORNING	2014-08-31 11:44:31.178551	2014-08-31 11:44:31.178551
15356	5	6	3	2013-12-09	IBN MORNING	2014-08-31 11:44:31.205072	2014-08-31 11:44:31.205072
15357	5	7	3	2013-12-09	BREAKFAST WITH INDIA	2014-08-31 11:44:31.231771	2014-08-31 11:44:31.231771
15358	5	7	3	2013-12-09	BREAKFAST WITH INDIA	2014-08-31 11:44:31.257441	2014-08-31 11:44:31.257441
15359	5	8	3	2013-12-09	BREAKFAST WITH INDIA	2014-08-31 11:44:31.587375	2014-08-31 11:44:31.587375
15360	5	8	3	2013-12-09	NEWS	2014-08-31 11:44:31.614124	2014-08-31 11:44:31.614124
15361	5	18	3	2013-12-09	IBN 7	2014-08-31 11:44:31.64511	2014-08-31 11:44:31.64511
15362	5	18	3	2013-12-09	IBN SPORTS	2014-08-31 11:44:31.673096	2014-08-31 11:44:31.673096
15363	5	18	3	2013-12-09	NEWS 360	2014-08-31 11:44:31.700916	2014-08-31 11:44:31.700916
15364	5	19	3	2013-12-09	DEVILS ADVOCATE	2014-08-31 11:44:31.732222	2014-08-31 11:44:31.732222
15365	5	21	3	2013-12-09	INDIA AT 9PM	2014-08-31 11:44:31.758395	2014-08-31 11:44:31.758395
15366	5	21	3	2013-12-09	INDIAN OF THE YEAR 2013-SPORTS	2014-08-31 11:44:31.784072	2014-08-31 11:44:31.784072
15367	5	21	3	2013-12-09	LATE NIGHT EDITION	2014-08-31 11:44:32.089642	2014-08-31 11:44:32.089642
15368	5	6	3	2013-12-10	IBN MORNING	2014-08-31 11:44:32.11727	2014-08-31 11:44:32.11727
15369	5	6	3	2013-12-10	IBN MORNING	2014-08-31 11:44:32.149511	2014-08-31 11:44:32.149511
15370	5	6	3	2013-12-10	BREAKFAST WITH INDIA	2014-08-31 11:44:32.177882	2014-08-31 11:44:32.177882
15371	5	7	3	2013-12-10	BREAKFAST WITH INDIA	2014-08-31 11:44:32.206124	2014-08-31 11:44:32.206124
15372	5	7	3	2013-12-10	BREAKFAST WITH INDIA	2014-08-31 11:44:32.243227	2014-08-31 11:44:32.243227
15373	5	8	3	2013-12-10	BREAKFAST WITH INDIA	2014-08-31 11:44:32.273895	2014-08-31 11:44:32.273895
15374	5	8	3	2013-12-10	BREAKFAST WITH INDIA	2014-08-31 11:44:32.299729	2014-08-31 11:44:32.299729
15375	5	18	3	2013-12-10	IBN 7	2014-08-31 11:44:32.60341	2014-08-31 11:44:32.60341
15376	5	18	3	2013-12-10	THE IMRAN KHAN INTERVIEW	2014-08-31 11:44:32.636011	2014-08-31 11:44:32.636011
15377	5	19	3	2013-12-10	DEVILS ADVOCATE	2014-08-31 11:44:32.663461	2014-08-31 11:44:32.663461
15378	5	20	3	2013-12-10	INDIA AT 9PM	2014-08-31 11:44:32.690422	2014-08-31 11:44:32.690422
15379	5	21	3	2013-12-10	INDIA AT 9PM	2014-08-31 11:44:32.718078	2014-08-31 11:44:32.718078
15380	5	21	3	2013-12-10	INDIA AT 9PM	2014-08-31 11:44:32.748973	2014-08-31 11:44:32.748973
15381	5	21	3	2013-12-10	INDIAN OF THE YEAR 2013-BUSINESS	2014-08-31 11:44:32.775257	2014-08-31 11:44:32.775257
15382	5	6	3	2013-12-11	IBN MORNING	2014-08-31 11:44:32.800992	2014-08-31 11:44:32.800992
15383	5	6	3	2013-12-11	IBN MORNING	2014-08-31 11:44:33.107472	2014-08-31 11:44:33.107472
15384	5	6	3	2013-12-11	BREAKFAST WITH INDIA	2014-08-31 11:44:33.139579	2014-08-31 11:44:33.139579
15385	5	7	3	2013-12-11	BREAKFAST WITH INDIA	2014-08-31 11:44:33.168951	2014-08-31 11:44:33.168951
15386	5	7	3	2013-12-11	BREAKFAST WITH INDIA	2014-08-31 11:44:33.196724	2014-08-31 11:44:33.196724
15387	5	8	3	2013-12-11	BREAKFAST WITH INDIA	2014-08-31 11:44:33.228684	2014-08-31 11:44:33.228684
15388	5	8	3	2013-12-11	BREAKFAST WITH INDIA	2014-08-31 11:44:33.256438	2014-08-31 11:44:33.256438
15389	5	18	3	2013-12-11	GAY SEX ILLEGAL AGAIN	2014-08-31 11:44:33.282701	2014-08-31 11:44:33.282701
15390	5	18	3	2013-12-11	THE WEEK THAT WASNT WITH CYRUS	2014-08-31 11:44:33.310161	2014-08-31 11:44:33.310161
15391	5	19	3	2013-12-11	THE LAST WORD	2014-08-31 11:44:33.339983	2014-08-31 11:44:33.339983
15392	5	20	3	2013-12-11	FACE THE PEOPLE	2014-08-31 11:44:33.651442	2014-08-31 11:44:33.651442
15393	5	21	3	2013-12-11	INDIAN OF THE YEAR 13-ENTERTAINMENT	2014-08-31 11:44:33.679915	2014-08-31 11:44:33.679915
15394	5	6	3	2013-12-12	IBN MORNING	2014-08-31 11:44:33.707479	2014-08-31 11:44:33.707479
15395	5	6	3	2013-12-12	IBN MORNING	2014-08-31 11:44:33.734674	2014-08-31 11:44:33.734674
15396	5	7	3	2013-12-12	BREAKFAST WITH INDIA	2014-08-31 11:44:33.762031	2014-08-31 11:44:33.762031
15397	5	7	3	2013-12-12	BREAKFAST WITH INDIA	2014-08-31 11:44:33.788884	2014-08-31 11:44:33.788884
15398	5	8	3	2013-12-12	BREAKFAST WITH INDIA	2014-08-31 11:44:33.81395	2014-08-31 11:44:33.81395
15399	5	8	3	2013-12-12	BREAKFAST WITH INDIA	2014-08-31 11:44:33.843123	2014-08-31 11:44:33.843123
15400	5	8	3	2013-12-12	NEWS	2014-08-31 11:44:34.168795	2014-08-31 11:44:34.168795
15401	5	18	3	2013-12-12	IBN 7	2014-08-31 11:44:34.198651	2014-08-31 11:44:34.198651
15402	5	18	3	2013-12-12	IBN SPORTS	2014-08-31 11:44:34.230114	2014-08-31 11:44:34.230114
15403	5	19	3	2013-12-12	NEWS 360	2014-08-31 11:44:34.257976	2014-08-31 11:44:34.257976
15404	5	19	3	2013-12-12	DEVILS ADVOCATE	2014-08-31 11:44:34.285985	2014-08-31 11:44:34.285985
15405	5	21	3	2013-12-12	INDIA AT 9PM	2014-08-31 11:44:34.313037	2014-08-31 11:44:34.313037
15406	5	21	3	2013-12-12	INDIAN OF THE YEAR 13-PUBLIC SERVICE	2014-08-31 11:44:34.342857	2014-08-31 11:44:34.342857
15407	5	21	3	2013-12-12	LATE NIGHT EDITION	2014-08-31 11:44:34.369173	2014-08-31 11:44:34.369173
15408	5	6	3	2013-12-13	IBN MORNING	2014-08-31 11:44:34.685329	2014-08-31 11:44:34.685329
15409	5	6	3	2013-12-13	IBN MORNING	2014-08-31 11:44:34.714036	2014-08-31 11:44:34.714036
15410	5	6	3	2013-12-13	BREAKFAST WITH INDIA	2014-08-31 11:44:34.741827	2014-08-31 11:44:34.741827
15411	5	7	3	2013-12-13	BREAKFAST WITH INDIA	2014-08-31 11:44:34.769416	2014-08-31 11:44:34.769416
15412	5	7	3	2013-12-13	BREAKFAST WITH INDIA	2014-08-31 11:44:34.797142	2014-08-31 11:44:34.797142
15413	5	8	3	2013-12-13	BREAKFAST WITH INDIA	2014-08-31 11:44:34.828917	2014-08-31 11:44:34.828917
15414	5	8	3	2013-12-13	NEWS	2014-08-31 11:44:34.855323	2014-08-31 11:44:34.855323
15415	5	18	3	2013-12-13	IBN 7	2014-08-31 11:44:34.881616	2014-08-31 11:44:34.881616
15416	5	18	3	2013-12-13	IBN SPORTS	2014-08-31 11:44:35.193676	2014-08-31 11:44:35.193676
15417	5	18	3	2013-12-13	NEWS 360	2014-08-31 11:44:35.226111	2014-08-31 11:44:35.226111
15418	5	19	3	2013-12-13	MEN AGAINST THE TIDE-A YEAR AFTER NIRBHA	2014-08-31 11:44:35.253854	2014-08-31 11:44:35.253854
15419	5	19	3	2013-12-13	MEN AGAINST THE TIDE-A YEAR AFTER NIRBHA	2014-08-31 11:44:35.281415	2014-08-31 11:44:35.281415
15420	5	21	3	2013-12-13	INDIAN OF THE YEAR 2013-POLITICS	2014-08-31 11:44:35.308447	2014-08-31 11:44:35.308447
15421	5	21	3	2013-12-13	LATE NIGHT EDITION	2014-08-31 11:44:35.339585	2014-08-31 11:44:35.339585
15422	5	6	3	2013-12-14	IBN MORNING	2014-08-31 11:44:35.366772	2014-08-31 11:44:35.366772
15423	5	7	3	2013-12-14	IBN MORNING	2014-08-31 11:44:35.392753	2014-08-31 11:44:35.392753
15424	5	8	3	2013-12-14	IBN MORNING	2014-08-31 11:44:35.70799	2014-08-31 11:44:35.70799
15425	5	10	3	2013-12-14	MEN AGAINST THE TIDE-A YEAR AFTER NIRBHA	2014-08-31 11:44:35.73505	2014-08-31 11:44:35.73505
15426	5	11	3	2013-12-14	INDIAN OF THE YEAR 2013-POLITICS	2014-08-31 11:44:35.763083	2014-08-31 11:44:35.763083
15427	5	15	3	2013-12-14	DEVILS ADVOCATE	2014-08-31 11:44:35.792077	2014-08-31 11:44:35.792077
15428	5	19	3	2013-12-14	SENIOR CITIZEN AWARDS(EVENT)	2014-08-31 11:44:35.823674	2014-08-31 11:44:35.823674
15429	5	19	3	2013-12-14	SENIOR CITIZEN AWARDS(EVENT)	2014-08-31 11:44:35.852007	2014-08-31 11:44:35.852007
15430	5	20	3	2013-12-14	INDIA AT 9PM	2014-08-31 11:44:35.878621	2014-08-31 11:44:35.878621
15431	5	20	3	2013-12-14	THE WEEK THAT WASNT WITH CYRUS	2014-08-31 11:44:35.904823	2014-08-31 11:44:35.904823
15432	5	21	3	2013-12-14	HT LEADERSHIP SUMMIT	2014-08-31 11:44:36.23615	2014-08-31 11:44:36.23615
15433	5	22	3	2013-12-14	NOW SHOWING	2014-08-31 11:44:36.263142	2014-08-31 11:44:36.263142
15434	5	22	3	2013-12-14	LATE NIGHT EDITION	2014-08-31 11:44:36.291595	2014-08-31 11:44:36.291595
15435	5	6	3	2013-12-15	IBN MORNING	2014-08-31 11:44:36.32651	2014-08-31 11:44:36.32651
15436	5	7	3	2013-12-15	IBN MORNING	2014-08-31 11:44:36.353661	2014-08-31 11:44:36.353661
15437	5	9	3	2013-12-15	NEWS	2014-08-31 11:44:36.382101	2014-08-31 11:44:36.382101
15438	5	11	3	2013-12-15	GOOD AFTERNOON INDIA	2014-08-31 11:44:36.429171	2014-08-31 11:44:36.429171
15439	5	13	3	2013-12-15	NEWS	2014-08-31 11:44:36.476308	2014-08-31 11:44:36.476308
15440	5	14	3	2013-12-15	NEWS	2014-08-31 11:44:36.526986	2014-08-31 11:44:36.526986
15441	5	14	3	2013-12-15	NEWS	2014-08-31 11:44:36.977067	2014-08-31 11:44:36.977067
15442	5	15	3	2013-12-15	NEWS	2014-08-31 11:44:37.026721	2014-08-31 11:44:37.026721
15443	5	17	3	2013-12-15	IBN 7	2014-08-31 11:44:37.067801	2014-08-31 11:44:37.067801
15444	5	18	3	2013-12-15	HT LEADERSHIP SUMMIT	2014-08-31 11:44:37.109221	2014-08-31 11:44:37.109221
15445	5	19	3	2013-12-15	INDIA AT 9PM	2014-08-31 11:44:37.161305	2014-08-31 11:44:37.161305
15446	5	21	3	2013-12-15	LATE NIGHT EDITION	2014-08-31 11:44:37.20113	2014-08-31 11:44:37.20113
15447	5	22	3	2013-12-15	LATE NIGHT EDITION	2014-08-31 11:44:37.24501	2014-08-31 11:44:37.24501
15448	5	6	3	2013-12-16	IBN MORNING	2014-08-31 11:44:37.282442	2014-08-31 11:44:37.282442
15449	5	6	3	2013-12-16	IBN MORNING	2014-08-31 11:44:37.618526	2014-08-31 11:44:37.618526
15450	5	7	3	2013-12-16	BREAKFAST WITH INDIA	2014-08-31 11:44:37.650637	2014-08-31 11:44:37.650637
15451	5	7	3	2013-12-16	BREAKFAST WITH INDIA	2014-08-31 11:44:37.678251	2014-08-31 11:44:37.678251
15452	5	7	3	2013-12-16	BREAKFAST WITH INDIA	2014-08-31 11:44:37.70526	2014-08-31 11:44:37.70526
15453	5	8	3	2013-12-16	BREAKFAST WITH INDIA	2014-08-31 11:44:37.735772	2014-08-31 11:44:37.735772
15454	5	18	3	2013-12-16	AGENDA FOR CHANGE ONE YEAR ON	2014-08-31 11:44:37.761973	2014-08-31 11:44:37.761973
15455	5	18	3	2013-12-16	IBN SPORTS	2014-08-31 11:44:37.787967	2014-08-31 11:44:37.787967
15456	5	19	3	2013-12-16	THE LAST WORD	2014-08-31 11:44:37.814045	2014-08-31 11:44:37.814045
15457	5	19	3	2013-12-16	INDIA AT 9PM	2014-08-31 11:44:38.120458	2014-08-31 11:44:38.120458
15458	5	21	3	2013-12-16	AGENDA FOR CHANGE THE JUSTICE DIALOGUE	2014-08-31 11:44:38.148416	2014-08-31 11:44:38.148416
15459	5	21	3	2013-12-16	AGENDA FOR CHANGE THE JUSTICE DIALOGUE	2014-08-31 11:44:38.175747	2014-08-31 11:44:38.175747
15460	5	6	3	2013-12-17	IBN MORNING	2014-08-31 11:44:38.203049	2014-08-31 11:44:38.203049
15461	5	7	3	2013-12-17	BREAKFAST WITH INDIA	2014-08-31 11:44:38.236387	2014-08-31 11:44:38.236387
15462	5	7	3	2013-12-17	BREAKFAST WITH INDIA	2014-08-31 11:44:38.265412	2014-08-31 11:44:38.265412
15463	5	8	3	2013-12-17	BREAKFAST WITH INDIA	2014-08-31 11:44:38.293953	2014-08-31 11:44:38.293953
15464	5	8	3	2013-12-17	BREAKFAST WITH INDIA	2014-08-31 11:44:38.32759	2014-08-31 11:44:38.32759
15465	5	8	3	2013-12-17	BREAKFAST WITH INDIA	2014-08-31 11:44:38.634496	2014-08-31 11:44:38.634496
15466	5	18	3	2013-12-17	IBN SPORTS	2014-08-31 11:44:38.663994	2014-08-31 11:44:38.663994
15467	5	18	3	2013-12-17	NEWS 360	2014-08-31 11:44:38.692779	2014-08-31 11:44:38.692779
15468	5	19	3	2013-12-17	THE LAST WORD	2014-08-31 11:44:38.71934	2014-08-31 11:44:38.71934
15469	5	19	3	2013-12-17	INDIA AT 9PM	2014-08-31 11:44:38.748857	2014-08-31 11:44:38.748857
15470	5	21	3	2013-12-17	INDIA AT 9PM	2014-08-31 11:44:38.777137	2014-08-31 11:44:38.777137
15471	5	21	3	2013-12-17	LATE NIGHT EDITION	2014-08-31 11:44:38.803396	2014-08-31 11:44:38.803396
15472	5	6	3	2013-12-18	IBN SPORTS	2014-08-31 11:44:38.83294	2014-08-31 11:44:38.83294
15473	5	6	3	2013-12-18	BREAKFAST WITH INDIA	2014-08-31 11:44:39.129311	2014-08-31 11:44:39.129311
15474	5	7	3	2013-12-18	BREAKFAST WITH INDIA	2014-08-31 11:44:39.156919	2014-08-31 11:44:39.156919
15475	5	7	3	2013-12-18	BREAKFAST WITH INDIA	2014-08-31 11:44:39.183966	2014-08-31 11:44:39.183966
15476	5	8	3	2013-12-18	BREAKFAST WITH INDIA	2014-08-31 11:44:39.215767	2014-08-31 11:44:39.215767
15477	5	18	3	2013-12-18	IBN 7	2014-08-31 11:44:39.244243	2014-08-31 11:44:39.244243
15478	5	19	3	2013-12-18	NEWS 360	2014-08-31 11:44:39.271495	2014-08-31 11:44:39.271495
15479	5	20	3	2013-12-18	INDIA AT 9PM	2014-08-31 11:44:39.29729	2014-08-31 11:44:39.29729
15480	5	20	3	2013-12-18	INDIA AT 9PM	2014-08-31 11:44:39.326075	2014-08-31 11:44:39.326075
15481	5	21	3	2013-12-18	LATE NIGHT EDITION	2014-08-31 11:44:39.631721	2014-08-31 11:44:39.631721
15482	5	6	3	2013-12-19	IBN MORNING	2014-08-31 11:44:39.660339	2014-08-31 11:44:39.660339
15483	5	6	3	2013-12-19	IBN MORNING	2014-08-31 11:44:39.68802	2014-08-31 11:44:39.68802
15484	5	7	3	2013-12-19	BREAKFAST WITH INDIA	2014-08-31 11:44:39.715095	2014-08-31 11:44:39.715095
15485	5	7	3	2013-12-19	BREAKFAST WITH INDIA	2014-08-31 11:44:39.748423	2014-08-31 11:44:39.748423
15486	5	8	3	2013-12-19	NEWS	2014-08-31 11:44:39.775802	2014-08-31 11:44:39.775802
15487	5	18	3	2013-12-19	IBN 7	2014-08-31 11:44:39.802422	2014-08-31 11:44:39.802422
15488	5	19	3	2013-12-19	NEWS 360	2014-08-31 11:44:39.832763	2014-08-31 11:44:39.832763
15489	5	20	3	2013-12-19	INDIA AT 9PM	2014-08-31 11:44:39.858034	2014-08-31 11:44:39.858034
15490	5	21	3	2013-12-19	INDIAN OF THE YEAR 2013-SPORTS	2014-08-31 11:44:40.169354	2014-08-31 11:44:40.169354
15491	5	21	3	2013-12-19	INDIAN OF THE YEAR 2013-SPORTS	2014-08-31 11:44:40.198467	2014-08-31 11:44:40.198467
15492	5	6	3	2013-12-20	IBN MORNING	2014-08-31 11:44:40.230241	2014-08-31 11:44:40.230241
15493	5	6	3	2013-12-20	IBN MORNING	2014-08-31 11:44:40.25777	2014-08-31 11:44:40.25777
15494	5	7	3	2013-12-20	BREAKFAST WITH INDIA	2014-08-31 11:44:40.285479	2014-08-31 11:44:40.285479
15495	5	7	3	2013-12-20	BREAKFAST WITH INDIA	2014-08-31 11:44:40.311854	2014-08-31 11:44:40.311854
15496	5	8	3	2013-12-20	NEWS	2014-08-31 11:44:40.342254	2014-08-31 11:44:40.342254
15497	5	18	3	2013-12-20	IBN 7	2014-08-31 11:44:40.368718	2014-08-31 11:44:40.368718
15498	5	18	3	2013-12-20	NOW SHOWING	2014-08-31 11:44:40.685291	2014-08-31 11:44:40.685291
15499	5	19	3	2013-12-20	INDIAN OF THE YEAR 2013-RC	2014-08-31 11:44:40.712239	2014-08-31 11:44:40.712239
15500	5	21	3	2013-12-20	INDIAN OF THE YEAR 13	2014-08-31 11:44:40.73963	2014-08-31 11:44:40.73963
15501	5	21	3	2013-12-20	INDIAN OF THE YEAR 13	2014-08-31 11:44:40.767607	2014-08-31 11:44:40.767607
15502	5	6	3	2013-12-21	IBN MORNING	2014-08-31 11:44:40.795613	2014-08-31 11:44:40.795613
15503	5	7	3	2013-12-21	IBN MORNING	2014-08-31 11:44:40.825524	2014-08-31 11:44:40.825524
15504	5	8	3	2013-12-21	IBN MORNING	2014-08-31 11:44:40.858245	2014-08-31 11:44:40.858245
15505	5	10	3	2013-12-21	FACE THE PEOPLE	2014-08-31 11:44:40.883832	2014-08-31 11:44:40.883832
15506	5	12	3	2013-12-21	AGENDA FOR CHANGE NIRBHAYA THE FEARLESS	2014-08-31 11:44:41.222114	2014-08-31 11:44:41.222114
15507	5	13	3	2013-12-21	NOW SHOWING	2014-08-31 11:44:41.250121	2014-08-31 11:44:41.250121
15508	5	15	3	2013-12-21	CJ-AGENDA FOR CHANGE	2014-08-31 11:44:41.27671	2014-08-31 11:44:41.27671
15509	5	17	3	2013-12-21	NOW SHOWING	2014-08-31 11:44:41.303646	2014-08-31 11:44:41.303646
15510	5	18	3	2013-12-21	AGENDA FOR CHANGE NIRBHAYA THE FEARLESS	2014-08-31 11:44:41.339414	2014-08-31 11:44:41.339414
15511	5	19	3	2013-12-21	THE BOLLYWOOD ROUNDTABLE 2013	2014-08-31 11:44:41.366313	2014-08-31 11:44:41.366313
15512	5	21	3	2013-12-21	E LOUNGE UNWIND	2014-08-31 11:44:41.393302	2014-08-31 11:44:41.393302
15513	5	21	3	2013-12-21	LATE NIGHT EDITION	2014-08-31 11:44:41.417804	2014-08-31 11:44:41.417804
15514	5	22	3	2013-12-21	THE BOLLYWOOD ROUNDTABLE 2013	2014-08-31 11:44:41.724613	2014-08-31 11:44:41.724613
15515	5	6	3	2013-12-22	IBN MORNING	2014-08-31 11:44:41.753306	2014-08-31 11:44:41.753306
15516	5	6	3	2013-12-22	IBN MORNING	2014-08-31 11:44:41.781878	2014-08-31 11:44:41.781878
15517	5	7	3	2013-12-22	IBN MORNING	2014-08-31 11:44:41.808744	2014-08-31 11:44:41.808744
15518	5	8	3	2013-12-22	NOW SHOWING	2014-08-31 11:44:41.840916	2014-08-31 11:44:41.840916
15519	5	9	3	2013-12-22	THE WEEK THAT WASNT WITH CYRUS	2014-08-31 11:44:41.868302	2014-08-31 11:44:41.868302
15520	5	10	3	2013-12-22	THE BOLLYWOOD ROUNDTABLE 2013	2014-08-31 11:44:41.894657	2014-08-31 11:44:41.894657
15521	5	14	3	2013-12-22	DEVILS ADVOCATE	2014-08-31 11:44:41.923488	2014-08-31 11:44:41.923488
15522	5	16	3	2013-12-22	RAJAGIRI NATIONAL BUSINESS QUIZ 2013	2014-08-31 11:44:42.223981	2014-08-31 11:44:42.223981
15523	5	17	3	2013-12-22	GOOD EVENING INDIA	2014-08-31 11:44:42.251786	2014-08-31 11:44:42.251786
15524	5	19	3	2013-12-22	DEVILS ADVOCATE	2014-08-31 11:44:42.280192	2014-08-31 11:44:42.280192
15525	5	20	3	2013-12-22	INDIA AT 9PM	2014-08-31 11:44:42.308279	2014-08-31 11:44:42.308279
15526	5	20	3	2013-12-22	THE BOLLYWOOD ROUNDTABLE 2013	2014-08-31 11:44:42.344673	2014-08-31 11:44:42.344673
15527	5	22	3	2013-12-22	LATE NIGHT EDITION	2014-08-31 11:44:42.37184	2014-08-31 11:44:42.37184
15528	5	16	4	2013-11-29	AMERICAN DIGGER	2014-08-31 11:44:42.398948	2014-08-31 11:44:42.398948
15529	5	16	4	2013-11-29	HOW DO THEY DO IT	2014-08-31 11:44:42.429554	2014-08-31 11:44:42.429554
15530	5	17	4	2013-11-29	WILD ASIA	2014-08-31 11:44:42.743922	2014-08-31 11:44:42.743922
15531	5	18	4	2013-11-29	MAN VS WILD	2014-08-31 11:44:42.771729	2014-08-31 11:44:42.771729
15532	5	19	4	2013-11-29	AFRICA	2014-08-31 11:44:42.799827	2014-08-31 11:44:42.799827
15533	5	20	4	2013-11-29	YOU HAVE BEEN WARNED	2014-08-31 11:44:42.835213	2014-08-31 11:44:42.835213
15534	5	20	4	2013-11-29	YOU HAVE BEEN WARNED	2014-08-31 11:44:42.86322	2014-08-31 11:44:42.86322
15535	5	21	4	2013-11-29	DUAL SURVIVAL	2014-08-31 11:44:42.891485	2014-08-31 11:44:42.891485
15536	5	21	4	2013-11-29	DUAL SURVIVAL	2014-08-31 11:44:42.925255	2014-08-31 11:44:42.925255
15537	5	22	4	2013-11-29	DESTROYED IN SECONDS	2014-08-31 11:44:42.95075	2014-08-31 11:44:42.95075
15538	5	22	4	2013-11-29	DESTROYED IN SECONDS	2014-08-31 11:44:42.975771	2014-08-31 11:44:42.975771
15539	5	6	4	2013-11-30	DINOSAUR PLANET	2014-08-31 11:44:43.292375	2014-08-31 11:44:43.292375
15540	5	8	4	2013-11-30	BLUE PLANET	2014-08-31 11:44:43.319111	2014-08-31 11:44:43.319111
15541	5	9	4	2013-11-30	MAN VS WILD	2014-08-31 11:44:43.347802	2014-08-31 11:44:43.347802
15542	5	10	4	2013-11-30	FOOD FACTORY	2014-08-31 11:44:43.374944	2014-08-31 11:44:43.374944
15543	5	11	4	2013-11-30	DUAL SURVIVAL	2014-08-31 11:44:43.401451	2014-08-31 11:44:43.401451
15544	5	13	4	2013-11-30	YOU HAVE BEEN WARNED	2014-08-31 11:44:43.430579	2014-08-31 11:44:43.430579
15545	5	14	4	2013-11-30	MAN WOMAN WILD	2014-08-31 11:44:43.456266	2014-08-31 11:44:43.456266
15546	5	15	4	2013-11-30	MAN VS WILD	2014-08-31 11:44:43.480697	2014-08-31 11:44:43.480697
15547	5	17	4	2013-11-30	MAN VS WILD	2014-08-31 11:44:43.786102	2014-08-31 11:44:43.786102
15548	5	19	4	2013-11-30	WILDEST INDIA	2014-08-31 11:44:43.813069	2014-08-31 11:44:43.813069
15549	5	20	4	2013-11-30	SWAMP WARS	2014-08-31 11:44:43.844294	2014-08-31 11:44:43.844294
15550	5	22	4	2013-11-30	AFRICA	2014-08-31 11:44:43.871557	2014-08-31 11:44:43.871557
15551	5	7	4	2013-12-01	FACTORY MADE	2014-08-31 11:44:43.898788	2014-08-31 11:44:43.898788
15552	5	8	4	2013-12-01	DUAL SURVIVAL	2014-08-31 11:44:43.928709	2014-08-31 11:44:43.928709
15553	5	9	4	2013-12-01	MAN VS WILD	2014-08-31 11:44:43.954148	2014-08-31 11:44:43.954148
15554	5	11	4	2013-12-01	BODY BIZARRE	2014-08-31 11:44:43.979936	2014-08-31 11:44:43.979936
15555	5	13	4	2013-12-01	SPEED OF LIFE	2014-08-31 11:44:44.294802	2014-08-31 11:44:44.294802
15556	5	14	4	2013-12-01	MAN WOMAN WILD	2014-08-31 11:44:44.330788	2014-08-31 11:44:44.330788
15557	5	16	4	2013-12-01	HOW DO THEY DO IT	2014-08-31 11:44:44.361338	2014-08-31 11:44:44.361338
15558	5	17	4	2013-12-01	MAN VS WILD	2014-08-31 11:44:44.39036	2014-08-31 11:44:44.39036
15559	5	18	4	2013-12-01	WORLDS TOP 5-GIANT AIRCRAFT	2014-08-31 11:44:44.415709	2014-08-31 11:44:44.415709
15560	5	19	4	2013-12-01	EARTH FLIGHT	2014-08-31 11:44:44.442067	2014-08-31 11:44:44.442067
15561	5	20	4	2013-12-01	SURVIVORMAN	2014-08-31 11:44:44.469067	2014-08-31 11:44:44.469067
15562	5	22	4	2013-12-01	AFRICA	2014-08-31 11:44:44.494169	2014-08-31 11:44:44.494169
15563	5	16	4	2013-12-02	FACTORY MADE	2014-08-31 11:44:44.800417	2014-08-31 11:44:44.800417
15564	5	16	4	2013-12-02	HOW DO THEY DO IT	2014-08-31 11:44:44.832846	2014-08-31 11:44:44.832846
15565	5	16	4	2013-12-02	HOW DO THEY DO IT	2014-08-31 11:44:44.87068	2014-08-31 11:44:44.87068
15566	5	17	4	2013-12-02	WILD ASIA	2014-08-31 11:44:44.90028	2014-08-31 11:44:44.90028
15567	5	18	4	2013-12-02	WHAT HAPPENED NEXT	2014-08-31 11:44:44.930814	2014-08-31 11:44:44.930814
15568	5	18	4	2013-12-02	HOW DO THEY DO IT	2014-08-31 11:44:44.958155	2014-08-31 11:44:44.958155
15569	5	19	4	2013-12-02	HISTORY OF THE WORLD	2014-08-31 11:44:44.985304	2014-08-31 11:44:44.985304
15570	5	19	4	2013-12-02	HISTORY OF THE WORLD	2014-08-31 11:44:45.009674	2014-08-31 11:44:45.009674
15571	5	20	4	2013-12-02	WORLDS TOP 5-MIGHTY TRANSPORTERS	2014-08-31 11:44:45.313895	2014-08-31 11:44:45.313895
15572	5	21	4	2013-12-02	WORLDS TOUGHEST DRIVING TESTS	2014-08-31 11:44:45.348573	2014-08-31 11:44:45.348573
15573	5	22	4	2013-12-02	FORBIDDEN	2014-08-31 11:44:45.37661	2014-08-31 11:44:45.37661
15574	5	16	4	2013-12-03	FACTORY MADE	2014-08-31 11:44:45.403261	2014-08-31 11:44:45.403261
15575	5	16	4	2013-12-03	HOW DO THEY DO IT	2014-08-31 11:44:45.433699	2014-08-31 11:44:45.433699
15576	5	17	4	2013-12-03	WILD ASIA	2014-08-31 11:44:45.461028	2014-08-31 11:44:45.461028
15577	5	17	4	2013-12-03	WILD ASIA	2014-08-31 11:44:45.487725	2014-08-31 11:44:45.487725
15578	5	18	4	2013-12-03	WHAT HAPPENED NEXT	2014-08-31 11:44:45.514315	2014-08-31 11:44:45.514315
15579	5	18	4	2013-12-03	HOW DO THEY DO IT	2014-08-31 11:44:45.815409	2014-08-31 11:44:45.815409
15580	5	19	4	2013-12-03	HISTORY OF THE WORLD	2014-08-31 11:44:45.848426	2014-08-31 11:44:45.848426
15581	5	19	4	2013-12-03	HISTORY OF THE WORLD	2014-08-31 11:44:45.875797	2014-08-31 11:44:45.875797
15582	5	21	4	2013-12-03	WORLDS TOUGHEST DRIVING TESTS	2014-08-31 11:44:45.904458	2014-08-31 11:44:45.904458
15583	5	22	4	2013-12-03	FOOD FACTORY	2014-08-31 11:44:45.935537	2014-08-31 11:44:45.935537
15584	5	22	4	2013-12-03	FACTORY MADE	2014-08-31 11:44:45.961831	2014-08-31 11:44:45.961831
15585	5	16	4	2013-12-04	FACTORY MADE	2014-08-31 11:44:45.988896	2014-08-31 11:44:45.988896
15586	5	16	4	2013-12-04	HOW DO THEY DO IT	2014-08-31 11:44:46.036033	2014-08-31 11:44:46.036033
15587	5	17	4	2013-12-04	REVEALED RASHTRAPATI BHAWAN	2014-08-31 11:44:46.351102	2014-08-31 11:44:46.351102
15588	5	18	4	2013-12-04	MAN VS WILD	2014-08-31 11:44:46.380871	2014-08-31 11:44:46.380871
15589	5	19	4	2013-12-04	HISTORY OF THE WORLD	2014-08-31 11:44:46.408202	2014-08-31 11:44:46.408202
15590	5	19	4	2013-12-04	HISTORY OF THE WORLD	2014-08-31 11:44:46.439509	2014-08-31 11:44:46.439509
15591	5	20	4	2013-12-04	BLUE PLANET	2014-08-31 11:44:46.465989	2014-08-31 11:44:46.465989
15592	5	21	4	2013-12-04	WORLDS TOUGHEST DRIVING TESTS	2014-08-31 11:44:46.493041	2014-08-31 11:44:46.493041
15593	5	21	4	2013-12-04	WORLDS TOUGHEST DRIVING TESTS	2014-08-31 11:44:46.518408	2014-08-31 11:44:46.518408
15594	5	22	4	2013-12-04	BODY INVADERS	2014-08-31 11:44:46.548204	2014-08-31 11:44:46.548204
15595	5	22	4	2013-12-04	BODY INVADERS	2014-08-31 11:44:46.573237	2014-08-31 11:44:46.573237
15596	5	17	4	2013-12-05	SUPERFISH BLUEFIN TUNA	2014-08-31 11:44:46.883697	2014-08-31 11:44:46.883697
15597	5	17	4	2013-12-05	SUPERFISH BLUEFIN TUNA	2014-08-31 11:44:46.911774	2014-08-31 11:44:46.911774
15598	5	18	4	2013-12-05	MAN VS WILD	2014-08-31 11:44:46.942846	2014-08-31 11:44:46.942846
15599	5	18	4	2013-12-05	MAN VS WILD	2014-08-31 11:44:46.97013	2014-08-31 11:44:46.97013
15600	5	19	4	2013-12-05	HISTORY OF THE WORLD	2014-08-31 11:44:46.998495	2014-08-31 11:44:46.998495
15601	5	19	4	2013-12-05	HISTORY OF THE WORLD	2014-08-31 11:44:47.030411	2014-08-31 11:44:47.030411
15602	5	20	4	2013-12-05	GENERATION EARTH A PLACE TO LIVE	2014-08-31 11:44:47.057582	2014-08-31 11:44:47.057582
15603	5	20	4	2013-12-05	GENERATION EARTH A PLACE TO LIVE	2014-08-31 11:44:47.08455	2014-08-31 11:44:47.08455
15604	5	21	4	2013-12-05	WORLDS TOUGHEST DRIVING TESTS	2014-08-31 11:44:47.398487	2014-08-31 11:44:47.398487
15605	5	22	4	2013-12-05	GANGES	2014-08-31 11:44:47.430833	2014-08-31 11:44:47.430833
15606	5	22	4	2013-12-05	GANGES	2014-08-31 11:44:47.458042	2014-08-31 11:44:47.458042
15607	5	16	4	2013-12-06	FACTORY MADE	2014-08-31 11:44:47.485038	2014-08-31 11:44:47.485038
15608	5	16	4	2013-12-06	HOW DO THEY DO IT	2014-08-31 11:44:47.511388	2014-08-31 11:44:47.511388
15609	5	17	4	2013-12-06	SUPERFISH	2014-08-31 11:44:47.54179	2014-08-31 11:44:47.54179
15610	5	18	4	2013-12-06	MAN VS WILD	2014-08-31 11:44:47.56764	2014-08-31 11:44:47.56764
15611	5	19	4	2013-12-06	HISTORY OF THE WORLD	2014-08-31 11:44:47.592647	2014-08-31 11:44:47.592647
15612	5	19	4	2013-12-06	HISTORY OF THE WORLD	2014-08-31 11:44:47.897001	2014-08-31 11:44:47.897001
15613	5	20	4	2013-12-06	YOU HAVE BEEN WARNED	2014-08-31 11:44:47.92863	2014-08-31 11:44:47.92863
15614	5	20	4	2013-12-06	YOU HAVE BEEN WARNED	2014-08-31 11:44:47.956204	2014-08-31 11:44:47.956204
15615	5	21	4	2013-12-06	WORLDS TOUGHEST DRIVING TESTS	2014-08-31 11:44:47.983283	2014-08-31 11:44:47.983283
15616	5	21	4	2013-12-06	WORLDS TOUGHEST DRIVING TESTS	2014-08-31 11:44:48.011782	2014-08-31 11:44:48.011782
15617	5	22	4	2013-12-06	DESTROYED IN SECONDS	2014-08-31 11:44:48.043675	2014-08-31 11:44:48.043675
15618	5	6	4	2013-12-07	DINOSAUR PLANET	2014-08-31 11:44:48.070274	2014-08-31 11:44:48.070274
15619	5	8	4	2013-12-07	BLUE PLANET	2014-08-31 11:44:48.096428	2014-08-31 11:44:48.096428
15620	5	9	4	2013-12-07	FOOD FACTORY	2014-08-31 11:44:48.402009	2014-08-31 11:44:48.402009
15621	5	10	4	2013-12-07	NORTH AMERICA	2014-08-31 11:44:48.432899	2014-08-31 11:44:48.432899
15622	5	11	4	2013-12-07	MAN VS WILD	2014-08-31 11:44:48.459797	2014-08-31 11:44:48.459797
15623	5	12	4	2013-12-07	THE MAKING OF MANDELA	2014-08-31 11:44:48.486616	2014-08-31 11:44:48.486616
15624	5	14	4	2013-12-07	MY SHOKING STORY	2014-08-31 11:44:48.513446	2014-08-31 11:44:48.513446
15625	5	17	4	2013-12-07	MAN VS WILD	2014-08-31 11:44:48.544293	2014-08-31 11:44:48.544293
15626	5	18	4	2013-12-07	GANGA RIVER DIVINE	2014-08-31 11:44:48.570539	2014-08-31 11:44:48.570539
15627	5	20	4	2013-12-07	THE MAKING OF MANDELA	2014-08-31 11:44:48.595856	2014-08-31 11:44:48.595856
15628	5	21	4	2013-12-07	CHRIS TARRANT EXTREME RAILWAYS	2014-08-31 11:44:48.898446	2014-08-31 11:44:48.898446
15629	5	22	4	2013-12-07	AFRICA	2014-08-31 11:44:48.929846	2014-08-31 11:44:48.929846
15630	5	7	4	2013-12-08	SURVIVORMAN	2014-08-31 11:44:48.957357	2014-08-31 11:44:48.957357
15631	5	8	4	2013-12-08	DUAL SURVIVAL	2014-08-31 11:44:48.984635	2014-08-31 11:44:48.984635
15632	5	10	4	2013-12-08	NORTH AMERICA	2014-08-31 11:44:49.011234	2014-08-31 11:44:49.011234
15633	5	11	4	2013-12-08	MAN VS WILD	2014-08-31 11:44:49.042322	2014-08-31 11:44:49.042322
15634	5	13	4	2013-12-08	THE MAKING OF MANDELA	2014-08-31 11:44:49.068969	2014-08-31 11:44:49.068969
15635	5	14	4	2013-12-08	MY SHOKING STORY	2014-08-31 11:44:49.094851	2014-08-31 11:44:49.094851
15636	5	15	4	2013-12-08	I SHOULDNOT BE ALIVE	2014-08-31 11:44:49.399903	2014-08-31 11:44:49.399903
15637	5	16	4	2013-12-08	HOW DO THEY DO IT	2014-08-31 11:44:49.436789	2014-08-31 11:44:49.436789
15638	5	17	4	2013-12-08	MAN VS WILD	2014-08-31 11:44:49.463835	2014-08-31 11:44:49.463835
15639	5	20	4	2013-12-08	SURVIVORMAN	2014-08-31 11:44:49.490766	2014-08-31 11:44:49.490766
15640	5	21	4	2013-12-08	EARTH MACHINE	2014-08-31 11:44:49.51592	2014-08-31 11:44:49.51592
15641	5	22	4	2013-12-08	AFRICA	2014-08-31 11:44:49.546681	2014-08-31 11:44:49.546681
15642	5	16	4	2013-12-09	FACTORY MADE	2014-08-31 11:44:49.572341	2014-08-31 11:44:49.572341
15643	5	16	4	2013-12-09	HOW DO THEY DO IT	2014-08-31 11:44:49.597274	2014-08-31 11:44:49.597274
15644	5	17	4	2013-12-09	ISOLATED	2014-08-31 11:44:49.623672	2014-08-31 11:44:49.623672
15645	5	18	4	2013-12-09	TOP HOOKER	2014-08-31 11:44:49.918354	2014-08-31 11:44:49.918354
15646	5	19	4	2013-12-09	HISTORY OF THE WORLD	2014-08-31 11:44:49.948775	2014-08-31 11:44:49.948775
15647	5	19	4	2013-12-09	HISTORY OF THE WORLD	2014-08-31 11:44:49.97599	2014-08-31 11:44:49.97599
15648	5	20	4	2013-12-09	WORLDS TOP 5-TOUGHEST TRUCKS	2014-08-31 11:44:50.002831	2014-08-31 11:44:50.002831
15649	5	20	4	2013-12-09	WORLDS TOP 5-TOUGHEST TRUCKS	2014-08-31 11:44:50.033245	2014-08-31 11:44:50.033245
15650	5	21	4	2013-12-09	WORLDS TOUGHEST DRIVING TESTS	2014-08-31 11:44:50.059715	2014-08-31 11:44:50.059715
15651	5	22	4	2013-12-09	FORBIDDEN	2014-08-31 11:44:50.085555	2014-08-31 11:44:50.085555
15652	5	22	4	2013-12-09	FORBIDDEN	2014-08-31 11:44:50.110247	2014-08-31 11:44:50.110247
15653	5	16	4	2013-12-10	FACTORY MADE	2014-08-31 11:44:50.409643	2014-08-31 11:44:50.409643
15654	5	16	4	2013-12-10	HOW DO THEY DO IT	2014-08-31 11:44:50.443209	2014-08-31 11:44:50.443209
15655	5	17	4	2013-12-10	ISOLATED	2014-08-31 11:44:50.469944	2014-08-31 11:44:50.469944
15656	5	18	4	2013-12-10	TOP HOOKER	2014-08-31 11:44:50.497267	2014-08-31 11:44:50.497267
15657	5	19	4	2013-12-10	HISTORY OF THE WORLD	2014-08-31 11:44:50.52695	2014-08-31 11:44:50.52695
15658	5	20	4	2013-12-10	MAN VS WILD	2014-08-31 11:44:50.553391	2014-08-31 11:44:50.553391
15659	5	20	4	2013-12-10	MAN VS WILD	2014-08-31 11:44:50.579544	2014-08-31 11:44:50.579544
15660	5	21	4	2013-12-10	WORLDS TOUGHEST DRIVING TESTS	2014-08-31 11:44:50.60477	2014-08-31 11:44:50.60477
15661	5	21	4	2013-12-10	WORLDS TOUGHEST DRIVING TESTS	2014-08-31 11:44:50.910094	2014-08-31 11:44:50.910094
15662	5	22	4	2013-12-10	FACTORY MADE	2014-08-31 11:44:50.941251	2014-08-31 11:44:50.941251
15663	5	22	4	2013-12-10	FACTORY MADE	2014-08-31 11:44:50.968819	2014-08-31 11:44:50.968819
15664	5	16	4	2013-12-11	FACTORY MADE	2014-08-31 11:44:50.995635	2014-08-31 11:44:50.995635
15665	5	16	4	2013-12-11	HOW DO THEY DO IT	2014-08-31 11:44:51.056746	2014-08-31 11:44:51.056746
15666	5	17	4	2013-12-11	ISOLATED	2014-08-31 11:44:51.084354	2014-08-31 11:44:51.084354
15667	5	18	4	2013-12-11	TOP HOOKER	2014-08-31 11:44:51.108681	2014-08-31 11:44:51.108681
15668	5	19	4	2013-12-11	HISTORY OF THE WORLD	2014-08-31 11:44:51.137621	2014-08-31 11:44:51.137621
15669	5	19	4	2013-12-11	HISTORY OF THE WORLD	2014-08-31 11:44:51.441781	2014-08-31 11:44:51.441781
15670	5	20	4	2013-12-11	BLUE PLANET	2014-08-31 11:44:51.475585	2014-08-31 11:44:51.475585
15671	5	21	4	2013-12-11	WORLDS TOUGHEST DRIVING TESTS	2014-08-31 11:44:51.502949	2014-08-31 11:44:51.502949
15672	5	21	4	2013-12-11	WORLDS TOUGHEST DRIVING TESTS	2014-08-31 11:44:51.533909	2014-08-31 11:44:51.533909
15673	5	22	4	2013-12-11	BODY INVADERS	2014-08-31 11:44:51.560422	2014-08-31 11:44:51.560422
15674	5	22	4	2013-12-11	BODY INVADERS	2014-08-31 11:44:51.587009	2014-08-31 11:44:51.587009
15675	5	16	4	2013-12-12	FACTORY MADE	2014-08-31 11:44:51.612741	2014-08-31 11:44:51.612741
15676	5	16	4	2013-12-12	HOW DO THEY DO IT	2014-08-31 11:44:51.642447	2014-08-31 11:44:51.642447
15677	5	17	4	2013-12-12	NORTH AMERICA	2014-08-31 11:44:51.945328	2014-08-31 11:44:51.945328
15678	5	17	4	2013-12-12	NORTH AMERICA	2014-08-31 11:44:51.973387	2014-08-31 11:44:51.973387
15679	5	18	4	2013-12-12	MAN VS WILD	2014-08-31 11:44:52.001012	2014-08-31 11:44:52.001012
15680	5	18	4	2013-12-12	MAN VS WILD	2014-08-31 11:44:52.036846	2014-08-31 11:44:52.036846
15681	5	19	4	2013-12-12	HISTORY OF THE WORLD	2014-08-31 11:44:52.064005	2014-08-31 11:44:52.064005
15682	5	20	4	2013-12-12	SECRETS OF NAVY SEALS	2014-08-31 11:44:52.091394	2014-08-31 11:44:52.091394
15683	5	20	4	2013-12-12	SECRETS OF NAVY SEALS	2014-08-31 11:44:52.116936	2014-08-31 11:44:52.116936
15684	5	22	4	2013-12-12	JUNGLE GOLD	2014-08-31 11:44:52.147554	2014-08-31 11:44:52.147554
15685	5	22	4	2013-12-12	JUNGLE GOLD	2014-08-31 11:44:52.45012	2014-08-31 11:44:52.45012
15686	5	16	4	2013-12-13	FACTORY MADE	2014-08-31 11:44:52.478698	2014-08-31 11:44:52.478698
15687	5	17	4	2013-12-13	NORTH AMERICA	2014-08-31 11:44:52.504885	2014-08-31 11:44:52.504885
15688	5	17	4	2013-12-13	NORTH AMERICA	2014-08-31 11:44:52.535568	2014-08-31 11:44:52.535568
15689	5	18	4	2013-12-13	MAN VS WILD	2014-08-31 11:44:52.562221	2014-08-31 11:44:52.562221
15690	5	18	4	2013-12-13	MAN VS WILD	2014-08-31 11:44:52.588713	2014-08-31 11:44:52.588713
15691	5	19	4	2013-12-13	HISTORY OF THE WORLD	2014-08-31 11:44:52.613924	2014-08-31 11:44:52.613924
15692	5	20	4	2013-12-13	YOU HAVE BEEN WARNED	2014-08-31 11:44:52.648128	2014-08-31 11:44:52.648128
15693	5	20	4	2013-12-13	YOU HAVE BEEN WARNED	2014-08-31 11:44:52.674363	2014-08-31 11:44:52.674363
15694	5	21	4	2013-12-13	WORLDS TOUGHEST DRIVING TESTS	2014-08-31 11:44:52.981371	2014-08-31 11:44:52.981371
15695	5	22	4	2013-12-13	DESTROYED IN SECONDS	2014-08-31 11:44:53.009941	2014-08-31 11:44:53.009941
15696	5	22	4	2013-12-13	DESTROYED IN SECONDS	2014-08-31 11:44:53.042858	2014-08-31 11:44:53.042858
15697	5	6	4	2013-12-14	YOU HAVE BEEN WARNED	2014-08-31 11:44:53.071033	2014-08-31 11:44:53.071033
15698	5	7	4	2013-12-14	DUAL SURVIVAL	2014-08-31 11:44:53.099206	2014-08-31 11:44:53.099206
15699	5	8	4	2013-12-14	BLUE PLANET	2014-08-31 11:44:53.129975	2014-08-31 11:44:53.129975
15700	5	8	4	2013-12-14	BLUE PLANET	2014-08-31 11:44:53.157337	2014-08-31 11:44:53.157337
15701	5	9	4	2013-12-14	WHAT HAPPENED NEXT	2014-08-31 11:44:53.183692	2014-08-31 11:44:53.183692
15702	5	13	4	2013-12-14	YOU HAVE BEEN WARNED	2014-08-31 11:44:53.494315	2014-08-31 11:44:53.494315
15703	5	17	4	2013-12-14	MAN VS WILD	2014-08-31 11:44:53.526343	2014-08-31 11:44:53.526343
15704	5	18	4	2013-12-14	MY SHOKING STORY	2014-08-31 11:44:53.555717	2014-08-31 11:44:53.555717
15705	5	19	4	2013-12-14	WILDEST INDIA	2014-08-31 11:44:53.583058	2014-08-31 11:44:53.583058
15706	5	21	4	2013-12-14	CHRIS TARRANT EXTREME RAILWAYS	2014-08-31 11:44:53.611752	2014-08-31 11:44:53.611752
15707	5	22	4	2013-12-14	AFRICA	2014-08-31 11:44:53.644121	2014-08-31 11:44:53.644121
15708	5	6	4	2013-12-15	YOU HAVE BEEN WARNED	2014-08-31 11:44:53.670252	2014-08-31 11:44:53.670252
15709	5	8	4	2013-12-15	DUAL SURVIVAL	2014-08-31 11:44:53.698452	2014-08-31 11:44:53.698452
15710	5	10	4	2013-12-15	NORTH AMERICA	2014-08-31 11:44:54.00114	2014-08-31 11:44:54.00114
15711	5	11	4	2013-12-15	MAN VS WILD	2014-08-31 11:44:54.033346	2014-08-31 11:44:54.033346
15712	5	12	4	2013-12-15	BODY BIZARRE	2014-08-31 11:44:54.060055	2014-08-31 11:44:54.060055
15713	5	14	4	2013-12-15	THE MAKING OF MANDELA	2014-08-31 11:44:54.087239	2014-08-31 11:44:54.087239
15714	5	15	4	2013-12-15	I SHOULDNOT BE ALIVE	2014-08-31 11:44:54.11418	2014-08-31 11:44:54.11418
15715	5	17	4	2013-12-15	MAN VS WILD	2014-08-31 11:44:54.14867	2014-08-31 11:44:54.14867
15716	5	18	4	2013-12-15	MAN WOMAN WILD	2014-08-31 11:44:54.175865	2014-08-31 11:44:54.175865
15717	5	21	4	2013-12-15	EARTH MACHINE	2014-08-31 11:44:54.201833	2014-08-31 11:44:54.201833
15718	5	22	4	2013-12-15	AFRICA	2014-08-31 11:44:54.505001	2014-08-31 11:44:54.505001
15719	5	16	4	2013-12-16	FACTORY MADE	2014-08-31 11:44:54.541514	2014-08-31 11:44:54.541514
15720	5	16	4	2013-12-16	HOW DO THEY DO IT	2014-08-31 11:44:54.569192	2014-08-31 11:44:54.569192
15721	5	17	4	2013-12-16	ISOLATED	2014-08-31 11:44:54.596514	2014-08-31 11:44:54.596514
15722	5	17	4	2013-12-16	ISOLATED	2014-08-31 11:44:54.627044	2014-08-31 11:44:54.627044
15723	5	18	4	2013-12-16	TOP HOOKER	2014-08-31 11:44:54.653467	2014-08-31 11:44:54.653467
15724	5	20	4	2013-12-16	WORLDS TOP 5-GIANT CRANES	2014-08-31 11:44:54.680258	2014-08-31 11:44:54.680258
15725	5	21	4	2013-12-16	GOLD RUSH	2014-08-31 11:44:54.705469	2014-08-31 11:44:54.705469
15726	5	21	4	2013-12-16	GOLD RUSH	2014-08-31 11:44:55.026356	2014-08-31 11:44:55.026356
15727	5	22	4	2013-12-16	REVEALED RASHTRAPATI BHAWAN	2014-08-31 11:44:55.055385	2014-08-31 11:44:55.055385
15728	5	22	4	2013-12-16	REVEALED RASHTRAPATI BHAWAN	2014-08-31 11:44:55.085431	2014-08-31 11:44:55.085431
15729	5	16	4	2013-12-17	FACTORY MADE	2014-08-31 11:44:55.111206	2014-08-31 11:44:55.111206
15730	5	16	4	2013-12-17	HOW DO THEY DO IT	2014-08-31 11:44:55.142468	2014-08-31 11:44:55.142468
15731	5	17	4	2013-12-17	ISOLATED	2014-08-31 11:44:55.171383	2014-08-31 11:44:55.171383
15732	5	18	4	2013-12-17	TOP HOOKER	2014-08-31 11:44:55.197962	2014-08-31 11:44:55.197962
15733	5	19	4	2013-12-17	GOLD RUSH	2014-08-31 11:44:55.234008	2014-08-31 11:44:55.234008
15734	5	19	4	2013-12-17	GOLD RUSH	2014-08-31 11:44:55.547227	2014-08-31 11:44:55.547227
15735	5	20	4	2013-12-17	MAN VS WILD	2014-08-31 11:44:55.575318	2014-08-31 11:44:55.575318
15736	5	21	4	2013-12-17	GOLD RUSH	2014-08-31 11:44:55.602812	2014-08-31 11:44:55.602812
15737	5	22	4	2013-12-17	LIVING WITH TIGERS	2014-08-31 11:44:55.63925	2014-08-31 11:44:55.63925
15738	5	22	4	2013-12-17	LIVING WITH TIGERS	2014-08-31 11:44:55.668862	2014-08-31 11:44:55.668862
15739	5	16	4	2013-12-18	FACTORY MADE	2014-08-31 11:44:55.698494	2014-08-31 11:44:55.698494
15740	5	16	4	2013-12-18	HOW DO THEY DO IT	2014-08-31 11:44:55.730282	2014-08-31 11:44:55.730282
15741	5	17	4	2013-12-18	ISOLATED	2014-08-31 11:44:55.757011	2014-08-31 11:44:55.757011
15742	5	18	4	2013-12-18	TOP HOOKER	2014-08-31 11:44:55.78202	2014-08-31 11:44:55.78202
15743	5	19	4	2013-12-18	HAINAN ADVENTURE WITH NIGEL MARVEN	2014-08-31 11:44:56.130562	2014-08-31 11:44:56.130562
15744	5	20	4	2013-12-18	KINGDOM OF PLANTS	2014-08-31 11:44:56.158168	2014-08-31 11:44:56.158168
15745	5	20	4	2013-12-18	KINGDOM OF PLANTS	2014-08-31 11:44:56.185424	2014-08-31 11:44:56.185424
15746	5	21	4	2013-12-18	GOLD RUSH	2014-08-31 11:44:56.212405	2014-08-31 11:44:56.212405
15747	5	16	4	2013-12-19	FACTORY MADE	2014-08-31 11:44:56.247589	2014-08-31 11:44:56.247589
15748	5	16	4	2013-12-19	HOW DO THEY DO IT	2014-08-31 11:44:56.275144	2014-08-31 11:44:56.275144
15749	5	17	4	2013-12-19	NORTH AMERICA	2014-08-31 11:44:56.300619	2014-08-31 11:44:56.300619
15750	5	18	4	2013-12-19	MAN VS WILD	2014-08-31 11:44:56.329195	2014-08-31 11:44:56.329195
15751	5	18	4	2013-12-19	MAN VS WILD	2014-08-31 11:44:56.630377	2014-08-31 11:44:56.630377
15752	5	19	4	2013-12-19	AMERICAN DIGGER	2014-08-31 11:44:56.658388	2014-08-31 11:44:56.658388
15753	5	21	4	2013-12-19	GOLD RUSH	2014-08-31 11:44:56.68694	2014-08-31 11:44:56.68694
15754	5	22	4	2013-12-19	HISTORY OF THE WORLD	2014-08-31 11:44:56.713347	2014-08-31 11:44:56.713347
15755	5	16	4	2013-12-20	HOW DO THEY DO IT	2014-08-31 11:44:56.749885	2014-08-31 11:44:56.749885
15756	5	17	4	2013-12-20	NORTH AMERICA	2014-08-31 11:44:56.776515	2014-08-31 11:44:56.776515
15757	5	17	4	2013-12-20	NORTH AMERICA	2014-08-31 11:44:56.803556	2014-08-31 11:44:56.803556
15758	5	18	4	2013-12-20	MAN VS WILD	2014-08-31 11:44:56.834208	2014-08-31 11:44:56.834208
15759	5	19	4	2013-12-20	THE SUPERNATURALIST	2014-08-31 11:44:57.145491	2014-08-31 11:44:57.145491
15760	5	20	4	2013-12-20	YOU HAVE BEEN WARNED	2014-08-31 11:44:57.173515	2014-08-31 11:44:57.173515
15761	5	20	4	2013-12-20	YOU HAVE BEEN WARNED	2014-08-31 11:44:57.19993	2014-08-31 11:44:57.19993
15762	5	21	4	2013-12-20	GOLD RUSH	2014-08-31 11:44:57.230864	2014-08-31 11:44:57.230864
15763	5	22	4	2013-12-20	JUNGLE GOLD	2014-08-31 11:44:57.25888	2014-08-31 11:44:57.25888
15764	5	22	4	2013-12-20	JUNGLE GOLD	2014-08-31 11:44:57.285104	2014-08-31 11:44:57.285104
15765	5	6	4	2013-12-21	YOU HAVE BEEN WARNED	2014-08-31 11:44:57.309735	2014-08-31 11:44:57.309735
15766	5	7	4	2013-12-21	MAN WOMAN WILD	2014-08-31 11:44:57.343222	2014-08-31 11:44:57.343222
15767	5	8	4	2013-12-21	KINGDOM OF PLANTS	2014-08-31 11:44:57.656334	2014-08-31 11:44:57.656334
15768	5	12	4	2013-12-21	GOLD RUSH	2014-08-31 11:44:57.684748	2014-08-31 11:44:57.684748
15769	5	13	4	2013-12-21	YOU HAVE BEEN WARNED	2014-08-31 11:44:57.711135	2014-08-31 11:44:57.711135
15770	5	14	4	2013-12-21	MEDICAL ANOMALIES-MY BRAND NEW	2014-08-31 11:44:57.742292	2014-08-31 11:44:57.742292
15771	5	15	4	2013-12-21	MAN VS WILD	2014-08-31 11:44:57.770053	2014-08-31 11:44:57.770053
15772	5	16	4	2013-12-21	HOW DO THEY DO IT	2014-08-31 11:44:57.796562	2014-08-31 11:44:57.796562
15773	5	18	4	2013-12-21	BUILD IT BIGGER	2014-08-31 11:44:57.825774	2014-08-31 11:44:57.825774
15774	5	21	4	2013-12-21	CHRIS TARRANT EXTREME RAILWAYS	2014-08-31 11:44:57.851652	2014-08-31 11:44:57.851652
15775	5	22	4	2013-12-21	AFRICA	2014-08-31 11:44:58.154801	2014-08-31 11:44:58.154801
15776	5	6	4	2013-12-22	YOU HAVE BEEN WARNED	2014-08-31 11:44:58.183056	2014-08-31 11:44:58.183056
15777	5	8	4	2013-12-22	DUAL SURVIVAL	2014-08-31 11:44:58.210466	2014-08-31 11:44:58.210466
15778	5	9	4	2013-12-22	FOOD FACTORY	2014-08-31 11:44:58.241289	2014-08-31 11:44:58.241289
15779	5	12	4	2013-12-22	BODY BIZARRE	2014-08-31 11:44:58.268927	2014-08-31 11:44:58.268927
15780	5	13	4	2013-12-22	CAR VS WILD	2014-08-31 11:44:58.295692	2014-08-31 11:44:58.295692
15781	5	14	4	2013-12-22	MEDICAL ANOMALIES-MY BRAND NEW	2014-08-31 11:44:58.324674	2014-08-31 11:44:58.324674
15782	5	15	4	2013-12-22	I SHOULDNOT BE ALIVE	2014-08-31 11:44:58.35203	2014-08-31 11:44:58.35203
15783	5	16	4	2013-12-22	HOW DO THEY DO IT	2014-08-31 11:44:58.663574	2014-08-31 11:44:58.663574
15784	5	17	4	2013-12-22	MAN VS WILD	2014-08-31 11:44:58.691215	2014-08-31 11:44:58.691215
15785	5	18	4	2013-12-22	MAN WOMAN WILD	2014-08-31 11:44:58.718312	2014-08-31 11:44:58.718312
15786	5	16	4	2013-12-23	FACTORY MADE	2014-08-31 11:44:58.750782	2014-08-31 11:44:58.750782
15787	5	16	4	2013-12-23	FACTORY MADE	2014-08-31 11:44:58.778614	2014-08-31 11:44:58.778614
15788	5	17	4	2013-12-23	ISOLATED	2014-08-31 11:44:58.806064	2014-08-31 11:44:58.806064
15789	5	17	4	2013-12-23	ISOLATED	2014-08-31 11:44:58.835455	2014-08-31 11:44:58.835455
15790	5	18	4	2013-12-23	TOP HOOKER	2014-08-31 11:44:58.861438	2014-08-31 11:44:58.861438
15791	5	19	4	2013-12-23	SPEED OF LIFE	2014-08-31 11:44:58.886728	2014-08-31 11:44:58.886728
15792	5	20	4	2013-12-23	HIMALAYAN TSUNAMI	2014-08-31 11:44:59.212829	2014-08-31 11:44:59.212829
15793	5	21	4	2013-12-23	GOLD RUSH	2014-08-31 11:44:59.251843	2014-08-31 11:44:59.251843
15794	5	22	4	2013-12-23	SWAMP WARS	2014-08-31 11:44:59.286078	2014-08-31 11:44:59.286078
15795	5	22	4	2013-12-23	SWAMP WARS	2014-08-31 11:44:59.313814	2014-08-31 11:44:59.313814
15796	5	16	4	2013-12-24	FACTORY MADE	2014-08-31 11:44:59.346104	2014-08-31 11:44:59.346104
15797	5	16	4	2013-12-24	FACTORY MADE	2014-08-31 11:44:59.374391	2014-08-31 11:44:59.374391
15798	5	16	4	2013-12-24	HOW DO THEY DO IT	2014-08-31 11:44:59.40026	2014-08-31 11:44:59.40026
15799	5	17	4	2013-12-24	ISOLATED	2014-08-31 11:44:59.428007	2014-08-31 11:44:59.428007
15800	5	17	4	2013-12-24	ISOLATED	2014-08-31 11:44:59.737968	2014-08-31 11:44:59.737968
15801	5	18	4	2013-12-24	TOP HOOKER	2014-08-31 11:44:59.765183	2014-08-31 11:44:59.765183
15802	5	21	4	2013-12-24	GOLD RUSH	2014-08-31 11:44:59.792396	2014-08-31 11:44:59.792396
15803	5	21	4	2013-12-24	GOLD RUSH	2014-08-31 11:44:59.818798	2014-08-31 11:44:59.818798
15804	5	22	4	2013-12-24	EARTH FLIGHT	2014-08-31 11:44:59.850652	2014-08-31 11:44:59.850652
15805	5	22	4	2013-12-24	EARTH FLIGHT	2014-08-31 11:44:59.877113	2014-08-31 11:44:59.877113
15806	5	16	4	2013-12-25	FACTORY MADE	2014-08-31 11:44:59.907092	2014-08-31 11:44:59.907092
15807	5	16	4	2013-12-25	FACTORY MADE	2014-08-31 11:44:59.940337	2014-08-31 11:44:59.940337
15808	5	16	4	2013-12-25	HOW DO THEY DO IT	2014-08-31 11:45:00.240514	2014-08-31 11:45:00.240514
15809	5	16	4	2013-12-25	HOW DO THEY DO IT	2014-08-31 11:45:00.269292	2014-08-31 11:45:00.269292
15810	5	17	4	2013-12-25	ISOLATED	2014-08-31 11:45:00.29664	2014-08-31 11:45:00.29664
15811	5	17	4	2013-12-25	ISOLATED	2014-08-31 11:45:00.327409	2014-08-31 11:45:00.327409
15812	5	21	4	2013-12-25	GOLD RUSH	2014-08-31 11:45:00.354347	2014-08-31 11:45:00.354347
15813	5	21	4	2013-12-25	GOLD RUSH	2014-08-31 11:45:00.381595	2014-08-31 11:45:00.381595
15814	5	22	4	2013-12-25	SKYWIRE NIK TALKS THE WALK	2014-08-31 11:45:00.409312	2014-08-31 11:45:00.409312
15815	5	22	4	2013-12-25	SKYWIRE NIK TALKS THE WALK	2014-08-31 11:45:00.439927	2014-08-31 11:45:00.439927
15816	5	16	4	2013-12-26	FACTORY MADE	2014-08-31 11:45:00.742375	2014-08-31 11:45:00.742375
15817	5	16	4	2013-12-26	FACTORY MADE	2014-08-31 11:45:00.769678	2014-08-31 11:45:00.769678
15818	5	16	4	2013-12-26	HOW DO THEY DO IT	2014-08-31 11:45:00.796745	2014-08-31 11:45:00.796745
15819	5	17	4	2013-12-26	NORTH AMERICA	2014-08-31 11:45:00.82775	2014-08-31 11:45:00.82775
15820	5	17	4	2013-12-26	NORTH AMERICA	2014-08-31 11:45:00.854997	2014-08-31 11:45:00.854997
15821	5	18	4	2013-12-26	MAN VS WILD	2014-08-31 11:45:00.882732	2014-08-31 11:45:00.882732
15822	5	21	4	2013-12-26	GOLD RUSH	2014-08-31 11:45:00.909045	2014-08-31 11:45:00.909045
15823	5	21	4	2013-12-26	GOLD RUSH	2014-08-31 11:45:00.938307	2014-08-31 11:45:00.938307
15824	5	22	4	2013-12-26	LIVING WITH TIGERS	2014-08-31 11:45:01.287312	2014-08-31 11:45:01.287312
15825	5	22	4	2013-12-26	LIVING WITH TIGERS	2014-08-31 11:45:01.318076	2014-08-31 11:45:01.318076
15826	5	5	5	2013-11-29	TEE TIME	2014-08-31 11:45:01.352072	2014-08-31 11:45:01.352072
15827	5	6	5	2013-11-29	MORNING BETS	2014-08-31 11:45:01.382401	2014-08-31 11:45:01.382401
15828	5	7	5	2013-11-29	TRADING CALLS	2014-08-31 11:45:01.411248	2014-08-31 11:45:01.411248
15829	5	7	5	2013-11-29	TRADING CALLS	2014-08-31 11:45:01.443553	2014-08-31 11:45:01.443553
15830	5	9	5	2013-11-29	FIRST TRADES	2014-08-31 11:45:01.471962	2014-08-31 11:45:01.471962
15831	5	10	5	2013-11-29	TRADERS20 (T20)	2014-08-31 11:45:01.50228	2014-08-31 11:45:01.50228
15832	5	11	5	2013-11-29	MARKET SENSE	2014-08-31 11:45:01.846216	2014-08-31 11:45:01.846216
15833	5	12	5	2013-11-29	MARKETS AT LUNCH	2014-08-31 11:45:01.888249	2014-08-31 11:45:01.888249
15834	5	12	5	2013-11-29	MARKETS AT LUNCH	2014-08-31 11:45:01.91651	2014-08-31 11:45:01.91651
15835	5	13	5	2013-11-29	CLOSING TRADES	2014-08-31 11:45:01.949706	2014-08-31 11:45:01.949706
15836	5	15	5	2013-11-29	BUSINESS DAY	2014-08-31 11:45:01.980507	2014-08-31 11:45:01.980507
15837	5	15	5	2013-11-29	BUSINESS DAY	2014-08-31 11:45:02.011582	2014-08-31 11:45:02.011582
15838	5	17	5	2013-11-29	RUSH HOUR	2014-08-31 11:45:02.041549	2014-08-31 11:45:02.041549
15839	5	17	5	2013-11-29	BUSINESS EXPRESS	2014-08-31 11:45:02.071118	2014-08-31 11:45:02.071118
15840	5	18	5	2013-11-29	YOUR TRADES THE WEEK AHEAD	2014-08-31 11:45:02.097167	2014-08-31 11:45:02.097167
15841	5	19	5	2013-11-29	BUSINESS TONIGHT	2014-08-31 11:45:02.428282	2014-08-31 11:45:02.428282
15842	5	20	5	2013-11-29	BUSINESS TONIGHT	2014-08-31 11:45:02.458633	2014-08-31 11:45:02.458633
15843	5	21	5	2013-11-29	YOUR TRADES THE WEEK AHEAD	2014-08-31 11:45:02.487006	2014-08-31 11:45:02.487006
15844	5	22	5	2013-11-29	THE PROPERTY GUIDE	2014-08-31 11:45:02.515146	2014-08-31 11:45:02.515146
15845	5	5	5	2013-12-02	INVESTORS GUIDE	2014-08-31 11:45:02.549207	2014-08-31 11:45:02.549207
15846	5	6	5	2013-12-02	MORNING BETS	2014-08-31 11:45:02.577722	2014-08-31 11:45:02.577722
15847	5	6	5	2013-12-02	MORNING BETS	2014-08-31 11:45:02.604391	2014-08-31 11:45:02.604391
15848	5	7	5	2013-12-02	FIRST TRADES	2014-08-31 11:45:02.633875	2014-08-31 11:45:02.633875
15849	5	9	5	2013-12-02	HOT STOCKS	2014-08-31 11:45:02.992961	2014-08-31 11:45:02.992961
15850	5	11	5	2013-12-02	MARKET SENSE	2014-08-31 11:45:03.027064	2014-08-31 11:45:03.027064
15851	5	11	5	2013-12-02	MARKETS AT LUNCH	2014-08-31 11:45:03.059854	2014-08-31 11:45:03.059854
15852	5	12	5	2013-12-02	MARKETS AT LUNCH	2014-08-31 11:45:03.09049	2014-08-31 11:45:03.09049
15853	5	13	5	2013-12-02	CLOSING TRADES	2014-08-31 11:45:03.125244	2014-08-31 11:45:03.125244
15854	5	14	5	2013-12-02	TOMORROWS TRADES	2014-08-31 11:45:03.165073	2014-08-31 11:45:03.165073
15855	5	15	5	2013-12-02	BUSINESS DAY	2014-08-31 11:45:03.213485	2014-08-31 11:45:03.213485
15856	5	15	5	2013-12-02	BUSINESS DAY	2014-08-31 11:45:03.246847	2014-08-31 11:45:03.246847
15857	5	17	5	2013-12-02	RUSH HOUR	2014-08-31 11:45:03.592362	2014-08-31 11:45:03.592362
15858	5	18	5	2013-12-02	BUSINESS EXPRESS	2014-08-31 11:45:03.649385	2014-08-31 11:45:03.649385
15859	5	19	5	2013-12-02	MARKET HOUR	2014-08-31 11:45:03.701925	2014-08-31 11:45:03.701925
15860	5	19	5	2013-12-02	MARKET HOUR	2014-08-31 11:45:03.744748	2014-08-31 11:45:03.744748
15861	5	20	5	2013-12-02	BUSINESS TONIGHT	2014-08-31 11:45:03.781367	2014-08-31 11:45:03.781367
15862	5	20	5	2013-12-02	TOP 10 AT 10	2014-08-31 11:45:03.816958	2014-08-31 11:45:03.816958
15863	5	21	5	2013-12-02	INVESTORS GUIDE	2014-08-31 11:45:03.853625	2014-08-31 11:45:03.853625
15864	5	22	5	2013-12-02	INVESTORS GUIDE	2014-08-31 11:45:03.882065	2014-08-31 11:45:03.882065
15865	5	5	5	2013-12-03	INVESTORS GUIDE	2014-08-31 11:45:04.225728	2014-08-31 11:45:04.225728
15866	5	6	5	2013-12-03	MORNING MANTRA	2014-08-31 11:45:04.255349	2014-08-31 11:45:04.255349
15867	5	6	5	2013-12-03	MORNING MANTRA	2014-08-31 11:45:04.284828	2014-08-31 11:45:04.284828
15868	5	7	5	2013-12-03	TRADING CALLS	2014-08-31 11:45:04.311475	2014-08-31 11:45:04.311475
15869	5	9	5	2013-12-03	HOT STOCKS	2014-08-31 11:45:04.345429	2014-08-31 11:45:04.345429
15870	5	11	5	2013-12-03	MARKET SENSE	2014-08-31 11:45:04.379236	2014-08-31 11:45:04.379236
15871	5	12	5	2013-12-03	MARKETS AT LUNCH	2014-08-31 11:45:04.409182	2014-08-31 11:45:04.409182
15872	5	12	5	2013-12-03	THE F & O SHOW	2014-08-31 11:45:04.442847	2014-08-31 11:45:04.442847
15873	5	13	5	2013-12-03	CLOSING TRADES	2014-08-31 11:45:04.773246	2014-08-31 11:45:04.773246
15874	5	14	5	2013-12-03	TOMORROWS TRADES	2014-08-31 11:45:04.803086	2014-08-31 11:45:04.803086
15875	5	14	5	2013-12-03	TOMORROWS TRADES	2014-08-31 11:45:04.835362	2014-08-31 11:45:04.835362
15876	5	15	5	2013-12-03	MARKETS TOMORROW	2014-08-31 11:45:04.866015	2014-08-31 11:45:04.866015
15877	5	16	5	2013-12-03	HOT COMMODITIES	2014-08-31 11:45:04.897134	2014-08-31 11:45:04.897134
15878	5	17	5	2013-12-03	THE PROPERTY GUIDE	2014-08-31 11:45:04.932611	2014-08-31 11:45:04.932611
15879	5	18	5	2013-12-03	BUSINESS EXPRESS	2014-08-31 11:45:04.961404	2014-08-31 11:45:04.961404
15880	5	19	5	2013-12-03	MARKET HOUR	2014-08-31 11:45:04.990049	2014-08-31 11:45:04.990049
15881	5	20	5	2013-12-03	TOP 10 AT 10	2014-08-31 11:45:05.313066	2014-08-31 11:45:05.313066
15882	5	21	5	2013-12-03	THE PROPERTY GUIDE	2014-08-31 11:45:05.349887	2014-08-31 11:45:05.349887
15883	5	22	5	2013-12-03	THE PROPERTY GUIDE	2014-08-31 11:45:05.380409	2014-08-31 11:45:05.380409
15884	5	22	5	2013-12-03	INDIAMART LEADERS OF TOMORROW 2013	2014-08-31 11:45:05.408552	2014-08-31 11:45:05.408552
15885	5	5	5	2013-12-04	MARKETS TOMORROW	2014-08-31 11:45:05.436573	2014-08-31 11:45:05.436573
15886	5	6	5	2013-12-04	TRADING CALLS	2014-08-31 11:45:05.46483	2014-08-31 11:45:05.46483
15887	5	7	5	2013-12-04	TRADING CALLS	2014-08-31 11:45:05.493232	2014-08-31 11:45:05.493232
15888	5	8	5	2013-12-04	FIRST TRADES	2014-08-31 11:45:05.524953	2014-08-31 11:45:05.524953
15889	5	9	5	2013-12-04	HOT STOCKS	2014-08-31 11:45:05.550987	2014-08-31 11:45:05.550987
15890	5	10	5	2013-12-04	TRADERS20 (T20)	2014-08-31 11:45:05.871272	2014-08-31 11:45:05.871272
15891	5	11	5	2013-12-04	MARKET SENSE	2014-08-31 11:45:05.899057	2014-08-31 11:45:05.899057
15892	5	12	5	2013-12-04	MARKETS AT LUNCH	2014-08-31 11:45:05.930614	2014-08-31 11:45:05.930614
15893	5	13	5	2013-12-04	THE F & O SHOW	2014-08-31 11:45:05.96187	2014-08-31 11:45:05.96187
15894	5	14	5	2013-12-04	TOMORROWS TRADES	2014-08-31 11:45:05.991032	2014-08-31 11:45:05.991032
15895	5	15	5	2013-12-04	BUSINESS DAY	2014-08-31 11:45:06.040857	2014-08-31 11:45:06.040857
15896	5	15	5	2013-12-04	MARKETS TOMORROW	2014-08-31 11:45:06.08276	2014-08-31 11:45:06.08276
15897	5	16	5	2013-12-04	HOT COMMODITIES	2014-08-31 11:45:06.110493	2014-08-31 11:45:06.110493
15898	5	17	5	2013-12-04	GLOBAL MANTRA OUTLOOK 2014	2014-08-31 11:45:06.435533	2014-08-31 11:45:06.435533
15899	5	18	5	2013-12-04	INDIA ECONOMIC CONCLAVE	2014-08-31 11:45:06.465249	2014-08-31 11:45:06.465249
15900	5	19	5	2013-12-04	MARKET HOUR	2014-08-31 11:45:06.497043	2014-08-31 11:45:06.497043
15901	5	20	5	2013-12-04	TOP 10 AT 10	2014-08-31 11:45:06.52918	2014-08-31 11:45:06.52918
15902	5	21	5	2013-12-04	MARKETS TOMORROW	2014-08-31 11:45:06.556587	2014-08-31 11:45:06.556587
15903	5	22	5	2013-12-04	BRAND EQUITY	2014-08-31 11:45:06.585729	2014-08-31 11:45:06.585729
15904	5	22	5	2013-12-04	MARKET HOUR	2014-08-31 11:45:06.612418	2014-08-31 11:45:06.612418
15905	5	5	5	2013-12-05	MORNING MANTRA	2014-08-31 11:45:06.641761	2014-08-31 11:45:06.641761
15906	5	6	5	2013-12-05	MORNING MANTRA	2014-08-31 11:45:06.977412	2014-08-31 11:45:06.977412
15907	5	6	5	2013-12-05	MORNING BETS	2014-08-31 11:45:07.007365	2014-08-31 11:45:07.007365
15908	5	7	5	2013-12-05	TRADING CALLS	2014-08-31 11:45:07.044998	2014-08-31 11:45:07.044998
15909	5	7	5	2013-12-05	TRADING CALLS	2014-08-31 11:45:07.073571	2014-08-31 11:45:07.073571
15910	5	9	5	2013-12-05	TRADERS20 (T20)	2014-08-31 11:45:07.104969	2014-08-31 11:45:07.104969
15911	5	10	5	2013-12-05	BUY NOW SELL NOW-THE STOCK GAM	2014-08-31 11:45:07.136078	2014-08-31 11:45:07.136078
15912	5	11	5	2013-12-05	MARKET SENSE	2014-08-31 11:45:07.175038	2014-08-31 11:45:07.175038
15913	5	12	5	2013-12-05	MARKETS AT LUNCH	2014-08-31 11:45:07.200746	2014-08-31 11:45:07.200746
15914	5	12	5	2013-12-05	THE F & O SHOW	2014-08-31 11:45:07.528627	2014-08-31 11:45:07.528627
15915	5	13	5	2013-12-05	THE F & O SHOW	2014-08-31 11:45:07.566835	2014-08-31 11:45:07.566835
15916	5	13	5	2013-12-05	THE F & O SHOW	2014-08-31 11:45:07.605093	2014-08-31 11:45:07.605093
15917	5	15	5	2013-12-05	BUSINESS DAY	2014-08-31 11:45:07.647949	2014-08-31 11:45:07.647949
15918	5	16	5	2013-12-05	RUSH HOUR	2014-08-31 11:45:07.676734	2014-08-31 11:45:07.676734
15919	5	17	5	2013-12-05	RUSH HOUR	2014-08-31 11:45:07.704556	2014-08-31 11:45:07.704556
15920	5	18	5	2013-12-05	INDIA ECONOMIC CONCLAVE	2014-08-31 11:45:07.743399	2014-08-31 11:45:07.743399
15921	5	19	5	2013-12-05	MARKET HOUR	2014-08-31 11:45:07.771244	2014-08-31 11:45:07.771244
15922	5	20	5	2013-12-05	BUSINESS TONIGHT	2014-08-31 11:45:08.08906	2014-08-31 11:45:08.08906
15923	5	21	5	2013-12-05	TOP 10 AT 10	2014-08-31 11:45:08.117333	2014-08-31 11:45:08.117333
15924	5	21	5	2013-12-05	TEE TIME	2014-08-31 11:45:08.148672	2014-08-31 11:45:08.148672
15925	5	22	5	2013-12-05	TEE TIME	2014-08-31 11:45:08.177089	2014-08-31 11:45:08.177089
15926	5	5	5	2013-12-06	MORNING MANTRA	2014-08-31 11:45:08.205027	2014-08-31 11:45:08.205027
15927	5	6	5	2013-12-06	MORNING BETS	2014-08-31 11:45:08.232349	2014-08-31 11:45:08.232349
15928	5	7	5	2013-12-06	TRADING CALLS	2014-08-31 11:45:08.258933	2014-08-31 11:45:08.258933
15929	5	7	5	2013-12-06	FIRST TRADES	2014-08-31 11:45:08.286051	2014-08-31 11:45:08.286051
15930	5	9	5	2013-12-06	HOT STOCKS	2014-08-31 11:45:08.611824	2014-08-31 11:45:08.611824
15931	5	10	5	2013-12-06	BUY NOW SELL NOW-THE STOCK GAM	2014-08-31 11:45:08.662094	2014-08-31 11:45:08.662094
15932	5	11	5	2013-12-06	MARKET SENSE	2014-08-31 11:45:08.689523	2014-08-31 11:45:08.689523
15933	5	11	5	2013-12-06	MARKETS AT LUNCH	2014-08-31 11:45:08.723897	2014-08-31 11:45:08.723897
15934	5	13	5	2013-12-06	THE F & O SHOW	2014-08-31 11:45:08.753065	2014-08-31 11:45:08.753065
15935	5	15	5	2013-12-06	BUSINESS DAY	2014-08-31 11:45:08.780719	2014-08-31 11:45:08.780719
15936	5	16	5	2013-12-06	HOT COMMODITIES	2014-08-31 11:45:08.80855	2014-08-31 11:45:08.80855
15937	5	17	5	2013-12-06	THE MARKET MAKERS WITH S NAREN	2014-08-31 11:45:08.839341	2014-08-31 11:45:08.839341
15938	5	18	5	2013-12-06	MARKET HOUR	2014-08-31 11:45:09.148135	2014-08-31 11:45:09.148135
15939	5	19	5	2013-12-06	BUSINESS TONIGHT	2014-08-31 11:45:09.186467	2014-08-31 11:45:09.186467
15940	5	20	5	2013-12-06	TOP 10 AT 10	2014-08-31 11:45:09.216499	2014-08-31 11:45:09.216499
15941	5	21	5	2013-12-06	DEAL MAKERS	2014-08-31 11:45:09.25005	2014-08-31 11:45:09.25005
15942	5	22	5	2013-12-06	YOUR TRADES THE WEEK AHEAD	2014-08-31 11:45:09.281205	2014-08-31 11:45:09.281205
15943	5	22	5	2013-12-06	THE PROPERTY GUIDE	2014-08-31 11:45:09.308086	2014-08-31 11:45:09.308086
15944	5	5	5	2013-12-07	INVESTORS GUIDE	2014-08-31 11:45:09.347241	2014-08-31 11:45:09.347241
15945	5	6	5	2013-12-07	TEE TIME	2014-08-31 11:45:09.38019	2014-08-31 11:45:09.38019
15946	5	7	5	2013-12-07	BAZAAR AGLE HAFTE	2014-08-31 11:45:09.405481	2014-08-31 11:45:09.405481
15947	5	8	5	2013-12-07	ALL ABOUT STOCKS	2014-08-31 11:45:09.751416	2014-08-31 11:45:09.751416
15948	5	9	5	2013-12-07	BUY NOW SELL NOW-WEEKEND	2014-08-31 11:45:09.783234	2014-08-31 11:45:09.783234
15949	5	10	5	2013-12-07	TOP SPEED	2014-08-31 11:45:09.81286	2014-08-31 11:45:09.81286
15950	5	11	5	2013-12-07	THE PROPERTY GUIDE	2014-08-31 11:45:09.85234	2014-08-31 11:45:09.85234
15951	5	12	5	2013-12-07	BUY NOW SELL NOW-WEEKEND	2014-08-31 11:45:09.881963	2014-08-31 11:45:09.881963
15952	5	13	5	2013-12-07	THE POWER OF SHUNYA	2014-08-31 11:45:09.908417	2014-08-31 11:45:09.908417
15953	5	15	5	2013-12-07	DEAL MAKERS	2014-08-31 11:45:09.943742	2014-08-31 11:45:09.943742
15954	5	16	5	2013-12-07	INDIAMART LEADERS OF TOMORROW 2013	2014-08-31 11:45:09.971019	2014-08-31 11:45:09.971019
15955	5	20	5	2013-12-07	THE MARKET MAKERS WITH S NAREN	2014-08-31 11:45:10.284072	2014-08-31 11:45:10.284072
15956	5	20	5	2013-12-07	CAPEGEMINI SUPER TECHIES SHOW-2	2014-08-31 11:45:10.310838	2014-08-31 11:45:10.310838
15957	5	21	5	2013-12-07	YOUR TRADES THE WEEK AHEAD	2014-08-31 11:45:10.350127	2014-08-31 11:45:10.350127
15958	5	22	5	2013-12-07	GLOBAL MANTRA OUTLOOK 2014	2014-08-31 11:45:10.377745	2014-08-31 11:45:10.377745
15959	5	22	5	2013-12-07	GLOBAL MANTRA OUTLOOK 2014	2014-08-31 11:45:10.405097	2014-08-31 11:45:10.405097
15960	5	5	5	2013-12-08	THE MARKET MAKERS WITH S NAREN	2014-08-31 11:45:10.440184	2014-08-31 11:45:10.440184
15961	5	6	5	2013-12-08	ALL ABOUT STOCKS	2014-08-31 11:45:10.466937	2014-08-31 11:45:10.466937
15962	5	7	5	2013-12-08	BUY NOW SELL NOW-WEEKEND	2014-08-31 11:45:10.494008	2014-08-31 11:45:10.494008
15963	5	8	5	2013-12-08	THE MARKET MAKERS WITH S NAREN	2014-08-31 11:45:10.803995	2014-08-31 11:45:10.803995
15964	5	10	5	2013-12-08	CAPEGEMINI SUPER TECHIES SHOW-2	2014-08-31 11:45:10.836927	2014-08-31 11:45:10.836927
15965	5	12	5	2013-12-08	ALL ABOUT STOCKS	2014-08-31 11:45:10.866803	2014-08-31 11:45:10.866803
15966	5	13	5	2013-12-08	TOP SPEED	2014-08-31 11:45:10.895456	2014-08-31 11:45:10.895456
15967	5	13	5	2013-12-08	INDIAMART LEADERS OF TOMORROW 2013	2014-08-31 11:45:10.927453	2014-08-31 11:45:10.927453
15968	5	14	5	2013-12-08	TEE TIME	2014-08-31 11:45:10.954589	2014-08-31 11:45:10.954589
15969	5	15	5	2013-12-08	INVESTORS GUIDE	2014-08-31 11:45:10.981507	2014-08-31 11:45:10.981507
15970	5	16	5	2013-12-08	MANDATE 2013	2014-08-31 11:45:11.024525	2014-08-31 11:45:11.024525
15971	5	18	5	2013-12-08	CAPEGEMINI SUPER TECHIES SHOW-2	2014-08-31 11:45:11.360368	2014-08-31 11:45:11.360368
15972	5	19	5	2013-12-08	HEALTHIER INDIA	2014-08-31 11:45:11.388844	2014-08-31 11:45:11.388844
15973	5	20	5	2013-12-08	TEE TIME	2014-08-31 11:45:11.416031	2014-08-31 11:45:11.416031
15974	5	21	5	2013-12-08	ALL ABOUT STOCKS	2014-08-31 11:45:11.448596	2014-08-31 11:45:11.448596
15975	5	22	5	2013-12-08	GLOBAL MANTRA OUTLOOK 2014	2014-08-31 11:45:11.475952	2014-08-31 11:45:11.475952
15976	5	5	5	2013-12-09	INVESTORS GUIDE	2014-08-31 11:45:11.502816	2014-08-31 11:45:11.502816
15977	5	7	5	2013-12-09	TRADING CALLS	2014-08-31 11:45:11.537856	2014-08-31 11:45:11.537856
15978	5	7	5	2013-12-09	FIRST TRADES	2014-08-31 11:45:11.563998	2014-08-31 11:45:11.563998
15979	5	8	5	2013-12-09	FIRST TRADES	2014-08-31 11:45:11.878015	2014-08-31 11:45:11.878015
15980	5	9	5	2013-12-09	HOT STOCKS	2014-08-31 11:45:11.905741	2014-08-31 11:45:11.905741
15981	5	10	5	2013-12-09	TRADERS20 (T20)	2014-08-31 11:45:11.937029	2014-08-31 11:45:11.937029
15982	5	11	5	2013-12-09	MARKET SENSE	2014-08-31 11:45:11.96794	2014-08-31 11:45:11.96794
15983	5	11	5	2013-12-09	MARKETS AT LUNCH	2014-08-31 11:45:11.996241	2014-08-31 11:45:11.996241
15984	5	12	5	2013-12-09	MARKETS AT LUNCH	2014-08-31 11:45:12.044765	2014-08-31 11:45:12.044765
15985	5	14	5	2013-12-09	TOMORROWS TRADES	2014-08-31 11:45:12.083287	2014-08-31 11:45:12.083287
15986	5	14	5	2013-12-09	BUSINESS DAY	2014-08-31 11:45:12.110208	2014-08-31 11:45:12.110208
15987	5	15	5	2013-12-09	MARKETS TOMORROW	2014-08-31 11:45:12.451857	2014-08-31 11:45:12.451857
15988	5	16	5	2013-12-09	HOT COMMODITIES	2014-08-31 11:45:12.506363	2014-08-31 11:45:12.506363
15989	5	17	5	2013-12-09	BUSINESS EXPRESS	2014-08-31 11:45:12.569519	2014-08-31 11:45:12.569519
15990	5	18	5	2013-12-09	MARKETS TOMORROW	2014-08-31 11:45:12.623285	2014-08-31 11:45:12.623285
15991	5	19	5	2013-12-09	MARKET HOUR	2014-08-31 11:45:12.677541	2014-08-31 11:45:12.677541
15992	5	20	5	2013-12-09	BUSINESS TONIGHT	2014-08-31 11:45:12.7308	2014-08-31 11:45:12.7308
15993	5	21	5	2013-12-09	TOP 10 AT 10	2014-08-31 11:45:12.780807	2014-08-31 11:45:12.780807
15994	5	22	5	2013-12-09	MARKETS TOMORROW	2014-08-31 11:45:12.832361	2014-08-31 11:45:12.832361
15995	5	22	5	2013-12-09	MARKETS TOMORROW	2014-08-31 11:45:12.881215	2014-08-31 11:45:12.881215
15996	5	5	5	2013-12-10	MARKETS TOMORROW	2014-08-31 11:45:13.309341	2014-08-31 11:45:13.309341
15997	5	6	5	2013-12-10	TRADING CALLS	2014-08-31 11:45:13.358327	2014-08-31 11:45:13.358327
15998	5	7	5	2013-12-10	TRADING CALLS	2014-08-31 11:45:13.399473	2014-08-31 11:45:13.399473
15999	5	7	5	2013-12-10	TRADING CALLS	2014-08-31 11:45:13.439844	2014-08-31 11:45:13.439844
16000	5	9	5	2013-12-10	HOT STOCKS	2014-08-31 11:45:13.478519	2014-08-31 11:45:13.478519
16001	5	11	5	2013-12-10	MARKET SENSE	2014-08-31 11:45:13.514379	2014-08-31 11:45:13.514379
16002	5	12	5	2013-12-10	MARKETS AT LUNCH	2014-08-31 11:45:13.558085	2014-08-31 11:45:13.558085
16003	5	12	5	2013-12-10	MARKETS AT LUNCH	2014-08-31 11:45:13.593099	2014-08-31 11:45:13.593099
16004	5	14	5	2013-12-10	TOMORROWS TRADES	2014-08-31 11:45:13.956774	2014-08-31 11:45:13.956774
16005	5	14	5	2013-12-10	TOMORROWS TRADES	2014-08-31 11:45:13.988197	2014-08-31 11:45:13.988197
16006	5	15	5	2013-12-10	MARKETS TOMORROW	2014-08-31 11:45:14.02704	2014-08-31 11:45:14.02704
16007	5	15	5	2013-12-10	MARKETS TOMORROW	2014-08-31 11:45:14.056728	2014-08-31 11:45:14.056728
16008	5	16	5	2013-12-10	HOT COMMODITIES	2014-08-31 11:45:14.086488	2014-08-31 11:45:14.086488
16009	5	17	5	2013-12-10	THE POWER OF SHUNYA	2014-08-31 11:45:14.116079	2014-08-31 11:45:14.116079
16010	5	18	5	2013-12-10	BUSINESS EXPRESS	2014-08-31 11:45:14.148828	2014-08-31 11:45:14.148828
16011	5	18	5	2013-12-10	MARKETS TOMORROW	2014-08-31 11:45:14.176232	2014-08-31 11:45:14.176232
16012	5	20	5	2013-12-10	TOP 10 AT 10	2014-08-31 11:45:14.496936	2014-08-31 11:45:14.496936
16013	5	21	5	2013-12-10	TOP 10 AT 10	2014-08-31 11:45:14.528965	2014-08-31 11:45:14.528965
16014	5	21	5	2013-12-10	THE PROPERTY GUIDE	2014-08-31 11:45:14.558237	2014-08-31 11:45:14.558237
16015	5	22	5	2013-12-10	THE PROPERTY GUIDE	2014-08-31 11:45:14.586292	2014-08-31 11:45:14.586292
16016	5	5	5	2013-12-11	MARKETS TOMORROW	2014-08-31 11:45:14.614289	2014-08-31 11:45:14.614289
16017	5	6	5	2013-12-11	MORNING BETS	2014-08-31 11:45:14.648342	2014-08-31 11:45:14.648342
16018	5	6	5	2013-12-11	TRADING CALLS	2014-08-31 11:45:14.674934	2014-08-31 11:45:14.674934
16019	5	7	5	2013-12-11	TRADING CALLS	2014-08-31 11:45:14.701731	2014-08-31 11:45:14.701731
16020	5	9	5	2013-12-11	HOT STOCKS	2014-08-31 11:45:15.098126	2014-08-31 11:45:15.098126
16021	5	11	5	2013-12-11	MARKET SENSE	2014-08-31 11:45:15.156511	2014-08-31 11:45:15.156511
16022	5	11	5	2013-12-11	MARKET SENSE	2014-08-31 11:45:15.208514	2014-08-31 11:45:15.208514
16023	5	12	5	2013-12-11	MARKETS AT LUNCH	2014-08-31 11:45:15.267919	2014-08-31 11:45:15.267919
16024	5	12	5	2013-12-11	THE F & O SHOW	2014-08-31 11:45:15.324315	2014-08-31 11:45:15.324315
16025	5	13	5	2013-12-11	CLOSING TRADES	2014-08-31 11:45:15.377	2014-08-31 11:45:15.377
16026	5	14	5	2013-12-11	TOMORROWS TRADES	2014-08-31 11:45:15.424795	2014-08-31 11:45:15.424795
16027	5	15	5	2013-12-11	MARKETS TOMORROW	2014-08-31 11:45:15.467308	2014-08-31 11:45:15.467308
16028	5	16	5	2013-12-11	BUSINESS DAY	2014-08-31 11:45:15.893331	2014-08-31 11:45:15.893331
16029	5	16	5	2013-12-11	RUSH HOUR	2014-08-31 11:45:15.938746	2014-08-31 11:45:15.938746
16030	5	17	5	2013-12-11	GLOBAL MANTRA OUTLOOK 2014	2014-08-31 11:45:15.980288	2014-08-31 11:45:15.980288
16031	5	18	5	2013-12-11	MARKETS TOMORROW	2014-08-31 11:45:16.053875	2014-08-31 11:45:16.053875
16032	5	19	5	2013-12-11	MARKET HOUR	2014-08-31 11:45:16.110807	2014-08-31 11:45:16.110807
16033	5	20	5	2013-12-11	BUSINESS TONIGHT	2014-08-31 11:45:16.15675	2014-08-31 11:45:16.15675
16034	5	21	5	2013-12-11	TOP 10 AT 10	2014-08-31 11:45:16.197235	2014-08-31 11:45:16.197235
16035	5	22	5	2013-12-11	BRAND EQUITY	2014-08-31 11:45:16.239086	2014-08-31 11:45:16.239086
16036	5	5	5	2013-12-12	MARKETS TOMORROW	2014-08-31 11:45:16.611858	2014-08-31 11:45:16.611858
16037	5	5	5	2013-12-12	BRAND EQUITY	2014-08-31 11:45:16.651339	2014-08-31 11:45:16.651339
16038	5	6	5	2013-12-12	TRADING CALLS	2014-08-31 11:45:16.687308	2014-08-31 11:45:16.687308
16039	5	7	5	2013-12-12	FIRST TRADES	2014-08-31 11:45:16.72612	2014-08-31 11:45:16.72612
16040	5	9	5	2013-12-12	FIRST TRADES	2014-08-31 11:45:16.761708	2014-08-31 11:45:16.761708
16041	5	9	5	2013-12-12	HOT STOCKS	2014-08-31 11:45:16.797427	2014-08-31 11:45:16.797427
16042	5	10	5	2013-12-12	BUY NOW SELL NOW-THE STOCK GAM	2014-08-31 11:45:16.834023	2014-08-31 11:45:16.834023
16043	5	11	5	2013-12-12	MARKETS AT LUNCH	2014-08-31 11:45:16.869264	2014-08-31 11:45:16.869264
16044	5	12	5	2013-12-12	MARKETS AT LUNCH	2014-08-31 11:45:16.907535	2014-08-31 11:45:16.907535
16045	5	14	5	2013-12-12	CLOSING TRADES	2014-08-31 11:45:17.386133	2014-08-31 11:45:17.386133
16046	5	14	5	2013-12-12	BUSINESS DAY	2014-08-31 11:45:17.417863	2014-08-31 11:45:17.417863
16047	5	15	5	2013-12-12	MARKETS TOMORROW	2014-08-31 11:45:17.450303	2014-08-31 11:45:17.450303
16048	5	16	5	2013-12-12	BUSINESS DAY	2014-08-31 11:45:17.478979	2014-08-31 11:45:17.478979
16049	5	17	5	2013-12-12	THE MARKET MAKERS WITH ABHAY AIMA	2014-08-31 11:45:17.506341	2014-08-31 11:45:17.506341
16050	5	18	5	2013-12-12	BUSINESS EXPRESS	2014-08-31 11:45:17.533098	2014-08-31 11:45:17.533098
16051	5	18	5	2013-12-12	CAPEGEMINI SUPER TECHIES SHOW-2	2014-08-31 11:45:17.559178	2014-08-31 11:45:17.559178
16052	5	19	5	2013-12-12	MARKET HOUR	2014-08-31 11:45:17.583964	2014-08-31 11:45:17.583964
16053	5	20	5	2013-12-12	BUSINESS TONIGHT	2014-08-31 11:45:17.896127	2014-08-31 11:45:17.896127
16054	5	21	5	2013-12-12	TEE TIME	2014-08-31 11:45:17.928089	2014-08-31 11:45:17.928089
16055	5	22	5	2013-12-12	MARKETS TOMORROW	2014-08-31 11:45:17.955808	2014-08-31 11:45:17.955808
16056	5	5	5	2013-12-13	MORNING MANTRA	2014-08-31 11:45:17.983512	2014-08-31 11:45:17.983512
16057	5	6	5	2013-12-13	TRADING CALLS	2014-08-31 11:45:18.01207	2014-08-31 11:45:18.01207
16058	5	7	5	2013-12-13	TRADING CALLS	2014-08-31 11:45:18.043168	2014-08-31 11:45:18.043168
16059	5	8	5	2013-12-13	FIRST TRADES	2014-08-31 11:45:18.069649	2014-08-31 11:45:18.069649
16060	5	9	5	2013-12-13	HOT STOCKS	2014-08-31 11:45:18.095134	2014-08-31 11:45:18.095134
16061	5	10	5	2013-12-13	MARKET SENSE	2014-08-31 11:45:18.403358	2014-08-31 11:45:18.403358
16062	5	11	5	2013-12-13	MARKET SENSE	2014-08-31 11:45:18.435438	2014-08-31 11:45:18.435438
16063	5	11	5	2013-12-13	MARKETS AT LUNCH	2014-08-31 11:45:18.463515	2014-08-31 11:45:18.463515
16064	5	12	5	2013-12-13	THE F & O SHOW	2014-08-31 11:45:18.490481	2014-08-31 11:45:18.490481
16065	5	13	5	2013-12-13	THE F & O SHOW	2014-08-31 11:45:18.517202	2014-08-31 11:45:18.517202
16066	5	14	5	2013-12-13	BUSINESS DAY	2014-08-31 11:45:18.547869	2014-08-31 11:45:18.547869
16067	5	15	5	2013-12-13	BUSINESS DAY	2014-08-31 11:45:18.575042	2014-08-31 11:45:18.575042
16068	5	16	5	2013-12-13	RUSH HOUR	2014-08-31 11:45:18.601274	2014-08-31 11:45:18.601274
16069	5	17	5	2013-12-13	BUSINESS EXPRESS	2014-08-31 11:45:18.915145	2014-08-31 11:45:18.915145
16070	5	18	5	2013-12-13	BUSINESS EXPRESS	2014-08-31 11:45:18.950968	2014-08-31 11:45:18.950968
16071	5	18	5	2013-12-13	YOUR TRADES THE WEEK AHEAD	2014-08-31 11:45:18.979155	2014-08-31 11:45:18.979155
16072	5	19	5	2013-12-13	MARKET HOUR	2014-08-31 11:45:19.00643	2014-08-31 11:45:19.00643
16073	5	20	5	2013-12-13	BUSINESS TONIGHT	2014-08-31 11:45:19.037703	2014-08-31 11:45:19.037703
16074	5	21	5	2013-12-13	THE MARKET MAKERS WITH ABHAY AIMA	2014-08-31 11:45:19.065475	2014-08-31 11:45:19.065475
16075	5	22	5	2013-12-13	THE PROPERTY GUIDE	2014-08-31 11:45:19.091706	2014-08-31 11:45:19.091706
16076	5	5	5	2013-12-16	THE MARKET MAKERS WITH ABHAY AIMA	2014-08-31 11:45:19.125104	2014-08-31 11:45:19.125104
16077	5	6	5	2013-12-16	MORNING MANTRA	2014-08-31 11:45:19.427823	2014-08-31 11:45:19.427823
16078	5	7	5	2013-12-16	TRADING CALLS	2014-08-31 11:45:19.455682	2014-08-31 11:45:19.455682
16079	5	8	5	2013-12-16	FIRST TRADES	2014-08-31 11:45:19.483979	2014-08-31 11:45:19.483979
16080	5	10	5	2013-12-16	TRADERS20 (T20)	2014-08-31 11:45:19.511318	2014-08-31 11:45:19.511318
16081	5	11	5	2013-12-16	MARKET SENSE	2014-08-31 11:45:19.542955	2014-08-31 11:45:19.542955
16082	5	12	5	2013-12-16	MARKETS AT LUNCH	2014-08-31 11:45:19.569776	2014-08-31 11:45:19.569776
16083	5	13	5	2013-12-16	THE F & O SHOW	2014-08-31 11:45:19.596462	2014-08-31 11:45:19.596462
16084	5	14	5	2013-12-16	TOMORROWS TRADES	2014-08-31 11:45:19.632778	2014-08-31 11:45:19.632778
16085	5	15	5	2013-12-16	MARKETS TOMORROW	2014-08-31 11:45:19.952984	2014-08-31 11:45:19.952984
16086	5	16	5	2013-12-16	HOT COMMODITIES	2014-08-31 11:45:19.981943	2014-08-31 11:45:19.981943
16087	5	17	5	2013-12-16	GLOBAL MANTRA OUTLOOK 2014	2014-08-31 11:45:20.010311	2014-08-31 11:45:20.010311
16088	5	18	5	2013-12-16	MARKET HOUR	2014-08-31 11:45:20.044753	2014-08-31 11:45:20.044753
16089	5	20	5	2013-12-16	BUSINESS TONIGHT	2014-08-31 11:45:20.073211	2014-08-31 11:45:20.073211
16090	5	21	5	2013-12-16	TOP 10 AT 10	2014-08-31 11:45:20.10273	2014-08-31 11:45:20.10273
16091	5	22	5	2013-12-16	MARKETS TOMORROW	2014-08-31 11:45:20.137957	2014-08-31 11:45:20.137957
16092	5	5	5	2013-12-17	INVESTORS GUIDE	2014-08-31 11:45:20.165058	2014-08-31 11:45:20.165058
16093	5	6	5	2013-12-17	TRADING CALLS	2014-08-31 11:45:20.19196	2014-08-31 11:45:20.19196
16094	5	7	5	2013-12-17	TRADING CALLS	2014-08-31 11:45:20.515833	2014-08-31 11:45:20.515833
16095	5	8	5	2013-12-17	FIRST TRADES	2014-08-31 11:45:20.549421	2014-08-31 11:45:20.549421
16096	5	10	5	2013-12-17	BUY NOW SELL NOW-THE STOCK GAM	2014-08-31 11:45:20.577507	2014-08-31 11:45:20.577507
16097	5	11	5	2013-12-17	MARKET SENSE	2014-08-31 11:45:20.605095	2014-08-31 11:45:20.605095
16098	5	12	5	2013-12-17	MARKETS AT LUNCH	2014-08-31 11:45:20.63662	2014-08-31 11:45:20.63662
16099	5	13	5	2013-12-17	THE F & O SHOW	2014-08-31 11:45:20.664281	2014-08-31 11:45:20.664281
16100	5	14	5	2013-12-17	BUSINESS DAY	2014-08-31 11:45:20.691275	2014-08-31 11:45:20.691275
16101	5	15	5	2013-12-17	MARKETS TOMORROW	2014-08-31 11:45:20.724495	2014-08-31 11:45:20.724495
16102	5	17	5	2013-12-17	RUSH HOUR	2014-08-31 11:45:21.081591	2014-08-31 11:45:21.081591
16103	5	18	5	2013-12-17	MARKETS TOMORROW	2014-08-31 11:45:21.108844	2014-08-31 11:45:21.108844
16104	5	18	5	2013-12-17	MARKET HOUR	2014-08-31 11:45:21.146755	2014-08-31 11:45:21.146755
16105	5	19	5	2013-12-17	BUSINESS TONIGHT	2014-08-31 11:45:21.177539	2014-08-31 11:45:21.177539
16106	5	20	5	2013-12-17	BUSINESS TONIGHT	2014-08-31 11:45:21.209074	2014-08-31 11:45:21.209074
16107	5	21	5	2013-12-17	INDIAMART LEADERS OF TOMORROW 2013	2014-08-31 11:45:21.241017	2014-08-31 11:45:21.241017
16108	5	5	5	2013-12-18	MORNING MANTRA	2014-08-31 11:45:21.268439	2014-08-31 11:45:21.268439
16109	5	6	5	2013-12-18	MORNING BETS	2014-08-31 11:45:21.294755	2014-08-31 11:45:21.294755
16110	5	6	5	2013-12-18	TRADING CALLS	2014-08-31 11:45:21.61511	2014-08-31 11:45:21.61511
16111	5	7	5	2013-12-18	FIRST TRADES	2014-08-31 11:45:21.649878	2014-08-31 11:45:21.649878
16112	5	11	5	2013-12-18	MARKET SENSE	2014-08-31 11:45:21.678648	2014-08-31 11:45:21.678648
16113	5	11	5	2013-12-18	MARKET SENSE	2014-08-31 11:45:21.706936	2014-08-31 11:45:21.706936
16114	5	12	5	2013-12-18	THE F & O SHOW	2014-08-31 11:45:21.736308	2014-08-31 11:45:21.736308
16115	5	13	5	2013-12-18	CLOSING TRADES	2014-08-31 11:45:21.764202	2014-08-31 11:45:21.764202
16116	5	14	5	2013-12-18	TOMORROWS TRADES	2014-08-31 11:45:21.791881	2014-08-31 11:45:21.791881
16117	5	15	5	2013-12-18	BUSINESS DAY	2014-08-31 11:45:21.82735	2014-08-31 11:45:21.82735
16118	5	16	5	2013-12-18	BUSINESS DAY	2014-08-31 11:45:22.146498	2014-08-31 11:45:22.146498
16119	5	17	5	2013-12-18	GLOBAL MANTRA OUTLOOK 2014	2014-08-31 11:45:22.174543	2014-08-31 11:45:22.174543
16120	5	18	5	2013-12-18	MARKETS TOMORROW	2014-08-31 11:45:22.202531	2014-08-31 11:45:22.202531
16121	5	19	5	2013-12-18	MARKET HOUR	2014-08-31 11:45:22.234036	2014-08-31 11:45:22.234036
16122	5	21	5	2013-12-18	MARKETS TOMORROW	2014-08-31 11:45:22.262968	2014-08-31 11:45:22.262968
16123	5	22	5	2013-12-18	MARKETS TOMORROW	2014-08-31 11:45:22.29079	2014-08-31 11:45:22.29079
16124	5	9	5	2013-12-19	HOT STOCKS	2014-08-31 11:45:22.325146	2014-08-31 11:45:22.325146
16125	5	10	5	2013-12-19	BUY NOW SELL NOW-THE STOCK GAM	2014-08-31 11:45:22.351761	2014-08-31 11:45:22.351761
16126	5	11	5	2013-12-19	MARKET SENSE	2014-08-31 11:45:22.673786	2014-08-31 11:45:22.673786
16127	5	12	5	2013-12-19	MARKETS AT LUNCH	2014-08-31 11:45:22.703425	2014-08-31 11:45:22.703425
16128	5	14	5	2013-12-19	TOMORROWS TRADES	2014-08-31 11:45:22.737655	2014-08-31 11:45:22.737655
16129	5	15	5	2013-12-19	BUSINESS DAY	2014-08-31 11:45:22.767239	2014-08-31 11:45:22.767239
16130	5	16	5	2013-12-19	HOT COMMODITIES	2014-08-31 11:45:22.796315	2014-08-31 11:45:22.796315
16131	5	17	5	2013-12-19	MARKET MAKERS WITH NAVNEET MUNOT	2014-08-31 11:45:22.833144	2014-08-31 11:45:22.833144
16132	5	18	5	2013-12-19	MARKET HOUR	2014-08-31 11:45:22.862121	2014-08-31 11:45:22.862121
16133	5	20	5	2013-12-19	BUSINESS TONIGHT	2014-08-31 11:45:22.891544	2014-08-31 11:45:22.891544
16134	5	21	5	2013-12-19	TOP 10 AT 10	2014-08-31 11:45:23.217057	2014-08-31 11:45:23.217057
16135	5	22	5	2013-12-19	MARKETS TOMORROW	2014-08-31 11:45:23.249872	2014-08-31 11:45:23.249872
16136	5	9	5	2013-12-20	HOT STOCKS	2014-08-31 11:45:23.282696	2014-08-31 11:45:23.282696
16137	5	10	5	2013-12-20	BUY NOW SELL NOW-THE STOCK GAM	2014-08-31 11:45:23.310646	2014-08-31 11:45:23.310646
16138	5	11	5	2013-12-20	MARKETS AT LUNCH	2014-08-31 11:45:23.342694	2014-08-31 11:45:23.342694
16139	5	13	5	2013-12-20	THE F & O SHOW	2014-08-31 11:45:23.372004	2014-08-31 11:45:23.372004
16140	5	17	5	2013-12-20	RUSH HOUR	2014-08-31 11:45:23.39982	2014-08-31 11:45:23.39982
16141	5	18	5	2013-12-20	BUSINESS EXPRESS	2014-08-31 11:45:23.430997	2014-08-31 11:45:23.430997
16142	5	19	5	2013-12-20	MARKET HOUR	2014-08-31 11:45:23.459914	2014-08-31 11:45:23.459914
16143	5	20	5	2013-12-20	TOP 10 AT 10	2014-08-31 11:45:23.783476	2014-08-31 11:45:23.783476
16144	5	21	5	2013-12-20	BUSINESS DAY	2014-08-31 11:45:23.811188	2014-08-31 11:45:23.811188
16145	5	22	5	2013-12-20	THE PROPERTY GUIDE	2014-08-31 11:45:23.842871	2014-08-31 11:45:23.842871
16146	5	17	6	2013-11-29	FOOD SAFARI	2014-08-31 11:45:23.870682	2014-08-31 11:45:23.870682
16147	5	17	6	2013-11-29	EAT ST	2014-08-31 11:45:23.901078	2014-08-31 11:45:23.901078
16148	5	18	6	2013-11-29	BOYS WEEKEND	2014-08-31 11:45:23.937747	2014-08-31 11:45:23.937747
16149	5	18	6	2013-11-29	JAMES MARTINS MEDITERRANEAN	2014-08-31 11:45:23.965683	2014-08-31 11:45:23.965683
16150	5	18	6	2013-11-29	JAMES MARTINS MEDITERRANEAN	2014-08-31 11:45:23.992526	2014-08-31 11:45:23.992526
16151	5	19	6	2013-11-29	THE TASTE	2014-08-31 11:45:24.32301	2014-08-31 11:45:24.32301
16152	5	19	6	2013-11-29	THE TASTE	2014-08-31 11:45:24.35117	2014-08-31 11:45:24.35117
16153	5	19	6	2013-11-29	THE TASTE	2014-08-31 11:45:24.379543	2014-08-31 11:45:24.379543
16154	5	19	6	2013-11-29	THE TASTE	2014-08-31 11:45:24.409924	2014-08-31 11:45:24.409924
16155	5	20	6	2013-11-29	THE TASTE	2014-08-31 11:45:24.442909	2014-08-31 11:45:24.442909
16156	5	20	6	2013-11-29	THE TASTE	2014-08-31 11:45:24.471638	2014-08-31 11:45:24.471638
16157	5	20	6	2013-11-29	THE TASTE	2014-08-31 11:45:24.49846	2014-08-31 11:45:24.49846
16158	5	20	6	2013-11-29	THE TASTE	2014-08-31 11:45:24.528746	2014-08-31 11:45:24.528746
16159	5	21	6	2013-11-29	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:24.849088	2014-08-31 11:45:24.849088
16160	5	21	6	2013-11-29	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:24.880533	2014-08-31 11:45:24.880533
16161	5	21	6	2013-11-29	BOYS WEEKEND	2014-08-31 11:45:24.908214	2014-08-31 11:45:24.908214
16162	5	22	6	2013-11-29	GETAWAY	2014-08-31 11:45:24.944581	2014-08-31 11:45:24.944581
16163	5	22	6	2013-11-29	LATIN ANGELS SPECIAL	2014-08-31 11:45:24.972883	2014-08-31 11:45:24.972883
16164	5	9	6	2013-11-30	EAT ST	2014-08-31 11:45:25.000538	2014-08-31 11:45:25.000538
16165	5	12	6	2013-11-30	ITALIAN FOOD SAFARI	2014-08-31 11:45:25.033046	2014-08-31 11:45:25.033046
16166	5	13	6	2013-11-30	BOYS WEEKEND	2014-08-31 11:45:25.060981	2014-08-31 11:45:25.060981
16167	5	14	6	2013-11-30	TWIST OF TASTE 2	2014-08-31 11:45:25.38517	2014-08-31 11:45:25.38517
16168	5	15	6	2013-11-30	TWIST OF TASTE 2	2014-08-31 11:45:25.413783	2014-08-31 11:45:25.413783
16169	5	15	6	2013-11-30	TWIST OF TASTE 2	2014-08-31 11:45:25.451884	2014-08-31 11:45:25.451884
16170	5	16	6	2013-11-30	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:25.480647	2014-08-31 11:45:25.480647
16171	5	17	6	2013-11-30	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:25.511315	2014-08-31 11:45:25.511315
16172	5	17	6	2013-11-30	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:25.539295	2014-08-31 11:45:25.539295
16173	5	18	6	2013-11-30	FOOD SAFARI	2014-08-31 11:45:25.569916	2014-08-31 11:45:25.569916
16174	5	19	6	2013-11-30	THE TASTE	2014-08-31 11:45:25.596391	2014-08-31 11:45:25.596391
16175	5	20	6	2013-11-30	BOYS WEEKEND	2014-08-31 11:45:25.923329	2014-08-31 11:45:25.923329
16176	5	20	6	2013-11-30	BOYS WEEKEND	2014-08-31 11:45:25.952119	2014-08-31 11:45:25.952119
16177	5	21	6	2013-11-30	EAT ST	2014-08-31 11:45:25.981209	2014-08-31 11:45:25.981209
16178	5	21	6	2013-11-30	JAMES MARTINS MEDITERRANEAN	2014-08-31 11:45:26.024315	2014-08-31 11:45:26.024315
16179	5	22	6	2013-11-30	GETAWAY	2014-08-31 11:45:26.074658	2014-08-31 11:45:26.074658
16180	5	22	6	2013-11-30	LATIN ANGELS SPECIAL	2014-08-31 11:45:26.102751	2014-08-31 11:45:26.102751
16181	5	10	6	2013-12-01	FOOD SAFARI	2014-08-31 11:45:26.133492	2014-08-31 11:45:26.133492
16182	5	10	6	2013-12-01	FOOD SAFARI	2014-08-31 11:45:26.160889	2014-08-31 11:45:26.160889
16183	5	15	6	2013-12-01	TWIST OF TASTE 2	2014-08-31 11:45:26.484268	2014-08-31 11:45:26.484268
16184	5	15	6	2013-12-01	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:26.511057	2014-08-31 11:45:26.511057
16185	5	15	6	2013-12-01	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:26.541781	2014-08-31 11:45:26.541781
16186	5	16	6	2013-12-01	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:26.568916	2014-08-31 11:45:26.568916
16187	5	16	6	2013-12-01	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:26.595954	2014-08-31 11:45:26.595954
16188	5	16	6	2013-12-01	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:26.626255	2014-08-31 11:45:26.626255
16189	5	17	6	2013-12-01	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:26.651697	2014-08-31 11:45:26.651697
16190	5	17	6	2013-12-01	BOYS WEEKEND	2014-08-31 11:45:26.676929	2014-08-31 11:45:26.676929
16191	5	17	6	2013-12-01	BOYS WEEKEND	2014-08-31 11:45:26.701388	2014-08-31 11:45:26.701388
16192	5	18	6	2013-12-01	STYLE AND THE CITY	2014-08-31 11:45:27.012349	2014-08-31 11:45:27.012349
16193	5	18	6	2013-12-01	JAMIE AT HOME	2014-08-31 11:45:27.050588	2014-08-31 11:45:27.050588
16194	5	19	6	2013-12-01	JAMIE AT HOME	2014-08-31 11:45:27.079293	2014-08-31 11:45:27.079293
16195	5	20	6	2013-12-01	FOOD SAFARI	2014-08-31 11:45:27.10713	2014-08-31 11:45:27.10713
16196	5	21	6	2013-12-01	THE TASTE	2014-08-31 11:45:27.133457	2014-08-31 11:45:27.133457
16197	5	22	6	2013-12-01	LATIN ANGELS SPECIAL	2014-08-31 11:45:27.160663	2014-08-31 11:45:27.160663
16198	5	17	6	2013-12-02	EAT ST	2014-08-31 11:45:27.187306	2014-08-31 11:45:27.187306
16199	5	17	6	2013-12-02	CHEESE SLICES	2014-08-31 11:45:27.211931	2014-08-31 11:45:27.211931
16200	5	18	6	2013-12-02	GETAWAY	2014-08-31 11:45:27.53331	2014-08-31 11:45:27.53331
16201	5	18	6	2013-12-02	GETAWAY	2014-08-31 11:45:27.561134	2014-08-31 11:45:27.561134
16202	5	18	6	2013-12-02	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:27.59071	2014-08-31 11:45:27.59071
16203	5	19	6	2013-12-02	BOYS WEEKEND	2014-08-31 11:45:27.618774	2014-08-31 11:45:27.618774
16204	5	20	6	2013-12-02	FOOD SAFARI	2014-08-31 11:45:27.651127	2014-08-31 11:45:27.651127
16205	5	20	6	2013-12-02	TWIST OF TASTE 2	2014-08-31 11:45:27.679198	2014-08-31 11:45:27.679198
16206	5	20	6	2013-12-02	TWIST OF TASTE 2	2014-08-31 11:45:27.705978	2014-08-31 11:45:27.705978
16207	5	21	6	2013-12-02	GETAWAY	2014-08-31 11:45:27.741704	2014-08-31 11:45:27.741704
16208	5	21	6	2013-12-02	ONE MAN AND HIS CAMPERVAN	2014-08-31 11:45:28.053988	2014-08-31 11:45:28.053988
16209	5	22	6	2013-12-02	LATIN ANGELS SPECIAL	2014-08-31 11:45:28.084322	2014-08-31 11:45:28.084322
16210	5	17	6	2013-12-03	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:28.11371	2014-08-31 11:45:28.11371
16211	5	17	6	2013-12-03	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:28.145798	2014-08-31 11:45:28.145798
16212	5	17	6	2013-12-03	ONE MAN AND HIS CAMPERVAN	2014-08-31 11:45:28.17443	2014-08-31 11:45:28.17443
16213	5	18	6	2013-12-03	THE TASTE	2014-08-31 11:45:28.202706	2014-08-31 11:45:28.202706
16214	5	19	6	2013-12-03	BOYS WEEKEND	2014-08-31 11:45:28.234544	2014-08-31 11:45:28.234544
16215	5	20	6	2013-12-03	FOOD SAFARI	2014-08-31 11:45:28.262018	2014-08-31 11:45:28.262018
16216	5	20	6	2013-12-03	TWIST OF TASTE 2	2014-08-31 11:45:28.586297	2014-08-31 11:45:28.586297
16217	5	21	6	2013-12-03	GETAWAY	2014-08-31 11:45:28.614924	2014-08-31 11:45:28.614924
16218	5	21	6	2013-12-03	GETAWAY	2014-08-31 11:45:28.64798	2014-08-31 11:45:28.64798
16219	5	21	6	2013-12-03	CHEESE SLICES	2014-08-31 11:45:28.682379	2014-08-31 11:45:28.682379
16220	5	22	6	2013-12-03	LATIN ANGELS SPECIAL	2014-08-31 11:45:28.709524	2014-08-31 11:45:28.709524
16221	5	22	6	2013-12-03	LATIN ANGELS SPECIAL	2014-08-31 11:45:28.740255	2014-08-31 11:45:28.740255
16222	5	17	6	2013-12-04	BOYS WEEKEND	2014-08-31 11:45:28.773499	2014-08-31 11:45:28.773499
16223	5	17	6	2013-12-04	BOYS WEEKEND	2014-08-31 11:45:28.800426	2014-08-31 11:45:28.800426
16224	5	17	6	2013-12-04	FOOD SAFARI	2014-08-31 11:45:29.08561	2014-08-31 11:45:29.08561
16225	5	17	6	2013-12-04	FOOD SAFARI	2014-08-31 11:45:29.11308	2014-08-31 11:45:29.11308
16226	5	18	6	2013-12-04	ONE MAN AND HIS CAMPERVAN	2014-08-31 11:45:29.144549	2014-08-31 11:45:29.144549
16227	5	19	6	2013-12-04	JAMIE AT HOME	2014-08-31 11:45:29.171943	2014-08-31 11:45:29.171943
16228	5	19	6	2013-12-04	ANNA AND KRISTINAS GROCERY BAG	2014-08-31 11:45:29.200585	2014-08-31 11:45:29.200585
16229	5	20	6	2013-12-04	EAT ST	2014-08-31 11:45:29.233758	2014-08-31 11:45:29.233758
16230	5	20	6	2013-12-04	TWIST OF TASTE 2	2014-08-31 11:45:29.264436	2014-08-31 11:45:29.264436
16231	5	20	6	2013-12-04	TWIST OF TASTE 2	2014-08-31 11:45:29.293884	2014-08-31 11:45:29.293884
16232	5	22	6	2013-12-04	LATIN ANGELS SPECIAL	2014-08-31 11:45:29.618051	2014-08-31 11:45:29.618051
16233	5	17	6	2013-12-05	EAT ST	2014-08-31 11:45:29.649345	2014-08-31 11:45:29.649345
16234	5	17	6	2013-12-05	CHEESE SLICES	2014-08-31 11:45:29.677168	2014-08-31 11:45:29.677168
16235	5	17	6	2013-12-05	CHEESE SLICES	2014-08-31 11:45:29.704957	2014-08-31 11:45:29.704957
16236	5	18	6	2013-12-05	ANNA AND KRISTINAS GROCERY BAG	2014-08-31 11:45:29.736671	2014-08-31 11:45:29.736671
16237	5	18	6	2013-12-05	ANNA AND KRISTINAS GROCERY BAG	2014-08-31 11:45:29.764031	2014-08-31 11:45:29.764031
16238	5	18	6	2013-12-05	FOOD SAFARI	2014-08-31 11:45:29.790535	2014-08-31 11:45:29.790535
16239	5	18	6	2013-12-05	FOOD SAFARI	2014-08-31 11:45:29.816065	2014-08-31 11:45:29.816065
16240	5	19	6	2013-12-05	5 INGREDIENT FIX	2014-08-31 11:45:29.851503	2014-08-31 11:45:29.851503
16241	5	21	6	2013-12-05	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:30.17596	2014-08-31 11:45:30.17596
16242	5	21	6	2013-12-05	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:30.206561	2014-08-31 11:45:30.206561
16243	5	21	6	2013-12-05	FOOD SAFARI	2014-08-31 11:45:30.237403	2014-08-31 11:45:30.237403
16244	5	22	6	2013-12-05	LATIN ANGELS SPECIAL	2014-08-31 11:45:30.267118	2014-08-31 11:45:30.267118
16245	5	17	6	2013-12-06	FOOD SAFARI	2014-08-31 11:45:30.294929	2014-08-31 11:45:30.294929
16246	5	17	6	2013-12-06	FOOD SAFARI	2014-08-31 11:45:30.326003	2014-08-31 11:45:30.326003
16247	5	17	6	2013-12-06	BOYS WEEKEND	2014-08-31 11:45:30.354094	2014-08-31 11:45:30.354094
16248	5	17	6	2013-12-06	BOYS WEEKEND	2014-08-31 11:45:30.380763	2014-08-31 11:45:30.380763
16249	5	18	6	2013-12-06	5 INGREDIENT FIX	2014-08-31 11:45:30.718769	2014-08-31 11:45:30.718769
16250	5	18	6	2013-12-06	5 INGREDIENT FIX	2014-08-31 11:45:30.749639	2014-08-31 11:45:30.749639
16251	5	18	6	2013-12-06	CHEESE SLICES	2014-08-31 11:45:30.778077	2014-08-31 11:45:30.778077
16252	5	21	6	2013-12-06	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:30.805656	2014-08-31 11:45:30.805656
16253	5	21	6	2013-12-06	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:30.837593	2014-08-31 11:45:30.837593
16254	5	21	6	2013-12-06	FOOD SAFARI	2014-08-31 11:45:30.865645	2014-08-31 11:45:30.865645
16255	5	22	6	2013-12-06	GETAWAY	2014-08-31 11:45:30.892836	2014-08-31 11:45:30.892836
16256	5	22	6	2013-12-06	GETAWAY	2014-08-31 11:45:30.918042	2014-08-31 11:45:30.918042
16257	5	22	6	2013-12-06	LATIN ANGELS SPECIAL	2014-08-31 11:45:31.273473	2014-08-31 11:45:31.273473
16258	5	22	6	2013-12-06	LATIN ANGELS SPECIAL	2014-08-31 11:45:31.300961	2014-08-31 11:45:31.300961
16259	5	10	6	2013-12-07	BOYS WEEKEND	2014-08-31 11:45:31.332373	2014-08-31 11:45:31.332373
16260	5	12	6	2013-12-07	JAMIE AT HOME	2014-08-31 11:45:31.360126	2014-08-31 11:45:31.360126
16261	5	13	6	2013-12-07	ONE MAN AND HIS CAMPERVAN	2014-08-31 11:45:31.387639	2014-08-31 11:45:31.387639
16262	5	14	6	2013-12-07	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:31.414187	2014-08-31 11:45:31.414187
16263	5	14	6	2013-12-07	ANNA AND KRISTINAS GROCERY BAG	2014-08-31 11:45:31.443933	2014-08-31 11:45:31.443933
16264	5	15	6	2013-12-07	TWIST OF TASTE 2	2014-08-31 11:45:31.471158	2014-08-31 11:45:31.471158
16265	5	15	6	2013-12-07	TWIST OF TASTE 2	2014-08-31 11:45:31.793274	2014-08-31 11:45:31.793274
16266	5	15	6	2013-12-07	STYLE AND THE CITY	2014-08-31 11:45:31.824618	2014-08-31 11:45:31.824618
16267	5	17	6	2013-12-07	EAT ST	2014-08-31 11:45:31.853513	2014-08-31 11:45:31.853513
16268	5	17	6	2013-12-07	ONE MAN AND HIS CAMPERVAN	2014-08-31 11:45:31.883483	2014-08-31 11:45:31.883483
16269	5	18	6	2013-12-07	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:31.911328	2014-08-31 11:45:31.911328
16270	5	19	6	2013-12-07	THE TASTE	2014-08-31 11:45:31.943488	2014-08-31 11:45:31.943488
16271	5	21	6	2013-12-07	CHEESE SLICES	2014-08-31 11:45:31.970703	2014-08-31 11:45:31.970703
16272	5	22	6	2013-12-07	LATIN ANGELS SPECIAL	2014-08-31 11:45:31.997243	2014-08-31 11:45:31.997243
16273	5	9	6	2013-12-08	5 INGREDIENT FIX	2014-08-31 11:45:32.319937	2014-08-31 11:45:32.319937
16274	5	9	6	2013-12-08	5 INGREDIENT FIX	2014-08-31 11:45:32.349854	2014-08-31 11:45:32.349854
16275	5	11	6	2013-12-08	LIFE ME EK BAAR	2014-08-31 11:45:32.377505	2014-08-31 11:45:32.377505
16276	5	11	6	2013-12-08	JAMIE AT HOME	2014-08-31 11:45:32.405741	2014-08-31 11:45:32.405741
16277	5	15	6	2013-12-08	BOYS WEEKEND	2014-08-31 11:45:32.43831	2014-08-31 11:45:32.43831
16278	5	16	6	2013-12-08	EAT ST	2014-08-31 11:45:32.467838	2014-08-31 11:45:32.467838
16279	5	17	6	2013-12-08	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:32.496392	2014-08-31 11:45:32.496392
16280	5	17	6	2013-12-08	CHEESE SLICES	2014-08-31 11:45:32.522361	2014-08-31 11:45:32.522361
16281	5	18	6	2013-12-08	ANNA AND KRISTINAS GROCERY BAG	2014-08-31 11:45:32.83637	2014-08-31 11:45:32.83637
16282	5	18	6	2013-12-08	ONE MAN AND HIS CAMPERVAN	2014-08-31 11:45:32.865391	2014-08-31 11:45:32.865391
16283	5	19	6	2013-12-08	JAMIE AT HOME	2014-08-31 11:45:32.894187	2014-08-31 11:45:32.894187
16284	5	21	6	2013-12-08	THE TASTE	2014-08-31 11:45:32.925425	2014-08-31 11:45:32.925425
16285	5	21	6	2013-12-08	THE TASTE	2014-08-31 11:45:32.953364	2014-08-31 11:45:32.953364
16286	5	22	6	2013-12-08	LATIN ANGELS SPECIAL	2014-08-31 11:45:32.980782	2014-08-31 11:45:32.980782
16287	5	17	6	2013-12-09	EAT ST	2014-08-31 11:45:33.007025	2014-08-31 11:45:33.007025
16288	5	17	6	2013-12-09	CHEESE SLICES	2014-08-31 11:45:33.037141	2014-08-31 11:45:33.037141
16289	5	18	6	2013-12-09	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:33.062246	2014-08-31 11:45:33.062246
16290	5	18	6	2013-12-09	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:33.381293	2014-08-31 11:45:33.381293
16291	5	19	6	2013-12-09	ANNA AND KRISTINAS GROCERY BAG	2014-08-31 11:45:33.409449	2014-08-31 11:45:33.409449
16292	5	19	6	2013-12-09	BOYS WEEKEND	2014-08-31 11:45:33.44153	2014-08-31 11:45:33.44153
16293	5	20	6	2013-12-09	FOOD SAFARI	2014-08-31 11:45:33.469508	2014-08-31 11:45:33.469508
16294	5	20	6	2013-12-09	TWIST OF TASTE 2	2014-08-31 11:45:33.50289	2014-08-31 11:45:33.50289
16295	5	20	6	2013-12-09	TWIST OF TASTE 2	2014-08-31 11:45:33.534899	2014-08-31 11:45:33.534899
16296	5	21	6	2013-12-09	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:33.561562	2014-08-31 11:45:33.561562
16297	5	22	6	2013-12-09	LATIN ANGELS SPECIAL	2014-08-31 11:45:33.587282	2014-08-31 11:45:33.587282
16298	5	22	6	2013-12-09	LATIN ANGELS SPECIAL	2014-08-31 11:45:33.912494	2014-08-31 11:45:33.912494
16299	5	17	6	2013-12-10	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:33.945397	2014-08-31 11:45:33.945397
16300	5	17	6	2013-12-10	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:33.974835	2014-08-31 11:45:33.974835
16301	5	17	6	2013-12-10	ONE MAN AND HIS CAMPERVAN	2014-08-31 11:45:34.003839	2014-08-31 11:45:34.003839
16302	5	18	6	2013-12-10	THE TASTE	2014-08-31 11:45:34.036019	2014-08-31 11:45:34.036019
16303	5	18	6	2013-12-10	THE TASTE	2014-08-31 11:45:34.065353	2014-08-31 11:45:34.065353
16304	5	19	6	2013-12-10	5 INGREDIENT FIX	2014-08-31 11:45:34.093068	2014-08-31 11:45:34.093068
16305	5	19	6	2013-12-10	BOYS WEEKEND	2014-08-31 11:45:34.124464	2014-08-31 11:45:34.124464
16306	5	20	6	2013-12-10	FOOD SAFARI	2014-08-31 11:45:34.427559	2014-08-31 11:45:34.427559
16307	5	20	6	2013-12-10	TWIST OF TASTE 2	2014-08-31 11:45:34.453985	2014-08-31 11:45:34.453985
16308	5	20	6	2013-12-10	TWIST OF TASTE 2	2014-08-31 11:45:34.480984	2014-08-31 11:45:34.480984
16309	5	21	6	2013-12-10	GETAWAY	2014-08-31 11:45:34.507131	2014-08-31 11:45:34.507131
16310	5	21	6	2013-12-10	CHEESE SLICES	2014-08-31 11:45:34.541718	2014-08-31 11:45:34.541718
16311	5	17	6	2013-12-11	BOYS WEEKEND	2014-08-31 11:45:34.572347	2014-08-31 11:45:34.572347
16312	5	17	6	2013-12-11	FOOD SAFARI	2014-08-31 11:45:34.599954	2014-08-31 11:45:34.599954
16313	5	17	6	2013-12-11	FOOD SAFARI	2014-08-31 11:45:34.630128	2014-08-31 11:45:34.630128
16314	5	18	6	2013-12-11	5 INGREDIENT FIX	2014-08-31 11:45:34.957082	2014-08-31 11:45:34.957082
16315	5	18	6	2013-12-11	5 INGREDIENT FIX	2014-08-31 11:45:34.985595	2014-08-31 11:45:34.985595
16316	5	18	6	2013-12-11	ONE MAN AND HIS CAMPERVAN	2014-08-31 11:45:35.014193	2014-08-31 11:45:35.014193
16317	5	19	6	2013-12-11	JAMIE AT HOME	2014-08-31 11:45:35.047031	2014-08-31 11:45:35.047031
16318	5	20	6	2013-12-11	EAT ST	2014-08-31 11:45:35.076342	2014-08-31 11:45:35.076342
16319	5	20	6	2013-12-11	EAT ST	2014-08-31 11:45:35.105353	2014-08-31 11:45:35.105353
16320	5	21	6	2013-12-11	THE TASTE	2014-08-31 11:45:35.136409	2014-08-31 11:45:35.136409
16321	5	21	6	2013-12-11	THE TASTE	2014-08-31 11:45:35.164337	2014-08-31 11:45:35.164337
16322	5	21	6	2013-12-11	THE TASTE	2014-08-31 11:45:35.485586	2014-08-31 11:45:35.485586
16323	5	17	6	2013-12-12	EAT ST	2014-08-31 11:45:35.514474	2014-08-31 11:45:35.514474
16324	5	17	6	2013-12-12	CHEESE SLICES	2014-08-31 11:45:35.549383	2014-08-31 11:45:35.549383
16325	5	18	6	2013-12-12	ANNA AND KRISTINAS GROCERY BAG	2014-08-31 11:45:35.576584	2014-08-31 11:45:35.576584
16326	5	18	6	2013-12-12	ANNA AND KRISTINAS GROCERY BAG	2014-08-31 11:45:35.603546	2014-08-31 11:45:35.603546
16327	5	18	6	2013-12-12	FOOD SAFARI	2014-08-31 11:45:35.635284	2014-08-31 11:45:35.635284
16328	5	19	6	2013-12-12	JAMIE AT HOME	2014-08-31 11:45:35.662812	2014-08-31 11:45:35.662812
16329	5	19	6	2013-12-12	5 INGREDIENT FIX	2014-08-31 11:45:35.689758	2014-08-31 11:45:35.689758
16330	5	21	6	2013-12-12	5 INGREDIENT FIX	2014-08-31 11:45:36.053925	2014-08-31 11:45:36.053925
16331	5	21	6	2013-12-12	5 INGREDIENT FIX	2014-08-31 11:45:36.086736	2014-08-31 11:45:36.086736
16332	5	21	6	2013-12-12	5 INGREDIENT FIX	2014-08-31 11:45:36.114309	2014-08-31 11:45:36.114309
16333	5	22	6	2013-12-12	LATIN ANGELS SPECIAL	2014-08-31 11:45:36.148907	2014-08-31 11:45:36.148907
16334	5	22	6	2013-12-12	LATIN ANGELS SPECIAL	2014-08-31 11:45:36.178053	2014-08-31 11:45:36.178053
16335	5	17	6	2013-12-13	FOOD SAFARI	2014-08-31 11:45:36.206009	2014-08-31 11:45:36.206009
16336	5	18	6	2013-12-13	5 INGREDIENT FIX	2014-08-31 11:45:36.237281	2014-08-31 11:45:36.237281
16337	5	19	6	2013-12-13	THE TASTE	2014-08-31 11:45:36.264358	2014-08-31 11:45:36.264358
16338	5	19	6	2013-12-13	THE TASTE	2014-08-31 11:45:36.581051	2014-08-31 11:45:36.581051
16339	5	19	6	2013-12-13	THE TASTE	2014-08-31 11:45:36.61704	2014-08-31 11:45:36.61704
16340	5	20	6	2013-12-13	THE TASTE	2014-08-31 11:45:36.648873	2014-08-31 11:45:36.648873
16341	5	20	6	2013-12-13	THE TASTE	2014-08-31 11:45:36.676732	2014-08-31 11:45:36.676732
16342	5	20	6	2013-12-13	THE TASTE	2014-08-31 11:45:36.705086	2014-08-31 11:45:36.705086
16343	5	20	6	2013-12-13	THE TASTE	2014-08-31 11:45:36.738292	2014-08-31 11:45:36.738292
16344	5	21	6	2013-12-13	KITCHEN NIGHTMARES	2014-08-31 11:45:36.766455	2014-08-31 11:45:36.766455
16345	5	21	6	2013-12-13	KITCHEN NIGHTMARES	2014-08-31 11:45:36.794975	2014-08-31 11:45:36.794975
16346	5	22	6	2013-12-13	GETAWAY	2014-08-31 11:45:36.82469	2014-08-31 11:45:36.82469
16347	5	9	6	2013-12-14	JAMIE AT HOME	2014-08-31 11:45:37.151907	2014-08-31 11:45:37.151907
16348	5	10	6	2013-12-14	CHEESE SLICES	2014-08-31 11:45:37.180937	2014-08-31 11:45:37.180937
16349	5	12	6	2013-12-14	KITCHEN NIGHTMARES	2014-08-31 11:45:37.209909	2014-08-31 11:45:37.209909
16350	5	12	6	2013-12-14	KITCHEN NIGHTMARES	2014-08-31 11:45:37.241979	2014-08-31 11:45:37.241979
16351	5	12	6	2013-12-14	KITCHEN NIGHTMARES	2014-08-31 11:45:37.270426	2014-08-31 11:45:37.270426
16352	5	13	6	2013-12-14	ONE MAN AND HIS CAMPERVAN	2014-08-31 11:45:37.301205	2014-08-31 11:45:37.301205
16353	5	15	6	2013-12-14	STYLE AND THE CITY	2014-08-31 11:45:37.33738	2014-08-31 11:45:37.33738
16354	5	16	6	2013-12-14	KITCHEN NIGHTMARES	2014-08-31 11:45:37.363444	2014-08-31 11:45:37.363444
16355	5	16	6	2013-12-14	KITCHEN NIGHTMARES	2014-08-31 11:45:37.691163	2014-08-31 11:45:37.691163
16356	5	17	6	2013-12-14	ONE MAN AND HIS CAMPERVAN	2014-08-31 11:45:37.723282	2014-08-31 11:45:37.723282
16357	5	17	6	2013-12-14	ONE MAN AND HIS CAMPERVAN	2014-08-31 11:45:37.752511	2014-08-31 11:45:37.752511
16358	5	17	6	2013-12-14	JAMIE AT HOME	2014-08-31 11:45:37.784914	2014-08-31 11:45:37.784914
16359	5	9	6	2013-12-15	JAMIE AT HOME	2014-08-31 11:45:37.812539	2014-08-31 11:45:37.812539
16360	5	11	6	2013-12-15	KITCHEN NIGHTMARES	2014-08-31 11:45:37.84666	2014-08-31 11:45:37.84666
16361	5	12	6	2013-12-15	THE TASTE	2014-08-31 11:45:37.878443	2014-08-31 11:45:37.878443
16362	5	14	6	2013-12-15	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:37.905548	2014-08-31 11:45:37.905548
16363	5	14	6	2013-12-15	ANNA AND KRISTINAS GROCERY BAG	2014-08-31 11:45:38.224426	2014-08-31 11:45:38.224426
16364	5	14	6	2013-12-15	ANNA AND KRISTINAS GROCERY BAG	2014-08-31 11:45:38.253032	2014-08-31 11:45:38.253032
16365	5	15	6	2013-12-15	GETAWAY	2014-08-31 11:45:38.28186	2014-08-31 11:45:38.28186
16366	5	15	6	2013-12-15	GETAWAY	2014-08-31 11:45:38.308593	2014-08-31 11:45:38.308593
16367	5	16	6	2013-12-15	FOOD SAFARI	2014-08-31 11:45:38.340258	2014-08-31 11:45:38.340258
16368	5	17	6	2013-12-15	BOYS WEEKEND	2014-08-31 11:45:38.368189	2014-08-31 11:45:38.368189
16369	5	18	6	2013-12-15	INDIA BIKE WEEK	2014-08-31 11:45:38.395437	2014-08-31 11:45:38.395437
16370	5	22	6	2013-12-15	GETAWAY	2014-08-31 11:45:38.434898	2014-08-31 11:45:38.434898
16371	5	17	6	2013-12-16	EAT ST	2014-08-31 11:45:38.753412	2014-08-31 11:45:38.753412
16372	5	17	6	2013-12-16	EAT ST	2014-08-31 11:45:38.783061	2014-08-31 11:45:38.783061
16373	5	17	6	2013-12-16	ONE MAN AND HIS CAMPERVAN	2014-08-31 11:45:38.810497	2014-08-31 11:45:38.810497
16374	5	18	6	2013-12-16	GETAWAY	2014-08-31 11:45:38.843335	2014-08-31 11:45:38.843335
16375	5	18	6	2013-12-16	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:38.872762	2014-08-31 11:45:38.872762
16376	5	18	6	2013-12-16	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:38.901112	2014-08-31 11:45:38.901112
16377	5	19	6	2013-12-16	BOYS WEEKEND	2014-08-31 11:45:38.932548	2014-08-31 11:45:38.932548
16378	5	21	6	2013-12-16	EAT ST	2014-08-31 11:45:38.961068	2014-08-31 11:45:38.961068
16379	5	21	6	2013-12-16	EAT ST	2014-08-31 11:45:39.284296	2014-08-31 11:45:39.284296
16380	5	22	6	2013-12-16	THE HOLIDAY SHOW	2014-08-31 11:45:39.31195	2014-08-31 11:45:39.31195
16381	5	22	6	2013-12-16	LATIN ANGELS SPECIAL	2014-08-31 11:45:39.344528	2014-08-31 11:45:39.344528
16382	5	16	6	2013-12-17	EDS UP	2014-08-31 11:45:39.373912	2014-08-31 11:45:39.373912
16383	5	16	6	2013-12-17	GETAWAY	2014-08-31 11:45:39.402807	2014-08-31 11:45:39.402807
16384	5	16	6	2013-12-17	GETAWAY	2014-08-31 11:45:39.434971	2014-08-31 11:45:39.434971
16385	5	17	6	2013-12-17	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:39.462836	2014-08-31 11:45:39.462836
16386	5	18	6	2013-12-17	THE TASTE	2014-08-31 11:45:39.489426	2014-08-31 11:45:39.489426
16387	5	21	6	2013-12-17	EAT ST	2014-08-31 11:45:39.797978	2014-08-31 11:45:39.797978
16388	5	21	6	2013-12-17	EAT ST	2014-08-31 11:45:39.830448	2014-08-31 11:45:39.830448
16389	5	22	6	2013-12-17	LATIN ANGELS SPECIAL	2014-08-31 11:45:39.859067	2014-08-31 11:45:39.859067
16390	5	22	6	2013-12-17	LATIN ANGELS SPECIAL	2014-08-31 11:45:39.887679	2014-08-31 11:45:39.887679
16391	5	22	6	2013-12-17	LATIN ANGELS SPECIAL	2014-08-31 11:45:39.915103	2014-08-31 11:45:39.915103
16392	5	22	6	2013-12-17	LATIN ANGELS SPECIAL	2014-08-31 11:45:39.9418	2014-08-31 11:45:39.9418
16393	5	16	6	2013-12-18	KITCHEN NIGHTMARES	2014-08-31 11:45:39.968531	2014-08-31 11:45:39.968531
16394	5	17	6	2013-12-18	BOYS WEEKEND	2014-08-31 11:45:39.994789	2014-08-31 11:45:39.994789
16395	5	17	6	2013-12-18	THE HOLIDAY SHOW	2014-08-31 11:45:40.02372	2014-08-31 11:45:40.02372
16396	5	18	6	2013-12-18	ANNA AND KRISTINAS GROCERY BAG	2014-08-31 11:45:40.329518	2014-08-31 11:45:40.329518
16397	5	18	6	2013-12-18	ANNA AND KRISTINAS GROCERY BAG	2014-08-31 11:45:40.357317	2014-08-31 11:45:40.357317
16398	5	18	6	2013-12-18	FOOD SAFARI	2014-08-31 11:45:40.385272	2014-08-31 11:45:40.385272
16399	5	22	6	2013-12-18	LATIN ANGELS SPECIAL	2014-08-31 11:45:40.413028	2014-08-31 11:45:40.413028
16400	5	22	6	2013-12-18	LATIN ANGELS SPECIAL	2014-08-31 11:45:40.44341	2014-08-31 11:45:40.44341
16401	5	22	6	2013-12-18	LATIN ANGELS SPECIAL	2014-08-31 11:45:40.470336	2014-08-31 11:45:40.470336
16402	5	22	6	2013-12-18	LATIN ANGELS SPECIAL	2014-08-31 11:45:40.498551	2014-08-31 11:45:40.498551
16403	5	17	6	2013-12-19	EAT ST	2014-08-31 11:45:40.528631	2014-08-31 11:45:40.528631
16404	5	17	6	2013-12-19	THE LIST	2014-08-31 11:45:40.85268	2014-08-31 11:45:40.85268
16405	5	18	6	2013-12-19	5 INGREDIENT FIX	2014-08-31 11:45:40.881483	2014-08-31 11:45:40.881483
16406	5	19	6	2013-12-19	JAMIE AT HOME	2014-08-31 11:45:40.908635	2014-08-31 11:45:40.908635
16407	5	21	6	2013-12-19	CHEESE SLICES	2014-08-31 11:45:40.940278	2014-08-31 11:45:40.940278
16408	5	21	6	2013-12-19	FOOD SAFARI	2014-08-31 11:45:40.968346	2014-08-31 11:45:40.968346
16409	5	22	6	2013-12-19	GETAWAY	2014-08-31 11:45:40.995221	2014-08-31 11:45:40.995221
16410	5	22	6	2013-12-19	GETAWAY	2014-08-31 11:45:41.047824	2014-08-31 11:45:41.047824
16411	5	22	6	2013-12-19	LATIN ANGELS SPECIAL	2014-08-31 11:45:41.082978	2014-08-31 11:45:41.082978
16412	5	22	6	2013-12-19	LATIN ANGELS SPECIAL	2014-08-31 11:45:41.414022	2014-08-31 11:45:41.414022
16413	5	17	6	2013-12-20	EAT ST	2014-08-31 11:45:41.450056	2014-08-31 11:45:41.450056
16414	5	17	6	2013-12-20	STREET FOOD AROUND THE WORLD	2014-08-31 11:45:41.479509	2014-08-31 11:45:41.479509
16415	5	17	6	2013-12-20	STREET FOOD AROUND THE WORLD	2014-08-31 11:45:41.508935	2014-08-31 11:45:41.508935
16416	5	18	6	2013-12-20	5 INGREDIENT FIX	2014-08-31 11:45:41.536949	2014-08-31 11:45:41.536949
16417	5	18	6	2013-12-20	5 INGREDIENT FIX	2014-08-31 11:45:41.565697	2014-08-31 11:45:41.565697
16418	5	18	6	2013-12-20	BOYS WEEKEND	2014-08-31 11:45:41.593103	2014-08-31 11:45:41.593103
16419	5	19	6	2013-12-20	JAMIE AT HOME	2014-08-31 11:45:41.618323	2014-08-31 11:45:41.618323
16420	5	20	6	2013-12-20	TWIST OF TASTE 2	2014-08-31 11:45:41.93507	2014-08-31 11:45:41.93507
16421	5	21	6	2013-12-20	KITCHEN NIGHTMARES	2014-08-31 11:45:41.963882	2014-08-31 11:45:41.963882
16422	5	22	6	2013-12-20	LATIN ANGELS SPECIAL	2014-08-31 11:45:41.993571	2014-08-31 11:45:41.993571
16423	5	22	6	2013-12-20	LATIN ANGELS SPECIAL	2014-08-31 11:45:42.025482	2014-08-31 11:45:42.025482
16424	5	22	6	2013-12-20	LATIN ANGELS SPECIAL	2014-08-31 11:45:42.054682	2014-08-31 11:45:42.054682
16425	5	9	6	2013-12-21	JAMIE AT HOME	2014-08-31 11:45:42.083413	2014-08-31 11:45:42.083413
16426	5	9	6	2013-12-21	5 INGREDIENT FIX	2014-08-31 11:45:42.110191	2014-08-31 11:45:42.110191
16427	5	9	6	2013-12-21	5 INGREDIENT FIX	2014-08-31 11:45:42.141287	2014-08-31 11:45:42.141287
16428	5	9	6	2013-12-21	5 INGREDIENT FIX	2014-08-31 11:45:42.449704	2014-08-31 11:45:42.449704
16429	5	10	6	2013-12-21	CHEESE SLICES	2014-08-31 11:45:42.479364	2014-08-31 11:45:42.479364
16430	5	10	6	2013-12-21	EAT ST	2014-08-31 11:45:42.50838	2014-08-31 11:45:42.50838
16431	5	17	6	2013-12-21	EAT ST	2014-08-31 11:45:42.554838	2014-08-31 11:45:42.554838
16432	5	18	6	2013-12-21	JAMIE AT HOME	2014-08-31 11:45:42.58535	2014-08-31 11:45:42.58535
16433	5	18	6	2013-12-21	JAMIE AT HOME	2014-08-31 11:45:42.613356	2014-08-31 11:45:42.613356
16434	5	19	6	2013-12-21	DAVID ROCCOS DOLCE VITA	2014-08-31 11:45:42.6453	2014-08-31 11:45:42.6453
16435	5	19	6	2013-12-21	DAVID ROCCOS DOLCE VITA	2014-08-31 11:45:42.672202	2014-08-31 11:45:42.672202
16436	5	20	6	2013-12-21	BOYS WEEKEND	2014-08-31 11:45:43.034471	2014-08-31 11:45:43.034471
16437	5	9	6	2013-12-22	5 INGREDIENT FIX	2014-08-31 11:45:43.087081	2014-08-31 11:45:43.087081
16438	5	10	6	2013-12-22	FOOD SAFARI	2014-08-31 11:45:43.153727	2014-08-31 11:45:43.153727
16439	5	10	6	2013-12-22	EAT ST	2014-08-31 11:45:43.203507	2014-08-31 11:45:43.203507
16440	5	12	6	2013-12-22	STREET FOOD AROUND THE WORLD	2014-08-31 11:45:43.257146	2014-08-31 11:45:43.257146
16441	5	13	6	2013-12-22	5 INGREDIENT FIX	2014-08-31 11:45:43.306637	2014-08-31 11:45:43.306637
16442	5	13	6	2013-12-22	5 INGREDIENT FIX	2014-08-31 11:45:43.358766	2014-08-31 11:45:43.358766
16443	5	14	6	2013-12-22	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:43.403865	2014-08-31 11:45:43.403865
16444	5	14	6	2013-12-22	ANNA AND KRISTINAS GROCERY BAG	2014-08-31 11:45:43.44803	2014-08-31 11:45:43.44803
16445	5	15	6	2013-12-22	CHEESE SLICES	2014-08-31 11:45:43.867392	2014-08-31 11:45:43.867392
16446	5	16	6	2013-12-22	KUNGFU KITCHEN	2014-08-31 11:45:43.90718	2014-08-31 11:45:43.90718
16447	5	16	6	2013-12-22	FOOD SAFARI	2014-08-31 11:45:43.947116	2014-08-31 11:45:43.947116
16448	5	19	6	2013-12-22	POHS KITCHEN	2014-08-31 11:45:43.98372	2014-08-31 11:45:43.98372
16449	5	17	6	2013-12-23	EAT ST	2014-08-31 11:45:44.018529	2014-08-31 11:45:44.018529
16450	5	17	6	2013-12-23	CHEESE SLICES	2014-08-31 11:45:44.058772	2014-08-31 11:45:44.058772
16451	5	18	6	2013-12-23	TWIST OF TASTE 2	2014-08-31 11:45:44.094128	2014-08-31 11:45:44.094128
16452	5	18	6	2013-12-23	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:44.130816	2014-08-31 11:45:44.130816
16453	5	19	6	2013-12-23	JAMIES FAMILY CHRISTMAS	2014-08-31 11:45:44.486396	2014-08-31 11:45:44.486396
16454	5	21	6	2013-12-23	ONE MAN AND HIS CAMPERVAN	2014-08-31 11:45:44.513407	2014-08-31 11:45:44.513407
16455	5	22	6	2013-12-23	THE HOLIDAY SHOW	2014-08-31 11:45:44.545702	2014-08-31 11:45:44.545702
16456	5	22	6	2013-12-23	LATIN ANGELS SPECIAL	2014-08-31 11:45:44.573725	2014-08-31 11:45:44.573725
16457	5	22	6	2013-12-23	LATIN ANGELS SPECIAL	2014-08-31 11:45:44.601844	2014-08-31 11:45:44.601844
16458	5	17	6	2013-12-24	MY SRI LANKA WITH PETER KURUVITA	2014-08-31 11:45:44.636906	2014-08-31 11:45:44.636906
16459	5	17	6	2013-12-24	ONE MAN AND HIS CAMPERVAN	2014-08-31 11:45:44.663749	2014-08-31 11:45:44.663749
16460	5	18	6	2013-12-24	CHEESE SLICES	2014-08-31 11:45:44.690387	2014-08-31 11:45:44.690387
16461	5	18	6	2013-12-24	CHEESE SLICES	2014-08-31 11:45:45.003769	2014-08-31 11:45:45.003769
16462	5	19	6	2013-12-24	BOYS WEEKEND	2014-08-31 11:45:45.036034	2014-08-31 11:45:45.036034
16463	5	21	6	2013-12-24	GETAWAY	2014-08-31 11:45:45.064596	2014-08-31 11:45:45.064596
16464	5	21	6	2013-12-24	EAT ST	2014-08-31 11:45:45.10068	2014-08-31 11:45:45.10068
16465	5	22	6	2013-12-24	LATIN ANGELS SPECIAL	2014-08-31 11:45:45.131884	2014-08-31 11:45:45.131884
16466	5	22	6	2013-12-24	INDIA BIKE WEEK	2014-08-31 11:45:45.159215	2014-08-31 11:45:45.159215
16467	5	17	6	2013-12-25	FOOD SAFARI	2014-08-31 11:45:45.185865	2014-08-31 11:45:45.185865
16468	5	17	6	2013-12-25	FOOD SAFARI	2014-08-31 11:45:45.211387	2014-08-31 11:45:45.211387
16469	5	17	6	2013-12-25	JAMIES FAMILY CHRISTMAS	2014-08-31 11:45:45.515615	2014-08-31 11:45:45.515615
16470	5	20	6	2013-12-25	EAT ST	2014-08-31 11:45:45.548676	2014-08-31 11:45:45.548676
16471	5	21	6	2013-12-25	BOYS WEEKEND	2014-08-31 11:45:45.575347	2014-08-31 11:45:45.575347
16472	5	21	6	2013-12-25	BOYS WEEKEND	2014-08-31 11:45:45.601431	2014-08-31 11:45:45.601431
16473	5	22	6	2013-12-25	LATIN ANGELS SPECIAL	2014-08-31 11:45:45.632272	2014-08-31 11:45:45.632272
16474	5	22	6	2013-12-25	LATIN ANGELS SPECIAL	2014-08-31 11:45:45.659229	2014-08-31 11:45:45.659229
16475	5	22	6	2013-12-25	INDIA BIKE WEEK	2014-08-31 11:45:45.685083	2014-08-31 11:45:45.685083
16476	5	17	6	2013-12-26	EAT ST	2014-08-31 11:45:45.712411	2014-08-31 11:45:45.712411
16477	5	17	6	2013-12-26	CHEESE SLICES	2014-08-31 11:45:46.055288	2014-08-31 11:45:46.055288
16478	5	18	6	2013-12-26	ANNA AND KRISTINAS GROCERY BAG	2014-08-31 11:45:46.084946	2014-08-31 11:45:46.084946
16479	5	18	6	2013-12-26	FOOD SAFARI	2014-08-31 11:45:46.112474	2014-08-31 11:45:46.112474
16480	5	18	6	2013-12-26	FOOD SAFARI	2014-08-31 11:45:46.144405	2014-08-31 11:45:46.144405
16481	5	21	6	2013-12-26	JAMES MARTINS MEDITERRANEAN	2014-08-31 11:45:46.172931	2014-08-31 11:45:46.172931
16482	5	22	6	2013-12-26	GETAWAY	2014-08-31 11:45:46.200002	2014-08-31 11:45:46.200002
16483	5	22	6	2013-12-26	LATIN ANGELS SPECIAL	2014-08-31 11:45:46.230604	2014-08-31 11:45:46.230604
16484	5	22	6	2013-12-26	LATIN ANGELS SPECIAL	2014-08-31 11:45:46.25682	2014-08-31 11:45:46.25682
16485	5	7	7	2013-11-30	EFF WEDDING CRASHERS	2014-08-31 11:45:46.55933	2014-08-31 11:45:46.55933
16486	5	7	7	2013-11-30	EFF WEDDING CRASHERS	2014-08-31 11:45:46.587178	2014-08-31 11:45:46.587178
16487	5	8	7	2013-11-30	EFF WEDDING CRASHERS	2014-08-31 11:45:46.614121	2014-08-31 11:45:46.614121
16488	5	9	7	2013-11-30	EFF EXTREMELY LOUD & INCREDIBLY CLOSE	2014-08-31 11:45:46.645652	2014-08-31 11:45:46.645652
16489	5	10	7	2013-11-30	EFF EXTREMELY LOUD & INCREDIBLY CLOSE	2014-08-31 11:45:46.672696	2014-08-31 11:45:46.672696
16490	5	11	7	2013-11-30	EFF EXTREMELY LOUD & INCREDIBLY CLOSE	2014-08-31 11:45:46.700833	2014-08-31 11:45:46.700833
16491	5	12	7	2013-11-30	EFF THE CAMPAIGN	2014-08-31 11:45:46.731698	2014-08-31 11:45:46.731698
16492	5	13	7	2013-11-30	EFF THE CAMPAIGN	2014-08-31 11:45:46.75758	2014-08-31 11:45:46.75758
16493	5	14	7	2013-11-30	EFF RISE OF THE GUARDIANS	2014-08-31 11:45:46.781803	2014-08-31 11:45:46.781803
16494	5	15	7	2013-11-30	EFF RISE OF THE GUARDIANS	2014-08-31 11:45:47.092636	2014-08-31 11:45:47.092636
16495	5	16	7	2013-11-30	EFF NATIONAL TREASURE	2014-08-31 11:45:47.124493	2014-08-31 11:45:47.124493
16496	5	16	7	2013-11-30	EFF NATIONAL TREASURE	2014-08-31 11:45:47.151999	2014-08-31 11:45:47.151999
16497	5	17	7	2013-11-30	EFF NATIONAL TREASURE	2014-08-31 11:45:47.178654	2014-08-31 11:45:47.178654
16498	5	18	7	2013-11-30	EFF NATIONAL TREASURE	2014-08-31 11:45:47.205425	2014-08-31 11:45:47.205425
16499	5	18	7	2013-11-30	EFF THE ANIMAL	2014-08-31 11:45:47.235814	2014-08-31 11:45:47.235814
16500	5	19	7	2013-11-30	EFF THE ANIMAL	2014-08-31 11:45:47.261505	2014-08-31 11:45:47.261505
16501	5	20	7	2013-11-30	EFF STEP UP REVOLUTION	2014-08-31 11:45:47.286891	2014-08-31 11:45:47.286891
16502	5	20	7	2013-11-30	EFF STEP UP REVOLUTION	2014-08-31 11:45:47.594919	2014-08-31 11:45:47.594919
16503	5	21	7	2013-11-30	EFF STEP UP REVOLUTION	2014-08-31 11:45:47.627067	2014-08-31 11:45:47.627067
16504	5	22	7	2013-11-30	EFF LOOPER	2014-08-31 11:45:47.654883	2014-08-31 11:45:47.654883
16505	5	23	7	2013-11-30	EFF LOOPER	2014-08-31 11:45:47.68382	2014-08-31 11:45:47.68382
16506	5	7	7	2013-12-01	EFF OUTBREAK	2014-08-31 11:45:47.712823	2014-08-31 11:45:47.712823
16507	5	7	7	2013-12-01	EFF OUTBREAK	2014-08-31 11:45:47.745985	2014-08-31 11:45:47.745985
16508	5	8	7	2013-12-01	EFF 13 GOING ON 30	2014-08-31 11:45:47.771889	2014-08-31 11:45:47.771889
16509	5	9	7	2013-12-01	EFF 13 GOING ON 30	2014-08-31 11:45:47.796999	2014-08-31 11:45:47.796999
16510	5	10	7	2013-12-01	EFF THE ANIMAL	2014-08-31 11:45:48.111688	2014-08-31 11:45:48.111688
16511	5	11	7	2013-12-01	EFF STEP UP REVOLUTION	2014-08-31 11:45:48.144045	2014-08-31 11:45:48.144045
16512	5	12	7	2013-12-01	EFF STEP UP REVOLUTION	2014-08-31 11:45:48.171365	2014-08-31 11:45:48.171365
16513	5	13	7	2013-12-01	EFF NATIONAL TREASURE	2014-08-31 11:45:48.198493	2014-08-31 11:45:48.198493
16514	5	14	7	2013-12-01	EFF NATIONAL TREASURE	2014-08-31 11:45:48.229927	2014-08-31 11:45:48.229927
16515	5	15	7	2013-12-01	EFF NATIONAL TREASURE	2014-08-31 11:45:48.257474	2014-08-31 11:45:48.257474
16516	5	16	7	2013-12-01	EFF LOOPER	2014-08-31 11:45:48.283181	2014-08-31 11:45:48.283181
16517	5	16	7	2013-12-01	EFF LOOPER	2014-08-31 11:45:48.308453	2014-08-31 11:45:48.308453
16518	5	17	7	2013-12-01	EFF LOOPER	2014-08-31 11:45:48.61708	2014-08-31 11:45:48.61708
16519	5	18	7	2013-12-01	EFF HAPPY FEET TWO	2014-08-31 11:45:48.648918	2014-08-31 11:45:48.648918
16520	5	19	7	2013-12-01	EFF HAPPY FEET TWO	2014-08-31 11:45:48.675903	2014-08-31 11:45:48.675903
16521	5	20	7	2013-12-01	EFF HARRY POTTER AND THE DEATHLY HAL-2	2014-08-31 11:45:48.705127	2014-08-31 11:45:48.705127
16522	5	20	7	2013-12-01	EFF HARRY POTTER AND THE DEATHLY HAL-2	2014-08-31 11:45:48.740144	2014-08-31 11:45:48.740144
16523	5	21	7	2013-12-01	EFF HARRY POTTER AND THE DEATHLY HAL-2	2014-08-31 11:45:48.767461	2014-08-31 11:45:48.767461
16524	5	21	7	2013-12-01	EFF HARRY POTTER AND THE DEATHLY HAL-2	2014-08-31 11:45:48.793116	2014-08-31 11:45:48.793116
16525	5	22	7	2013-12-01	EFF HARRY POTTER AND THE DEATHLY HAL-2	2014-08-31 11:45:48.823001	2014-08-31 11:45:48.823001
16526	5	23	7	2013-12-01	EFF FURRY VENGEANCE	2014-08-31 11:45:49.127651	2014-08-31 11:45:49.127651
16527	5	23	7	2013-12-01	EFF FURRY VENGEANCE	2014-08-31 11:45:49.155174	2014-08-31 11:45:49.155174
16528	5	15	7	2013-12-02	EFF FURRY VENGEANCE	2014-08-31 11:45:49.182619	2014-08-31 11:45:49.182619
16529	5	16	7	2013-12-02	EFF AIR FORCE ONE	2014-08-31 11:45:49.211803	2014-08-31 11:45:49.211803
16530	5	17	7	2013-12-02	EFF AIR FORCE ONE	2014-08-31 11:45:49.246943	2014-08-31 11:45:49.246943
16531	5	18	7	2013-12-02	EFF SHINJUKU INCIDENT	2014-08-31 11:45:49.274344	2014-08-31 11:45:49.274344
16532	5	19	7	2013-12-02	EFF SHINJUKU INCIDENT	2014-08-31 11:45:49.301082	2014-08-31 11:45:49.301082
16533	5	19	7	2013-12-02	EFF SHINJUKU INCIDENT	2014-08-31 11:45:49.331402	2014-08-31 11:45:49.331402
16534	5	20	7	2013-12-02	EFF ACT OF VALOR	2014-08-31 11:45:49.658976	2014-08-31 11:45:49.658976
16535	5	21	7	2013-12-02	EFF ACT OF VALOR	2014-08-31 11:45:49.688023	2014-08-31 11:45:49.688023
16536	5	21	7	2013-12-02	EFF ACT OF VALOR	2014-08-31 11:45:49.715655	2014-08-31 11:45:49.715655
16537	5	15	7	2013-12-03	EFF STREET DANCE 2	2014-08-31 11:45:49.747694	2014-08-31 11:45:49.747694
16538	5	17	7	2013-12-03	EFF HANNAH MONTANA-THE MOVIE	2014-08-31 11:45:49.775174	2014-08-31 11:45:49.775174
16539	5	18	7	2013-12-03	EFF STOMP THE YARD	2014-08-31 11:45:49.802229	2014-08-31 11:45:49.802229
16540	5	19	7	2013-12-03	EFF STOMP THE YARD	2014-08-31 11:45:49.833485	2014-08-31 11:45:49.833485
16541	5	19	7	2013-12-03	EFF STOMP THE YARD	2014-08-31 11:45:49.861345	2014-08-31 11:45:49.861345
16542	5	20	7	2013-12-03	EFF TWILIGHT	2014-08-31 11:45:49.886507	2014-08-31 11:45:49.886507
16543	5	21	7	2013-12-03	EFF TWILIGHT	2014-08-31 11:45:50.213354	2014-08-31 11:45:50.213354
16544	5	21	7	2013-12-03	EFF TWILIGHT	2014-08-31 11:45:50.249252	2014-08-31 11:45:50.249252
16545	5	22	7	2013-12-03	EFF ONG BAK	2014-08-31 11:45:50.276242	2014-08-31 11:45:50.276242
16546	5	15	7	2013-12-04	EFF ONG BAK	2014-08-31 11:45:50.303658	2014-08-31 11:45:50.303658
16547	5	16	7	2013-12-04	EFF PRINCE OF PERSIA THE SAND OF TIME	2014-08-31 11:45:50.331011	2014-08-31 11:45:50.331011
16548	5	17	7	2013-12-04	EFF PRINCE OF PERSIA THE SAND OF TIME	2014-08-31 11:45:50.358132	2014-08-31 11:45:50.358132
16549	5	20	7	2013-12-04	EFF GHOST RIDER-SPIRIT OF VENGEANCE	2014-08-31 11:45:50.384431	2014-08-31 11:45:50.384431
16550	5	21	7	2013-12-04	EFF GHOST RIDER-SPIRIT OF VENGEANCE	2014-08-31 11:45:50.409563	2014-08-31 11:45:50.409563
16551	5	21	7	2013-12-04	EFF GHOST RIDER-SPIRIT OF VENGEANCE	2014-08-31 11:45:50.735319	2014-08-31 11:45:50.735319
16552	5	15	7	2013-12-05	EFF THE HUNGER GAMES	2014-08-31 11:45:50.763267	2014-08-31 11:45:50.763267
16553	5	16	7	2013-12-05	EFF THE HUNGER GAMES	2014-08-31 11:45:50.790316	2014-08-31 11:45:50.790316
16554	5	17	7	2013-12-05	EFF THE HUNGER GAMES	2014-08-31 11:45:50.8171	2014-08-31 11:45:50.8171
16555	5	18	7	2013-12-05	EFF BAD COMPANY	2014-08-31 11:45:50.848666	2014-08-31 11:45:50.848666
16556	5	18	7	2013-12-05	EFF BAD COMPANY	2014-08-31 11:45:50.875731	2014-08-31 11:45:50.875731
16557	5	19	7	2013-12-05	EFF BAD COMPANY	2014-08-31 11:45:50.923509	2014-08-31 11:45:50.923509
16558	5	20	7	2013-12-05	EFF MINORITY REPORT	2014-08-31 11:45:50.948527	2014-08-31 11:45:50.948527
16559	5	21	7	2013-12-05	EFF MINORITY REPORT	2014-08-31 11:45:51.287748	2014-08-31 11:45:51.287748
16560	5	21	7	2013-12-05	EFF MINORITY REPORT	2014-08-31 11:45:51.323913	2014-08-31 11:45:51.323913
16561	5	7	7	2013-12-07	EFF SPY KIDS ALL THE TIME IN THE WORLD	2014-08-31 11:45:51.351507	2014-08-31 11:45:51.351507
16562	5	8	7	2013-12-07	EFF SPY KIDS ALL THE TIME IN THE WORLD	2014-08-31 11:45:51.379035	2014-08-31 11:45:51.379035
16563	5	9	7	2013-12-07	EFF FURRY VENGEANCE	2014-08-31 11:45:51.406439	2014-08-31 11:45:51.406439
16564	5	10	7	2013-12-07	EFF FURRY VENGEANCE	2014-08-31 11:45:51.43803	2014-08-31 11:45:51.43803
16565	5	10	7	2013-12-07	EFF FURRY VENGEANCE	2014-08-31 11:45:51.464383	2014-08-31 11:45:51.464383
16566	5	11	7	2013-12-07	EFF PRINCE OF PERSIA THE SAND OF TIME	2014-08-31 11:45:51.490733	2014-08-31 11:45:51.490733
16567	5	12	7	2013-12-07	EFF PRINCE OF PERSIA THE SAND OF TIME	2014-08-31 11:45:51.802232	2014-08-31 11:45:51.802232
16568	5	13	7	2013-12-07	EFF WEDDING CRASHERS	2014-08-31 11:45:51.83409	2014-08-31 11:45:51.83409
16569	5	14	7	2013-12-07	EFF WEDDING CRASHERS	2014-08-31 11:45:51.861041	2014-08-31 11:45:51.861041
16570	5	15	7	2013-12-07	EFF TRANSPORTER 3	2014-08-31 11:45:51.888255	2014-08-31 11:45:51.888255
16571	5	15	7	2013-12-07	EFF TRANSPORTER 3	2014-08-31 11:45:51.915317	2014-08-31 11:45:51.915317
16572	5	16	7	2013-12-07	EFF TRANSPORTER 3	2014-08-31 11:45:51.94779	2014-08-31 11:45:51.94779
16573	5	17	7	2013-12-07	EFF HARRY POTTER AND THE DEATHLY HAL-2	2014-08-31 11:45:51.974349	2014-08-31 11:45:51.974349
16574	5	18	7	2013-12-07	EFF HARRY POTTER AND THE DEATHLY HAL-2	2014-08-31 11:45:52.000746	2014-08-31 11:45:52.000746
16575	5	18	7	2013-12-07	EFF HARRY POTTER AND THE DEATHLY HAL-2	2014-08-31 11:45:52.325896	2014-08-31 11:45:52.325896
16576	5	19	7	2013-12-07	EFF HARRY POTTER AND THE DEATHLY HAL-2	2014-08-31 11:45:52.354028	2014-08-31 11:45:52.354028
16577	5	20	7	2013-12-07	EFF INDIANA JONES AND THE KINGDOM OF	2014-08-31 11:45:52.38145	2014-08-31 11:45:52.38145
16578	5	20	7	2013-12-07	EFF INDIANA JONES AND THE KINGDOM OF	2014-08-31 11:45:52.408578	2014-08-31 11:45:52.408578
16579	5	21	7	2013-12-07	EFF INDIANA JONES AND THE KINGDOM OF	2014-08-31 11:45:52.440436	2014-08-31 11:45:52.440436
16580	5	22	7	2013-12-07	EFF PARANORMAL ACTIVITY 4	2014-08-31 11:45:52.467773	2014-08-31 11:45:52.467773
16581	5	23	7	2013-12-07	EFF PARANORMAL ACTIVITY 4	2014-08-31 11:45:52.494036	2014-08-31 11:45:52.494036
16582	5	7	7	2013-12-08	EFF TRANSPORTER 3	2014-08-31 11:45:52.524056	2014-08-31 11:45:52.524056
16583	5	7	7	2013-12-08	EFF TRANSPORTER 3	2014-08-31 11:45:52.83586	2014-08-31 11:45:52.83586
16584	5	8	7	2013-12-08	EFF HARRY POTTER AND THE DEATHLY HAL-2	2014-08-31 11:45:52.864989	2014-08-31 11:45:52.864989
16585	5	9	7	2013-12-08	EFF HARRY POTTER AND THE DEATHLY HAL-2	2014-08-31 11:45:52.913108	2014-08-31 11:45:52.913108
16586	5	10	7	2013-12-08	EFF HARRY POTTER AND THE DEATHLY HAL-2	2014-08-31 11:45:52.945404	2014-08-31 11:45:52.945404
16587	5	11	7	2013-12-08	EFF INDIANA JONES AND THE KINGDOM OF	2014-08-31 11:45:52.973557	2014-08-31 11:45:52.973557
16588	5	12	7	2013-12-08	EFF INDIANA JONES AND THE KINGDOM OF	2014-08-31 11:45:53.002622	2014-08-31 11:45:53.002622
16589	5	13	7	2013-12-08	EFF PARANORMAL ACTIVITY 4	2014-08-31 11:45:53.035457	2014-08-31 11:45:53.035457
16590	5	14	7	2013-12-08	EFF PARANORMAL ACTIVITY 4	2014-08-31 11:45:53.062578	2014-08-31 11:45:53.062578
16591	5	15	7	2013-12-08	EFF KICK ASS	2014-08-31 11:45:53.087712	2014-08-31 11:45:53.087712
16592	5	15	7	2013-12-08	EFF KICK ASS	2014-08-31 11:45:53.395829	2014-08-31 11:45:53.395829
16593	5	16	7	2013-12-08	EFF KICK ASS	2014-08-31 11:45:53.427155	2014-08-31 11:45:53.427155
16594	5	17	7	2013-12-08	EFF MINORITY REPORT	2014-08-31 11:45:53.465352	2014-08-31 11:45:53.465352
16595	5	18	7	2013-12-08	EFF MINORITY REPORT	2014-08-31 11:45:53.493623	2014-08-31 11:45:53.493623
16596	5	19	7	2013-12-08	EFF MINORITY REPORT	2014-08-31 11:45:53.524485	2014-08-31 11:45:53.524485
16597	5	20	7	2013-12-08	EFF INDIANA JONES AND THE LAST CRUSADE	2014-08-31 11:45:53.552322	2014-08-31 11:45:53.552322
16598	5	20	7	2013-12-08	EFF INDIANA JONES AND THE LAST CRUSADE	2014-08-31 11:45:53.580253	2014-08-31 11:45:53.580253
16599	5	21	7	2013-12-08	EFF INDIANA JONES AND THE LAST CRUSADE	2014-08-31 11:45:53.605079	2014-08-31 11:45:53.605079
16600	5	22	7	2013-12-08	EFF STOMP THE YARD	2014-08-31 11:45:53.916318	2014-08-31 11:45:53.916318
16601	5	23	7	2013-12-08	EFF STOMP THE YARD	2014-08-31 11:45:53.950893	2014-08-31 11:45:53.950893
16602	5	23	7	2013-12-08	EFF STOMP THE YARD	2014-08-31 11:45:53.979336	2014-08-31 11:45:53.979336
16603	5	16	7	2013-12-09	EFF THE PARENT TRAP	2014-08-31 11:45:54.00797	2014-08-31 11:45:54.00797
16604	5	18	7	2013-12-09	EFF WILD HOGS	2014-08-31 11:45:54.03958	2014-08-31 11:45:54.03958
16605	5	18	7	2013-12-09	EFF WILD HOGS	2014-08-31 11:45:54.066561	2014-08-31 11:45:54.066561
16606	5	19	7	2013-12-09	EFF WILD HOGS	2014-08-31 11:45:54.093894	2014-08-31 11:45:54.093894
16607	5	20	7	2013-12-09	EFF RICHIE RICH	2014-08-31 11:45:54.123651	2014-08-31 11:45:54.123651
16608	5	21	7	2013-12-09	EFF RICHIE RICH	2014-08-31 11:45:54.438263	2014-08-31 11:45:54.438263
16609	5	21	7	2013-12-09	EFF RICHIE RICH	2014-08-31 11:45:54.467624	2014-08-31 11:45:54.467624
16610	5	22	7	2013-12-09	EFF COWBOYS & ALIENS	2014-08-31 11:45:54.496135	2014-08-31 11:45:54.496135
16611	5	23	7	2013-12-09	EFF COWBOYS & ALIENS	2014-08-31 11:45:54.528009	2014-08-31 11:45:54.528009
16612	5	15	7	2013-12-10	EFF BAD COMPANY	2014-08-31 11:45:54.55732	2014-08-31 11:45:54.55732
16613	5	16	7	2013-12-10	EFF BAD COMPANY	2014-08-31 11:45:54.584703	2014-08-31 11:45:54.584703
16614	5	17	7	2013-12-10	EFF BAD COMPANY	2014-08-31 11:45:54.611989	2014-08-31 11:45:54.611989
16615	5	18	7	2013-12-10	EFF WHAT WOMEN WANT	2014-08-31 11:45:54.642515	2014-08-31 11:45:54.642515
16616	5	19	7	2013-12-10	EFF WHAT WOMEN WANT	2014-08-31 11:45:54.947797	2014-08-31 11:45:54.947797
16617	5	19	7	2013-12-10	EFF WHAT WOMEN WANT	2014-08-31 11:45:54.976445	2014-08-31 11:45:54.976445
16618	5	20	7	2013-12-10	EFF LARA CROFT TOMB RAIDER	2014-08-31 11:45:55.004006	2014-08-31 11:45:55.004006
16619	5	21	7	2013-12-10	EFF LARA CROFT TOMB RAIDER	2014-08-31 11:45:55.034689	2014-08-31 11:45:55.034689
16620	5	18	7	2013-12-11	EFF CHARLIE AND THE CHOCOLATE	2014-08-31 11:45:55.062681	2014-08-31 11:45:55.062681
16621	5	19	7	2013-12-11	EFF CHARLIE AND THE CHOCOLATE	2014-08-31 11:45:55.089475	2014-08-31 11:45:55.089475
16622	5	21	7	2013-12-11	EFF RAIDERS OF THE LOST ARK	2014-08-31 11:45:55.136306	2014-08-31 11:45:55.136306
16623	5	15	7	2013-12-12	EFF THE DUKES OF HAZZARD	2014-08-31 11:45:55.178383	2014-08-31 11:45:55.178383
16624	5	16	7	2013-12-12	EFF THE DUKES OF HAZZARD	2014-08-31 11:45:55.493567	2014-08-31 11:45:55.493567
16625	5	18	7	2013-12-12	EFF COWBOYS & ALIENS	2014-08-31 11:45:55.523782	2014-08-31 11:45:55.523782
16626	5	19	7	2013-12-12	EFF COWBOYS & ALIENS	2014-08-31 11:45:55.552671	2014-08-31 11:45:55.552671
16627	5	19	7	2013-12-12	EFF COWBOYS & ALIENS	2014-08-31 11:45:55.578973	2014-08-31 11:45:55.578973
16628	5	20	7	2013-12-12	EFF SHINJUKU INCIDENT	2014-08-31 11:45:55.604397	2014-08-31 11:45:55.604397
16629	5	21	7	2013-12-12	EFF SHINJUKU INCIDENT	2014-08-31 11:45:55.634591	2014-08-31 11:45:55.634591
16630	5	21	7	2013-12-12	EFF SHINJUKU INCIDENT	2014-08-31 11:45:55.659637	2014-08-31 11:45:55.659637
16631	5	23	7	2013-12-12	EFF ALICE IN WONDERLAND	2014-08-31 11:45:55.684981	2014-08-31 11:45:55.684981
16632	5	7	7	2013-12-14	EFF NO RESERVATIONS	2014-08-31 11:45:55.984851	2014-08-31 11:45:55.984851
16633	5	8	7	2013-12-14	EFF SHERLOCK HOLMES-A GAME OF SHADOWS	2014-08-31 11:45:56.025801	2014-08-31 11:45:56.025801
16634	5	9	7	2013-12-14	EFF SHERLOCK HOLMES-A GAME OF SHADOWS	2014-08-31 11:45:56.072321	2014-08-31 11:45:56.072321
16635	5	10	7	2013-12-14	EFF MADAGASCAR-3 EUROPES MOST WANTED	2014-08-31 11:45:56.098255	2014-08-31 11:45:56.098255
16636	5	11	7	2013-12-14	EFF MADAGASCAR-3 EUROPES MOST WANTED	2014-08-31 11:45:56.128904	2014-08-31 11:45:56.128904
16637	5	12	7	2013-12-14	EFF GROWN UPS	2014-08-31 11:45:56.155028	2014-08-31 11:45:56.155028
16638	5	16	7	2013-12-14	EFF THE SORCERERS APPRENTICE	2014-08-31 11:45:56.180189	2014-08-31 11:45:56.180189
16639	5	17	7	2013-12-14	EFF THE SORCERERS APPRENTICE	2014-08-31 11:45:56.204694	2014-08-31 11:45:56.204694
16640	5	18	7	2013-12-14	EFF I AM LEGEND	2014-08-31 11:45:56.233238	2014-08-31 11:45:56.233238
16641	5	19	7	2013-12-14	EFF I AM LEGEND	2014-08-31 11:45:56.536778	2014-08-31 11:45:56.536778
16642	5	20	7	2013-12-14	EFF WRATH OF THE TITANS	2014-08-31 11:45:56.56594	2014-08-31 11:45:56.56594
16643	5	21	7	2013-12-14	EFF WRATH OF THE TITANS	2014-08-31 11:45:56.594609	2014-08-31 11:45:56.594609
16644	5	21	7	2013-12-14	EFF WRATH OF THE TITANS	2014-08-31 11:45:56.630272	2014-08-31 11:45:56.630272
16645	5	22	7	2013-12-14	EFF U.S.MARSHALS	2014-08-31 11:45:56.659227	2014-08-31 11:45:56.659227
16646	5	23	7	2013-12-14	EFF U.S.MARSHALS	2014-08-31 11:45:56.6873	2014-08-31 11:45:56.6873
16647	5	7	7	2013-12-15	EFF THE SORCERERS APPRENTICE	2014-08-31 11:45:56.712726	2014-08-31 11:45:56.712726
16648	5	8	7	2013-12-15	EFF THE SORCERERS APPRENTICE	2014-08-31 11:45:56.742429	2014-08-31 11:45:56.742429
16649	5	9	7	2013-12-15	EFF I AM LEGEND	2014-08-31 11:45:57.043562	2014-08-31 11:45:57.043562
16650	5	12	7	2013-12-15	EFF WRATH OF THE TITANS	2014-08-31 11:45:57.07118	2014-08-31 11:45:57.07118
16651	5	13	7	2013-12-15	EFF PARANORMAL ACTIVITY 4	2014-08-31 11:45:57.098312	2014-08-31 11:45:57.098312
16652	5	14	7	2013-12-15	EFF PARANORMAL ACTIVITY 4	2014-08-31 11:45:57.129802	2014-08-31 11:45:57.129802
16653	5	15	7	2013-12-15	EFF U.S.MARSHALS	2014-08-31 11:45:57.157343	2014-08-31 11:45:57.157343
16654	5	17	7	2013-12-15	EFF WHITE VENGEANCE	2014-08-31 11:45:57.185206	2014-08-31 11:45:57.185206
16655	5	18	7	2013-12-15	EFF WHITE VENGEANCE	2014-08-31 11:45:57.21094	2014-08-31 11:45:57.21094
16656	5	19	7	2013-12-15	EFF WHITE VENGEANCE	2014-08-31 11:45:57.239732	2014-08-31 11:45:57.239732
16657	5	20	7	2013-12-15	EFF INDIANA JONES AND THE KINGDOM OF	2014-08-31 11:45:57.556079	2014-08-31 11:45:57.556079
16658	5	21	7	2013-12-15	EFF INDIANA JONES AND THE KINGDOM OF	2014-08-31 11:45:57.58436	2014-08-31 11:45:57.58436
16659	5	21	7	2013-12-15	EFF INDIANA JONES AND THE KINGDOM OF	2014-08-31 11:45:57.611526	2014-08-31 11:45:57.611526
16660	5	22	7	2013-12-15	EFF THE ANIMAL	2014-08-31 11:45:57.643458	2014-08-31 11:45:57.643458
16661	5	23	7	2013-12-15	EFF THE ANIMAL	2014-08-31 11:45:57.670787	2014-08-31 11:45:57.670787
16662	5	18	7	2013-12-16	EFF WEDDING CRASHERS	2014-08-31 11:45:57.699028	2014-08-31 11:45:57.699028
16663	5	19	7	2013-12-16	EFF WEDDING CRASHERS	2014-08-31 11:45:57.724849	2014-08-31 11:45:57.724849
16664	5	19	7	2013-12-16	EFF THE SORCERERS APPRENTICE	2014-08-31 11:45:57.750407	2014-08-31 11:45:57.750407
16665	5	20	7	2013-12-16	EFF THE SORCERERS APPRENTICE	2014-08-31 11:45:58.067206	2014-08-31 11:45:58.067206
16666	5	21	7	2013-12-16	EFF THE SORCERERS APPRENTICE	2014-08-31 11:45:58.094603	2014-08-31 11:45:58.094603
16667	5	21	7	2013-12-16	EFF THE SORCERERS APPRENTICE	2014-08-31 11:45:58.125517	2014-08-31 11:45:58.125517
16668	5	15	7	2013-12-17	EFF WEDDING CRASHERS	2014-08-31 11:45:58.152235	2014-08-31 11:45:58.152235
16669	5	17	7	2013-12-17	EFF TOP GUN	2014-08-31 11:45:58.179531	2014-08-31 11:45:58.179531
16670	5	19	7	2013-12-17	EFF INDIANA JONES AND THE LAST CRUSADE	2014-08-31 11:45:58.205062	2014-08-31 11:45:58.205062
16671	5	23	7	2013-12-17	EFF ONG BAK 2 ONE MAN ARMY	2014-08-31 11:45:58.234251	2014-08-31 11:45:58.234251
16672	5	19	7	2013-12-18	EFF STEP UP REVOLUTION	2014-08-31 11:45:58.259112	2014-08-31 11:45:58.259112
16673	5	20	7	2013-12-18	EFF STEP UP REVOLUTION	2014-08-31 11:45:58.571042	2014-08-31 11:45:58.571042
16674	5	21	7	2013-12-18	EFF STEP UP REVOLUTION	2014-08-31 11:45:58.603414	2014-08-31 11:45:58.603414
16675	5	16	7	2013-12-19	EFF STREET DANCE 2	2014-08-31 11:45:58.640458	2014-08-31 11:45:58.640458
16676	5	17	7	2013-12-19	EFF STREET DANCE 2	2014-08-31 11:45:58.671636	2014-08-31 11:45:58.671636
16677	5	19	7	2013-12-19	EFF MADAGASCAR-3 EUROPES MOST WANTED	2014-08-31 11:45:58.700708	2014-08-31 11:45:58.700708
16678	5	21	7	2013-12-19	EFF MADAGASCAR-3 EUROPES MOST WANTED	2014-08-31 11:45:58.733072	2014-08-31 11:45:58.733072
16679	5	19	7	2013-12-20	EFF RAIDERS OF THE LOST ARK	2014-08-31 11:45:58.761612	2014-08-31 11:45:58.761612
16680	5	8	7	2013-12-21	EFF AROUND THE WORLD IN 80 DAY	2014-08-31 11:45:58.788745	2014-08-31 11:45:58.788745
16681	5	9	7	2013-12-21	EFF AROUND THE WORLD IN 80 DAY	2014-08-31 11:45:59.112305	2014-08-31 11:45:59.112305
16682	5	10	7	2013-12-21	EFF AROUND THE WORLD IN 80 DAY	2014-08-31 11:45:59.143763	2014-08-31 11:45:59.143763
16683	5	11	7	2013-12-21	EFF RAIDERS OF THE LOST ARK	2014-08-31 11:45:59.170483	2014-08-31 11:45:59.170483
16684	5	12	7	2013-12-21	EFF RAIDERS OF THE LOST ARK	2014-08-31 11:45:59.196799	2014-08-31 11:45:59.196799
16685	5	13	7	2013-12-21	EFF RISE OF THE GUARDIANS	2014-08-31 11:45:59.22724	2014-08-31 11:45:59.22724
16686	5	15	7	2013-12-21	EFF ROCK OF AGES	2014-08-31 11:45:59.254203	2014-08-31 11:45:59.254203
16687	5	16	7	2013-12-21	EFF ROCK OF AGES	2014-08-31 11:45:59.281898	2014-08-31 11:45:59.281898
16688	5	17	7	2013-12-21	EFF THE CHRONICLES OF NARNIA-THE LION	2014-08-31 11:45:59.309441	2014-08-31 11:45:59.309441
16689	5	18	7	2013-12-21	EFF THE CHRONICLES OF NARNIA-THE LION	2014-08-31 11:45:59.339153	2014-08-31 11:45:59.339153
16690	5	19	7	2013-12-21	EFF ARGO	2014-08-31 11:45:59.657208	2014-08-31 11:45:59.657208
16691	5	22	7	2013-12-21	EFF AIR FORCE ONE	2014-08-31 11:45:59.686115	2014-08-31 11:45:59.686115
16692	5	23	7	2013-12-21	EFF AIR FORCE ONE	2014-08-31 11:45:59.712701	2014-08-31 11:45:59.712701
16693	5	7	7	2013-12-22	EFF THE PRINCESS DIARIES 2 ROYAL ENGAGEM	2014-08-31 11:45:59.738844	2014-08-31 11:45:59.738844
16694	5	8	7	2013-12-22	EFF THE PRINCESS DIARIES 2 ROYAL ENGAGEM	2014-08-31 11:45:59.765227	2014-08-31 11:45:59.765227
16695	5	11	7	2013-12-22	EFF ARGO	2014-08-31 11:45:59.790501	2014-08-31 11:45:59.790501
16696	5	12	7	2013-12-22	EFF ARGO	2014-08-31 11:45:59.815153	2014-08-31 11:45:59.815153
16697	5	13	7	2013-12-22	EFF ARGO	2014-08-31 11:45:59.849237	2014-08-31 11:45:59.849237
16698	5	13	7	2013-12-22	EFF ARGO	2014-08-31 11:46:00.162326	2014-08-31 11:46:00.162326
16699	5	15	7	2013-12-22	EFF INDIANA JONES AND THE LAST CRUSADE	2014-08-31 11:46:00.189762	2014-08-31 11:46:00.189762
16700	5	16	7	2013-12-22	EFF THE DICTATOR	2014-08-31 11:46:00.215873	2014-08-31 11:46:00.215873
16701	5	17	7	2013-12-22	EFF THE DICTATOR	2014-08-31 11:46:00.241366	2014-08-31 11:46:00.241366
16702	5	17	7	2013-12-22	EFF THE DICTATOR	2014-08-31 11:46:00.267072	2014-08-31 11:46:00.267072
16703	5	18	7	2013-12-22	EFF PRINCE OF PERSIA THE SAND OF TIME	2014-08-31 11:46:00.292182	2014-08-31 11:46:00.292182
16704	5	19	7	2013-12-22	EFF PRINCE OF PERSIA THE SAND OF TIME	2014-08-31 11:46:00.317353	2014-08-31 11:46:00.317353
16705	5	19	7	2013-12-22	EFF SHERLOCK HOLMES-A GAME OF SHADOWS	2014-08-31 11:46:00.347212	2014-08-31 11:46:00.347212
16706	5	20	7	2013-12-22	EFF SHERLOCK HOLMES-A GAME OF SHADOWS	2014-08-31 11:46:00.645055	2014-08-31 11:46:00.645055
16707	5	20	7	2013-12-22	EFF SHERLOCK HOLMES-A GAME OF SHADOWS	2014-08-31 11:46:00.67154	2014-08-31 11:46:00.67154
16708	5	21	7	2013-12-22	EFF SHERLOCK HOLMES-A GAME OF SHADOWS	2014-08-31 11:46:00.704046	2014-08-31 11:46:00.704046
16709	5	19	7	2013-12-23	EFF THE CHRONICLES OF NARNIA-THE LION	2014-08-31 11:46:00.742809	2014-08-31 11:46:00.742809
16710	5	19	7	2013-12-24	EFF THE PARENT TRAP	2014-08-31 11:46:00.770363	2014-08-31 11:46:00.770363
16711	5	19	7	2013-12-25	EFF INDIANA JONES AND THE KINGDOM OF	2014-08-31 11:46:00.797104	2014-08-31 11:46:00.797104
16712	5	19	7	2013-12-26	EFF HAPPY FEET TWO	2014-08-31 11:46:00.823228	2014-08-31 11:46:00.823228
16713	5	16	8	2013-11-29	ANCIENT ALIENS	2014-08-31 11:46:00.849834	2014-08-31 11:46:00.849834
16714	5	16	8	2013-11-29	BAGGAGE BATTLES	2014-08-31 11:46:01.191783	2014-08-31 11:46:01.191783
16715	5	16	8	2013-11-29	BAGGAGE BATTLES	2014-08-31 11:46:01.222987	2014-08-31 11:46:01.222987
16716	5	17	8	2013-11-29	COUNTING CARS	2014-08-31 11:46:01.252585	2014-08-31 11:46:01.252585
16717	5	18	8	2013-11-29	KING COBRA FACE TO FACE	2014-08-31 11:46:01.280852	2014-08-31 11:46:01.280852
16718	5	19	8	2013-11-29	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:01.309346	2014-08-31 11:46:01.309346
16719	5	19	8	2013-11-29	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:01.340274	2014-08-31 11:46:01.340274
16720	5	19	8	2013-11-29	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:01.368451	2014-08-31 11:46:01.368451
16721	5	19	8	2013-11-29	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:01.393252	2014-08-31 11:46:01.393252
16722	5	20	8	2013-11-29	HIDDEN CITIES EXTREME	2014-08-31 11:46:01.717498	2014-08-31 11:46:01.717498
16723	5	21	8	2013-11-29	PAWN STARS	2014-08-31 11:46:01.75111	2014-08-31 11:46:01.75111
16724	5	21	8	2013-11-29	COUNTING CARS	2014-08-31 11:46:01.794307	2014-08-31 11:46:01.794307
16725	5	22	8	2013-11-29	ANCIENT ALIENS	2014-08-31 11:46:01.832154	2014-08-31 11:46:01.832154
16726	5	22	8	2013-11-29	ANCIENT ALIENS	2014-08-31 11:46:01.860782	2014-08-31 11:46:01.860782
16727	5	22	8	2013-11-29	ANCIENT ALIENS	2014-08-31 11:46:01.888853	2014-08-31 11:46:01.888853
16728	5	7	8	2013-11-30	ANCIENT ALIENS	2014-08-31 11:46:01.915169	2014-08-31 11:46:01.915169
16729	5	8	8	2013-11-30	MARK ZUCKERBERG THE REAL FACE BEHIND FAC	2014-08-31 11:46:01.947687	2014-08-31 11:46:01.947687
16730	5	9	8	2013-11-30	HIDDEN CITIES EXTREME	2014-08-31 11:46:02.246076	2014-08-31 11:46:02.246076
16731	5	9	8	2013-11-30	BAGGAGE BATTLES	2014-08-31 11:46:02.274602	2014-08-31 11:46:02.274602
16732	5	10	8	2013-11-30	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:02.303968	2014-08-31 11:46:02.303968
16733	5	11	8	2013-11-30	ANCIENT ALIENS	2014-08-31 11:46:02.335878	2014-08-31 11:46:02.335878
16734	5	12	8	2013-11-30	COUNTING CARS	2014-08-31 11:46:02.364598	2014-08-31 11:46:02.364598
16735	5	12	8	2013-11-30	PAWN STARS	2014-08-31 11:46:02.39247	2014-08-31 11:46:02.39247
16736	5	13	8	2013-11-30	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:02.416663	2014-08-31 11:46:02.416663
16737	5	14	8	2013-11-30	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:02.448756	2014-08-31 11:46:02.448756
16738	5	14	8	2013-11-30	AMAZING MOMENTS THE WORKS	2014-08-31 11:46:02.762132	2014-08-31 11:46:02.762132
16739	5	15	8	2013-11-30	HIDDEN CITIES EXTREME	2014-08-31 11:46:02.798001	2014-08-31 11:46:02.798001
16740	5	16	8	2013-11-30	HIDDEN CITIES EXTREME	2014-08-31 11:46:02.829697	2014-08-31 11:46:02.829697
16741	5	16	8	2013-11-30	BAGGAGE BATTLES	2014-08-31 11:46:02.85807	2014-08-31 11:46:02.85807
16742	5	17	8	2013-11-30	COUNTING CARS	2014-08-31 11:46:02.886846	2014-08-31 11:46:02.886846
16743	5	17	8	2013-11-30	PAWN STARS	2014-08-31 11:46:02.913492	2014-08-31 11:46:02.913492
16744	5	18	8	2013-11-30	MASTERS OF THE GAME	2014-08-31 11:46:02.944058	2014-08-31 11:46:02.944058
16745	5	19	8	2013-11-30	101 INVENTIONS THAT CHANGED THE WORLD	2014-08-31 11:46:02.970436	2014-08-31 11:46:02.970436
16746	5	20	8	2013-11-30	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:02.995791	2014-08-31 11:46:02.995791
16747	5	21	8	2013-11-30	BAGGAGE BATTLES	2014-08-31 11:46:03.35926	2014-08-31 11:46:03.35926
16748	5	22	8	2013-11-30	HOW SEX CHANGED THE WORLD	2014-08-31 11:46:03.387905	2014-08-31 11:46:03.387905
16749	5	22	8	2013-11-30	HOW SEX CHANGED THE WORLD	2014-08-31 11:46:03.414399	2014-08-31 11:46:03.414399
16750	5	7	8	2013-12-01	COUNTING CARS	2014-08-31 11:46:03.446713	2014-08-31 11:46:03.446713
16751	5	8	8	2013-12-01	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:03.475733	2014-08-31 11:46:03.475733
16752	5	8	8	2013-12-01	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:03.503783	2014-08-31 11:46:03.503783
16753	5	9	8	2013-12-01	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:03.534083	2014-08-31 11:46:03.534083
16754	5	10	8	2013-12-01	HIDDEN CITIES EXTREME	2014-08-31 11:46:03.560433	2014-08-31 11:46:03.560433
16755	5	11	8	2013-12-01	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:03.875937	2014-08-31 11:46:03.875937
16756	5	12	8	2013-12-01	PAWN STARS	2014-08-31 11:46:03.903184	2014-08-31 11:46:03.903184
16757	5	12	8	2013-12-01	PAWN STARS	2014-08-31 11:46:03.93405	2014-08-31 11:46:03.93405
16758	5	13	8	2013-12-01	BAGGAGE BATTLES	2014-08-31 11:46:03.963303	2014-08-31 11:46:03.963303
16759	5	14	8	2013-12-01	ANCIENT ALIENS	2014-08-31 11:46:03.992439	2014-08-31 11:46:03.992439
16760	5	15	8	2013-12-01	101 INVENTIONS THAT CHANGED THE WORLD	2014-08-31 11:46:04.029454	2014-08-31 11:46:04.029454
16761	5	15	8	2013-12-01	101 INVENTIONS THAT CHANGED THE WORLD	2014-08-31 11:46:04.056955	2014-08-31 11:46:04.056955
16762	5	16	8	2013-12-01	BAGGAGE BATTLES	2014-08-31 11:46:04.082943	2014-08-31 11:46:04.082943
16763	5	17	8	2013-12-01	COUNTING CARS	2014-08-31 11:46:04.393693	2014-08-31 11:46:04.393693
16764	5	18	8	2013-12-01	MASTERS OF THE GAME	2014-08-31 11:46:04.424456	2014-08-31 11:46:04.424456
16765	5	19	8	2013-12-01	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:04.454562	2014-08-31 11:46:04.454562
16766	5	19	8	2013-12-01	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:04.48379	2014-08-31 11:46:04.48379
16767	5	20	8	2013-12-01	INDIA ON FOUR WHEELS	2014-08-31 11:46:04.510472	2014-08-31 11:46:04.510472
16768	5	20	8	2013-12-01	INDIA ON FOUR WHEELS	2014-08-31 11:46:04.546054	2014-08-31 11:46:04.546054
16769	5	21	8	2013-12-01	BAGGAGE BATTLES	2014-08-31 11:46:04.573942	2014-08-31 11:46:04.573942
16770	5	21	8	2013-12-01	BAGGAGE BATTLES	2014-08-31 11:46:04.599126	2014-08-31 11:46:04.599126
16771	5	22	8	2013-12-01	HOW SEX CHANGED THE WORLD	2014-08-31 11:46:04.906435	2014-08-31 11:46:04.906435
16772	5	16	8	2013-12-02	ANCIENT ALIENS	2014-08-31 11:46:04.943936	2014-08-31 11:46:04.943936
16773	5	16	8	2013-12-02	BAGGAGE BATTLES	2014-08-31 11:46:04.973397	2014-08-31 11:46:04.973397
16774	5	16	8	2013-12-02	BAGGAGE BATTLES	2014-08-31 11:46:05.000806	2014-08-31 11:46:05.000806
16775	5	17	8	2013-12-02	COUNTING CARS	2014-08-31 11:46:05.031611	2014-08-31 11:46:05.031611
16776	5	18	8	2013-12-02	NATURAL WORLD	2014-08-31 11:46:05.062009	2014-08-31 11:46:05.062009
16777	5	18	8	2013-12-02	NATURAL WORLD	2014-08-31 11:46:05.090235	2014-08-31 11:46:05.090235
16778	5	18	8	2013-12-02	NATURAL WORLD	2014-08-31 11:46:05.115666	2014-08-31 11:46:05.115666
16779	5	19	8	2013-12-02	BAGGAGE BATTLES	2014-08-31 11:46:05.520512	2014-08-31 11:46:05.520512
16780	5	19	8	2013-12-02	BAGGAGE BATTLES	2014-08-31 11:46:05.548579	2014-08-31 11:46:05.548579
16781	5	20	8	2013-12-02	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:05.576749	2014-08-31 11:46:05.576749
16782	5	20	8	2013-12-02	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:05.602621	2014-08-31 11:46:05.602621
16783	5	20	8	2013-12-02	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:05.638333	2014-08-31 11:46:05.638333
16784	5	21	8	2013-12-02	PAWN STARS	2014-08-31 11:46:05.667351	2014-08-31 11:46:05.667351
16785	5	21	8	2013-12-02	PAWN STARS	2014-08-31 11:46:05.693333	2014-08-31 11:46:05.693333
16786	5	22	8	2013-12-02	ANCIENT ALIENS	2014-08-31 11:46:05.71818	2014-08-31 11:46:05.71818
16787	5	16	8	2013-12-03	ANCIENT ALIENS	2014-08-31 11:46:06.061277	2014-08-31 11:46:06.061277
16788	5	16	8	2013-12-03	HIDDEN CITIES EXTREME	2014-08-31 11:46:06.090306	2014-08-31 11:46:06.090306
16789	5	17	8	2013-12-03	COUNTING CARS	2014-08-31 11:46:06.125145	2014-08-31 11:46:06.125145
16790	5	17	8	2013-12-03	PAWN STARS	2014-08-31 11:46:06.156024	2014-08-31 11:46:06.156024
16791	5	18	8	2013-12-03	NATURAL WORLD	2014-08-31 11:46:06.184836	2014-08-31 11:46:06.184836
16792	5	18	8	2013-12-03	NATURAL WORLD	2014-08-31 11:46:06.210909	2014-08-31 11:46:06.210909
16793	5	19	8	2013-12-03	BAGGAGE BATTLES	2014-08-31 11:46:06.237379	2014-08-31 11:46:06.237379
16794	5	19	8	2013-12-03	SAVING INDIAS WESTERN GHATS	2014-08-31 11:46:06.26345	2014-08-31 11:46:06.26345
16795	5	20	8	2013-12-03	101 INVENTIONS THAT CHANGED THE WORLD	2014-08-31 11:46:06.288871	2014-08-31 11:46:06.288871
16796	5	20	8	2013-12-03	101 INVENTIONS THAT CHANGED THE WORLD	2014-08-31 11:46:06.607436	2014-08-31 11:46:06.607436
16797	5	20	8	2013-12-03	101 INVENTIONS THAT CHANGED THE WORLD	2014-08-31 11:46:06.639322	2014-08-31 11:46:06.639322
16798	5	21	8	2013-12-03	PAWN STARS	2014-08-31 11:46:06.669244	2014-08-31 11:46:06.669244
16799	5	21	8	2013-12-03	COUNTING CARS	2014-08-31 11:46:06.695783	2014-08-31 11:46:06.695783
16800	5	22	8	2013-12-03	ANCIENT ALIENS	2014-08-31 11:46:06.725368	2014-08-31 11:46:06.725368
16801	5	22	8	2013-12-03	ANCIENT ALIENS	2014-08-31 11:46:06.752871	2014-08-31 11:46:06.752871
16802	5	16	8	2013-12-04	ANCIENT ALIENS	2014-08-31 11:46:06.779451	2014-08-31 11:46:06.779451
16803	5	16	8	2013-12-04	HIDDEN CITIES EXTREME	2014-08-31 11:46:06.804929	2014-08-31 11:46:06.804929
16804	5	16	8	2013-12-04	HIDDEN CITIES EXTREME	2014-08-31 11:46:07.103719	2014-08-31 11:46:07.103719
16805	5	17	8	2013-12-04	COUNTING CARS	2014-08-31 11:46:07.140429	2014-08-31 11:46:07.140429
16806	5	17	8	2013-12-04	PAWN STARS	2014-08-31 11:46:07.167407	2014-08-31 11:46:07.167407
16807	5	18	8	2013-12-04	24/7 WILD	2014-08-31 11:46:07.193387	2014-08-31 11:46:07.193387
16808	5	19	8	2013-12-04	BAGGAGE BATTLES	2014-08-31 11:46:07.218344	2014-08-31 11:46:07.218344
16809	5	19	8	2013-12-04	SAVING INDIAS WESTERN GHATS	2014-08-31 11:46:07.247669	2014-08-31 11:46:07.247669
16810	5	20	8	2013-12-04	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:07.273361	2014-08-31 11:46:07.273361
16811	5	20	8	2013-12-04	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:07.298066	2014-08-31 11:46:07.298066
16812	5	21	8	2013-12-04	PAWN STARS	2014-08-31 11:46:07.611201	2014-08-31 11:46:07.611201
16813	5	21	8	2013-12-04	PAWN STARS	2014-08-31 11:46:07.643589	2014-08-31 11:46:07.643589
16814	5	21	8	2013-12-04	COUNTING CARS	2014-08-31 11:46:07.671854	2014-08-31 11:46:07.671854
16815	5	22	8	2013-12-04	ANCIENT ALIENS	2014-08-31 11:46:07.698605	2014-08-31 11:46:07.698605
16816	5	22	8	2013-12-04	ANCIENT ALIENS	2014-08-31 11:46:07.729526	2014-08-31 11:46:07.729526
16817	5	16	8	2013-12-05	ANCIENT ALIENS	2014-08-31 11:46:07.756398	2014-08-31 11:46:07.756398
16818	5	16	8	2013-12-05	HIDDEN CITIES EXTREME	2014-08-31 11:46:07.783072	2014-08-31 11:46:07.783072
16819	5	16	8	2013-12-05	HIDDEN CITIES EXTREME	2014-08-31 11:46:07.808065	2014-08-31 11:46:07.808065
16820	5	17	8	2013-12-05	PAWN STARS	2014-08-31 11:46:08.109356	2014-08-31 11:46:08.109356
16821	5	17	8	2013-12-05	PAWN STARS	2014-08-31 11:46:08.14307	2014-08-31 11:46:08.14307
16822	5	18	8	2013-12-05	KING COBRA FACE TO FACE	2014-08-31 11:46:08.171033	2014-08-31 11:46:08.171033
16823	5	18	8	2013-12-05	KING COBRA FACE TO FACE	2014-08-31 11:46:08.197351	2014-08-31 11:46:08.197351
16824	5	19	8	2013-12-05	BAGGAGE BATTLES	2014-08-31 11:46:08.233375	2014-08-31 11:46:08.233375
16825	5	19	8	2013-12-05	SAVING INDIAS WESTERN GHATS	2014-08-31 11:46:08.261267	2014-08-31 11:46:08.261267
16826	5	20	8	2013-12-05	MODERN MARVELS	2014-08-31 11:46:08.287433	2014-08-31 11:46:08.287433
16827	5	21	8	2013-12-05	PAWN STARS	2014-08-31 11:46:08.31177	2014-08-31 11:46:08.31177
16828	5	21	8	2013-12-05	PAWN STARS	2014-08-31 11:46:08.614347	2014-08-31 11:46:08.614347
16829	5	22	8	2013-12-05	ANCIENT ALIENS	2014-08-31 11:46:08.646152	2014-08-31 11:46:08.646152
16830	5	22	8	2013-12-05	ANCIENT ALIENS	2014-08-31 11:46:08.675409	2014-08-31 11:46:08.675409
16831	5	22	8	2013-12-05	ANCIENT ALIENS	2014-08-31 11:46:08.701185	2014-08-31 11:46:08.701185
16832	5	16	8	2013-12-06	ANCIENT ALIENS	2014-08-31 11:46:08.731963	2014-08-31 11:46:08.731963
16833	5	16	8	2013-12-06	HIDDEN CITIES EXTREME	2014-08-31 11:46:08.75947	2014-08-31 11:46:08.75947
16834	5	17	8	2013-12-06	COUNTING CARS	2014-08-31 11:46:08.785738	2014-08-31 11:46:08.785738
16835	5	17	8	2013-12-06	PAWN STARS	2014-08-31 11:46:08.811069	2014-08-31 11:46:08.811069
16836	5	18	8	2013-12-06	WORLDS SCARIEST ANIMAL ATTACK	2014-08-31 11:46:09.118323	2014-08-31 11:46:09.118323
16837	5	18	8	2013-12-06	WORLDS SCARIEST ANIMAL ATTACK	2014-08-31 11:46:09.149622	2014-08-31 11:46:09.149622
16838	5	18	8	2013-12-06	WORLDS SCARIEST ANIMAL ATTACK	2014-08-31 11:46:09.178442	2014-08-31 11:46:09.178442
16839	5	19	8	2013-12-06	BAGGAGE BATTLES	2014-08-31 11:46:09.205121	2014-08-31 11:46:09.205121
16840	5	20	8	2013-12-06	MIRACLE RISING SOUTH AFRICA	2014-08-31 11:46:09.236923	2014-08-31 11:46:09.236923
16841	5	20	8	2013-12-06	MIRACLE RISING SOUTH AFRICA	2014-08-31 11:46:09.264445	2014-08-31 11:46:09.264445
16842	5	21	8	2013-12-06	MIRACLE RISING SOUTH AFRICA	2014-08-31 11:46:09.291714	2014-08-31 11:46:09.291714
16843	5	21	8	2013-12-06	MIRACLE RISING SOUTH AFRICA	2014-08-31 11:46:09.325928	2014-08-31 11:46:09.325928
16844	5	22	8	2013-12-06	ANCIENT ALIENS	2014-08-31 11:46:09.360154	2014-08-31 11:46:09.360154
16845	5	22	8	2013-12-06	ANCIENT ALIENS	2014-08-31 11:46:09.680778	2014-08-31 11:46:09.680778
16846	5	22	8	2013-12-06	ANCIENT ALIENS	2014-08-31 11:46:09.707894	2014-08-31 11:46:09.707894
16847	5	7	8	2013-12-07	101 INVENTIONS THAT CHANGED THE WORLD	2014-08-31 11:46:09.738821	2014-08-31 11:46:09.738821
16848	5	7	8	2013-12-07	COUNTING CARS	2014-08-31 11:46:09.765299	2014-08-31 11:46:09.765299
16849	5	8	8	2013-12-07	MTV RANN VJ RUN	2014-08-31 11:46:09.792005	2014-08-31 11:46:09.792005
16850	5	9	8	2013-12-07	SAVING INDIAS WESTERN GHATS	2014-08-31 11:46:09.81797	2014-08-31 11:46:09.81797
16851	5	10	8	2013-12-07	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:09.847899	2014-08-31 11:46:09.847899
16852	5	10	8	2013-12-07	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:09.872381	2014-08-31 11:46:09.872381
16853	5	11	8	2013-12-07	ANCIENT ALIENS	2014-08-31 11:46:10.179792	2014-08-31 11:46:10.179792
16854	5	11	8	2013-12-07	ANCIENT ALIENS	2014-08-31 11:46:10.207729	2014-08-31 11:46:10.207729
16855	5	12	8	2013-12-07	COUNTING CARS	2014-08-31 11:46:10.239271	2014-08-31 11:46:10.239271
16856	5	13	8	2013-12-07	BAGGAGE BATTLES	2014-08-31 11:46:10.267841	2014-08-31 11:46:10.267841
16857	5	13	8	2013-12-07	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:10.294703	2014-08-31 11:46:10.294703
16858	5	14	8	2013-12-07	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:10.324328	2014-08-31 11:46:10.324328
16859	5	15	8	2013-12-07	STAN LEES SUPERHUMANS	2014-08-31 11:46:10.35006	2014-08-31 11:46:10.35006
16860	5	16	8	2013-12-07	STAN LEES SUPERHUMANS	2014-08-31 11:46:10.376552	2014-08-31 11:46:10.376552
16861	5	17	8	2013-12-07	COUNTING CARS	2014-08-31 11:46:10.691052	2014-08-31 11:46:10.691052
16862	5	18	8	2013-12-07	MASTERS OF THE GAME	2014-08-31 11:46:10.717369	2014-08-31 11:46:10.717369
16863	5	18	8	2013-12-07	GODS OF SPEED	2014-08-31 11:46:10.748294	2014-08-31 11:46:10.748294
16864	5	19	8	2013-12-07	GODS OF SPEED	2014-08-31 11:46:10.775195	2014-08-31 11:46:10.775195
16865	5	20	8	2013-12-07	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:10.80252	2014-08-31 11:46:10.80252
16866	5	20	8	2013-12-07	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:10.828583	2014-08-31 11:46:10.828583
16867	5	21	8	2013-12-07	BAGGAGE BATTLES	2014-08-31 11:46:10.853976	2014-08-31 11:46:10.853976
16868	5	22	8	2013-12-07	ANCIENT ALIENS	2014-08-31 11:46:10.878688	2014-08-31 11:46:10.878688
16869	5	7	8	2013-12-08	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:11.215981	2014-08-31 11:46:11.215981
16870	5	7	8	2013-12-08	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:11.248478	2014-08-31 11:46:11.248478
16871	5	8	8	2013-12-08	ANCIENT ALIENS	2014-08-31 11:46:11.276432	2014-08-31 11:46:11.276432
16872	5	8	8	2013-12-08	ANCIENT ALIENS	2014-08-31 11:46:11.302826	2014-08-31 11:46:11.302826
16873	5	9	8	2013-12-08	COUNTING CARS	2014-08-31 11:46:11.329582	2014-08-31 11:46:11.329582
16874	5	9	8	2013-12-08	BAGGAGE BATTLES	2014-08-31 11:46:11.356332	2014-08-31 11:46:11.356332
16875	5	10	8	2013-12-08	STAN LEES SUPERHUMANS	2014-08-31 11:46:11.382178	2014-08-31 11:46:11.382178
16876	5	11	8	2013-12-08	STAN LEES SUPERHUMANS	2014-08-31 11:46:11.407136	2014-08-31 11:46:11.407136
16877	5	12	8	2013-12-08	HIDDEN CITIES EXTREME	2014-08-31 11:46:11.711681	2014-08-31 11:46:11.711681
16878	5	12	8	2013-12-08	PAWN STARS	2014-08-31 11:46:11.7389	2014-08-31 11:46:11.7389
16879	5	13	8	2013-12-08	BAGGAGE BATTLES	2014-08-31 11:46:11.766922	2014-08-31 11:46:11.766922
16880	5	14	8	2013-12-08	ANCIENT ALIENS	2014-08-31 11:46:11.794021	2014-08-31 11:46:11.794021
16881	5	15	8	2013-12-08	MIRACLE RISING SOUTH AFRICA	2014-08-31 11:46:11.824328	2014-08-31 11:46:11.824328
16882	5	16	8	2013-12-08	HIDDEN CITIES EXTREME	2014-08-31 11:46:11.852174	2014-08-31 11:46:11.852174
16883	5	17	8	2013-12-08	PAWN STARS	2014-08-31 11:46:11.87837	2014-08-31 11:46:11.87837
16884	5	18	8	2013-12-08	MASTERS OF THE GAME	2014-08-31 11:46:11.904502	2014-08-31 11:46:11.904502
16885	5	18	8	2013-12-08	MASTERS OF THE GAME	2014-08-31 11:46:12.209281	2014-08-31 11:46:12.209281
16886	5	19	8	2013-12-08	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:12.240867	2014-08-31 11:46:12.240867
16887	5	20	8	2013-12-08	INDIA ON FOUR WHEELS	2014-08-31 11:46:12.267443	2014-08-31 11:46:12.267443
16888	5	21	8	2013-12-08	BAGGAGE BATTLES	2014-08-31 11:46:12.294221	2014-08-31 11:46:12.294221
16889	5	22	8	2013-12-08	ANCIENT ALIENS	2014-08-31 11:46:12.32473	2014-08-31 11:46:12.32473
16890	5	16	8	2013-12-09	ANCIENT ALIENS	2014-08-31 11:46:12.352991	2014-08-31 11:46:12.352991
16891	5	16	8	2013-12-09	HIDDEN CITIES EXTREME	2014-08-31 11:46:12.380936	2014-08-31 11:46:12.380936
16892	5	16	8	2013-12-09	HIDDEN CITIES EXTREME	2014-08-31 11:46:12.40685	2014-08-31 11:46:12.40685
16893	5	17	8	2013-12-09	COUNTING CARS	2014-08-31 11:46:12.430487	2014-08-31 11:46:12.430487
16894	5	17	8	2013-12-09	COUNTING CARS	2014-08-31 11:46:12.733871	2014-08-31 11:46:12.733871
16895	5	17	8	2013-12-09	PAWN STARS	2014-08-31 11:46:12.761492	2014-08-31 11:46:12.761492
16896	5	18	8	2013-12-09	EVOLVE	2014-08-31 11:46:12.791712	2014-08-31 11:46:12.791712
16897	5	19	8	2013-12-09	DERREN BROWN-THE EXPERIMENTS	2014-08-31 11:46:12.817993	2014-08-31 11:46:12.817993
16898	5	19	8	2013-12-09	DERREN BROWN-THE EXPERIMENTS	2014-08-31 11:46:12.850619	2014-08-31 11:46:12.850619
16899	5	19	8	2013-12-09	DERREN BROWN-THE EXPERIMENTS	2014-08-31 11:46:12.886059	2014-08-31 11:46:12.886059
16900	5	20	8	2013-12-09	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:12.911475	2014-08-31 11:46:12.911475
16901	5	20	8	2013-12-09	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:12.940251	2014-08-31 11:46:12.940251
16902	5	21	8	2013-12-09	SHIPPING WARS	2014-08-31 11:46:13.239446	2014-08-31 11:46:13.239446
16903	5	21	8	2013-12-09	SHIPPING WARS	2014-08-31 11:46:13.266544	2014-08-31 11:46:13.266544
16904	5	22	8	2013-12-09	ANCIENT ALIENS	2014-08-31 11:46:13.293375	2014-08-31 11:46:13.293375
16905	5	16	8	2013-12-10	ANCIENT ALIENS	2014-08-31 11:46:13.327817	2014-08-31 11:46:13.327817
16906	5	16	8	2013-12-10	SHIPPING WARS	2014-08-31 11:46:13.354211	2014-08-31 11:46:13.354211
16907	5	17	8	2013-12-10	COUNTING CARS	2014-08-31 11:46:13.380068	2014-08-31 11:46:13.380068
16908	5	17	8	2013-12-10	COUNTING CARS	2014-08-31 11:46:13.406617	2014-08-31 11:46:13.406617
16909	5	17	8	2013-12-10	PAWN STARS	2014-08-31 11:46:13.431235	2014-08-31 11:46:13.431235
16910	5	17	8	2013-12-10	PAWN STARS	2014-08-31 11:46:13.739125	2014-08-31 11:46:13.739125
16911	5	18	8	2013-12-10	24/7 WILD	2014-08-31 11:46:13.767067	2014-08-31 11:46:13.767067
16912	5	19	8	2013-12-10	DERREN BROWN-THE EXPERIMENTS	2014-08-31 11:46:13.793542	2014-08-31 11:46:13.793542
16913	5	19	8	2013-12-10	DERREN BROWN-THE EXPERIMENTS	2014-08-31 11:46:13.824905	2014-08-31 11:46:13.824905
16914	5	19	8	2013-12-10	DERREN BROWN-THE EXPERIMENTS	2014-08-31 11:46:13.853081	2014-08-31 11:46:13.853081
16915	5	20	8	2013-12-10	101 OBJECTS THAT CHANGED THE WORLD	2014-08-31 11:46:13.880862	2014-08-31 11:46:13.880862
16916	5	20	8	2013-12-10	101 OBJECTS THAT CHANGED THE WORLD	2014-08-31 11:46:13.906468	2014-08-31 11:46:13.906468
16917	5	21	8	2013-12-10	SHIPPING WARS	2014-08-31 11:46:13.93573	2014-08-31 11:46:13.93573
16918	5	21	8	2013-12-10	SHIPPING WARS	2014-08-31 11:46:14.243984	2014-08-31 11:46:14.243984
16919	5	22	8	2013-12-10	ANCIENT ALIENS	2014-08-31 11:46:14.271469	2014-08-31 11:46:14.271469
16920	5	16	8	2013-12-11	ANCIENT ALIENS	2014-08-31 11:46:14.299981	2014-08-31 11:46:14.299981
16921	5	16	8	2013-12-11	SHIPPING WARS	2014-08-31 11:46:14.330934	2014-08-31 11:46:14.330934
16922	5	17	8	2013-12-11	COUNTING CARS	2014-08-31 11:46:14.358775	2014-08-31 11:46:14.358775
16923	5	17	8	2013-12-11	PAWN STARS	2014-08-31 11:46:14.386352	2014-08-31 11:46:14.386352
16924	5	18	8	2013-12-11	DEADLY SUMMER	2014-08-31 11:46:14.412784	2014-08-31 11:46:14.412784
16925	5	18	8	2013-12-11	DEADLY SUMMER	2014-08-31 11:46:14.443834	2014-08-31 11:46:14.443834
16926	5	18	8	2013-12-11	DEADLY SUMMER	2014-08-31 11:46:14.76679	2014-08-31 11:46:14.76679
16927	5	19	8	2013-12-11	DERREN BROWN-THE EXPERIMENTS	2014-08-31 11:46:14.794513	2014-08-31 11:46:14.794513
16928	5	20	8	2013-12-11	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:14.826068	2014-08-31 11:46:14.826068
16929	5	21	8	2013-12-11	SHIPPING WARS	2014-08-31 11:46:14.854761	2014-08-31 11:46:14.854761
16930	5	16	8	2013-12-12	ANCIENT ALIENS	2014-08-31 11:46:14.883769	2014-08-31 11:46:14.883769
16931	5	17	8	2013-12-12	COUNTING CARS	2014-08-31 11:46:14.911338	2014-08-31 11:46:14.911338
16932	5	18	8	2013-12-12	OCTOPUS VOLCANO	2014-08-31 11:46:14.942699	2014-08-31 11:46:14.942699
16933	5	19	8	2013-12-12	DERREN BROWN-THE EXPERIMENTS	2014-08-31 11:46:14.974786	2014-08-31 11:46:14.974786
16934	5	19	8	2013-12-12	DERREN BROWN-THE EXPERIMENTS	2014-08-31 11:46:15.28466	2014-08-31 11:46:15.28466
16935	5	20	8	2013-12-12	MODERN MARVELS	2014-08-31 11:46:15.313543	2014-08-31 11:46:15.313543
16936	5	21	8	2013-12-12	PAWN STARS	2014-08-31 11:46:15.345531	2014-08-31 11:46:15.345531
16937	5	22	8	2013-12-12	ANCIENT ALIENS	2014-08-31 11:46:15.375531	2014-08-31 11:46:15.375531
16938	5	22	8	2013-12-12	ANCIENT ALIENS	2014-08-31 11:46:15.402514	2014-08-31 11:46:15.402514
16939	5	22	8	2013-12-12	ANCIENT ALIENS	2014-08-31 11:46:15.433168	2014-08-31 11:46:15.433168
16940	5	16	8	2013-12-13	ANCIENT ALIENS	2014-08-31 11:46:15.460028	2014-08-31 11:46:15.460028
16941	5	16	8	2013-12-13	ANCIENT ALIENS	2014-08-31 11:46:15.490148	2014-08-31 11:46:15.490148
16942	5	17	8	2013-12-13	COUNTING CARS	2014-08-31 11:46:15.514865	2014-08-31 11:46:15.514865
16943	5	18	8	2013-12-13	JOURNEY TO THE EDGE OF NOWHERE	2014-08-31 11:46:15.823068	2014-08-31 11:46:15.823068
16944	5	19	8	2013-12-13	DERREN BROWN-THE EXPERIMENTS	2014-08-31 11:46:15.852187	2014-08-31 11:46:15.852187
16945	5	20	8	2013-12-13	HIDDEN CITIES EXTREME	2014-08-31 11:46:15.880341	2014-08-31 11:46:15.880341
16946	5	21	8	2013-12-13	PAWN STARS	2014-08-31 11:46:15.906491	2014-08-31 11:46:15.906491
16947	5	21	8	2013-12-13	SHIPPING WARS	2014-08-31 11:46:15.937485	2014-08-31 11:46:15.937485
16948	5	22	8	2013-12-13	ANCIENT ALIENS	2014-08-31 11:46:15.969933	2014-08-31 11:46:15.969933
16949	5	22	8	2013-12-13	ANCIENT ALIENS	2014-08-31 11:46:15.99598	2014-08-31 11:46:15.99598
16950	5	7	8	2013-12-14	MASTERS OF THE GAME	2014-08-31 11:46:16.054593	2014-08-31 11:46:16.054593
16951	5	7	8	2013-12-14	SHIPPING WARS	2014-08-31 11:46:16.372366	2014-08-31 11:46:16.372366
16952	5	8	8	2013-12-14	MTV RANN VJ RUN	2014-08-31 11:46:16.399785	2014-08-31 11:46:16.399785
16953	5	8	8	2013-12-14	MTV RANN VJ RUN	2014-08-31 11:46:16.432118	2014-08-31 11:46:16.432118
16954	5	10	8	2013-12-14	101 OBJECTS THAT CHANGED THE WORLD	2014-08-31 11:46:16.45995	2014-08-31 11:46:16.45995
16955	5	10	8	2013-12-14	101 OBJECTS THAT CHANGED THE WORLD	2014-08-31 11:46:16.487586	2014-08-31 11:46:16.487586
16956	5	11	8	2013-12-14	ANCIENT ALIENS	2014-08-31 11:46:16.518156	2014-08-31 11:46:16.518156
16957	5	12	8	2013-12-14	SHIPPING WARS	2014-08-31 11:46:16.554601	2014-08-31 11:46:16.554601
16958	5	12	8	2013-12-14	SHIPPING WARS	2014-08-31 11:46:16.579804	2014-08-31 11:46:16.579804
16959	5	13	8	2013-12-14	BAGGAGE BATTLES	2014-08-31 11:46:16.90665	2014-08-31 11:46:16.90665
16960	5	13	8	2013-12-14	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:16.939561	2014-08-31 11:46:16.939561
16961	5	14	8	2013-12-14	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:16.970057	2014-08-31 11:46:16.970057
16962	5	14	8	2013-12-14	HIDDEN CITIES EXTREME	2014-08-31 11:46:16.997805	2014-08-31 11:46:16.997805
16963	5	15	8	2013-12-14	STAN LEES SUPERHUMANS	2014-08-31 11:46:17.030136	2014-08-31 11:46:17.030136
16964	5	16	8	2013-12-14	STAN LEES SUPERHUMANS	2014-08-31 11:46:17.057414	2014-08-31 11:46:17.057414
16965	5	17	8	2013-12-14	PAWN STARS	2014-08-31 11:46:17.083746	2014-08-31 11:46:17.083746
16966	5	18	8	2013-12-14	MASTERS OF THE GAME	2014-08-31 11:46:17.109035	2014-08-31 11:46:17.109035
16967	5	19	8	2013-12-14	GODS OF SPEED	2014-08-31 11:46:17.414041	2014-08-31 11:46:17.414041
16968	5	20	8	2013-12-14	BHUTTO	2014-08-31 11:46:17.446887	2014-08-31 11:46:17.446887
16969	5	21	8	2013-12-14	BHUTTO	2014-08-31 11:46:17.473979	2014-08-31 11:46:17.473979
16970	5	22	8	2013-12-14	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:17.50106	2014-08-31 11:46:17.50106
16971	5	7	8	2013-12-15	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:17.533336	2014-08-31 11:46:17.533336
16972	5	8	8	2013-12-15	ANCIENT ALIENS	2014-08-31 11:46:17.561032	2014-08-31 11:46:17.561032
16973	5	8	8	2013-12-15	ANCIENT ALIENS	2014-08-31 11:46:17.586995	2014-08-31 11:46:17.586995
16974	5	9	8	2013-12-15	COUNTING CARS	2014-08-31 11:46:17.611865	2014-08-31 11:46:17.611865
16975	5	9	8	2013-12-15	COUNTING CARS	2014-08-31 11:46:17.916964	2014-08-31 11:46:17.916964
16976	5	10	8	2013-12-15	STAN LEES SUPERHUMANS	2014-08-31 11:46:17.949813	2014-08-31 11:46:17.949813
16977	5	10	8	2013-12-15	STAN LEES SUPERHUMANS	2014-08-31 11:46:17.978259	2014-08-31 11:46:17.978259
16978	5	11	8	2013-12-15	STAN LEES SUPERHUMANS	2014-08-31 11:46:18.00742	2014-08-31 11:46:18.00742
16979	5	12	8	2013-12-15	SHIPPING WARS	2014-08-31 11:46:18.03701	2014-08-31 11:46:18.03701
16980	5	12	8	2013-12-15	SHIPPING WARS	2014-08-31 11:46:18.064376	2014-08-31 11:46:18.064376
16981	5	13	8	2013-12-15	BAGGAGE BATTLES	2014-08-31 11:46:18.09016	2014-08-31 11:46:18.09016
16982	5	14	8	2013-12-15	101 INVENTIONS THAT CHANGED THE WORLD	2014-08-31 11:46:18.123695	2014-08-31 11:46:18.123695
16983	5	15	8	2013-12-15	ANCIENT ALIENS	2014-08-31 11:46:18.42851	2014-08-31 11:46:18.42851
16984	5	15	8	2013-12-15	MODERN MARVELS	2014-08-31 11:46:18.45619	2014-08-31 11:46:18.45619
16985	5	16	8	2013-12-15	MODERN MARVELS	2014-08-31 11:46:18.484169	2014-08-31 11:46:18.484169
16986	5	17	8	2013-12-15	COUNTING CARS	2014-08-31 11:46:18.511138	2014-08-31 11:46:18.511138
16987	5	18	8	2013-12-15	MASTERS OF THE GAME	2014-08-31 11:46:18.542354	2014-08-31 11:46:18.542354
16988	5	19	8	2013-12-15	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:18.569485	2014-08-31 11:46:18.569485
16989	5	20	8	2013-12-15	INDIA ON FOUR WHEELS	2014-08-31 11:46:18.595923	2014-08-31 11:46:18.595923
16990	5	21	8	2013-12-15	BAGGAGE BATTLES	2014-08-31 11:46:18.630575	2014-08-31 11:46:18.630575
16991	5	22	8	2013-12-15	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:18.656666	2014-08-31 11:46:18.656666
16992	5	16	8	2013-12-16	ANCIENT ALIENS	2014-08-31 11:46:18.994962	2014-08-31 11:46:18.994962
16993	5	16	8	2013-12-16	SHIPPING WARS	2014-08-31 11:46:19.027782	2014-08-31 11:46:19.027782
16994	5	17	8	2013-12-16	COUNTING CARS	2014-08-31 11:46:19.056662	2014-08-31 11:46:19.056662
16995	5	17	8	2013-12-16	PAWN STARS	2014-08-31 11:46:19.084649	2014-08-31 11:46:19.084649
16996	5	18	8	2013-12-16	EVOLVE	2014-08-31 11:46:19.112242	2014-08-31 11:46:19.112242
16997	5	18	8	2013-12-16	EVOLVE	2014-08-31 11:46:19.143755	2014-08-31 11:46:19.143755
16998	5	20	8	2013-12-16	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:19.170777	2014-08-31 11:46:19.170777
16999	5	20	8	2013-12-16	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:19.1967	2014-08-31 11:46:19.1967
17000	5	21	8	2013-12-16	PAWN STARS	2014-08-31 11:46:19.536411	2014-08-31 11:46:19.536411
17001	5	22	8	2013-12-16	MEN AGAINST THE TIDE-A YEAR AFTER NIRBHA	2014-08-31 11:46:19.576278	2014-08-31 11:46:19.576278
17002	5	16	8	2013-12-17	ANCIENT ALIENS	2014-08-31 11:46:19.603243	2014-08-31 11:46:19.603243
17003	5	16	8	2013-12-17	ANCIENT ALIENS	2014-08-31 11:46:19.638686	2014-08-31 11:46:19.638686
17004	5	17	8	2013-12-17	COUNTING CARS	2014-08-31 11:46:19.665927	2014-08-31 11:46:19.665927
17005	5	18	8	2013-12-17	WHITE LIONS BORN WILD	2014-08-31 11:46:19.693715	2014-08-31 11:46:19.693715
17006	5	19	8	2013-12-17	DERREN BROWN-FEAR AND FAITH	2014-08-31 11:46:19.724902	2014-08-31 11:46:19.724902
17007	5	19	8	2013-12-17	DERREN BROWN-FEAR AND FAITH	2014-08-31 11:46:19.752216	2014-08-31 11:46:19.752216
17008	5	20	8	2013-12-17	101 OBJECTS THAT CHANGED THE WORLD	2014-08-31 11:46:20.064906	2014-08-31 11:46:20.064906
17009	5	21	8	2013-12-17	SHIPPING WARS	2014-08-31 11:46:20.093341	2014-08-31 11:46:20.093341
17010	5	21	8	2013-12-17	SHIPPING WARS	2014-08-31 11:46:20.124376	2014-08-31 11:46:20.124376
17011	5	22	8	2013-12-17	COUNTING CARS	2014-08-31 11:46:20.152721	2014-08-31 11:46:20.152721
17012	5	16	8	2013-12-18	ANCIENT ALIENS	2014-08-31 11:46:20.180161	2014-08-31 11:46:20.180161
17013	5	16	8	2013-12-18	SHIPPING WARS	2014-08-31 11:46:20.206655	2014-08-31 11:46:20.206655
17014	5	17	8	2013-12-18	COUNTING CARS	2014-08-31 11:46:20.240727	2014-08-31 11:46:20.240727
17015	5	17	8	2013-12-18	PAWN STARS	2014-08-31 11:46:20.267763	2014-08-31 11:46:20.267763
17016	5	18	8	2013-12-18	WHITE LIONS BORN WILD	2014-08-31 11:46:20.580498	2014-08-31 11:46:20.580498
17017	5	19	8	2013-12-18	DERREN BROWN-APOCALYPSE	2014-08-31 11:46:20.607558	2014-08-31 11:46:20.607558
17018	5	20	8	2013-12-18	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:20.640011	2014-08-31 11:46:20.640011
17019	5	21	8	2013-12-18	SHIPPING WARS	2014-08-31 11:46:20.667731	2014-08-31 11:46:20.667731
17020	5	21	8	2013-12-18	SHIPPING WARS	2014-08-31 11:46:20.694008	2014-08-31 11:46:20.694008
17021	5	22	8	2013-12-18	ANCIENT ALIENS	2014-08-31 11:46:20.726417	2014-08-31 11:46:20.726417
17022	5	16	8	2013-12-19	ANCIENT ALIENS	2014-08-31 11:46:20.753777	2014-08-31 11:46:20.753777
17023	5	16	8	2013-12-19	SHIPPING WARS	2014-08-31 11:46:20.780207	2014-08-31 11:46:20.780207
17024	5	18	8	2013-12-19	EVOLVE	2014-08-31 11:46:21.118737	2014-08-31 11:46:21.118737
17025	5	18	8	2013-12-19	EVOLVE	2014-08-31 11:46:21.149	2014-08-31 11:46:21.149
17026	5	19	8	2013-12-19	DERREN BROWN-APOCALYPSE	2014-08-31 11:46:21.176727	2014-08-31 11:46:21.176727
17027	5	20	8	2013-12-19	MODERN MARVELS	2014-08-31 11:46:21.203477	2014-08-31 11:46:21.203477
17028	5	20	8	2013-12-19	MODERN MARVELS	2014-08-31 11:46:21.238271	2014-08-31 11:46:21.238271
17029	5	21	8	2013-12-19	PAWN STARS	2014-08-31 11:46:21.265916	2014-08-31 11:46:21.265916
17030	5	21	8	2013-12-19	SHIPPING WARS	2014-08-31 11:46:21.291909	2014-08-31 11:46:21.291909
17031	5	22	8	2013-12-19	COUNTING CARS	2014-08-31 11:46:21.317061	2014-08-31 11:46:21.317061
17032	5	16	8	2013-12-20	ANCIENT ALIENS	2014-08-31 11:46:21.623533	2014-08-31 11:46:21.623533
17033	5	16	8	2013-12-20	SHIPPING WARS	2014-08-31 11:46:21.651663	2014-08-31 11:46:21.651663
17034	5	17	8	2013-12-20	COUNTING CARS	2014-08-31 11:46:21.679049	2014-08-31 11:46:21.679049
17035	5	17	8	2013-12-20	PAWN STARS	2014-08-31 11:46:21.706016	2014-08-31 11:46:21.706016
17036	5	18	8	2013-12-20	EVOLVE	2014-08-31 11:46:21.737733	2014-08-31 11:46:21.737733
17037	5	18	8	2013-12-20	EVOLVE	2014-08-31 11:46:21.765777	2014-08-31 11:46:21.765777
17038	5	19	8	2013-12-20	DERREN BROWN-THE EXPERIMENTS	2014-08-31 11:46:21.792859	2014-08-31 11:46:21.792859
17039	5	20	8	2013-12-20	BAGGAGE BATTLES	2014-08-31 11:46:21.823393	2014-08-31 11:46:21.823393
17040	5	22	8	2013-12-20	COUNTING CARS	2014-08-31 11:46:21.850436	2014-08-31 11:46:21.850436
17041	5	22	8	2013-12-20	COUNTING CARS	2014-08-31 11:46:22.175522	2014-08-31 11:46:22.175522
17042	5	7	8	2013-12-21	BAGGAGE BATTLES	2014-08-31 11:46:22.204592	2014-08-31 11:46:22.204592
17043	5	7	8	2013-12-21	COUNTING CARS	2014-08-31 11:46:22.236693	2014-08-31 11:46:22.236693
17044	5	8	8	2013-12-21	MODERN MARVELS	2014-08-31 11:46:22.265098	2014-08-31 11:46:22.265098
17045	5	9	8	2013-12-21	MODERN MARVELS	2014-08-31 11:46:22.292422	2014-08-31 11:46:22.292422
17046	5	9	8	2013-12-21	MODERN MARVELS	2014-08-31 11:46:22.326492	2014-08-31 11:46:22.326492
17047	5	11	8	2013-12-21	101 INVENTIONS THAT CHANGED THE WORLD	2014-08-31 11:46:22.353317	2014-08-31 11:46:22.353317
17048	5	13	8	2013-12-21	COUNTING CARS	2014-08-31 11:46:22.379933	2014-08-31 11:46:22.379933
17049	5	13	8	2013-12-21	BAGGAGE BATTLES	2014-08-31 11:46:22.688961	2014-08-31 11:46:22.688961
17050	5	14	8	2013-12-21	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:22.716638	2014-08-31 11:46:22.716638
17051	5	15	8	2013-12-21	STAN LEES SUPERHUMANS	2014-08-31 11:46:22.74923	2014-08-31 11:46:22.74923
17052	5	16	8	2013-12-21	STAN LEES SUPERHUMANS	2014-08-31 11:46:22.777953	2014-08-31 11:46:22.777953
17053	5	18	8	2013-12-21	MASTERS OF THE GAME	2014-08-31 11:46:22.805229	2014-08-31 11:46:22.805229
17054	5	19	8	2013-12-21	GODS OF SPEED	2014-08-31 11:46:22.839869	2014-08-31 11:46:22.839869
17055	5	20	8	2013-12-21	BHUTTO	2014-08-31 11:46:22.867591	2014-08-31 11:46:22.867591
17056	5	22	8	2013-12-21	HOW SEX CHANGED THE WORLD	2014-08-31 11:46:22.893515	2014-08-31 11:46:22.893515
17057	5	22	8	2013-12-21	HOW SEX CHANGED THE WORLD	2014-08-31 11:46:23.204137	2014-08-31 11:46:23.204137
17058	5	7	8	2013-12-22	COUNTING CARS	2014-08-31 11:46:23.236578	2014-08-31 11:46:23.236578
17059	5	8	8	2013-12-22	PLAY	2014-08-31 11:46:23.265958	2014-08-31 11:46:23.265958
17060	5	9	8	2013-12-22	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:23.295263	2014-08-31 11:46:23.295263
17061	5	10	8	2013-12-22	STAN LEES SUPERHUMANS	2014-08-31 11:46:23.332371	2014-08-31 11:46:23.332371
17062	5	11	8	2013-12-22	STAN LEES SUPERHUMANS	2014-08-31 11:46:23.360735	2014-08-31 11:46:23.360735
17063	5	12	8	2013-12-22	SHIPPING WARS	2014-08-31 11:46:23.387196	2014-08-31 11:46:23.387196
17064	5	13	8	2013-12-22	COUNTING CARS	2014-08-31 11:46:23.414441	2014-08-31 11:46:23.414441
17065	5	14	8	2013-12-22	101 INVENTIONS THAT CHANGED THE WORLD	2014-08-31 11:46:23.738096	2014-08-31 11:46:23.738096
17066	5	14	8	2013-12-22	DERREN BROWN-APOCALYPSE	2014-08-31 11:46:23.765869	2014-08-31 11:46:23.765869
17067	5	14	8	2013-12-22	DERREN BROWN-APOCALYPSE	2014-08-31 11:46:23.794389	2014-08-31 11:46:23.794389
17068	5	15	8	2013-12-22	DERREN BROWN-APOCALYPSE	2014-08-31 11:46:23.825994	2014-08-31 11:46:23.825994
17069	5	16	8	2013-12-22	SHIPPING WARS	2014-08-31 11:46:23.854703	2014-08-31 11:46:23.854703
17070	5	17	8	2013-12-22	PAWN STARS	2014-08-31 11:46:23.883102	2014-08-31 11:46:23.883102
17071	5	18	8	2013-12-22	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:23.909885	2014-08-31 11:46:23.909885
17072	5	20	8	2013-12-22	101 INVENTIONS THAT CHANGED THE WORLD	2014-08-31 11:46:23.941039	2014-08-31 11:46:23.941039
17073	5	22	8	2013-12-22	HOW SEX CHANGED THE WORLD	2014-08-31 11:46:24.265884	2014-08-31 11:46:24.265884
17074	5	16	8	2013-12-23	SPIDER-MAN TECH	2014-08-31 11:46:24.296329	2014-08-31 11:46:24.296329
17075	5	16	8	2013-12-23	SPIDER-MAN TECH	2014-08-31 11:46:24.328673	2014-08-31 11:46:24.328673
17076	5	17	8	2013-12-23	PAWN STARS	2014-08-31 11:46:24.360717	2014-08-31 11:46:24.360717
17077	5	18	8	2013-12-23	SCIENCE IMPOSSIBLE	2014-08-31 11:46:24.387761	2014-08-31 11:46:24.387761
17078	5	19	8	2013-12-23	DERREN BROWN-THE EXPERIMENTS	2014-08-31 11:46:24.413336	2014-08-31 11:46:24.413336
17079	5	19	8	2013-12-23	DERREN BROWN-THE EXPERIMENTS	2014-08-31 11:46:24.443741	2014-08-31 11:46:24.443741
17080	5	20	8	2013-12-23	YOUR BLEEPED UP BRAIN	2014-08-31 11:46:24.476321	2014-08-31 11:46:24.476321
17081	5	21	8	2013-12-23	DUCK DYNASTY	2014-08-31 11:46:24.795235	2014-08-31 11:46:24.795235
17082	5	22	8	2013-12-23	COUNTING CARS	2014-08-31 11:46:24.829842	2014-08-31 11:46:24.829842
17083	5	22	8	2013-12-23	HOW SEX CHANGED THE WORLD	2014-08-31 11:46:24.857743	2014-08-31 11:46:24.857743
17084	5	16	8	2013-12-24	101 OBJECTS THAT CHANGED THE WORLD	2014-08-31 11:46:24.884655	2014-08-31 11:46:24.884655
17085	5	16	8	2013-12-24	DUCK DYNASTY	2014-08-31 11:46:24.912036	2014-08-31 11:46:24.912036
17086	5	17	8	2013-12-24	COUNTING CARS	2014-08-31 11:46:24.942418	2014-08-31 11:46:24.942418
17087	5	18	8	2013-12-24	SCIENCE IMPOSSIBLE	2014-08-31 11:46:24.969462	2014-08-31 11:46:24.969462
17088	5	18	8	2013-12-24	SCIENCE IMPOSSIBLE	2014-08-31 11:46:24.995592	2014-08-31 11:46:24.995592
17089	5	19	8	2013-12-24	DERREN BROWN-FEAR AND FAITH	2014-08-31 11:46:25.021181	2014-08-31 11:46:25.021181
17090	5	20	8	2013-12-24	PAWN STARS	2014-08-31 11:46:25.337238	2014-08-31 11:46:25.337238
17091	5	21	8	2013-12-24	DUCK DYNASTY	2014-08-31 11:46:25.365614	2014-08-31 11:46:25.365614
17092	5	22	8	2013-12-24	COUNTING CARS	2014-08-31 11:46:25.393309	2014-08-31 11:46:25.393309
17093	5	22	8	2013-12-24	HOW SEX CHANGED THE WORLD	2014-08-31 11:46:25.423373	2014-08-31 11:46:25.423373
17094	5	16	8	2013-12-25	DUCK DYNASTY	2014-08-31 11:46:25.45151	2014-08-31 11:46:25.45151
17095	5	17	8	2013-12-25	PAWN STARS	2014-08-31 11:46:25.478571	2014-08-31 11:46:25.478571
17096	5	18	8	2013-12-25	PAWN STARS	2014-08-31 11:46:25.504725	2014-08-31 11:46:25.504725
17097	5	19	8	2013-12-25	DERREN BROWN-FEAR AND FAITH	2014-08-31 11:46:25.539076	2014-08-31 11:46:25.539076
17098	5	19	8	2013-12-25	DERREN BROWN-FEAR AND FAITH	2014-08-31 11:46:25.843697	2014-08-31 11:46:25.843697
17099	5	19	8	2013-12-25	DERREN BROWN-FEAR AND FAITH	2014-08-31 11:46:25.871075	2014-08-31 11:46:25.871075
17100	5	20	8	2013-12-25	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:25.898447	2014-08-31 11:46:25.898447
17101	5	21	8	2013-12-25	PAWN STARS	2014-08-31 11:46:25.929875	2014-08-31 11:46:25.929875
17102	5	22	8	2013-12-25	COUNTING CARS	2014-08-31 11:46:25.957646	2014-08-31 11:46:25.957646
17103	5	22	8	2013-12-25	HOW SEX CHANGED THE WORLD	2014-08-31 11:46:25.985321	2014-08-31 11:46:25.985321
17104	5	16	8	2013-12-26	DYNAMO MAGICIAN IMPOSSIBLE	2014-08-31 11:46:26.037458	2014-08-31 11:46:26.037458
17105	5	16	8	2013-12-26	DUCK DYNASTY	2014-08-31 11:46:26.072904	2014-08-31 11:46:26.072904
17106	5	17	8	2013-12-26	PAWN STARS	2014-08-31 11:46:26.374854	2014-08-31 11:46:26.374854
17107	5	18	8	2013-12-26	SCIENCE IMPOSSIBLE	2014-08-31 11:46:26.402086	2014-08-31 11:46:26.402086
17108	5	19	8	2013-12-26	DERREN BROWN-APOCALYPSE	2014-08-31 11:46:26.432072	2014-08-31 11:46:26.432072
17109	5	19	8	2013-12-26	DERREN BROWN-APOCALYPSE	2014-08-31 11:46:26.459515	2014-08-31 11:46:26.459515
17110	5	20	8	2013-12-26	MODERN MARVELS	2014-08-31 11:46:26.486643	2014-08-31 11:46:26.486643
17111	5	21	8	2013-12-26	DUCK DYNASTY	2014-08-31 11:46:26.51286	2014-08-31 11:46:26.51286
17112	5	22	8	2013-12-26	COUNTING CARS	2014-08-31 11:46:26.541986	2014-08-31 11:46:26.541986
17113	5	22	8	2013-12-26	HOW SEX CHANGED THE WORLD	2014-08-31 11:46:26.566634	2014-08-31 11:46:26.566634
17114	5	6	9	2013-11-29	EFF THE DEVIL`S ADVOCATE	2014-08-31 11:46:26.871471	2014-08-31 11:46:26.871471
17115	5	6	9	2013-11-29	EFF THE DEVIL`S ADVOCATE	2014-08-31 11:46:26.898865	2014-08-31 11:46:26.898865
17116	5	7	9	2013-11-29	EFF DEAD MAN DOWN	2014-08-31 11:46:26.929652	2014-08-31 11:46:26.929652
17117	5	7	9	2013-11-29	EFF DEAD MAN DOWN	2014-08-31 11:46:26.957111	2014-08-31 11:46:26.957111
17118	5	8	9	2013-11-29	EFF DEAD MAN DOWN	2014-08-31 11:46:26.984067	2014-08-31 11:46:26.984067
17119	5	9	9	2013-11-29	EFF DEAD MAN DOWN	2014-08-31 11:46:27.010799	2014-08-31 11:46:27.010799
17120	5	10	9	2013-11-29	EFF SPECIES II	2014-08-31 11:46:27.04113	2014-08-31 11:46:27.04113
17121	5	11	9	2013-11-29	EFF RUSH HOUR 2	2014-08-31 11:46:27.067257	2014-08-31 11:46:27.067257
17122	5	12	9	2013-11-29	EFF RUSH HOUR 2	2014-08-31 11:46:27.36435	2014-08-31 11:46:27.36435
17123	5	13	9	2013-11-29	EFF ERAGON	2014-08-31 11:46:27.391517	2014-08-31 11:46:27.391517
17124	5	14	9	2013-11-29	EFF ERAGON	2014-08-31 11:46:27.427335	2014-08-31 11:46:27.427335
17125	5	15	9	2013-11-29	EFF MICHAEL JACKSONS THIS IS IT	2014-08-31 11:46:27.454284	2014-08-31 11:46:27.454284
17126	5	16	9	2013-11-29	EFF MICHAEL JACKSONS THIS IS IT	2014-08-31 11:46:27.482067	2014-08-31 11:46:27.482067
17127	5	16	9	2013-11-29	EFF MICHAEL JACKSONS THIS IS IT	2014-08-31 11:46:27.51	2014-08-31 11:46:27.51
17128	5	17	9	2013-11-29	EFF MICHAEL JACKSONS THIS IS IT	2014-08-31 11:46:27.540113	2014-08-31 11:46:27.540113
17129	5	17	9	2013-11-29	EFF BODY OF LIES	2014-08-31 11:46:27.566464	2014-08-31 11:46:27.566464
17130	5	18	9	2013-11-29	EFF BODY OF LIES	2014-08-31 11:46:27.867515	2014-08-31 11:46:27.867515
17131	5	18	9	2013-11-29	EFF BODY OF LIES	2014-08-31 11:46:27.895684	2014-08-31 11:46:27.895684
17132	5	19	9	2013-11-29	EFF BODY OF LIES	2014-08-31 11:46:27.925984	2014-08-31 11:46:27.925984
17133	5	19	9	2013-11-29	EFF BODY OF LIES	2014-08-31 11:46:27.951277	2014-08-31 11:46:27.951277
17134	5	20	9	2013-11-29	EFF THE SPIDERWICK CHRONICLES	2014-08-31 11:46:27.980255	2014-08-31 11:46:27.980255
17135	5	21	9	2013-11-29	EFF THE SPIDERWICK CHRONICLES	2014-08-31 11:46:28.007784	2014-08-31 11:46:28.007784
17136	5	22	9	2013-11-29	EFF TURISTAS	2014-08-31 11:46:28.038106	2014-08-31 11:46:28.038106
17137	5	22	9	2013-11-29	EFF TURISTAS	2014-08-31 11:46:28.064343	2014-08-31 11:46:28.064343
17138	5	6	9	2013-11-30	EFF DENNIS THE MENACE	2014-08-31 11:46:28.367458	2014-08-31 11:46:28.367458
17139	5	6	9	2013-11-30	EFF KINGDOM OF HEAVEN	2014-08-31 11:46:28.399205	2014-08-31 11:46:28.399205
17140	5	7	9	2013-11-30	EFF KINGDOM OF HEAVEN	2014-08-31 11:46:28.43054	2014-08-31 11:46:28.43054
17141	5	7	9	2013-11-30	EFF KINGDOM OF HEAVEN	2014-08-31 11:46:28.458241	2014-08-31 11:46:28.458241
17142	5	10	9	2013-11-30	EFF LAW ABIDING CITIZEN	2014-08-31 11:46:28.492384	2014-08-31 11:46:28.492384
17143	5	14	9	2013-11-30	EFF RIO	2014-08-31 11:46:28.525049	2014-08-31 11:46:28.525049
17144	5	15	9	2013-11-30	EFF RIO	2014-08-31 11:46:28.555958	2014-08-31 11:46:28.555958
17145	5	16	9	2013-11-30	EFF BEHIND ENEMY LINES	2014-08-31 11:46:28.581862	2014-08-31 11:46:28.581862
17146	5	17	9	2013-11-30	EFF BEHIND ENEMY LINES	2014-08-31 11:46:28.606254	2014-08-31 11:46:28.606254
17147	5	18	9	2013-11-30	EFF BATMAN FOREVER	2014-08-31 11:46:28.909826	2014-08-31 11:46:28.909826
17148	5	19	9	2013-11-30	EFF BATMAN FOREVER	2014-08-31 11:46:28.943509	2014-08-31 11:46:28.943509
17149	5	20	9	2013-11-30	EFF THE KARATE KID	2014-08-31 11:46:28.971239	2014-08-31 11:46:28.971239
17150	5	22	9	2013-11-30	EFF THE KARATE KID	2014-08-31 11:46:28.998194	2014-08-31 11:46:28.998194
17151	5	22	9	2013-11-30	EFF THE KARATE KID	2014-08-31 11:46:29.027077	2014-08-31 11:46:29.027077
17152	5	6	9	2013-12-01	EFF RIO	2014-08-31 11:46:29.052878	2014-08-31 11:46:29.052878
17153	5	7	9	2013-12-01	EFF THE CHRONICLES OF NARNIA THE VOYAGE	2014-08-31 11:46:29.077915	2014-08-31 11:46:29.077915
17154	5	7	9	2013-12-01	EFF THE CHRONICLES OF NARNIA THE VOYAGE	2014-08-31 11:46:29.101619	2014-08-31 11:46:29.101619
17155	5	8	9	2013-12-01	EFF THE CHRONICLES OF NARNIA THE VOYAGE	2014-08-31 11:46:29.403728	2014-08-31 11:46:29.403728
17156	5	9	9	2013-12-01	EFF THE SPIDERWICK CHRONICLES	2014-08-31 11:46:29.434552	2014-08-31 11:46:29.434552
17157	5	10	9	2013-12-01	EFF THE SPIDERWICK CHRONICLES	2014-08-31 11:46:29.460985	2014-08-31 11:46:29.460985
17158	5	14	9	2013-12-01	EFF BATMAN AND ROBIN	2014-08-31 11:46:29.488363	2014-08-31 11:46:29.488363
17159	5	15	9	2013-12-01	EFF BATMAN AND ROBIN	2014-08-31 11:46:29.514877	2014-08-31 11:46:29.514877
17160	5	16	9	2013-12-01	EFF TURISTAS	2014-08-31 11:46:29.548454	2014-08-31 11:46:29.548454
17161	5	18	9	2013-12-01	EFF NIGHT AT THE MUSEUM 2	2014-08-31 11:46:29.574278	2014-08-31 11:46:29.574278
17162	5	16	9	2013-12-02	EFF OCEANS THIRTEEN	2014-08-31 11:46:29.599401	2014-08-31 11:46:29.599401
17163	5	17	9	2013-12-02	EFF OCEANS THIRTEEN	2014-08-31 11:46:29.905179	2014-08-31 11:46:29.905179
17164	5	17	9	2013-12-02	EFF OCEANS THIRTEEN	2014-08-31 11:46:29.936801	2014-08-31 11:46:29.936801
17165	5	19	9	2013-12-02	EFF THE CHRONICLES OF NARNIA THE VOYAGE	2014-08-31 11:46:29.965999	2014-08-31 11:46:29.965999
17166	5	19	9	2013-12-02	EFF THE CHRONICLES OF NARNIA THE VOYAGE	2014-08-31 11:46:30.017839	2014-08-31 11:46:30.017839
17167	5	21	9	2013-12-02	EFF THE KICK	2014-08-31 11:46:30.07506	2014-08-31 11:46:30.07506
17168	5	22	9	2013-12-02	EFF NEXT	2014-08-31 11:46:30.127875	2014-08-31 11:46:30.127875
17169	5	16	9	2013-12-03	EFF RENDITION	2014-08-31 11:46:30.175818	2014-08-31 11:46:30.175818
17170	5	16	9	2013-12-03	EFF RENDITION	2014-08-31 11:46:30.22841	2014-08-31 11:46:30.22841
17171	5	17	9	2013-12-03	EFF RENDITION	2014-08-31 11:46:30.652923	2014-08-31 11:46:30.652923
17172	5	18	9	2013-12-03	EFF JOY RIDE	2014-08-31 11:46:30.703947	2014-08-31 11:46:30.703947
17173	5	19	9	2013-12-03	EFF JOY RIDE	2014-08-31 11:46:30.753451	2014-08-31 11:46:30.753451
17174	5	20	9	2013-12-03	EFF ENTER THE DRAGON	2014-08-31 11:46:30.799446	2014-08-31 11:46:30.799446
17175	5	22	9	2013-12-03	EFF OCEANS ELEVEN	2014-08-31 11:46:30.854911	2014-08-31 11:46:30.854911
17176	5	16	9	2013-12-04	EFF NEXT	2014-08-31 11:46:30.900552	2014-08-31 11:46:30.900552
17177	5	17	9	2013-12-04	EFF CONAN THE BARBARIAN	2014-08-31 11:46:30.949679	2014-08-31 11:46:30.949679
17178	5	18	9	2013-12-04	EFF CONAN THE BARBARIAN	2014-08-31 11:46:30.986434	2014-08-31 11:46:30.986434
17179	5	19	9	2013-12-04	EFF CONAN THE BARBARIAN	2014-08-31 11:46:31.406672	2014-08-31 11:46:31.406672
17180	5	20	9	2013-12-04	EFF HERO	2014-08-31 11:46:31.442991	2014-08-31 11:46:31.442991
17181	5	21	9	2013-12-04	EFF HERO	2014-08-31 11:46:31.475649	2014-08-31 11:46:31.475649
17182	5	22	9	2013-12-04	EFF OCEANS TWELVE	2014-08-31 11:46:31.506978	2014-08-31 11:46:31.506978
17183	5	16	9	2013-12-05	EFF BATMAN AND ROBIN	2014-08-31 11:46:31.545651	2014-08-31 11:46:31.545651
17184	5	17	9	2013-12-05	EFF BATMAN AND ROBIN	2014-08-31 11:46:31.58238	2014-08-31 11:46:31.58238
17185	5	17	9	2013-12-05	EFF BATMAN AND ROBIN	2014-08-31 11:46:31.61244	2014-08-31 11:46:31.61244
17186	5	19	9	2013-12-05	EFF NEVER BACK DOWN	2014-08-31 11:46:31.647861	2014-08-31 11:46:31.647861
17187	5	20	9	2013-12-05	EFF RUMBLE IN THE BRONX	2014-08-31 11:46:31.960319	2014-08-31 11:46:31.960319
17188	5	21	9	2013-12-05	EFF RUMBLE IN THE BRONX	2014-08-31 11:46:31.988518	2014-08-31 11:46:31.988518
17189	5	22	9	2013-12-05	EFF OCEANS THIRTEEN	2014-08-31 11:46:32.015086	2014-08-31 11:46:32.015086
17190	5	6	9	2013-12-06	EFF THE CHRONICLES OF NARNIA THE VOYAGE	2014-08-31 11:46:32.048948	2014-08-31 11:46:32.048948
17191	5	6	9	2013-12-06	EFF THE CHRONICLES OF NARNIA THE VOYAGE	2014-08-31 11:46:32.076271	2014-08-31 11:46:32.076271
17192	5	7	9	2013-12-06	EFF NIGHT AT THE MUSEUM 2	2014-08-31 11:46:32.103097	2014-08-31 11:46:32.103097
17193	5	7	9	2013-12-06	EFF NIGHT AT THE MUSEUM 2	2014-08-31 11:46:32.12949	2014-08-31 11:46:32.12949
17194	5	8	9	2013-12-06	EFF NIGHT AT THE MUSEUM 2	2014-08-31 11:46:32.155919	2014-08-31 11:46:32.155919
17195	5	8	9	2013-12-06	EFF NIGHT AT THE MUSEUM 2	2014-08-31 11:46:32.181846	2014-08-31 11:46:32.181846
17196	5	9	9	2013-12-06	EFF BODY OF LIES	2014-08-31 11:46:32.48324	2014-08-31 11:46:32.48324
17197	5	10	9	2013-12-06	EFF BODY OF LIES	2014-08-31 11:46:32.510518	2014-08-31 11:46:32.510518
17198	5	11	9	2013-12-06	EFF BODY OF LIES	2014-08-31 11:46:32.542122	2014-08-31 11:46:32.542122
17199	5	11	9	2013-12-06	EFF BATMAN FOREVER	2014-08-31 11:46:32.570568	2014-08-31 11:46:32.570568
17200	5	13	9	2013-12-06	EFF NEVER BACK DOWN	2014-08-31 11:46:32.598333	2014-08-31 11:46:32.598333
17201	5	14	9	2013-12-06	EFF NEVER BACK DOWN	2014-08-31 11:46:32.632809	2014-08-31 11:46:32.632809
17202	5	16	9	2013-12-06	EFF HERO	2014-08-31 11:46:32.658043	2014-08-31 11:46:32.658043
17203	5	16	9	2013-12-06	EFF HERO	2014-08-31 11:46:32.682582	2014-08-31 11:46:32.682582
17204	5	17	9	2013-12-06	EFF HERO	2014-08-31 11:46:32.976514	2014-08-31 11:46:32.976514
17205	5	17	9	2013-12-06	EFF SWAT	2014-08-31 11:46:33.004317	2014-08-31 11:46:33.004317
17206	5	18	9	2013-12-06	EFF SWAT	2014-08-31 11:46:33.036637	2014-08-31 11:46:33.036637
17207	5	18	9	2013-12-06	EFF SWAT	2014-08-31 11:46:33.063581	2014-08-31 11:46:33.063581
17208	5	19	9	2013-12-06	EFF SWAT	2014-08-31 11:46:33.090487	2014-08-31 11:46:33.090487
17209	5	19	9	2013-12-06	EFF SWAT	2014-08-31 11:46:33.125544	2014-08-31 11:46:33.125544
17210	5	20	9	2013-12-06	EFF HARRY POTTER AND THE DEATHLY HALL-1	2014-08-31 11:46:33.150425	2014-08-31 11:46:33.150425
17211	5	21	9	2013-12-06	EFF HARRY POTTER AND THE DEATHLY HALL-1	2014-08-31 11:46:33.17461	2014-08-31 11:46:33.17461
17212	5	22	9	2013-12-06	EFF HARRY POTTER AND THE DEATHLY HALL-1	2014-08-31 11:46:33.457134	2014-08-31 11:46:33.457134
17213	5	22	9	2013-12-06	EFF HARRY POTTER AND THE DEATHLY HALL-1	2014-08-31 11:46:33.484811	2014-08-31 11:46:33.484811
17214	5	6	9	2013-12-07	EFF THE LAST MIMZY	2014-08-31 11:46:33.51191	2014-08-31 11:46:33.51191
17215	5	6	9	2013-12-07	EFF HERO	2014-08-31 11:46:33.548902	2014-08-31 11:46:33.548902
17216	5	7	9	2013-12-07	EFF HERO	2014-08-31 11:46:33.576129	2014-08-31 11:46:33.576129
17217	5	8	9	2013-12-07	EFF JUMPER	2014-08-31 11:46:33.60334	2014-08-31 11:46:33.60334
17218	5	9	9	2013-12-07	EFF JUMPER	2014-08-31 11:46:33.632644	2014-08-31 11:46:33.632644
17219	5	11	9	2013-12-07	EFF UNSTOPPABLE	2014-08-31 11:46:33.657966	2014-08-31 11:46:33.657966
17220	5	15	9	2013-12-07	EFF KNOWING	2014-08-31 11:46:33.94189	2014-08-31 11:46:33.94189
17221	5	17	9	2013-12-07	EFF KNOWING	2014-08-31 11:46:33.969623	2014-08-31 11:46:33.969623
17222	5	17	9	2013-12-07	EFF THE ISLAND	2014-08-31 11:46:33.996643	2014-08-31 11:46:33.996643
17223	5	18	9	2013-12-07	EFF THE ISLAND	2014-08-31 11:46:34.032452	2014-08-31 11:46:34.032452
17224	5	18	9	2013-12-07	EFF THE ISLAND	2014-08-31 11:46:34.059594	2014-08-31 11:46:34.059594
17225	5	20	9	2013-12-07	EFF FANTASTIC FOUR-RISE OF THE SILVER SU	2014-08-31 11:46:34.085762	2014-08-31 11:46:34.085762
17226	5	21	9	2013-12-07	EFF FANTASTIC FOUR-RISE OF THE SILVER SU	2014-08-31 11:46:34.111116	2014-08-31 11:46:34.111116
17227	5	22	9	2013-12-07	EFF X-MEN THE LAST STAND	2014-08-31 11:46:34.140339	2014-08-31 11:46:34.140339
17228	5	6	9	2013-12-08	EFF EPIC MOVIE	2014-08-31 11:46:34.421483	2014-08-31 11:46:34.421483
17229	5	6	9	2013-12-08	EFF EPIC MOVIE	2014-08-31 11:46:34.448634	2014-08-31 11:46:34.448634
17230	5	8	9	2013-12-08	EFF KNOWING	2014-08-31 11:46:34.475375	2014-08-31 11:46:34.475375
17231	5	9	9	2013-12-08	EFF KNOWING	2014-08-31 11:46:34.501958	2014-08-31 11:46:34.501958
17232	5	11	9	2013-12-08	EFF RUMBLE IN THE BRONX	2014-08-31 11:46:34.53774	2014-08-31 11:46:34.53774
17233	5	12	9	2013-12-08	EFF X-MEN THE LAST STAND	2014-08-31 11:46:34.564394	2014-08-31 11:46:34.564394
17234	5	13	9	2013-12-08	EFF X-MEN THE LAST STAND	2014-08-31 11:46:34.590261	2014-08-31 11:46:34.590261
17235	5	15	9	2013-12-08	EFF HARRY POTTER AND THE DEATHLY HALL-1	2014-08-31 11:46:34.615498	2014-08-31 11:46:34.615498
17236	5	16	9	2013-12-08	EFF MR POPPERS PENGUINS	2014-08-31 11:46:34.902795	2014-08-31 11:46:34.902795
17237	5	18	9	2013-12-08	EFF A NIGHTMARE ON ELM STREET	2014-08-31 11:46:34.934331	2014-08-31 11:46:34.934331
17238	5	16	9	2013-12-09	EFF CONAN THE BARBARIAN	2014-08-31 11:46:34.960621	2014-08-31 11:46:34.960621
17239	5	17	9	2013-12-09	EFF CONAN THE BARBARIAN	2014-08-31 11:46:34.989177	2014-08-31 11:46:34.989177
17240	5	19	9	2013-12-09	EFF SWORDFISH	2014-08-31 11:46:35.017064	2014-08-31 11:46:35.017064
17241	5	19	9	2013-12-09	EFF SWORDFISH	2014-08-31 11:46:35.048349	2014-08-31 11:46:35.048349
17242	5	21	9	2013-12-09	EFF CURSE OF THE GOLDEN FLOWER	2014-08-31 11:46:35.074814	2014-08-31 11:46:35.074814
17243	5	22	9	2013-12-09	EFF CURSE OF THE GOLDEN FLOWER	2014-08-31 11:46:35.102106	2014-08-31 11:46:35.102106
17244	5	22	9	2013-12-09	EFF SHUTTER	2014-08-31 11:46:35.132425	2014-08-31 11:46:35.132425
17245	5	17	9	2013-12-10	EFF SWAT	2014-08-31 11:46:35.419393	2014-08-31 11:46:35.419393
17246	5	18	9	2013-12-10	EFF COBRA	2014-08-31 11:46:35.448186	2014-08-31 11:46:35.448186
17247	5	18	9	2013-12-10	EFF COBRA	2014-08-31 11:46:35.476892	2014-08-31 11:46:35.476892
17248	5	19	9	2013-12-10	EFF COBRA	2014-08-31 11:46:35.508676	2014-08-31 11:46:35.508676
17249	5	20	9	2013-12-10	EFF INCREDIBLE KUNG FU MISSION	2014-08-31 11:46:35.542442	2014-08-31 11:46:35.542442
17250	5	21	9	2013-12-10	EFF INCREDIBLE KUNG FU MISSION	2014-08-31 11:46:35.571572	2014-08-31 11:46:35.571572
17251	5	22	9	2013-12-10	EFF ANACONDA	2014-08-31 11:46:35.597849	2014-08-31 11:46:35.597849
17252	5	16	9	2013-12-11	EFF UNKNOWN	2014-08-31 11:46:35.625926	2014-08-31 11:46:35.625926
17253	5	17	9	2013-12-11	EFF UNKNOWN	2014-08-31 11:46:35.937019	2014-08-31 11:46:35.937019
17254	5	19	9	2013-12-11	EFF UNSTOPPABLE	2014-08-31 11:46:35.966061	2014-08-31 11:46:35.966061
17255	5	21	9	2013-12-11	EFF THE LEGEND OF DRUNKEN MASTER	2014-08-31 11:46:35.994289	2014-08-31 11:46:35.994289
17256	5	21	9	2013-12-11	EFF THE LEGEND OF DRUNKEN MASTER	2014-08-31 11:46:36.049785	2014-08-31 11:46:36.049785
17257	5	22	9	2013-12-11	EFF COMMANDO	2014-08-31 11:46:36.085806	2014-08-31 11:46:36.085806
17258	5	16	9	2013-12-12	EFF EDGE OF DARKNESS	2014-08-31 11:46:36.11261	2014-08-31 11:46:36.11261
17259	5	17	9	2013-12-12	EFF EDGE OF DARKNESS	2014-08-31 11:46:36.143	2014-08-31 11:46:36.143
17260	5	18	9	2013-12-12	EFF BLOOD AND BONE	2014-08-31 11:46:36.169001	2014-08-31 11:46:36.169001
17261	5	19	9	2013-12-12	EFF BLOOD AND BONE	2014-08-31 11:46:36.484502	2014-08-31 11:46:36.484502
17262	5	21	9	2013-12-12	EFF THE KARATE KID	2014-08-31 11:46:36.512255	2014-08-31 11:46:36.512255
17263	5	22	9	2013-12-12	EFF THE KARATE KID	2014-08-31 11:46:36.556118	2014-08-31 11:46:36.556118
17264	5	6	9	2013-12-13	EFF THE DAVINCI CODE	2014-08-31 11:46:36.589897	2014-08-31 11:46:36.589897
17265	5	7	9	2013-12-13	EFF THE DAVINCI CODE	2014-08-31 11:46:36.62777	2014-08-31 11:46:36.62777
17266	5	7	9	2013-12-13	EFF THE DAVINCI CODE	2014-08-31 11:46:36.661142	2014-08-31 11:46:36.661142
17267	5	8	9	2013-12-13	EFF SCOOBY DOO THE MYSTERY BEGINS	2014-08-31 11:46:36.688264	2014-08-31 11:46:36.688264
17268	5	8	9	2013-12-13	EFF SCOOBY DOO THE MYSTERY BEGINS	2014-08-31 11:46:36.712382	2014-08-31 11:46:36.712382
17269	5	9	9	2013-12-13	EFF SCOOBY DOO THE MYSTERY BEGINS	2014-08-31 11:46:37.028312	2014-08-31 11:46:37.028312
17270	5	10	9	2013-12-13	EFF MR POPPERS PENGUINS	2014-08-31 11:46:37.058158	2014-08-31 11:46:37.058158
17271	5	10	9	2013-12-13	EFF MR POPPERS PENGUINS	2014-08-31 11:46:37.087435	2014-08-31 11:46:37.087435
17272	5	11	9	2013-12-13	EFF MR POPPERS PENGUINS	2014-08-31 11:46:37.114348	2014-08-31 11:46:37.114348
17273	5	13	9	2013-12-13	EFF THE KARATE KID	2014-08-31 11:46:37.147855	2014-08-31 11:46:37.147855
17274	5	14	9	2013-12-13	EFF FRIDAY THE 13TH	2014-08-31 11:46:37.177684	2014-08-31 11:46:37.177684
17275	5	15	9	2013-12-13	EFF FRIDAY THE 13TH	2014-08-31 11:46:37.204999	2014-08-31 11:46:37.204999
17276	5	16	9	2013-12-13	EFF LAW ABIDING CITIZEN	2014-08-31 11:46:37.243194	2014-08-31 11:46:37.243194
17277	5	17	9	2013-12-13	EFF LAW ABIDING CITIZEN	2014-08-31 11:46:37.563219	2014-08-31 11:46:37.563219
17278	5	17	9	2013-12-13	EFF LAW ABIDING CITIZEN	2014-08-31 11:46:37.591401	2014-08-31 11:46:37.591401
17279	5	18	9	2013-12-13	EFF THE LEAGUE OF EXTRAORDINAR	2014-08-31 11:46:37.626975	2014-08-31 11:46:37.626975
17280	5	18	9	2013-12-13	EFF THE LEAGUE OF EXTRAORDINAR	2014-08-31 11:46:37.654621	2014-08-31 11:46:37.654621
17281	5	19	9	2013-12-13	EFF THE LEAGUE OF EXTRAORDINAR	2014-08-31 11:46:37.683945	2014-08-31 11:46:37.683945
17282	5	19	9	2013-12-13	EFF THE LEAGUE OF EXTRAORDINAR	2014-08-31 11:46:37.710647	2014-08-31 11:46:37.710647
17283	5	20	9	2013-12-13	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:46:37.74192	2014-08-31 11:46:37.74192
17284	5	21	9	2013-12-13	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:46:37.769086	2014-08-31 11:46:37.769086
17285	5	21	9	2013-12-13	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:46:38.084149	2014-08-31 11:46:38.084149
17286	5	22	9	2013-12-13	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:46:38.112159	2014-08-31 11:46:38.112159
17287	5	22	9	2013-12-13	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:46:38.144176	2014-08-31 11:46:38.144176
17288	5	6	9	2013-12-14	EFF FREE WILLY	2014-08-31 11:46:38.172333	2014-08-31 11:46:38.172333
17289	5	7	9	2013-12-14	EFF FREE WILLY	2014-08-31 11:46:38.200277	2014-08-31 11:46:38.200277
17290	5	8	9	2013-12-14	EFF A NIGHTMARE ON ELM STREET	2014-08-31 11:46:38.231194	2014-08-31 11:46:38.231194
17291	5	10	9	2013-12-14	EFF EDGE OF DARKNESS	2014-08-31 11:46:38.259301	2014-08-31 11:46:38.259301
17292	5	13	9	2013-12-14	EFF X2	2014-08-31 11:46:38.285719	2014-08-31 11:46:38.285719
17293	5	14	9	2013-12-14	EFF X2	2014-08-31 11:46:38.31109	2014-08-31 11:46:38.31109
17294	5	15	9	2013-12-14	EFF COMMANDO	2014-08-31 11:46:38.634482	2014-08-31 11:46:38.634482
17295	5	16	9	2013-12-14	EFF SHUTTER	2014-08-31 11:46:38.661967	2014-08-31 11:46:38.661967
17296	5	17	9	2013-12-14	EFF SHUTTER	2014-08-31 11:46:38.690483	2014-08-31 11:46:38.690483
17297	5	17	9	2013-12-14	EFF SHUTTER	2014-08-31 11:46:38.717926	2014-08-31 11:46:38.717926
17298	5	18	9	2013-12-14	EFF OCEANS ELEVEN	2014-08-31 11:46:38.74787	2014-08-31 11:46:38.74787
17299	5	20	9	2013-12-14	EFF OCEANS TWELVE	2014-08-31 11:46:38.775183	2014-08-31 11:46:38.775183
17300	5	21	9	2013-12-14	EFF OCEANS TWELVE	2014-08-31 11:46:38.801278	2014-08-31 11:46:38.801278
17301	5	22	9	2013-12-14	EFF OCEANS TWELVE	2014-08-31 11:46:38.831972	2014-08-31 11:46:38.831972
17302	5	6	9	2013-12-15	EFF ALIENS IN THE ATTIC	2014-08-31 11:46:39.155123	2014-08-31 11:46:39.155123
17303	5	7	9	2013-12-15	EFF ALIENS IN THE ATTIC	2014-08-31 11:46:39.184504	2014-08-31 11:46:39.184504
17304	5	8	9	2013-12-15	EFF WHATS HAPPENS IN VEGAS	2014-08-31 11:46:39.209746	2014-08-31 11:46:39.209746
17305	5	11	9	2013-12-15	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:46:39.245105	2014-08-31 11:46:39.245105
17306	5	13	9	2013-12-15	EFF THE HANGOVER	2014-08-31 11:46:39.272011	2014-08-31 11:46:39.272011
17307	5	13	9	2013-12-15	EFF THE HANGOVER	2014-08-31 11:46:39.298462	2014-08-31 11:46:39.298462
17308	5	14	9	2013-12-15	EFF THE TRANSPORTER 2	2014-08-31 11:46:39.327991	2014-08-31 11:46:39.327991
17309	5	15	9	2013-12-15	EFF THE TRANSPORTER 2	2014-08-31 11:46:39.352858	2014-08-31 11:46:39.352858
17310	5	16	9	2013-12-15	EFF THE GREY	2014-08-31 11:46:39.662938	2014-08-31 11:46:39.662938
17311	5	18	9	2013-12-15	EFF ANACONDA	2014-08-31 11:46:39.692837	2014-08-31 11:46:39.692837
17312	5	16	9	2013-12-16	EFF THE LEAGUE OF EXTRAORDINAR	2014-08-31 11:46:39.723386	2014-08-31 11:46:39.723386
17313	5	17	9	2013-12-16	EFF THE LEAGUE OF EXTRAORDINAR	2014-08-31 11:46:39.752326	2014-08-31 11:46:39.752326
17314	5	18	9	2013-12-16	EFF OCEANS ELEVEN	2014-08-31 11:46:39.782446	2014-08-31 11:46:39.782446
17315	5	20	9	2013-12-16	EFF HOSTAGE	2014-08-31 11:46:39.80838	2014-08-31 11:46:39.80838
17316	5	21	9	2013-12-16	EFF HOSTAGE	2014-08-31 11:46:39.839251	2014-08-31 11:46:39.839251
17317	5	22	9	2013-12-16	EFF THE HANGOVER	2014-08-31 11:46:39.866002	2014-08-31 11:46:39.866002
17318	5	6	9	2013-12-20	EFF BUFFY THE VAMPIRE SLAYER	2014-08-31 11:46:40.176787	2014-08-31 11:46:40.176787
17319	5	7	9	2013-12-20	EFF X2	2014-08-31 11:46:40.205376	2014-08-31 11:46:40.205376
17320	5	7	9	2013-12-20	EFF X2	2014-08-31 11:46:40.237493	2014-08-31 11:46:40.237493
17321	5	9	9	2013-12-20	EFF X2	2014-08-31 11:46:40.268088	2014-08-31 11:46:40.268088
17322	5	9	9	2013-12-20	EFF WHO AM I	2014-08-31 11:46:40.298206	2014-08-31 11:46:40.298206
17323	5	10	9	2013-12-20	EFF WHO AM I	2014-08-31 11:46:40.329581	2014-08-31 11:46:40.329581
17324	5	10	9	2013-12-20	EFF WHO AM I	2014-08-31 11:46:40.357194	2014-08-31 11:46:40.357194
17325	5	12	9	2013-12-20	EFF THE TRANSPORTER 2	2014-08-31 11:46:40.383355	2014-08-31 11:46:40.383355
17326	5	13	9	2013-12-20	EFF THE TRANSPORTER 2	2014-08-31 11:46:40.702067	2014-08-31 11:46:40.702067
17327	5	14	9	2013-12-20	EFF DAMAGE	2014-08-31 11:46:40.734342	2014-08-31 11:46:40.734342
17328	5	15	9	2013-12-20	EFF DAMAGE	2014-08-31 11:46:40.762992	2014-08-31 11:46:40.762992
17329	5	16	9	2013-12-20	EFF HOSTAGE	2014-08-31 11:46:40.791686	2014-08-31 11:46:40.791686
17330	5	16	9	2013-12-20	EFF HOSTAGE	2014-08-31 11:46:40.823447	2014-08-31 11:46:40.823447
17331	5	17	9	2013-12-20	EFF HOSTAGE	2014-08-31 11:46:40.851994	2014-08-31 11:46:40.851994
17332	5	17	9	2013-12-20	EFF HOSTAGE	2014-08-31 11:46:40.87911	2014-08-31 11:46:40.87911
17333	5	18	9	2013-12-20	EFF HOSTAGE	2014-08-31 11:46:40.904964	2014-08-31 11:46:40.904964
17334	5	18	9	2013-12-20	EFF TMNT	2014-08-31 11:46:41.253371	2014-08-31 11:46:41.253371
17335	5	19	9	2013-12-20	EFF TMNT	2014-08-31 11:46:41.282415	2014-08-31 11:46:41.282415
17336	5	19	9	2013-12-20	EFF TMNT	2014-08-31 11:46:41.308776	2014-08-31 11:46:41.308776
17337	5	21	9	2013-12-20	EFF HARRY POTTER AND THE ORDER	2014-08-31 11:46:41.345178	2014-08-31 11:46:41.345178
17338	5	21	9	2013-12-20	EFF HARRY POTTER AND THE ORDER	2014-08-31 11:46:41.372943	2014-08-31 11:46:41.372943
17339	5	22	9	2013-12-20	EFF HARRY POTTER AND THE ORDER	2014-08-31 11:46:41.401176	2014-08-31 11:46:41.401176
17340	5	6	9	2013-12-21	EFF THE COVENANT	2014-08-31 11:46:41.431389	2014-08-31 11:46:41.431389
17341	5	7	9	2013-12-21	EFF PANDORUM	2014-08-31 11:46:41.458701	2014-08-31 11:46:41.458701
17342	5	8	9	2013-12-21	EFF PANDORUM	2014-08-31 11:46:41.485741	2014-08-31 11:46:41.485741
17343	5	10	9	2013-12-21	EFF SUPERMAN	2014-08-31 11:46:41.796354	2014-08-31 11:46:41.796354
17344	5	13	9	2013-12-21	EFF BANDIDAS	2014-08-31 11:46:41.827861	2014-08-31 11:46:41.827861
17345	5	15	9	2013-12-21	EFF 1408	2014-08-31 11:46:41.855344	2014-08-31 11:46:41.855344
17346	5	16	9	2013-12-21	EFF DAREDEVIL	2014-08-31 11:46:41.883497	2014-08-31 11:46:41.883497
17347	5	17	9	2013-12-21	EFF DAREDEVIL	2014-08-31 11:46:41.909999	2014-08-31 11:46:41.909999
17348	5	19	9	2013-12-21	EFF POSEIDON	2014-08-31 11:46:41.940741	2014-08-31 11:46:41.940741
17349	5	20	9	2013-12-21	EFF MADAGASCAR ESCAPE 2 AFRICA	2014-08-31 11:46:41.968332	2014-08-31 11:46:41.968332
17350	5	21	9	2013-12-21	EFF MADAGASCAR ESCAPE 2 AFRICA	2014-08-31 11:46:41.993507	2014-08-31 11:46:41.993507
17351	5	22	9	2013-12-21	EFF THE LORD OF THE RINGS	2014-08-31 11:46:42.307382	2014-08-31 11:46:42.307382
17352	5	6	9	2013-12-22	EFF TMNT	2014-08-31 11:46:42.339409	2014-08-31 11:46:42.339409
17353	5	7	9	2013-12-22	EFF TMNT	2014-08-31 11:46:42.367382	2014-08-31 11:46:42.367382
17354	5	8	9	2013-12-22	EFF ANACONDAS TRAIL OF BLOOD	2014-08-31 11:46:42.394406	2014-08-31 11:46:42.394406
17355	5	10	9	2013-12-22	EFF HARRY POTTER AND THE ORDER	2014-08-31 11:46:42.424396	2014-08-31 11:46:42.424396
17356	5	11	9	2013-12-22	EFF HARRY POTTER AND THE ORDER	2014-08-31 11:46:42.450667	2014-08-31 11:46:42.450667
17357	5	12	9	2013-12-22	EFF MADAGASCAR ESCAPE 2 AFRICA	2014-08-31 11:46:42.476909	2014-08-31 11:46:42.476909
17358	5	14	9	2013-12-22	EFF X-MEN FIRST CLASS	2014-08-31 11:46:42.503309	2014-08-31 11:46:42.503309
17359	5	15	9	2013-12-22	EFF X-MEN FIRST CLASS	2014-08-31 11:46:42.810098	2014-08-31 11:46:42.810098
17360	5	16	9	2013-12-22	EFF RESIDENT EVIL AFTERLIFE	2014-08-31 11:46:42.843018	2014-08-31 11:46:42.843018
17361	5	18	9	2013-12-22	EFF RESIDENT EVIL AFTERLIFE	2014-08-31 11:46:42.871862	2014-08-31 11:46:42.871862
17362	5	17	10	2013-11-29	CHEF ON THE ROAD	2014-08-31 11:46:42.900014	2014-08-31 11:46:42.900014
17363	5	17	10	2013-11-29	CHEF ON THE ROAD	2014-08-31 11:46:42.931671	2014-08-31 11:46:42.931671
17364	5	17	10	2013-11-29	CHEF ON THE ROAD	2014-08-31 11:46:42.959328	2014-08-31 11:46:42.959328
17365	5	17	10	2013-11-29	CHEF ON THE ROAD	2014-08-31 11:46:42.986547	2014-08-31 11:46:42.986547
17366	5	17	10	2013-11-29	CHEF ON THE ROAD	2014-08-31 11:46:43.014897	2014-08-31 11:46:43.014897
17367	5	18	10	2013-11-29	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:43.343209	2014-08-31 11:46:43.343209
17368	5	18	10	2013-11-29	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:43.372001	2014-08-31 11:46:43.372001
17369	5	18	10	2013-11-29	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:43.40149	2014-08-31 11:46:43.40149
17370	5	18	10	2013-11-29	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:43.434427	2014-08-31 11:46:43.434427
17371	5	18	10	2013-11-29	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:43.463252	2014-08-31 11:46:43.463252
17372	5	19	10	2013-11-29	CAUGHT IN THE ACT	2014-08-31 11:46:43.490798	2014-08-31 11:46:43.490798
17373	5	19	10	2013-11-29	CAUGHT IN THE ACT	2014-08-31 11:46:43.516811	2014-08-31 11:46:43.516811
17374	5	19	10	2013-11-29	CAUGHT IN THE ACT	2014-08-31 11:46:43.547347	2014-08-31 11:46:43.547347
17375	5	20	10	2013-11-29	MUMBAI MEGA FLOOD	2014-08-31 11:46:43.85996	2014-08-31 11:46:43.85996
17376	5	20	10	2013-11-29	MUMBAI MEGA FLOOD	2014-08-31 11:46:43.887527	2014-08-31 11:46:43.887527
17377	5	20	10	2013-11-29	MUMBAI MEGA FLOOD	2014-08-31 11:46:43.914958	2014-08-31 11:46:43.914958
17378	5	21	10	2013-11-29	MEGF-SUPERCARS FERRARI	2014-08-31 11:46:43.950129	2014-08-31 11:46:43.950129
17379	5	6	10	2013-11-30	LION BATTLE ZONE	2014-08-31 11:46:43.978616	2014-08-31 11:46:43.978616
17380	5	6	10	2013-11-30	LION BATTLE ZONE	2014-08-31 11:46:44.004919	2014-08-31 11:46:44.004919
17381	5	7	10	2013-11-30	CAUGHT IN THE ACT	2014-08-31 11:46:44.037159	2014-08-31 11:46:44.037159
17382	5	8	10	2013-11-30	ULTIMATE ANIMAL COUNTDOWN-ATTACK	2014-08-31 11:46:44.065223	2014-08-31 11:46:44.065223
17383	5	8	10	2013-11-30	ULTIMATE ANIMAL COUNTDOWN-ATTACK	2014-08-31 11:46:44.365717	2014-08-31 11:46:44.365717
17384	5	9	10	2013-11-30	STUNTMEN OF BOLLYWOOD	2014-08-31 11:46:44.393256	2014-08-31 11:46:44.393256
17385	5	10	10	2013-11-30	TRAPPED IN KEDARNATH	2014-08-31 11:46:44.423675	2014-08-31 11:46:44.423675
17386	5	10	10	2013-11-30	TRAPPED IN KEDARNATH	2014-08-31 11:46:44.450795	2014-08-31 11:46:44.450795
17387	5	11	10	2013-11-30	THE INDESTRUCTIBLES MAULED BY LIONS	2014-08-31 11:46:44.478381	2014-08-31 11:46:44.478381
17388	5	12	10	2013-11-30	MEGF-TATA NANO	2014-08-31 11:46:44.505824	2014-08-31 11:46:44.505824
17389	5	17	10	2013-11-30	MEGF-FRITO LAY	2014-08-31 11:46:44.535115	2014-08-31 11:46:44.535115
17390	5	19	10	2013-11-30	BRAIN GAMES	2014-08-31 11:46:44.561239	2014-08-31 11:46:44.561239
17391	5	20	10	2013-11-30	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:44.586904	2014-08-31 11:46:44.586904
17392	5	20	10	2013-11-30	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:44.900837	2014-08-31 11:46:44.900837
17393	5	22	10	2013-11-30	WILD SEX-LIBIDO	2014-08-31 11:46:44.932623	2014-08-31 11:46:44.932623
17394	5	22	10	2013-11-30	WILD SEX-LIBIDO	2014-08-31 11:46:44.959995	2014-08-31 11:46:44.959995
17395	5	6	10	2013-12-01	THE BUDDH INTERNATIONAL CIRCUIT	2014-08-31 11:46:44.987283	2014-08-31 11:46:44.987283
17396	5	6	10	2013-12-01	THE BUDDH INTERNATIONAL CIRCUIT	2014-08-31 11:46:45.012482	2014-08-31 11:46:45.012482
17397	5	7	10	2013-12-01	THE INDESTRUCTIBLES BABY CAR CRASH	2014-08-31 11:46:45.042215	2014-08-31 11:46:45.042215
17398	5	8	10	2013-12-01	ULTIMATE ANIMAL COUNTDOWN-DEFENDERS	2014-08-31 11:46:45.069713	2014-08-31 11:46:45.069713
17399	5	8	10	2013-12-01	ULTIMATE ANIMAL COUNTDOWN-DEFENDERS	2014-08-31 11:46:45.094778	2014-08-31 11:46:45.094778
17400	5	9	10	2013-12-01	SECRETS OF THE TAJ MAHAL	2014-08-31 11:46:45.408676	2014-08-31 11:46:45.408676
17401	5	10	10	2013-12-01	IN THE WOMB TWINS TRIPLETS AND QUADS	2014-08-31 11:46:45.437815	2014-08-31 11:46:45.437815
17402	5	11	10	2013-12-01	AFRICAS DEADLIEST-SERENGETI TANZANIA	2014-08-31 11:46:45.466113	2014-08-31 11:46:45.466113
17403	5	12	10	2013-12-01	BFTK-GRASSLAND	2014-08-31 11:46:45.496673	2014-08-31 11:46:45.496673
17404	5	14	10	2013-12-01	BREAKOUT-OHIOS MOST WANTED	2014-08-31 11:46:45.527915	2014-08-31 11:46:45.527915
17405	5	15	10	2013-12-01	WORLDS BIGGEST FESTIVAL KUMBH MELA	2014-08-31 11:46:45.55485	2014-08-31 11:46:45.55485
17406	5	17	10	2013-12-01	CHEF ON THE ROAD	2014-08-31 11:46:45.582694	2014-08-31 11:46:45.582694
17407	5	19	10	2013-12-01	CAUGHT IN THE ACT	2014-08-31 11:46:45.607547	2014-08-31 11:46:45.607547
17408	5	20	10	2013-12-01	MEGF-COCA COLA	2014-08-31 11:46:45.90478	2014-08-31 11:46:45.90478
17409	5	21	10	2013-12-01	INSIDE-AMERICAS MONEY VAULT	2014-08-31 11:46:45.936564	2014-08-31 11:46:45.936564
17410	5	22	10	2013-12-01	WILD SEX-MACHO MALES	2014-08-31 11:46:45.963139	2014-08-31 11:46:45.963139
17411	5	19	10	2013-12-02	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:45.98996	2014-08-31 11:46:45.98996
17412	5	19	10	2013-12-02	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:46.047064	2014-08-31 11:46:46.047064
17413	5	19	10	2013-12-02	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:46.081046	2014-08-31 11:46:46.081046
17414	5	20	10	2013-12-02	STUNTMEN OF BOLLYWOOD	2014-08-31 11:46:46.106179	2014-08-31 11:46:46.106179
17415	5	20	10	2013-12-02	STUNTMEN OF BOLLYWOOD	2014-08-31 11:46:46.139245	2014-08-31 11:46:46.139245
17416	5	20	10	2013-12-02	STUNTMEN OF BOLLYWOOD	2014-08-31 11:46:46.430153	2014-08-31 11:46:46.430153
17417	5	21	10	2013-12-02	MEGF-WILLIAMS F-1	2014-08-31 11:46:46.457476	2014-08-31 11:46:46.457476
17418	5	21	10	2013-12-02	MEGF-WILLIAMS F-1	2014-08-31 11:46:46.483848	2014-08-31 11:46:46.483848
17419	5	21	10	2013-12-02	MEGF-WILLIAMS F-1	2014-08-31 11:46:46.510621	2014-08-31 11:46:46.510621
17420	5	21	10	2013-12-02	MEGF-WILLIAMS F-1	2014-08-31 11:46:46.541827	2014-08-31 11:46:46.541827
17421	5	22	10	2013-12-02	WILD SEX-MACHO MALES	2014-08-31 11:46:46.567985	2014-08-31 11:46:46.567985
17422	5	22	10	2013-12-02	WILD SEX-MACHO MALES	2014-08-31 11:46:46.59332	2014-08-31 11:46:46.59332
17423	5	22	10	2013-12-02	WILD SEX-MACHO MALES	2014-08-31 11:46:46.626292	2014-08-31 11:46:46.626292
17424	5	16	10	2013-12-03	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:46.92268	2014-08-31 11:46:46.92268
17425	5	16	10	2013-12-03	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:46.951245	2014-08-31 11:46:46.951245
17426	5	17	10	2013-12-03	DNGE-BITE FORCE	2014-08-31 11:46:46.978542	2014-08-31 11:46:46.978542
17427	5	18	10	2013-12-03	THE LION RANGER TROUBLE IN THE	2014-08-31 11:46:47.007616	2014-08-31 11:46:47.007616
17428	5	21	10	2013-12-03	MEGF-FORD	2014-08-31 11:46:47.041147	2014-08-31 11:46:47.041147
17429	5	21	10	2013-12-03	MEGF-FORD	2014-08-31 11:46:47.068395	2014-08-31 11:46:47.068395
17430	5	21	10	2013-12-03	MEGF-FORD	2014-08-31 11:46:47.094589	2014-08-31 11:46:47.094589
17431	5	22	10	2013-12-03	WILD SEX-FEMMES FATALES	2014-08-31 11:46:47.131267	2014-08-31 11:46:47.131267
17432	5	22	10	2013-12-03	WILD SEX-FEMMES FATALES	2014-08-31 11:46:47.423575	2014-08-31 11:46:47.423575
17433	5	22	10	2013-12-03	WILD SEX-FEMMES FATALES	2014-08-31 11:46:47.450951	2014-08-31 11:46:47.450951
17434	5	22	10	2013-12-03	WILD SEX-FEMMES FATALES	2014-08-31 11:46:47.47706	2014-08-31 11:46:47.47706
17435	5	22	10	2013-12-03	WILD SEX-FEMMES FATALES	2014-08-31 11:46:47.504468	2014-08-31 11:46:47.504468
17436	5	22	10	2013-12-03	WILD SEX-FEMMES FATALES	2014-08-31 11:46:47.540501	2014-08-31 11:46:47.540501
17437	5	19	10	2013-12-04	SPEED KILLS JUNGLE	2014-08-31 11:46:47.566553	2014-08-31 11:46:47.566553
17438	5	19	10	2013-12-04	SPEED KILLS JUNGLE	2014-08-31 11:46:47.591855	2014-08-31 11:46:47.591855
17439	5	19	10	2013-12-04	SPEED KILLS JUNGLE	2014-08-31 11:46:47.616756	2014-08-31 11:46:47.616756
17440	5	20	10	2013-12-04	MEGF-TATA NANO	2014-08-31 11:46:47.644811	2014-08-31 11:46:47.644811
17441	5	20	10	2013-12-04	MEGF-TATA NANO	2014-08-31 11:46:47.945013	2014-08-31 11:46:47.945013
17442	5	20	10	2013-12-04	MEGF-TATA NANO	2014-08-31 11:46:47.972883	2014-08-31 11:46:47.972883
17443	5	21	10	2013-12-04	MEGF-BMW X3	2014-08-31 11:46:48.000472	2014-08-31 11:46:48.000472
17444	5	21	10	2013-12-04	MEGF-BMW X3	2014-08-31 11:46:48.031775	2014-08-31 11:46:48.031775
17445	5	21	10	2013-12-04	MEGF-BMW X3	2014-08-31 11:46:48.060799	2014-08-31 11:46:48.060799
17446	5	22	10	2013-12-04	WILD SEX-DEVIANTS	2014-08-31 11:46:48.087896	2014-08-31 11:46:48.087896
17447	5	22	10	2013-12-04	WILD SEX-DEVIANTS	2014-08-31 11:46:48.113287	2014-08-31 11:46:48.113287
17448	5	22	10	2013-12-04	WILD SEX-DEVIANTS	2014-08-31 11:46:48.147939	2014-08-31 11:46:48.147939
17449	5	22	10	2013-12-04	WILD SEX-DEVIANTS	2014-08-31 11:46:48.444795	2014-08-31 11:46:48.444795
17450	5	19	10	2013-12-05	CAUGHT IN THE ACT	2014-08-31 11:46:48.471441	2014-08-31 11:46:48.471441
17451	5	19	10	2013-12-05	CAUGHT IN THE ACT	2014-08-31 11:46:48.498156	2014-08-31 11:46:48.498156
17452	5	19	10	2013-12-05	CAUGHT IN THE ACT	2014-08-31 11:46:48.529465	2014-08-31 11:46:48.529465
17453	5	19	10	2013-12-05	CAUGHT IN THE ACT	2014-08-31 11:46:48.555743	2014-08-31 11:46:48.555743
17454	5	19	10	2013-12-05	CAUGHT IN THE ACT	2014-08-31 11:46:48.581229	2014-08-31 11:46:48.581229
17455	5	20	10	2013-12-05	RETURN OF THE CLOUDED LEOPARDS	2014-08-31 11:46:48.605908	2014-08-31 11:46:48.605908
17456	5	21	10	2013-12-05	SPEEDMAKERS-JAGUAR	2014-08-31 11:46:48.638242	2014-08-31 11:46:48.638242
17457	5	21	10	2013-12-05	SPEEDMAKERS-JAGUAR	2014-08-31 11:46:48.943478	2014-08-31 11:46:48.943478
17458	5	21	10	2013-12-05	SPEEDMAKERS-JAGUAR	2014-08-31 11:46:48.970826	2014-08-31 11:46:48.970826
17459	5	21	10	2013-12-05	SPEEDMAKERS-JAGUAR	2014-08-31 11:46:48.997714	2014-08-31 11:46:48.997714
17460	5	22	10	2013-12-05	TABO-FOREVER YOUNG	2014-08-31 11:46:49.028451	2014-08-31 11:46:49.028451
17461	5	22	10	2013-12-05	TABO-FOREVER YOUNG	2014-08-31 11:46:49.055373	2014-08-31 11:46:49.055373
17462	5	22	10	2013-12-05	TABO-FOREVER YOUNG	2014-08-31 11:46:49.081667	2014-08-31 11:46:49.081667
17463	5	13	10	2013-12-06	THE INDESTRUCTIBLES HIGH SPEED BIKE CRAS	2014-08-31 11:46:49.109462	2014-08-31 11:46:49.109462
17464	5	15	10	2013-12-06	MEGF-TATA NANO	2014-08-31 11:46:49.13944	2014-08-31 11:46:49.13944
17465	5	15	10	2013-12-06	MEGF-TATA NANO	2014-08-31 11:46:49.477572	2014-08-31 11:46:49.477572
17466	5	15	10	2013-12-06	MEGF-TATA NANO	2014-08-31 11:46:49.532229	2014-08-31 11:46:49.532229
17467	5	16	10	2013-12-06	ULTIMATE ANIMAL COUNTDOWN-SMELLIEST	2014-08-31 11:46:49.581109	2014-08-31 11:46:49.581109
17468	5	16	10	2013-12-06	ULTIMATE ANIMAL COUNTDOWN-SMELLIEST	2014-08-31 11:46:49.635234	2014-08-31 11:46:49.635234
17469	5	16	10	2013-12-06	ULTIMATE ANIMAL COUNTDOWN-SMELLIEST	2014-08-31 11:46:49.684535	2014-08-31 11:46:49.684535
17470	5	17	10	2013-12-06	MOST EXTREME MOMENTS	2014-08-31 11:46:49.737857	2014-08-31 11:46:49.737857
17471	5	18	10	2013-12-06	AFRICAS DEADLIEST-LUANGWA ZAMBIA	2014-08-31 11:46:49.78495	2014-08-31 11:46:49.78495
17472	5	18	10	2013-12-06	AFRICAS DEADLIEST-LUANGWA ZAMBIA	2014-08-31 11:46:49.837054	2014-08-31 11:46:49.837054
17473	5	18	10	2013-12-06	AFRICAS DEADLIEST-LUANGWA ZAMBIA	2014-08-31 11:46:50.229101	2014-08-31 11:46:50.229101
17474	5	22	10	2013-12-06	TABO-EXTREME OBESTIY	2014-08-31 11:46:50.269099	2014-08-31 11:46:50.269099
17475	5	22	10	2013-12-06	TABO-EXTREME OBESTIY	2014-08-31 11:46:50.308408	2014-08-31 11:46:50.308408
17476	5	22	10	2013-12-06	TABO-EXTREME OBESTIY	2014-08-31 11:46:50.355036	2014-08-31 11:46:50.355036
17477	5	7	10	2013-12-07	THE LION RANGER ATTACK OF THE	2014-08-31 11:46:50.391772	2014-08-31 11:46:50.391772
17478	5	7	10	2013-12-07	THE LION RANGER ATTACK OF THE	2014-08-31 11:46:50.417948	2014-08-31 11:46:50.417948
17479	5	8	10	2013-12-07	ULTIMATE ANIMAL COUNTDOWN-DAREDEVILS	2014-08-31 11:46:50.448291	2014-08-31 11:46:50.448291
17480	5	8	10	2013-12-07	ULTIMATE ANIMAL COUNTDOWN-DAREDEVILS	2014-08-31 11:46:50.473885	2014-08-31 11:46:50.473885
17481	5	10	10	2013-12-07	MEGC-MUMBAI	2014-08-31 11:46:50.769945	2014-08-31 11:46:50.769945
17482	5	10	10	2013-12-07	MEGC-MUMBAI	2014-08-31 11:46:50.796749	2014-08-31 11:46:50.796749
17483	5	15	10	2013-12-07	MANDELA HIS LIFE AND LEGACY	2014-08-31 11:46:50.827324	2014-08-31 11:46:50.827324
17484	5	16	10	2013-12-07	ULTIMATE ANIMAL COUNTDOWN-DAREDEVILS	2014-08-31 11:46:50.853451	2014-08-31 11:46:50.853451
17485	5	17	10	2013-12-07	THE NUMBERS GAME WILL YOU MAKE A MILLION	2014-08-31 11:46:50.879597	2014-08-31 11:46:50.879597
17486	5	18	10	2013-12-07	NAT GEOS TOP 10 PHOTOS	2014-08-31 11:46:50.905827	2014-08-31 11:46:50.905827
17487	5	18	10	2013-12-07	NAT GEOS TOP 10 PHOTOS	2014-08-31 11:46:50.934792	2014-08-31 11:46:50.934792
17488	5	18	10	2013-12-07	NAT GEOS TOP 10 PHOTOS	2014-08-31 11:46:50.959448	2014-08-31 11:46:50.959448
17489	5	19	10	2013-12-07	BRAIN GAMES	2014-08-31 11:46:51.281632	2014-08-31 11:46:51.281632
17490	5	19	10	2013-12-07	BRAIN GAMES	2014-08-31 11:46:51.314382	2014-08-31 11:46:51.314382
17491	5	6	10	2013-12-08	MOST EXTREME MOMENTS	2014-08-31 11:46:51.347797	2014-08-31 11:46:51.347797
17492	5	7	10	2013-12-08	AFRICAS DEADLIEST-SERENGETI TANZANIA	2014-08-31 11:46:51.373853	2014-08-31 11:46:51.373853
17493	5	8	10	2013-12-08	MANDELA HIS LIFE AND LEGACY	2014-08-31 11:46:51.399729	2014-08-31 11:46:51.399729
17494	5	8	10	2013-12-08	MANDELA HIS LIFE AND LEGACY	2014-08-31 11:46:51.425974	2014-08-31 11:46:51.425974
17495	5	11	10	2013-12-08	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:51.451033	2014-08-31 11:46:51.451033
17496	5	11	10	2013-12-08	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:51.475785	2014-08-31 11:46:51.475785
17497	5	13	10	2013-12-08	INSIDE-AMERICAS MONEY VAULT	2014-08-31 11:46:51.499651	2014-08-31 11:46:51.499651
17498	5	15	10	2013-12-08	MEGC-MUMBAI	2014-08-31 11:46:51.798812	2014-08-31 11:46:51.798812
17499	5	16	10	2013-12-08	ULTIMATE ANIMAL COUNTDOWN-DEFENDERS	2014-08-31 11:46:51.83081	2014-08-31 11:46:51.83081
17500	5	16	10	2013-12-08	ULTIMATE ANIMAL COUNTDOWN-DEFENDERS	2014-08-31 11:46:51.857455	2014-08-31 11:46:51.857455
17501	5	17	10	2013-12-08	DNGE-MONSTER CROCS	2014-08-31 11:46:51.883905	2014-08-31 11:46:51.883905
17502	5	18	10	2013-12-08	AFRICAS DEADLIEST-SERENGETI TANZANIA	2014-08-31 11:46:51.910677	2014-08-31 11:46:51.910677
17503	5	19	10	2013-12-08	THE 80S INDIA	2014-08-31 11:46:51.936062	2014-08-31 11:46:51.936062
17504	5	22	10	2013-12-08	TABO-STRANGE BONDS	2014-08-31 11:46:51.960741	2014-08-31 11:46:51.960741
17505	5	16	10	2013-12-09	ULTIMATE ANIMAL COUNTDOWN-SURVIVORS	2014-08-31 11:46:51.984552	2014-08-31 11:46:51.984552
17506	5	16	10	2013-12-09	ULTIMATE ANIMAL COUNTDOWN-SURVIVORS	2014-08-31 11:46:52.284255	2014-08-31 11:46:52.284255
17507	5	16	10	2013-12-09	ULTIMATE ANIMAL COUNTDOWN-SURVIVORS	2014-08-31 11:46:52.311287	2014-08-31 11:46:52.311287
17508	5	16	10	2013-12-09	ULTIMATE ANIMAL COUNTDOWN-SURVIVORS	2014-08-31 11:46:52.342559	2014-08-31 11:46:52.342559
17509	5	16	10	2013-12-09	ULTIMATE ANIMAL COUNTDOWN-SURVIVORS	2014-08-31 11:46:52.368627	2014-08-31 11:46:52.368627
17510	5	17	10	2013-12-09	THE LAST MANEATER KILLER	2014-08-31 11:46:52.394859	2014-08-31 11:46:52.394859
17511	5	17	10	2013-12-09	THE LAST MANEATER KILLER	2014-08-31 11:46:52.420525	2014-08-31 11:46:52.420525
17512	5	17	10	2013-12-09	THE LAST MANEATER KILLER	2014-08-31 11:46:52.446141	2014-08-31 11:46:52.446141
17513	5	17	10	2013-12-09	THE LAST MANEATER KILLER	2014-08-31 11:46:52.470573	2014-08-31 11:46:52.470573
17514	5	18	10	2013-12-09	MOST THRILLING MOMENTS	2014-08-31 11:46:52.777526	2014-08-31 11:46:52.777526
17515	5	18	10	2013-12-09	MOST THRILLING MOMENTS	2014-08-31 11:46:52.804461	2014-08-31 11:46:52.804461
17516	5	18	10	2013-12-09	MOST THRILLING MOMENTS	2014-08-31 11:46:52.84022	2014-08-31 11:46:52.84022
17517	5	18	10	2013-12-09	MOST THRILLING MOMENTS	2014-08-31 11:46:52.867095	2014-08-31 11:46:52.867095
17518	5	16	10	2013-12-10	ULTIMATE ANIMAL COUNTDOWN-ATTACK	2014-08-31 11:46:52.894513	2014-08-31 11:46:52.894513
17519	5	16	10	2013-12-10	ULTIMATE ANIMAL COUNTDOWN-ATTACK	2014-08-31 11:46:52.921651	2014-08-31 11:46:52.921651
17520	5	16	10	2013-12-10	ULTIMATE ANIMAL COUNTDOWN-ATTACK	2014-08-31 11:46:52.947131	2014-08-31 11:46:52.947131
17521	5	16	10	2013-12-10	ULTIMATE ANIMAL COUNTDOWN-ATTACK	2014-08-31 11:46:52.972322	2014-08-31 11:46:52.972322
17522	5	16	10	2013-12-10	ULTIMATE ANIMAL COUNTDOWN-ATTACK	2014-08-31 11:46:53.276858	2014-08-31 11:46:53.276858
17523	5	16	10	2013-12-10	ULTIMATE ANIMAL COUNTDOWN-ATTACK	2014-08-31 11:46:53.303449	2014-08-31 11:46:53.303449
17524	5	17	10	2013-12-10	BFTK-GRASSLAND	2014-08-31 11:46:53.333692	2014-08-31 11:46:53.333692
17525	5	17	10	2013-12-10	BFTK-GRASSLAND	2014-08-31 11:46:53.359491	2014-08-31 11:46:53.359491
17526	5	17	10	2013-12-10	BFTK-GRASSLAND	2014-08-31 11:46:53.385138	2014-08-31 11:46:53.385138
17527	5	17	10	2013-12-10	BFTK-GRASSLAND	2014-08-31 11:46:53.41112	2014-08-31 11:46:53.41112
17528	5	18	10	2013-12-10	MOST EXTREME MOMENTS	2014-08-31 11:46:53.44001	2014-08-31 11:46:53.44001
17529	5	18	10	2013-12-10	MOST EXTREME MOMENTS	2014-08-31 11:46:53.465278	2014-08-31 11:46:53.465278
17530	5	18	10	2013-12-10	MOST EXTREME MOMENTS	2014-08-31 11:46:53.766592	2014-08-31 11:46:53.766592
17531	5	16	10	2013-12-11	ULTIMATE ANIMAL COUNTDOWN-LETHAL WEAPONS	2014-08-31 11:46:53.794285	2014-08-31 11:46:53.794285
17532	5	16	10	2013-12-11	ULTIMATE ANIMAL COUNTDOWN-LETHAL WEAPONS	2014-08-31 11:46:53.825198	2014-08-31 11:46:53.825198
17533	5	16	10	2013-12-11	ULTIMATE ANIMAL COUNTDOWN-LETHAL WEAPONS	2014-08-31 11:46:53.852635	2014-08-31 11:46:53.852635
17534	5	16	10	2013-12-11	ULTIMATE ANIMAL COUNTDOWN-LETHAL WEAPONS	2014-08-31 11:46:53.880413	2014-08-31 11:46:53.880413
17535	5	16	10	2013-12-11	ULTIMATE ANIMAL COUNTDOWN-LETHAL WEAPONS	2014-08-31 11:46:53.907891	2014-08-31 11:46:53.907891
17536	5	16	10	2013-12-11	ULTIMATE ANIMAL COUNTDOWN-LETHAL WEAPONS	2014-08-31 11:46:53.938032	2014-08-31 11:46:53.938032
17537	5	17	10	2013-12-11	DNGE-DEADLEST SNAKES	2014-08-31 11:46:53.963837	2014-08-31 11:46:53.963837
17538	5	17	10	2013-12-11	DNGE-DEADLEST SNAKES	2014-08-31 11:46:54.280007	2014-08-31 11:46:54.280007
17539	5	17	10	2013-12-11	DNGE-DEADLEST SNAKES	2014-08-31 11:46:54.307454	2014-08-31 11:46:54.307454
17540	5	17	10	2013-12-11	DNGE-DEADLEST SNAKES	2014-08-31 11:46:54.334132	2014-08-31 11:46:54.334132
17541	5	18	10	2013-12-11	MOST DANGEROUS MOMENT	2014-08-31 11:46:54.362383	2014-08-31 11:46:54.362383
17542	5	18	10	2013-12-11	MOST DANGEROUS MOMENT	2014-08-31 11:46:54.390444	2014-08-31 11:46:54.390444
17543	5	18	10	2013-12-11	MOST DANGEROUS MOMENT	2014-08-31 11:46:54.418062	2014-08-31 11:46:54.418062
17544	5	16	10	2013-12-12	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:54.449532	2014-08-31 11:46:54.449532
17545	5	16	10	2013-12-12	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:54.475638	2014-08-31 11:46:54.475638
17546	5	16	10	2013-12-12	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:54.50058	2014-08-31 11:46:54.50058
17547	5	16	10	2013-12-12	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:54.81508	2014-08-31 11:46:54.81508
17548	5	16	10	2013-12-12	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:46:54.84757	2014-08-31 11:46:54.84757
17549	5	17	10	2013-12-12	SWAMP LIONS	2014-08-31 11:46:54.875936	2014-08-31 11:46:54.875936
17550	5	17	10	2013-12-12	SWAMP LIONS	2014-08-31 11:46:54.903606	2014-08-31 11:46:54.903606
17551	5	17	10	2013-12-12	SWAMP LIONS	2014-08-31 11:46:54.930147	2014-08-31 11:46:54.930147
17552	5	17	10	2013-12-12	SWAMP LIONS	2014-08-31 11:46:54.955817	2014-08-31 11:46:54.955817
17553	5	18	10	2013-12-12	MOST AMAZING CLOSE ENCOU	2014-08-31 11:46:54.982455	2014-08-31 11:46:54.982455
17554	5	18	10	2013-12-12	MOST AMAZING CLOSE ENCOU	2014-08-31 11:46:55.006798	2014-08-31 11:46:55.006798
17555	5	18	10	2013-12-12	MOST AMAZING CLOSE ENCOU	2014-08-31 11:46:55.314718	2014-08-31 11:46:55.314718
17556	5	18	10	2013-12-12	MOST AMAZING CLOSE ENCOU	2014-08-31 11:46:55.351042	2014-08-31 11:46:55.351042
17557	5	9	10	2013-12-13	MEGF-SUPERCARS CORVETTE ZR1	2014-08-31 11:46:55.378573	2014-08-31 11:46:55.378573
17558	5	11	10	2013-12-13	CAUGHT IN THE ACT	2014-08-31 11:46:55.405095	2014-08-31 11:46:55.405095
17559	5	13	10	2013-12-13	THE 80S INDIA	2014-08-31 11:46:55.436415	2014-08-31 11:46:55.436415
17560	5	15	10	2013-12-13	SECRETS OF THE TAJ MAHAL	2014-08-31 11:46:55.464257	2014-08-31 11:46:55.464257
17561	5	15	10	2013-12-13	SECRETS OF THE TAJ MAHAL	2014-08-31 11:46:55.496856	2014-08-31 11:46:55.496856
17562	5	15	10	2013-12-13	SECRETS OF THE TAJ MAHAL	2014-08-31 11:46:55.530297	2014-08-31 11:46:55.530297
17563	5	16	10	2013-12-13	ULTIMATE ANIMAL COUNTDOWN-SWARMS	2014-08-31 11:46:55.835048	2014-08-31 11:46:55.835048
17564	5	16	10	2013-12-13	ULTIMATE ANIMAL COUNTDOWN-SWARMS	2014-08-31 11:46:55.865275	2014-08-31 11:46:55.865275
17565	5	16	10	2013-12-13	ULTIMATE ANIMAL COUNTDOWN-SWARMS	2014-08-31 11:46:55.894604	2014-08-31 11:46:55.894604
17566	5	17	10	2013-12-13	BRUTAL KILLERS	2014-08-31 11:46:55.926379	2014-08-31 11:46:55.926379
17567	5	17	10	2013-12-13	BRUTAL KILLERS	2014-08-31 11:46:55.955383	2014-08-31 11:46:55.955383
17568	5	17	10	2013-12-13	BRUTAL KILLERS	2014-08-31 11:46:55.983496	2014-08-31 11:46:55.983496
17569	5	18	10	2013-12-13	MOST THRILLING MOMENTS	2014-08-31 11:46:56.030535	2014-08-31 11:46:56.030535
17570	5	11	10	2013-12-14	CAUGHT IN THE ACT	2014-08-31 11:46:56.0736	2014-08-31 11:46:56.0736
17571	5	11	10	2013-12-14	CAUGHT IN THE ACT	2014-08-31 11:46:56.393194	2014-08-31 11:46:56.393194
17572	5	13	10	2013-12-14	MEGF-TATA NANO	2014-08-31 11:46:56.427543	2014-08-31 11:46:56.427543
17573	5	14	10	2013-12-14	THE LIVING EDENS TEMPLES OF TH	2014-08-31 11:46:56.456571	2014-08-31 11:46:56.456571
17574	5	14	10	2013-12-14	THE LIVING EDENS TEMPLES OF TH	2014-08-31 11:46:56.487774	2014-08-31 11:46:56.487774
17575	5	14	10	2013-12-14	THE LIVING EDENS TEMPLES OF TH	2014-08-31 11:46:56.530932	2014-08-31 11:46:56.530932
17576	5	15	10	2013-12-14	SECRETS OF WILD-ELEPHANT KINGDOM	2014-08-31 11:46:56.561903	2014-08-31 11:46:56.561903
17577	5	15	10	2013-12-14	SECRETS OF WILD-ELEPHANT KINGDOM	2014-08-31 11:46:56.594797	2014-08-31 11:46:56.594797
17578	5	15	10	2013-12-14	SECRETS OF WILD-ELEPHANT KINGDOM	2014-08-31 11:46:56.629199	2014-08-31 11:46:56.629199
17579	5	16	10	2013-12-14	ULTIMATE ANIMAL COUNTDOWN-FIGHTERS	2014-08-31 11:46:56.946868	2014-08-31 11:46:56.946868
17580	5	16	10	2013-12-14	ULTIMATE ANIMAL COUNTDOWN-FIGHTERS	2014-08-31 11:46:56.976885	2014-08-31 11:46:56.976885
17581	5	17	10	2013-12-14	MEGA-HARVESTING THE SUN	2014-08-31 11:46:57.006265	2014-08-31 11:46:57.006265
17582	5	17	10	2013-12-14	MEGA-HARVESTING THE SUN	2014-08-31 11:46:57.045138	2014-08-31 11:46:57.045138
17583	5	9	10	2013-12-15	INSIDE-AMERICAS MONEY VAULT	2014-08-31 11:46:57.07697	2014-08-31 11:46:57.07697
17584	5	9	10	2013-12-15	INSIDE-AMERICAS MONEY VAULT	2014-08-31 11:46:57.106298	2014-08-31 11:46:57.106298
17585	5	9	10	2013-12-15	INSIDE-AMERICAS MONEY VAULT	2014-08-31 11:46:57.137468	2014-08-31 11:46:57.137468
17586	5	10	10	2013-12-15	MUMBAI MEGA FLOOD	2014-08-31 11:46:57.166937	2014-08-31 11:46:57.166937
17587	5	10	10	2013-12-15	MUMBAI MEGA FLOOD	2014-08-31 11:46:57.488668	2014-08-31 11:46:57.488668
17588	5	12	10	2013-12-15	TABO-PRISON LOVE	2014-08-31 11:46:57.516518	2014-08-31 11:46:57.516518
17589	5	12	10	2013-12-15	TABO-PRISON LOVE	2014-08-31 11:46:57.550565	2014-08-31 11:46:57.550565
17590	5	12	10	2013-12-15	TABO-PRISON LOVE	2014-08-31 11:46:57.580574	2014-08-31 11:46:57.580574
17591	5	13	10	2013-12-15	TRAPPED IN KEDARNATH	2014-08-31 11:46:57.611988	2014-08-31 11:46:57.611988
17592	5	15	10	2013-12-15	MUMBAI MEGA FLOOD	2014-08-31 11:46:57.647701	2014-08-31 11:46:57.647701
17593	5	15	10	2013-12-15	MUMBAI MEGA FLOOD	2014-08-31 11:46:57.677854	2014-08-31 11:46:57.677854
17594	5	15	10	2013-12-15	MUMBAI MEGA FLOOD	2014-08-31 11:46:57.702746	2014-08-31 11:46:57.702746
17595	5	16	10	2013-12-15	FINDING THE LOST DA VINCI	2014-08-31 11:46:57.741504	2014-08-31 11:46:57.741504
17596	5	19	10	2013-12-16	SECRETS OF WILD-TIGER JUNGLES	2014-08-31 11:46:58.053888	2014-08-31 11:46:58.053888
17597	5	19	10	2013-12-16	SECRETS OF WILD-TIGER JUNGLES	2014-08-31 11:46:58.081988	2014-08-31 11:46:58.081988
17598	5	20	10	2013-12-16	PERILOUS JOUR-CROSSING THE HIM	2014-08-31 11:46:58.110266	2014-08-31 11:46:58.110266
17599	5	20	10	2013-12-16	PERILOUS JOUR-CROSSING THE HIM	2014-08-31 11:46:58.150065	2014-08-31 11:46:58.150065
17600	5	20	10	2013-12-16	PERILOUS JOUR-CROSSING THE HIM	2014-08-31 11:46:58.17976	2014-08-31 11:46:58.17976
17601	5	21	10	2013-12-16	SPEEDMAKERS-ASTON MARTIN	2014-08-31 11:46:58.208332	2014-08-31 11:46:58.208332
17602	5	21	10	2013-12-16	SPEEDMAKERS-ASTON MARTIN	2014-08-31 11:46:58.239305	2014-08-31 11:46:58.239305
17603	5	21	10	2013-12-16	SPEEDMAKERS-ASTON MARTIN	2014-08-31 11:46:58.265076	2014-08-31 11:46:58.265076
17604	5	22	10	2013-12-16	MEET THE POLYGAMISTS	2014-08-31 11:46:58.561318	2014-08-31 11:46:58.561318
17605	5	22	10	2013-12-16	MEET THE POLYGAMISTS	2014-08-31 11:46:58.589743	2014-08-31 11:46:58.589743
17606	5	22	10	2013-12-16	MEET THE POLYGAMISTS	2014-08-31 11:46:58.62584	2014-08-31 11:46:58.62584
17607	5	16	10	2013-12-17	ULTIMATE ANIMAL COUNTDOWN-DAREDEVILS	2014-08-31 11:46:58.65493	2014-08-31 11:46:58.65493
17608	5	16	10	2013-12-17	ULTIMATE ANIMAL COUNTDOWN-DAREDEVILS	2014-08-31 11:46:58.685179	2014-08-31 11:46:58.685179
17609	5	16	10	2013-12-17	ULTIMATE ANIMAL COUNTDOWN-DAREDEVILS	2014-08-31 11:46:58.713286	2014-08-31 11:46:58.713286
17610	5	16	10	2013-12-17	ULTIMATE ANIMAL COUNTDOWN-DAREDEVILS	2014-08-31 11:46:58.745105	2014-08-31 11:46:58.745105
17611	5	16	10	2013-12-17	ULTIMATE ANIMAL COUNTDOWN-DAREDEVILS	2014-08-31 11:46:58.773347	2014-08-31 11:46:58.773347
17612	5	17	10	2013-12-17	DNGE-BACKYARD MONSTERS VACATION NIGHTMAR	2014-08-31 11:46:59.093243	2014-08-31 11:46:59.093243
17613	5	17	10	2013-12-17	DNGE-BACKYARD MONSTERS VACATION NIGHTMAR	2014-08-31 11:46:59.126554	2014-08-31 11:46:59.126554
17614	5	17	10	2013-12-17	DNGE-BACKYARD MONSTERS VACATION NIGHTMAR	2014-08-31 11:46:59.155481	2014-08-31 11:46:59.155481
17615	5	17	10	2013-12-17	DNGE-BACKYARD MONSTERS VACATION NIGHTMAR	2014-08-31 11:46:59.18253	2014-08-31 11:46:59.18253
17616	5	20	10	2013-12-17	MEGF-TATA NANO	2014-08-31 11:46:59.214135	2014-08-31 11:46:59.214135
17617	5	21	10	2013-12-17	SPEEDMAKERS-JAGUAR	2014-08-31 11:46:59.248723	2014-08-31 11:46:59.248723
17618	5	16	10	2013-12-18	ULTIMATE ANIMAL COUNTDOWN-DEFENDERS	2014-08-31 11:46:59.274767	2014-08-31 11:46:59.274767
17619	5	16	10	2013-12-18	ULTIMATE ANIMAL COUNTDOWN-DEFENDERS	2014-08-31 11:46:59.301141	2014-08-31 11:46:59.301141
17620	5	17	10	2013-12-18	DNGE-SNAKEBOT	2014-08-31 11:46:59.722569	2014-08-31 11:46:59.722569
17621	5	18	10	2013-12-18	ANIMAL UNDERWORLD BEAST WORSHIP	2014-08-31 11:46:59.76901	2014-08-31 11:46:59.76901
17622	5	19	10	2013-12-18	RETURN OF THE CLOUDED LEOPARDS	2014-08-31 11:46:59.813297	2014-08-31 11:46:59.813297
17623	5	19	10	2013-12-18	RETURN OF THE CLOUDED LEOPARDS	2014-08-31 11:46:59.865941	2014-08-31 11:46:59.865941
17624	5	20	10	2013-12-18	CHEF ON THE ROAD	2014-08-31 11:46:59.901956	2014-08-31 11:46:59.901956
17625	5	20	10	2013-12-18	CHEF ON THE ROAD	2014-08-31 11:46:59.932307	2014-08-31 11:46:59.932307
17626	5	22	10	2013-12-18	WILD SEX-THE HARD SELL	2014-08-31 11:46:59.958065	2014-08-31 11:46:59.958065
17627	5	22	10	2013-12-18	WILD SEX-THE HARD SELL	2014-08-31 11:46:59.986783	2014-08-31 11:46:59.986783
17628	5	22	10	2013-12-18	WILD SEX-THE HARD SELL	2014-08-31 11:47:00.307054	2014-08-31 11:47:00.307054
17629	5	16	10	2013-12-19	ULTIMATE ANIMAL COUNTDOWN-SURVIVORS	2014-08-31 11:47:00.33913	2014-08-31 11:47:00.33913
17630	5	18	10	2013-12-19	ULTIMATE ANIMAL COUNTDOWN-ATTACK	2014-08-31 11:47:00.367572	2014-08-31 11:47:00.367572
17631	5	19	10	2013-12-19	CAUGHT IN THE ACT	2014-08-31 11:47:00.395866	2014-08-31 11:47:00.395866
17632	5	19	10	2013-12-19	CAUGHT IN THE ACT	2014-08-31 11:47:00.432191	2014-08-31 11:47:00.432191
17633	5	20	10	2013-12-19	SECRETS OF WILD-TIGER JUNGLES	2014-08-31 11:47:00.461727	2014-08-31 11:47:00.461727
17634	5	20	10	2013-12-19	SECRETS OF WILD-TIGER JUNGLES	2014-08-31 11:47:00.497415	2014-08-31 11:47:00.497415
17635	5	20	10	2013-12-19	SECRETS OF WILD-TIGER JUNGLES	2014-08-31 11:47:00.530795	2014-08-31 11:47:00.530795
17636	5	22	10	2013-12-19	WILD SEX-MACHO MALES	2014-08-31 11:47:00.870877	2014-08-31 11:47:00.870877
17637	5	22	10	2013-12-19	WILD SEX-MACHO MALES	2014-08-31 11:47:00.9007	2014-08-31 11:47:00.9007
17638	5	22	10	2013-12-19	WILD SEX-MACHO MALES	2014-08-31 11:47:00.938218	2014-08-31 11:47:00.938218
17639	5	22	10	2013-12-19	WILD SEX-MACHO MALES	2014-08-31 11:47:00.980969	2014-08-31 11:47:00.980969
17640	5	15	10	2013-12-20	THE 80S INDIA	2014-08-31 11:47:01.050209	2014-08-31 11:47:01.050209
17641	5	15	10	2013-12-20	THE 80S INDIA	2014-08-31 11:47:01.103596	2014-08-31 11:47:01.103596
17642	5	15	10	2013-12-20	THE 80S INDIA	2014-08-31 11:47:01.133953	2014-08-31 11:47:01.133953
17643	5	16	10	2013-12-20	ULTIMATE ANIMAL COUNTDOWN-ATTACK	2014-08-31 11:47:01.161837	2014-08-31 11:47:01.161837
17644	5	16	10	2013-12-20	ULTIMATE ANIMAL COUNTDOWN-ATTACK	2014-08-31 11:47:01.188187	2014-08-31 11:47:01.188187
17645	5	16	10	2013-12-20	ULTIMATE ANIMAL COUNTDOWN-ATTACK	2014-08-31 11:47:01.570755	2014-08-31 11:47:01.570755
17646	5	17	10	2013-12-20	DNGE-BACKYARD MONSTERS VACATION NIGHTMAR	2014-08-31 11:47:01.601255	2014-08-31 11:47:01.601255
17647	5	17	10	2013-12-20	DNGE-BACKYARD MONSTERS VACATION NIGHTMAR	2014-08-31 11:47:01.638414	2014-08-31 11:47:01.638414
17648	5	17	10	2013-12-20	DNGE-BACKYARD MONSTERS VACATION NIGHTMAR	2014-08-31 11:47:01.669709	2014-08-31 11:47:01.669709
17649	5	18	10	2013-12-20	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:47:01.698283	2014-08-31 11:47:01.698283
17650	5	18	10	2013-12-20	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:47:01.730309	2014-08-31 11:47:01.730309
17651	5	18	10	2013-12-20	ULTIMATE ANIMAL COUNTDOWN-VENOM	2014-08-31 11:47:01.758037	2014-08-31 11:47:01.758037
17652	5	6	10	2013-12-21	A NEW AGE OF EXPLORATION	2014-08-31 11:47:01.784877	2014-08-31 11:47:01.784877
17653	5	6	10	2013-12-21	A NEW AGE OF EXPLORATION	2014-08-31 11:47:02.125374	2014-08-31 11:47:02.125374
17654	5	7	10	2013-12-21	THE BUDDH INTERNATIONAL CIRCUIT	2014-08-31 11:47:02.154964	2014-08-31 11:47:02.154964
17655	5	7	10	2013-12-21	THE BUDDH INTERNATIONAL CIRCUIT	2014-08-31 11:47:02.18434	2014-08-31 11:47:02.18434
17656	5	8	10	2013-12-21	ULTIMATE ANIMAL COUNTDOWN-ATTACK	2014-08-31 11:47:02.214701	2014-08-31 11:47:02.214701
17657	5	8	10	2013-12-21	ULTIMATE ANIMAL COUNTDOWN-ATTACK	2014-08-31 11:47:02.252526	2014-08-31 11:47:02.252526
17658	5	9	10	2013-12-21	INSIDE-KOKILABEN AMBANI HOSPITAL	2014-08-31 11:47:02.281901	2014-08-31 11:47:02.281901
17659	5	9	10	2013-12-21	INSIDE-KOKILABEN AMBANI HOSPITAL	2014-08-31 11:47:02.308987	2014-08-31 11:47:02.308987
17660	5	9	10	2013-12-21	INSIDE-KOKILABEN AMBANI HOSPITAL	2014-08-31 11:47:02.340463	2014-08-31 11:47:02.340463
17661	5	12	10	2013-12-21	TABOO	2014-08-31 11:47:02.660536	2014-08-31 11:47:02.660536
17662	5	13	10	2013-12-21	INSIDE-AMERICAS MONEY VAULT	2014-08-31 11:47:02.689709	2014-08-31 11:47:02.689709
17663	5	13	10	2013-12-21	INSIDE-AMERICAS MONEY VAULT	2014-08-31 11:47:02.717381	2014-08-31 11:47:02.717381
17664	5	7	10	2013-12-22	AFRICAS DEADLIEST-SERENGETI TANZANIA	2014-08-31 11:47:02.744775	2014-08-31 11:47:02.744775
17665	5	7	10	2013-12-22	AFRICAS DEADLIEST-SERENGETI TANZANIA	2014-08-31 11:47:02.772227	2014-08-31 11:47:02.772227
17666	5	7	10	2013-12-22	AFRICAS DEADLIEST-SERENGETI TANZANIA	2014-08-31 11:47:02.799319	2014-08-31 11:47:02.799319
17667	5	7	10	2013-12-22	AFRICAS DEADLIEST-SERENGETI TANZANIA	2014-08-31 11:47:02.82976	2014-08-31 11:47:02.82976
17668	5	8	10	2013-12-22	ULTIMATE ANIMAL COUNTDOWN-LETHAL WEAPONS	2014-08-31 11:47:02.855761	2014-08-31 11:47:02.855761
17669	5	8	10	2013-12-22	ULTIMATE ANIMAL COUNTDOWN-LETHAL WEAPONS	2014-08-31 11:47:03.172868	2014-08-31 11:47:03.172868
17670	5	10	10	2013-12-22	WORLDS WEIRDEST-FREAKY EATS	2014-08-31 11:47:03.207547	2014-08-31 11:47:03.207547
17671	5	13	10	2013-12-22	CHEF ON THE ROAD	2014-08-31 11:47:03.266706	2014-08-31 11:47:03.266706
17672	5	16	10	2013-12-22	MNKT-MONSOON SHOWDOWN	2014-08-31 11:47:03.306541	2014-08-31 11:47:03.306541
17673	5	17	10	2013-12-22	DANGEROUS ENCOUTERS	2014-08-31 11:47:03.338631	2014-08-31 11:47:03.338631
17674	5	19	10	2013-12-22	DA VINCIS DEMONS	2014-08-31 11:47:03.367073	2014-08-31 11:47:03.367073
17675	5	22	10	2013-12-22	WILD SEX-THE HARD SELL	2014-08-31 11:47:03.394421	2014-08-31 11:47:03.394421
17676	5	16	10	2013-12-23	MOST THRILLING MOMENTS	2014-08-31 11:47:03.42467	2014-08-31 11:47:03.42467
17677	5	16	10	2013-12-23	MOST THRILLING MOMENTS	2014-08-31 11:47:03.743366	2014-08-31 11:47:03.743366
17678	5	16	10	2013-12-23	MOST THRILLING MOMENTS	2014-08-31 11:47:03.77298	2014-08-31 11:47:03.77298
17679	5	17	10	2013-12-23	THE LAST MANEATER KILLER	2014-08-31 11:47:03.801466	2014-08-31 11:47:03.801466
17680	5	17	10	2013-12-23	THE LAST MANEATER KILLER	2014-08-31 11:47:03.838999	2014-08-31 11:47:03.838999
17681	5	18	10	2013-12-23	RETURN OF THE CLOUDED LEOPARDS	2014-08-31 11:47:03.869372	2014-08-31 11:47:03.869372
17682	5	18	10	2013-12-23	RETURN OF THE CLOUDED LEOPARDS	2014-08-31 11:47:03.89784	2014-08-31 11:47:03.89784
17683	5	16	10	2013-12-24	MOST EXTREME MOMENTS	2014-08-31 11:47:03.933372	2014-08-31 11:47:03.933372
17684	5	16	10	2013-12-24	MOST EXTREME MOMENTS	2014-08-31 11:47:03.962744	2014-08-31 11:47:03.962744
17685	5	16	10	2013-12-24	MOST EXTREME MOMENTS	2014-08-31 11:47:04.287668	2014-08-31 11:47:04.287668
17686	5	17	10	2013-12-24	BFTK-GRASSLAND	2014-08-31 11:47:04.316282	2014-08-31 11:47:04.316282
17687	5	18	10	2013-12-24	TABOO-INDIA	2014-08-31 11:47:04.348872	2014-08-31 11:47:04.348872
17688	5	18	10	2013-12-24	TABOO-INDIA	2014-08-31 11:47:04.376221	2014-08-31 11:47:04.376221
17689	5	16	10	2013-12-25	MOST DANGEROUS MOMENT	2014-08-31 11:47:04.405876	2014-08-31 11:47:04.405876
17690	5	16	10	2013-12-25	MOST DANGEROUS MOMENT	2014-08-31 11:47:04.442798	2014-08-31 11:47:04.442798
17691	5	16	10	2013-12-25	MOST DANGEROUS MOMENT	2014-08-31 11:47:04.472145	2014-08-31 11:47:04.472145
17692	5	17	10	2013-12-25	DNGE-BITE FORCE	2014-08-31 11:47:04.498417	2014-08-31 11:47:04.498417
17693	5	17	10	2013-12-25	DNGE-BITE FORCE	2014-08-31 11:47:04.528381	2014-08-31 11:47:04.528381
17694	5	18	10	2013-12-25	MEGC-MUMBAI	2014-08-31 11:47:04.843866	2014-08-31 11:47:04.843866
17695	5	18	10	2013-12-25	MEGC-MUMBAI	2014-08-31 11:47:04.871527	2014-08-31 11:47:04.871527
17696	5	16	10	2013-12-26	MOST AMAZING CLOSE ENCOU	2014-08-31 11:47:04.900268	2014-08-31 11:47:04.900268
17697	5	16	10	2013-12-26	MOST AMAZING CLOSE ENCOU	2014-08-31 11:47:04.932318	2014-08-31 11:47:04.932318
17698	5	17	10	2013-12-26	SWAMP LIONS	2014-08-31 11:47:04.960295	2014-08-31 11:47:04.960295
17699	5	17	10	2013-12-26	SWAMP LIONS	2014-08-31 11:47:04.987459	2014-08-31 11:47:04.987459
17700	5	18	10	2013-12-26	MEGF-TATA NANO	2014-08-31 11:47:05.016773	2014-08-31 11:47:05.016773
17701	5	18	10	2013-12-26	MEGF-TATA NANO	2014-08-31 11:47:05.043855	2014-08-31 11:47:05.043855
17702	5	6	11	2013-11-29	NEWS AT A GLANCE	2014-08-31 11:47:05.344295	2014-08-31 11:47:05.344295
17703	5	6	11	2013-11-29	TEA TOAST & SPORTS	2014-08-31 11:47:05.371596	2014-08-31 11:47:05.371596
17704	5	6	11	2013-11-29	NEWS AT A GLANCE	2014-08-31 11:47:05.398554	2014-08-31 11:47:05.398554
17705	5	7	11	2013-11-29	BREAKFAST NEWS	2014-08-31 11:47:05.429611	2014-08-31 11:47:05.429611
17706	5	8	11	2013-11-29	BREAKFAST NEWS	2014-08-31 11:47:05.460036	2014-08-31 11:47:05.460036
17707	5	9	11	2013-11-29	DAILY 10	2014-08-31 11:47:05.486092	2014-08-31 11:47:05.486092
17708	5	9	11	2013-11-29	NEWS AT A GLANCE	2014-08-31 11:47:05.511423	2014-08-31 11:47:05.511423
17709	5	17	11	2013-11-29	LEFT RIGHT & CENTRE	2014-08-31 11:47:05.539966	2014-08-31 11:47:05.539966
17710	5	17	11	2013-11-29	NDTV 24X7 NEWS	2014-08-31 11:47:05.842869	2014-08-31 11:47:05.842869
17711	5	18	11	2013-11-29	NEWS AT A GLANCE	2014-08-31 11:47:05.87193	2014-08-31 11:47:05.87193
17712	5	18	11	2013-11-29	LEFT RIGHT & CENTRE	2014-08-31 11:47:05.899364	2014-08-31 11:47:05.899364
17713	5	19	11	2013-11-29	BATTLEGROUND	2014-08-31 11:47:05.929946	2014-08-31 11:47:05.929946
17714	5	22	11	2013-11-29	NDTV 24X7 NEWS	2014-08-31 11:47:05.960911	2014-08-31 11:47:05.960911
17715	5	22	11	2013-11-29	THANK GOD ITS FRIDAY	2014-08-31 11:47:05.987467	2014-08-31 11:47:05.987467
17716	5	6	11	2013-11-30	NEWS STREAM	2014-08-31 11:47:06.030394	2014-08-31 11:47:06.030394
17717	5	7	11	2013-11-30	BREAKFAST NEWS	2014-08-31 11:47:06.069945	2014-08-31 11:47:06.069945
17718	5	8	11	2013-11-30	BREAKFAST NEWS	2014-08-31 11:47:06.374407	2014-08-31 11:47:06.374407
17719	5	9	11	2013-11-30	DAILY 10	2014-08-31 11:47:06.403178	2014-08-31 11:47:06.403178
17720	5	10	11	2013-11-30	THE GREAT INDIAN TAMASHA	2014-08-31 11:47:06.434464	2014-08-31 11:47:06.434464
17721	5	11	11	2013-11-30	NDTV 24X7 NEWS	2014-08-31 11:47:06.462853	2014-08-31 11:47:06.462853
17722	5	17	11	2013-11-30	6 PM PRIME	2014-08-31 11:47:06.491135	2014-08-31 11:47:06.491135
17723	5	18	11	2013-11-30	FOLLOW THE LEADER	2014-08-31 11:47:06.518543	2014-08-31 11:47:06.518543
17724	5	19	11	2013-11-30	NEWS AT A GLANCE	2014-08-31 11:47:06.549644	2014-08-31 11:47:06.549644
17725	5	20	11	2013-11-30	WALK THE TALK	2014-08-31 11:47:06.576968	2014-08-31 11:47:06.576968
17726	5	21	11	2013-11-30	NDTV 24X7 NEWS	2014-08-31 11:47:06.879622	2014-08-31 11:47:06.879622
17727	5	22	11	2013-11-30	SATURDAY NIGHT FEVER	2014-08-31 11:47:06.906583	2014-08-31 11:47:06.906583
17728	5	22	11	2013-11-30	NEWS AT A GLANCE	2014-08-31 11:47:06.937615	2014-08-31 11:47:06.937615
17729	5	6	11	2013-12-01	BREAKFAST NEWS	2014-08-31 11:47:06.964165	2014-08-31 11:47:06.964165
17730	5	7	11	2013-12-01	NEWS AT A GLANCE	2014-08-31 11:47:06.99078	2014-08-31 11:47:06.99078
17731	5	8	11	2013-12-01	OUR GIRLS OUR PRIDE	2014-08-31 11:47:07.018193	2014-08-31 11:47:07.018193
17732	5	10	11	2013-12-01	NDTV VEDANTA OUR GIRLS OUR PRIDE	2014-08-31 11:47:07.049155	2014-08-31 11:47:07.049155
17733	5	12	11	2013-12-01	NDTV 24X7-JUST IN	2014-08-31 11:47:07.074428	2014-08-31 11:47:07.074428
17734	5	15	11	2013-12-01	NDTV VEDANTA OUR GIRLS OUR PRIDE	2014-08-31 11:47:07.367372	2014-08-31 11:47:07.367372
17735	5	15	11	2013-12-01	NDTV VEDANTA OUR GIRLS OUR PRIDE	2014-08-31 11:47:07.395909	2014-08-31 11:47:07.395909
17736	5	17	11	2013-12-01	NDTV VEDANTA OUR GIRLS OUR PRIDE	2014-08-31 11:47:07.427085	2014-08-31 11:47:07.427085
17737	5	18	11	2013-12-01	NDTV VEDANTA OUR GIRLS OUR PRIDE	2014-08-31 11:47:07.458529	2014-08-31 11:47:07.458529
17738	5	19	11	2013-12-01	NDTV VEDANTA OUR GIRLS OUR PRIDE	2014-08-31 11:47:07.485108	2014-08-31 11:47:07.485108
17739	5	20	11	2013-12-01	BATTLEGROUND	2014-08-31 11:47:07.511728	2014-08-31 11:47:07.511728
17740	5	21	11	2013-12-01	NDTV 24X7 NEWS	2014-08-31 11:47:07.547354	2014-08-31 11:47:07.547354
17741	5	21	11	2013-12-01	NDTV 24X7 NEWS	2014-08-31 11:47:07.572884	2014-08-31 11:47:07.572884
17742	5	22	11	2013-12-01	NDTV 24X7 NEWS	2014-08-31 11:47:07.59762	2014-08-31 11:47:07.59762
17743	5	22	11	2013-12-01	THE GREAT INDIAN TAMASHA	2014-08-31 11:47:07.88668	2014-08-31 11:47:07.88668
17744	5	6	11	2013-12-02	NEWS STREAM	2014-08-31 11:47:07.914595	2014-08-31 11:47:07.914595
17745	5	6	11	2013-12-02	BREAKFAST NEWS	2014-08-31 11:47:07.951727	2014-08-31 11:47:07.951727
17746	5	7	11	2013-12-02	BREAKFAST NEWS	2014-08-31 11:47:07.983344	2014-08-31 11:47:07.983344
17747	5	7	11	2013-12-02	BREAKFAST NEWS	2014-08-31 11:47:08.012571	2014-08-31 11:47:08.012571
17748	5	8	11	2013-12-02	BREAKFAST NEWS	2014-08-31 11:47:08.04044	2014-08-31 11:47:08.04044
17749	5	9	11	2013-12-02	DAILY 10	2014-08-31 11:47:08.066808	2014-08-31 11:47:08.066808
17750	5	9	11	2013-12-02	DAILY 10	2014-08-31 11:47:08.092615	2014-08-31 11:47:08.092615
17751	5	9	11	2013-12-02	NEWS AT A GLANCE	2014-08-31 11:47:08.391107	2014-08-31 11:47:08.391107
17752	5	17	11	2013-12-02	6 PM PRIME	2014-08-31 11:47:08.41891	2014-08-31 11:47:08.41891
17753	5	17	11	2013-12-02	SPORTS TOP 10	2014-08-31 11:47:08.45048	2014-08-31 11:47:08.45048
17754	5	18	11	2013-12-02	NEWS AT A GLANCE	2014-08-31 11:47:08.478148	2014-08-31 11:47:08.478148
17755	5	19	11	2013-12-02	THE BUCK STOPS HERE	2014-08-31 11:47:08.505494	2014-08-31 11:47:08.505494
17756	5	20	11	2013-12-02	NEWSFIRST AT 10	2014-08-31 11:47:08.537551	2014-08-31 11:47:08.537551
17757	5	21	11	2013-12-02	NDTV 24X7 NEWS	2014-08-31 11:47:08.565016	2014-08-31 11:47:08.565016
17758	5	22	11	2013-12-02	NIGHT OUT	2014-08-31 11:47:08.591386	2014-08-31 11:47:08.591386
17759	5	22	11	2013-12-02	THE BUCK STOPS HERE	2014-08-31 11:47:08.9257	2014-08-31 11:47:08.9257
17760	5	6	11	2013-12-03	NEWS AT A GLANCE	2014-08-31 11:47:08.954136	2014-08-31 11:47:08.954136
17761	5	6	11	2013-12-03	BREAKFAST NEWS	2014-08-31 11:47:08.981959	2014-08-31 11:47:08.981959
17762	5	7	11	2013-12-03	BREAKFAST NEWS	2014-08-31 11:47:09.010313	2014-08-31 11:47:09.010313
17763	5	7	11	2013-12-03	NEWS AT A GLANCE	2014-08-31 11:47:09.043065	2014-08-31 11:47:09.043065
17764	5	8	11	2013-12-03	BREAKFAST NEWS	2014-08-31 11:47:09.0711	2014-08-31 11:47:09.0711
17765	5	8	11	2013-12-03	DAILY 10	2014-08-31 11:47:09.097015	2014-08-31 11:47:09.097015
17766	5	9	11	2013-12-03	NDTV VEDANTA OUR GIRLS OUR PRIDE	2014-08-31 11:47:09.126204	2014-08-31 11:47:09.126204
17767	5	9	11	2013-12-03	NDTV 24X7 NEWS	2014-08-31 11:47:09.443925	2014-08-31 11:47:09.443925
17768	5	17	11	2013-12-03	THE SOCIAL NETWORK	2014-08-31 11:47:09.472834	2014-08-31 11:47:09.472834
17769	5	17	11	2013-12-03	SPORTS TOP 10	2014-08-31 11:47:09.500902	2014-08-31 11:47:09.500902
17770	5	18	11	2013-12-03	NEWS AT A GLANCE	2014-08-31 11:47:09.533369	2014-08-31 11:47:09.533369
17771	5	19	11	2013-12-03	THE BUCK STOPS HERE	2014-08-31 11:47:09.564272	2014-08-31 11:47:09.564272
17772	5	21	11	2013-12-03	AGENDA	2014-08-31 11:47:09.593475	2014-08-31 11:47:09.593475
17773	5	22	11	2013-12-03	NDTV 24X7 NEWS	2014-08-31 11:47:09.625309	2014-08-31 11:47:09.625309
17774	5	22	11	2013-12-03	NIGHT OUT	2014-08-31 11:47:09.654245	2014-08-31 11:47:09.654245
17775	5	22	11	2013-12-03	THE BUCK STOPS HERE	2014-08-31 11:47:10.000293	2014-08-31 11:47:10.000293
17776	5	6	11	2013-12-05	NEWS STREAM	2014-08-31 11:47:10.034569	2014-08-31 11:47:10.034569
17777	5	6	11	2013-12-05	TEA TOAST & SPORTS	2014-08-31 11:47:10.062483	2014-08-31 11:47:10.062483
17778	5	7	11	2013-12-05	BREAKFAST NEWS	2014-08-31 11:47:10.090695	2014-08-31 11:47:10.090695
17779	5	7	11	2013-12-05	THE GREAT INDIAN TAMASHA	2014-08-31 11:47:10.12389	2014-08-31 11:47:10.12389
17780	5	8	11	2013-12-05	BREAKFAST NEWS	2014-08-31 11:47:10.152383	2014-08-31 11:47:10.152383
17781	5	8	11	2013-12-05	THE GREAT INDIAN TAMASHA	2014-08-31 11:47:10.178637	2014-08-31 11:47:10.178637
17782	5	9	11	2013-12-05	DAILY 10	2014-08-31 11:47:10.204607	2014-08-31 11:47:10.204607
17783	5	9	11	2013-12-05	NDTV 24X7 NEWS	2014-08-31 11:47:10.53304	2014-08-31 11:47:10.53304
17784	5	17	11	2013-12-05	6 PM PRIME	2014-08-31 11:47:10.561676	2014-08-31 11:47:10.561676
17785	5	17	11	2013-12-05	THE SOCIAL NETWORK	2014-08-31 11:47:10.589133	2014-08-31 11:47:10.589133
17786	5	18	11	2013-12-05	NEWS AT A GLANCE	2014-08-31 11:47:10.6259	2014-08-31 11:47:10.6259
17787	5	19	11	2013-12-05	THE BUCK STOPS HERE	2014-08-31 11:47:10.654846	2014-08-31 11:47:10.654846
17788	5	20	11	2013-12-05	NEWSFIRST AT 10	2014-08-31 11:47:10.683393	2014-08-31 11:47:10.683393
17789	5	21	11	2013-12-05	NEWSFIRST AT 10	2014-08-31 11:47:10.709759	2014-08-31 11:47:10.709759
17790	5	22	11	2013-12-05	NIGHT OUT	2014-08-31 11:47:10.740189	2014-08-31 11:47:10.740189
17791	5	22	11	2013-12-05	THE BUCK STOPS HERE	2014-08-31 11:47:10.764667	2014-08-31 11:47:10.764667
17792	5	6	11	2013-12-06	NDTV 24X7 NEWS	2014-08-31 11:47:11.136165	2014-08-31 11:47:11.136165
17793	5	6	11	2013-12-06	BREAKFAST NEWS	2014-08-31 11:47:11.167639	2014-08-31 11:47:11.167639
17794	5	7	11	2013-12-06	BREAKFAST NEWS	2014-08-31 11:47:11.199306	2014-08-31 11:47:11.199306
17795	5	7	11	2013-12-06	BREAKFAST NEWS	2014-08-31 11:47:11.236014	2014-08-31 11:47:11.236014
17796	5	8	11	2013-12-06	BREAKFAST NEWS	2014-08-31 11:47:11.267596	2014-08-31 11:47:11.267596
17797	5	8	11	2013-12-06	NEWS AT A GLANCE	2014-08-31 11:47:11.295988	2014-08-31 11:47:11.295988
17798	5	9	11	2013-12-06	MANDELA THE LEGEND	2014-08-31 11:47:11.338469	2014-08-31 11:47:11.338469
17799	5	9	11	2013-12-06	NDTV 24X7 NEWS	2014-08-31 11:47:11.365744	2014-08-31 11:47:11.365744
17800	5	17	11	2013-12-06	NEWS AT A GLANCE	2014-08-31 11:47:11.694957	2014-08-31 11:47:11.694957
17801	5	17	11	2013-12-06	SPORTS TOP 10	2014-08-31 11:47:11.722274	2014-08-31 11:47:11.722274
17802	5	18	11	2013-12-06	NEWS AT A GLANCE	2014-08-31 11:47:11.750048	2014-08-31 11:47:11.750048
17803	5	19	11	2013-12-06	THE BUCK STOPS HERE	2014-08-31 11:47:11.777375	2014-08-31 11:47:11.777375
17804	5	20	11	2013-12-06	NEWSFIRST AT 10	2014-08-31 11:47:11.804422	2014-08-31 11:47:11.804422
17805	5	21	11	2013-12-06	MANDELA THE LEGEND	2014-08-31 11:47:11.835531	2014-08-31 11:47:11.835531
17806	5	22	11	2013-12-06	NDTV 24X7 NEWS	2014-08-31 11:47:11.863617	2014-08-31 11:47:11.863617
17807	5	22	11	2013-12-06	NDTV 24X7 NEWS	2014-08-31 11:47:11.890418	2014-08-31 11:47:11.890418
17808	5	6	11	2013-12-07	NEWS AT A GLANCE	2014-08-31 11:47:12.209381	2014-08-31 11:47:12.209381
17809	5	7	11	2013-12-07	BOLLYWOOD ROOTS	2014-08-31 11:47:12.238267	2014-08-31 11:47:12.238267
17810	5	7	11	2013-12-07	BREAKFAST NEWS	2014-08-31 11:47:12.2724	2014-08-31 11:47:12.2724
17811	5	8	11	2013-12-07	NEWS AT A GLANCE	2014-08-31 11:47:12.300005	2014-08-31 11:47:12.300005
17812	5	9	11	2013-12-07	NEWSNET 3 0	2014-08-31 11:47:12.331042	2014-08-31 11:47:12.331042
17813	5	10	11	2013-12-07	MANDELA THE LEGEND	2014-08-31 11:47:12.357544	2014-08-31 11:47:12.357544
17814	5	15	11	2013-12-07	NDTV 24X7 NEWS	2014-08-31 11:47:12.382949	2014-08-31 11:47:12.382949
17815	5	15	11	2013-12-07	NDTV VEDANTA OUR GIRLS OUR PRIDE	2014-08-31 11:47:12.408123	2014-08-31 11:47:12.408123
17816	5	17	11	2013-12-07	BOLLYWOOD ROOTS	2014-08-31 11:47:12.718494	2014-08-31 11:47:12.718494
17817	5	17	11	2013-12-07	REAL WOMEN INCREDIBLE LIVES	2014-08-31 11:47:12.7489	2014-08-31 11:47:12.7489
17818	5	18	11	2013-12-07	REAL WOMEN INCREDIBLE LIVES	2014-08-31 11:47:12.777906	2014-08-31 11:47:12.777906
17819	5	19	11	2013-12-07	THE BUCK STOPS HERE	2014-08-31 11:47:12.806777	2014-08-31 11:47:12.806777
17820	5	20	11	2013-12-07	TRUTH VS HYPE	2014-08-31 11:47:12.834341	2014-08-31 11:47:12.834341
17821	5	21	11	2013-12-07	NDTV 24X7 NEWS	2014-08-31 11:47:12.860623	2014-08-31 11:47:12.860623
17822	5	22	11	2013-12-07	SATURDAY NIGHT FEVER	2014-08-31 11:47:12.885638	2014-08-31 11:47:12.885638
17823	5	22	11	2013-12-07	THE BUCK STOPS HERE	2014-08-31 11:47:12.910507	2014-08-31 11:47:12.910507
17824	5	6	11	2013-12-09	NEWS AT A GLANCE	2014-08-31 11:47:13.221876	2014-08-31 11:47:13.221876
17825	5	6	11	2013-12-09	NEWS AT A GLANCE	2014-08-31 11:47:13.250101	2014-08-31 11:47:13.250101
17826	5	7	11	2013-12-09	BREAKFAST NEWS	2014-08-31 11:47:13.278297	2014-08-31 11:47:13.278297
17827	5	7	11	2013-12-09	BREAKFAST NEWS	2014-08-31 11:47:13.306507	2014-08-31 11:47:13.306507
17828	5	8	11	2013-12-09	BREAKFAST NEWS	2014-08-31 11:47:13.338744	2014-08-31 11:47:13.338744
17829	5	8	11	2013-12-09	NEWS AT A GLANCE	2014-08-31 11:47:13.366222	2014-08-31 11:47:13.366222
17830	5	9	11	2013-12-09	THE GIANT KILLER	2014-08-31 11:47:13.392169	2014-08-31 11:47:13.392169
17831	5	9	11	2013-12-09	NDTV 24X7 NEWS	2014-08-31 11:47:13.417342	2014-08-31 11:47:13.417342
17832	5	17	11	2013-12-09	NEWS AT A GLANCE	2014-08-31 11:47:13.728497	2014-08-31 11:47:13.728497
17833	5	19	11	2013-12-09	THE BUCK STOPS HERE	2014-08-31 11:47:13.75646	2014-08-31 11:47:13.75646
17834	5	20	11	2013-12-09	NEWSFIRST AT 10	2014-08-31 11:47:13.785248	2014-08-31 11:47:13.785248
17835	5	21	11	2013-12-09	NDTV 24X7 NEWS	2014-08-31 11:47:13.81381	2014-08-31 11:47:13.81381
17836	5	22	11	2013-12-09	NDTV 24X7 NEWS	2014-08-31 11:47:13.849461	2014-08-31 11:47:13.849461
17837	5	22	11	2013-12-09	NIGHT OUT	2014-08-31 11:47:13.876063	2014-08-31 11:47:13.876063
17838	5	22	11	2013-12-09	NIGHT OUT	2014-08-31 11:47:13.913716	2014-08-31 11:47:13.913716
17839	5	22	11	2013-12-09	THE BUCK STOPS HERE	2014-08-31 11:47:13.965872	2014-08-31 11:47:13.965872
17840	5	6	11	2013-12-10	NEWS AT A GLANCE	2014-08-31 11:47:14.403796	2014-08-31 11:47:14.403796
17841	5	7	11	2013-12-10	BREAKFAST NEWS	2014-08-31 11:47:14.452742	2014-08-31 11:47:14.452742
17842	5	7	11	2013-12-10	NEWS AT A GLANCE	2014-08-31 11:47:14.495045	2014-08-31 11:47:14.495045
17843	5	8	11	2013-12-10	BREAKFAST NEWS	2014-08-31 11:47:14.549697	2014-08-31 11:47:14.549697
17844	5	8	11	2013-12-10	DAILY 10	2014-08-31 11:47:14.590572	2014-08-31 11:47:14.590572
17845	5	9	11	2013-12-10	DAILY 10	2014-08-31 11:47:14.635197	2014-08-31 11:47:14.635197
17846	5	9	11	2013-12-10	DAILY 10	2014-08-31 11:47:14.67299	2014-08-31 11:47:14.67299
17847	5	9	11	2013-12-10	NDTV 24X7 NEWS	2014-08-31 11:47:14.710864	2014-08-31 11:47:14.710864
17848	5	17	11	2013-12-10	THE SOCIAL NETWORK	2014-08-31 11:47:14.752523	2014-08-31 11:47:14.752523
17849	5	18	11	2013-12-10	LEFT RIGHT & CENTRE	2014-08-31 11:47:15.100522	2014-08-31 11:47:15.100522
17850	5	19	11	2013-12-10	LEFT RIGHT & CENTRE	2014-08-31 11:47:15.138882	2014-08-31 11:47:15.138882
17851	5	20	11	2013-12-10	NEWSFIRST AT 10	2014-08-31 11:47:15.174222	2014-08-31 11:47:15.174222
17852	5	21	11	2013-12-10	NEWS AT A GLANCE	2014-08-31 11:47:15.208339	2014-08-31 11:47:15.208339
17853	5	22	11	2013-12-10	NDTV 24X7 NEWS	2014-08-31 11:47:15.248786	2014-08-31 11:47:15.248786
17854	5	22	11	2013-12-10	NIGHT OUT	2014-08-31 11:47:15.277739	2014-08-31 11:47:15.277739
17855	5	22	11	2013-12-10	NEWS AT A GLANCE	2014-08-31 11:47:15.305076	2014-08-31 11:47:15.305076
17856	5	6	11	2013-12-11	NEWS STREAM	2014-08-31 11:47:15.336282	2014-08-31 11:47:15.336282
17857	5	6	11	2013-12-11	TEA TOAST & SPORTS	2014-08-31 11:47:15.658775	2014-08-31 11:47:15.658775
17858	5	6	11	2013-12-11	BREAKFAST NEWS	2014-08-31 11:47:15.688954	2014-08-31 11:47:15.688954
17859	5	7	11	2013-12-11	BREAKFAST NEWS	2014-08-31 11:47:15.725796	2014-08-31 11:47:15.725796
17860	5	8	11	2013-12-11	BREAKFAST NEWS	2014-08-31 11:47:15.757502	2014-08-31 11:47:15.757502
17861	5	9	11	2013-12-11	DAILY 10	2014-08-31 11:47:15.787955	2014-08-31 11:47:15.787955
17862	5	9	11	2013-12-11	DAILY 10	2014-08-31 11:47:15.816589	2014-08-31 11:47:15.816589
17863	5	9	11	2013-12-11	BREAKING NEWS	2014-08-31 11:47:15.851936	2014-08-31 11:47:15.851936
17864	5	17	11	2013-12-11	6 PM PRIME	2014-08-31 11:47:15.880346	2014-08-31 11:47:15.880346
17865	5	17	11	2013-12-11	THE SOCIAL NETWORK	2014-08-31 11:47:16.228259	2014-08-31 11:47:16.228259
17866	5	18	11	2013-12-11	AGENDA	2014-08-31 11:47:16.257636	2014-08-31 11:47:16.257636
17867	5	19	11	2013-12-11	NEWS AT A GLANCE	2014-08-31 11:47:16.286169	2014-08-31 11:47:16.286169
17868	5	21	11	2013-12-11	NEWS AT A GLANCE	2014-08-31 11:47:16.313718	2014-08-31 11:47:16.313718
17869	5	22	11	2013-12-11	NDTV 24X7 NEWS	2014-08-31 11:47:16.345668	2014-08-31 11:47:16.345668
17870	5	22	11	2013-12-11	NEWS AT A GLANCE	2014-08-31 11:47:16.374033	2014-08-31 11:47:16.374033
17871	5	22	11	2013-12-11	THE BUCK STOPS HERE	2014-08-31 11:47:16.401556	2014-08-31 11:47:16.401556
17872	5	6	11	2013-12-12	TEA TOAST & SPORTS	2014-08-31 11:47:16.431512	2014-08-31 11:47:16.431512
17873	5	6	11	2013-12-12	TEA TOAST & SPORTS	2014-08-31 11:47:16.748999	2014-08-31 11:47:16.748999
17874	5	7	11	2013-12-12	BREAKFAST NEWS	2014-08-31 11:47:16.77841	2014-08-31 11:47:16.77841
17875	5	7	11	2013-12-12	BREAKFAST NEWS	2014-08-31 11:47:16.806612	2014-08-31 11:47:16.806612
17876	5	7	11	2013-12-12	BREAKFAST NEWS	2014-08-31 11:47:16.837658	2014-08-31 11:47:16.837658
17877	5	8	11	2013-12-12	BREAKFAST NEWS	2014-08-31 11:47:16.868155	2014-08-31 11:47:16.868155
17878	5	8	11	2013-12-12	BREAKFAST NEWS	2014-08-31 11:47:16.894315	2014-08-31 11:47:16.894315
17879	5	8	11	2013-12-12	BREAKFAST NEWS	2014-08-31 11:47:16.918811	2014-08-31 11:47:16.918811
17880	5	17	11	2013-12-12	THE SOCIAL NETWORK	2014-08-31 11:47:16.95018	2014-08-31 11:47:16.95018
17881	5	18	11	2013-12-12	NEWS AT A GLANCE	2014-08-31 11:47:17.263988	2014-08-31 11:47:17.263988
17882	5	19	11	2013-12-12	THE BUCK STOPS HERE	2014-08-31 11:47:17.292701	2014-08-31 11:47:17.292701
17883	5	20	11	2013-12-12	NEWSFIRST AT 10	2014-08-31 11:47:17.32433	2014-08-31 11:47:17.32433
17884	5	21	11	2013-12-12	AGENDA	2014-08-31 11:47:17.352612	2014-08-31 11:47:17.352612
17885	5	22	11	2013-12-12	NDTV 24X7 NEWS	2014-08-31 11:47:17.38134	2014-08-31 11:47:17.38134
17886	5	6	11	2013-12-13	NEWS STREAM	2014-08-31 11:47:17.408255	2014-08-31 11:47:17.408255
17887	5	6	11	2013-12-13	TEA TOAST & SPORTS	2014-08-31 11:47:17.442014	2014-08-31 11:47:17.442014
17888	5	7	11	2013-12-13	BREAKFAST NEWS	2014-08-31 11:47:17.468948	2014-08-31 11:47:17.468948
17889	5	7	11	2013-12-13	NEWS AT A GLANCE	2014-08-31 11:47:17.77834	2014-08-31 11:47:17.77834
17890	5	8	11	2013-12-13	NEWS AT A GLANCE	2014-08-31 11:47:17.808386	2014-08-31 11:47:17.808386
17891	5	9	11	2013-12-13	DAILY 10	2014-08-31 11:47:17.839747	2014-08-31 11:47:17.839747
17892	5	9	11	2013-12-13	DAILY 10	2014-08-31 11:47:17.868441	2014-08-31 11:47:17.868441
17893	5	9	11	2013-12-13	NEWS AT A GLANCE	2014-08-31 11:47:17.899576	2014-08-31 11:47:17.899576
17894	5	17	11	2013-12-13	6 PM PRIME	2014-08-31 11:47:17.936227	2014-08-31 11:47:17.936227
17895	5	17	11	2013-12-13	SPORTS TOP 10	2014-08-31 11:47:17.963993	2014-08-31 11:47:17.963993
17896	5	18	11	2013-12-13	EXCLUSIVE-HAMID KARZAI IN HIS PALACE	2014-08-31 11:47:17.990486	2014-08-31 11:47:17.990486
17897	5	19	11	2013-12-13	THE BUCK STOPS HERE	2014-08-31 11:47:18.016446	2014-08-31 11:47:18.016446
17898	5	21	11	2013-12-13	NDTV 24X7 NEWS	2014-08-31 11:47:18.330603	2014-08-31 11:47:18.330603
17899	5	22	11	2013-12-13	NDTV 24X7 NEWS	2014-08-31 11:47:18.358816	2014-08-31 11:47:18.358816
17900	5	6	11	2013-12-14	NEWS STREAM	2014-08-31 11:47:18.387316	2014-08-31 11:47:18.387316
17901	5	6	11	2013-12-14	NEWS STREAM	2014-08-31 11:47:18.414219	2014-08-31 11:47:18.414219
17902	5	7	11	2013-12-14	BREAKFAST NEWS	2014-08-31 11:47:18.445465	2014-08-31 11:47:18.445465
17903	5	8	11	2013-12-14	BREAKFAST NEWS	2014-08-31 11:47:18.472605	2014-08-31 11:47:18.472605
17904	5	8	11	2013-12-14	INDIAS 25 GREATEST GLOBAL LIVING LEGENDS	2014-08-31 11:47:18.498992	2014-08-31 11:47:18.498992
17905	5	13	11	2013-12-14	INDIAS 25 GREATEST GLOBAL LIVING LEGENDS	2014-08-31 11:47:18.526971	2014-08-31 11:47:18.526971
17906	5	19	11	2013-12-14	NDTV 24X7 NEWS	2014-08-31 11:47:18.827571	2014-08-31 11:47:18.827571
17907	5	19	11	2013-12-14	NDTV 24X7 NEWS	2014-08-31 11:47:18.854555	2014-08-31 11:47:18.854555
17908	5	20	11	2013-12-14	INDIAS 25 GREATEST GLOBAL LIVING LEGENDS	2014-08-31 11:47:18.881944	2014-08-31 11:47:18.881944
17909	5	22	11	2013-12-14	INDIAS 25 GREATEST GLOBAL LIVING LEGENDS	2014-08-31 11:47:18.909606	2014-08-31 11:47:18.909606
17910	5	22	11	2013-12-14	INDIAS 25 GREATEST GLOBAL LIVING LEGENDS	2014-08-31 11:47:18.940273	2014-08-31 11:47:18.940273
17911	5	22	11	2013-12-14	NDTV 24X7 NEWS	2014-08-31 11:47:18.967226	2014-08-31 11:47:18.967226
17912	5	6	11	2013-12-15	BREAKFAST NEWS	2014-08-31 11:47:18.993474	2014-08-31 11:47:18.993474
17913	5	7	11	2013-12-15	NEWS AT A GLANCE	2014-08-31 11:47:19.01826	2014-08-31 11:47:19.01826
17914	5	8	11	2013-12-15	INDIAS 25 GREATEST GLOBAL LIVING LEGENDS	2014-08-31 11:47:19.333822	2014-08-31 11:47:19.333822
17915	5	10	11	2013-12-15	NDTV 24X7 NEWS	2014-08-31 11:47:19.362955	2014-08-31 11:47:19.362955
17916	5	10	11	2013-12-15	INDIAS 25 GREATEST GLOBAL LIVING LEGENDS	2014-08-31 11:47:19.39147	2014-08-31 11:47:19.39147
17917	5	13	11	2013-12-15	INDIAS 25 GREATEST GLOBAL LIVING LEGENDS	2014-08-31 11:47:19.41773	2014-08-31 11:47:19.41773
17918	5	17	11	2013-12-15	EXCLUSIVE INTERVIEW WITH HAMID KARZAI	2014-08-31 11:47:19.450658	2014-08-31 11:47:19.450658
17919	5	17	11	2013-12-15	EXCLUSIVE INTERVIEW WITH HAMID KARZAI	2014-08-31 11:47:19.478035	2014-08-31 11:47:19.478035
17920	5	19	11	2013-12-15	THE BUCK STOPS HERE	2014-08-31 11:47:19.503876	2014-08-31 11:47:19.503876
17921	5	22	11	2013-12-15	INDIAS 25 GREATEST GLOBAL LIVING LEGENDS	2014-08-31 11:47:19.533436	2014-08-31 11:47:19.533436
17922	5	22	11	2013-12-15	THE BUCK STOPS HERE	2014-08-31 11:47:19.835161	2014-08-31 11:47:19.835161
17923	5	22	11	2013-12-15	THE BUCK STOPS HERE	2014-08-31 11:47:19.863647	2014-08-31 11:47:19.863647
17924	5	6	11	2013-12-16	BREAKFAST NEWS	2014-08-31 11:47:19.890248	2014-08-31 11:47:19.890248
17925	5	7	11	2013-12-16	BREAKFAST NEWS	2014-08-31 11:47:19.916373	2014-08-31 11:47:19.916373
17926	5	8	11	2013-12-16	BREAKFAST NEWS	2014-08-31 11:47:19.947714	2014-08-31 11:47:19.947714
17927	5	9	11	2013-12-16	DAILY 10	2014-08-31 11:47:19.973516	2014-08-31 11:47:19.973516
17928	5	9	11	2013-12-16	DAILY 10	2014-08-31 11:47:19.998415	2014-08-31 11:47:19.998415
17929	5	9	11	2013-12-16	NDTV 24X7 NEWS	2014-08-31 11:47:20.028001	2014-08-31 11:47:20.028001
17930	5	17	11	2013-12-16	6 PM PRIME	2014-08-31 11:47:20.330501	2014-08-31 11:47:20.330501
17931	5	18	11	2013-12-16	WHEN INDIA LOST A DAUGHTER	2014-08-31 11:47:20.357811	2014-08-31 11:47:20.357811
17932	5	19	11	2013-12-16	THE BUCK STOPS HERE	2014-08-31 11:47:20.38464	2014-08-31 11:47:20.38464
17933	5	20	11	2013-12-16	NEWSFIRST AT 10	2014-08-31 11:47:20.410781	2014-08-31 11:47:20.410781
17934	5	22	11	2013-12-16	NEWS AT A GLANCE	2014-08-31 11:47:20.437226	2014-08-31 11:47:20.437226
17935	5	22	11	2013-12-16	NEWS AT A GLANCE	2014-08-31 11:47:20.4644	2014-08-31 11:47:20.4644
17936	5	6	11	2013-12-17	NEWS STREAM	2014-08-31 11:47:20.490176	2014-08-31 11:47:20.490176
17937	5	7	11	2013-12-17	BREAKFAST NEWS	2014-08-31 11:47:20.515037	2014-08-31 11:47:20.515037
17938	5	8	11	2013-12-17	BREAKFAST NEWS	2014-08-31 11:47:20.816322	2014-08-31 11:47:20.816322
17939	5	9	11	2013-12-17	DAILY 10	2014-08-31 11:47:20.84876	2014-08-31 11:47:20.84876
17940	5	9	11	2013-12-17	DAILY 10	2014-08-31 11:47:20.877377	2014-08-31 11:47:20.877377
17941	5	9	11	2013-12-17	THE GREAT INDIAN TAMASHA	2014-08-31 11:47:20.905475	2014-08-31 11:47:20.905475
17942	5	17	11	2013-12-17	NEWS AT A GLANCE	2014-08-31 11:47:20.938342	2014-08-31 11:47:20.938342
17943	5	18	11	2013-12-17	LEFT RIGHT & CENTRE	2014-08-31 11:47:20.965225	2014-08-31 11:47:20.965225
17944	5	19	11	2013-12-17	THE BUCK STOPS HERE	2014-08-31 11:47:20.990452	2014-08-31 11:47:20.990452
17945	5	20	11	2013-12-17	NEWSFIRST AT 10	2014-08-31 11:47:21.038152	2014-08-31 11:47:21.038152
17946	5	21	11	2013-12-17	INDIAS 25 GREATEST GLOBAL LIVING LEGENDS	2014-08-31 11:47:21.075922	2014-08-31 11:47:21.075922
17947	5	22	11	2013-12-17	NIGHT OUT	2014-08-31 11:47:21.401492	2014-08-31 11:47:21.401492
17948	5	6	11	2013-12-18	TEA TOAST & SPORTS	2014-08-31 11:47:21.433466	2014-08-31 11:47:21.433466
17949	5	6	11	2013-12-18	BREAKFAST NEWS	2014-08-31 11:47:21.464385	2014-08-31 11:47:21.464385
17950	5	7	11	2013-12-18	BREAKFAST NEWS	2014-08-31 11:47:21.491106	2014-08-31 11:47:21.491106
17951	5	8	11	2013-12-18	BREAKFAST NEWS	2014-08-31 11:47:21.517846	2014-08-31 11:47:21.517846
17952	5	9	11	2013-12-18	DAILY 10	2014-08-31 11:47:21.549633	2014-08-31 11:47:21.549633
17953	5	9	11	2013-12-18	NDTV 24X7 NEWS	2014-08-31 11:47:21.575623	2014-08-31 11:47:21.575623
17954	5	17	11	2013-12-18	THE GREAT INDIAN TAMASHA	2014-08-31 11:47:21.603759	2014-08-31 11:47:21.603759
17955	5	18	11	2013-12-18	NEWS AT A GLANCE	2014-08-31 11:47:21.93075	2014-08-31 11:47:21.93075
17956	5	19	11	2013-12-18	THE BUCK STOPS HERE	2014-08-31 11:47:21.959083	2014-08-31 11:47:21.959083
17957	5	20	11	2013-12-18	NEWSFIRST AT 10	2014-08-31 11:47:21.988476	2014-08-31 11:47:21.988476
17958	5	22	11	2013-12-18	TURNING POINT-TOP STORIE	2014-08-31 11:47:22.016571	2014-08-31 11:47:22.016571
17959	5	22	11	2013-12-18	TURNING POINT-TOP STORIE	2014-08-31 11:47:22.049279	2014-08-31 11:47:22.049279
17960	5	6	11	2013-12-19	TURNING POINT-TOP STORIE	2014-08-31 11:47:22.075981	2014-08-31 11:47:22.075981
17961	5	7	11	2013-12-19	BREAKFAST NEWS	2014-08-31 11:47:22.101704	2014-08-31 11:47:22.101704
17962	5	8	11	2013-12-19	NEWS AT A GLANCE	2014-08-31 11:47:22.132255	2014-08-31 11:47:22.132255
17963	5	9	11	2013-12-19	DAILY 10	2014-08-31 11:47:22.555231	2014-08-31 11:47:22.555231
17964	5	9	11	2013-12-19	DAILY 10	2014-08-31 11:47:22.584511	2014-08-31 11:47:22.584511
17965	5	9	11	2013-12-19	NEWS AT A GLANCE	2014-08-31 11:47:22.611583	2014-08-31 11:47:22.611583
17966	5	17	11	2013-12-19	SPORTS TOP 10	2014-08-31 11:47:22.647427	2014-08-31 11:47:22.647427
17967	5	18	11	2013-12-19	LEFT RIGHT & CENTRE	2014-08-31 11:47:22.676867	2014-08-31 11:47:22.676867
17968	5	19	11	2013-12-19	LEFT RIGHT & CENTRE	2014-08-31 11:47:22.706893	2014-08-31 11:47:22.706893
17969	5	22	11	2013-12-19	TURNING POINT-TOP STORIE	2014-08-31 11:47:22.738477	2014-08-31 11:47:22.738477
17970	5	22	11	2013-12-19	TURNING POINT-TOP STORIE	2014-08-31 11:47:22.76629	2014-08-31 11:47:22.76629
17971	5	22	11	2013-12-19	NEWS AT A GLANCE	2014-08-31 11:47:23.093208	2014-08-31 11:47:23.093208
17972	5	6	11	2013-12-20	NEWS AT A GLANCE	2014-08-31 11:47:23.124156	2014-08-31 11:47:23.124156
17973	5	6	11	2013-12-20	NEWS AT A GLANCE	2014-08-31 11:47:23.150717	2014-08-31 11:47:23.150717
17974	5	7	11	2013-12-20	BREAKFAST NEWS	2014-08-31 11:47:23.183109	2014-08-31 11:47:23.183109
17975	5	8	11	2013-12-20	BREAKFAST NEWS	2014-08-31 11:47:23.21137	2014-08-31 11:47:23.21137
17976	5	8	11	2013-12-20	DAILY 10	2014-08-31 11:47:23.243428	2014-08-31 11:47:23.243428
17977	5	9	11	2013-12-20	DAILY 10	2014-08-31 11:47:23.269892	2014-08-31 11:47:23.269892
17978	5	17	11	2013-12-20	NEWS AT A GLANCE	2014-08-31 11:47:23.294706	2014-08-31 11:47:23.294706
17979	5	18	11	2013-12-20	THE GREAT INDIAN TAMASHA	2014-08-31 11:47:23.610753	2014-08-31 11:47:23.610753
17980	5	19	11	2013-12-20	THE BUCK STOPS HERE	2014-08-31 11:47:23.642065	2014-08-31 11:47:23.642065
17981	5	20	11	2013-12-20	NEWSFIRST AT 10	2014-08-31 11:47:23.668716	2014-08-31 11:47:23.668716
17982	5	21	11	2013-12-20	INDIA MATTERS	2014-08-31 11:47:23.695627	2014-08-31 11:47:23.695627
17983	5	22	11	2013-12-20	TURNING POINT-TOP STORIE	2014-08-31 11:47:23.727025	2014-08-31 11:47:23.727025
17984	5	6	11	2013-12-21	NEWS AT A GLANCE	2014-08-31 11:47:23.753741	2014-08-31 11:47:23.753741
17985	5	7	11	2013-12-21	NEWS AT A GLANCE	2014-08-31 11:47:23.779728	2014-08-31 11:47:23.779728
17986	5	8	11	2013-12-21	THE GREAT INDIAN TAMASHA	2014-08-31 11:47:23.805201	2014-08-31 11:47:23.805201
17987	5	9	11	2013-12-21	NEWS AT A GLANCE	2014-08-31 11:47:24.109939	2014-08-31 11:47:24.109939
17988	5	17	11	2013-12-21	BOLLYWOOD ROOTS	2014-08-31 11:47:24.142211	2014-08-31 11:47:24.142211
17989	5	18	11	2013-12-21	NEWS AT A GLANCE	2014-08-31 11:47:24.169023	2014-08-31 11:47:24.169023
17990	5	20	11	2013-12-21	WALK THE TALK	2014-08-31 11:47:24.195666	2014-08-31 11:47:24.195666
17991	5	21	11	2013-12-21	NDTV 24X7 NEWS	2014-08-31 11:47:24.226123	2014-08-31 11:47:24.226123
17992	5	22	11	2013-12-21	NEWS AT A GLANCE	2014-08-31 11:47:24.25285	2014-08-31 11:47:24.25285
17993	5	22	11	2013-12-21	THE GREAT INDIAN TAMASHA	2014-08-31 11:47:24.278125	2014-08-31 11:47:24.278125
17994	5	6	11	2013-12-22	TURNING POINT-TOP STORIE	2014-08-31 11:47:24.302768	2014-08-31 11:47:24.302768
17995	5	6	11	2013-12-22	TURNING POINT-TOP STORIE	2014-08-31 11:47:24.330664	2014-08-31 11:47:24.330664
17996	5	7	11	2013-12-22	INDIAS 25 GREATEST GLOBAL LIVING LEGENDS	2014-08-31 11:47:24.637966	2014-08-31 11:47:24.637966
17997	5	7	11	2013-12-22	NEWS AT A GLANCE	2014-08-31 11:47:24.665568	2014-08-31 11:47:24.665568
17998	5	8	11	2013-12-22	CELL GURU	2014-08-31 11:47:24.693368	2014-08-31 11:47:24.693368
17999	5	17	11	2013-12-22	NDTV 24X7 NEWS	2014-08-31 11:47:24.723842	2014-08-31 11:47:24.723842
18000	5	20	11	2013-12-22	NEWS AT A GLANCE	2014-08-31 11:47:24.752354	2014-08-31 11:47:24.752354
18001	5	21	11	2013-12-22	NDTV 24X7 NEWS	2014-08-31 11:47:24.779344	2014-08-31 11:47:24.779344
18002	5	21	11	2013-12-22	NEWS AT A GLANCE	2014-08-31 11:47:24.805529	2014-08-31 11:47:24.805529
18003	5	22	11	2013-12-22	NEWS AT A GLANCE	2014-08-31 11:47:24.83508	2014-08-31 11:47:24.83508
18004	5	22	11	2013-12-22	THE GREAT INDIAN TAMASHA	2014-08-31 11:47:25.141979	2014-08-31 11:47:25.141979
18005	5	20	13	2013-11-29	EFF BRAVE	2014-08-31 11:47:25.169338	2014-08-31 11:47:25.169338
18006	5	21	13	2013-11-29	EFF BRAVE	2014-08-31 11:47:25.19668	2014-08-31 11:47:25.19668
18007	5	22	13	2013-11-29	EFF PRETTY WOMAN	2014-08-31 11:47:25.227587	2014-08-31 11:47:25.227587
18008	5	23	13	2013-11-29	EFF PRETTY WOMAN	2014-08-31 11:47:25.255727	2014-08-31 11:47:25.255727
18009	5	23	13	2013-11-29	EFF PRETTY WOMAN	2014-08-31 11:47:25.281808	2014-08-31 11:47:25.281808
18010	5	8	13	2013-11-30	EFF TITANIC	2014-08-31 11:47:25.306135	2014-08-31 11:47:25.306135
18011	5	8	13	2013-11-30	EFF TITANIC	2014-08-31 11:47:25.34023	2014-08-31 11:47:25.34023
18012	5	9	13	2013-11-30	EFF TITANIC	2014-08-31 11:47:25.653143	2014-08-31 11:47:25.653143
18013	5	11	13	2013-11-30	EFF THE HILLS HAVE EYES II	2014-08-31 11:47:25.681543	2014-08-31 11:47:25.681543
18014	5	12	13	2013-11-30	EFF THE HILLS HAVE EYES II	2014-08-31 11:47:25.7077	2014-08-31 11:47:25.7077
18015	5	12	13	2013-11-30	EFF THE HILLS HAVE EYES II	2014-08-31 11:47:25.738324	2014-08-31 11:47:25.738324
18016	5	21	13	2013-11-30	EFF PARENTAL GUIDANCE	2014-08-31 11:47:25.764894	2014-08-31 11:47:25.764894
18017	5	21	13	2013-11-30	EFF PARENTAL GUIDANCE	2014-08-31 11:47:25.790941	2014-08-31 11:47:25.790941
18018	5	23	13	2013-11-30	EFF THE HILLS HAVE EYES	2014-08-31 11:47:25.818089	2014-08-31 11:47:25.818089
18019	5	23	13	2013-11-30	EFF THE HILLS HAVE EYES	2014-08-31 11:47:25.847594	2014-08-31 11:47:25.847594
18020	5	12	13	2013-12-01	EFF SHANGHAI NOON	2014-08-31 11:47:26.182606	2014-08-31 11:47:26.182606
18021	5	13	13	2013-12-01	EFF SHANGHAI NOON	2014-08-31 11:47:26.210101	2014-08-31 11:47:26.210101
18022	5	14	13	2013-12-01	EFF SHANGHAI NOON	2014-08-31 11:47:26.241713	2014-08-31 11:47:26.241713
18023	5	15	13	2013-12-01	EFF GEORGE OF THE JUNGLE	2014-08-31 11:47:26.269421	2014-08-31 11:47:26.269421
18024	5	16	13	2013-12-01	EFF GEORGE OF THE JUNGLE	2014-08-31 11:47:26.296245	2014-08-31 11:47:26.296245
18025	5	20	13	2013-12-01	EFF ALADDIN	2014-08-31 11:47:26.326055	2014-08-31 11:47:26.326055
18026	5	21	13	2013-12-01	EFF ALADDIN	2014-08-31 11:47:26.351662	2014-08-31 11:47:26.351662
18027	5	22	13	2013-12-01	EFF HELLBOY II THE GOLDEN ARMY	2014-08-31 11:47:26.376876	2014-08-31 11:47:26.376876
18028	5	23	13	2013-12-01	EFF HELLBOY II THE GOLDEN ARMY	2014-08-31 11:47:26.692044	2014-08-31 11:47:26.692044
18029	5	15	13	2013-12-02	EFF THE HILLS HAVE EYES	2014-08-31 11:47:26.720511	2014-08-31 11:47:26.720511
18030	5	16	13	2013-12-02	EFF THE HILLS HAVE EYES	2014-08-31 11:47:26.748691	2014-08-31 11:47:26.748691
18031	5	16	13	2013-12-02	EFF THE HILLS HAVE EYES	2014-08-31 11:47:26.777166	2014-08-31 11:47:26.777166
18032	5	17	13	2013-12-02	EFF THE HILLS HAVE EYES	2014-08-31 11:47:26.805537	2014-08-31 11:47:26.805537
18033	5	20	13	2013-12-02	EFF THE DARKEST HOUR	2014-08-31 11:47:26.836802	2014-08-31 11:47:26.836802
18034	5	20	13	2013-12-02	EFF THE DARKEST HOUR	2014-08-31 11:47:26.862489	2014-08-31 11:47:26.862489
18035	5	21	13	2013-12-02	EFF THE DARKEST HOUR	2014-08-31 11:47:26.887868	2014-08-31 11:47:26.887868
18036	5	22	13	2013-12-02	EFF THE A-TEAM	2014-08-31 11:47:27.199954	2014-08-31 11:47:27.199954
18037	5	22	13	2013-12-02	EFF THE A-TEAM	2014-08-31 11:47:27.230692	2014-08-31 11:47:27.230692
18038	5	16	13	2013-12-03	EFF HELLBOY II THE GOLDEN ARMY	2014-08-31 11:47:27.258504	2014-08-31 11:47:27.258504
18039	5	16	13	2013-12-03	EFF HELLBOY II THE GOLDEN ARMY	2014-08-31 11:47:27.286229	2014-08-31 11:47:27.286229
18040	5	17	13	2013-12-03	EFF HELLBOY II THE GOLDEN ARMY	2014-08-31 11:47:27.313709	2014-08-31 11:47:27.313709
18041	5	17	13	2013-12-03	EFF HELLBOY II THE GOLDEN ARMY	2014-08-31 11:47:27.350395	2014-08-31 11:47:27.350395
18042	5	20	13	2013-12-03	EFF SAFE HOUSE	2014-08-31 11:47:27.37882	2014-08-31 11:47:27.37882
18043	5	21	13	2013-12-03	EFF SAFE HOUSE	2014-08-31 11:47:27.405063	2014-08-31 11:47:27.405063
18044	5	21	13	2013-12-03	EFF SAFE HOUSE	2014-08-31 11:47:27.433114	2014-08-31 11:47:27.433114
18045	5	22	13	2013-12-03	EFF BRAVE	2014-08-31 11:47:27.738192	2014-08-31 11:47:27.738192
18046	5	23	13	2013-12-03	EFF BRAVE	2014-08-31 11:47:27.767947	2014-08-31 11:47:27.767947
18047	5	16	13	2013-12-04	EFF THE KARATE KID	2014-08-31 11:47:27.796958	2014-08-31 11:47:27.796958
18048	5	16	13	2013-12-04	EFF THE KARATE KID	2014-08-31 11:47:27.829452	2014-08-31 11:47:27.829452
18049	5	17	13	2013-12-04	EFF THE KARATE KID	2014-08-31 11:47:27.857508	2014-08-31 11:47:27.857508
18050	5	17	13	2013-12-04	EFF THE KARATE KID	2014-08-31 11:47:27.883511	2014-08-31 11:47:27.883511
18051	5	20	13	2013-12-04	EFF THIS MEANS WAR	2014-08-31 11:47:27.910464	2014-08-31 11:47:27.910464
18052	5	20	13	2013-12-04	EFF THIS MEANS WAR	2014-08-31 11:47:27.935147	2014-08-31 11:47:27.935147
18053	5	21	13	2013-12-04	EFF THIS MEANS WAR	2014-08-31 11:47:28.241303	2014-08-31 11:47:28.241303
18054	5	23	13	2013-12-04	EFF HOT SHOT PART DEUX	2014-08-31 11:47:28.269638	2014-08-31 11:47:28.269638
18055	5	23	13	2013-12-04	EFF HOT SHOT PART DEUX	2014-08-31 11:47:28.296996	2014-08-31 11:47:28.296996
18056	5	15	13	2013-12-05	EFF THE INCREDIBLE HULK	2014-08-31 11:47:28.327375	2014-08-31 11:47:28.327375
18057	5	16	13	2013-12-05	EFF THE INCREDIBLE HULK	2014-08-31 11:47:28.354784	2014-08-31 11:47:28.354784
18058	5	16	13	2013-12-05	EFF THE INCREDIBLE HULK	2014-08-31 11:47:28.3824	2014-08-31 11:47:28.3824
18059	5	17	13	2013-12-05	EFF THE INCREDIBLE HULK	2014-08-31 11:47:28.4072	2014-08-31 11:47:28.4072
18060	5	20	13	2013-12-05	EFF THE AVENGERS	2014-08-31 11:47:28.436382	2014-08-31 11:47:28.436382
18061	5	20	13	2013-12-05	EFF THE AVENGERS	2014-08-31 11:47:28.737754	2014-08-31 11:47:28.737754
18062	5	22	13	2013-12-05	EFF THE AVENGERS	2014-08-31 11:47:28.765646	2014-08-31 11:47:28.765646
18063	5	23	13	2013-12-05	EFF DEUCE BIGALOW: MALE GIGOLO	2014-08-31 11:47:28.794011	2014-08-31 11:47:28.794011
18064	5	23	13	2013-12-05	EFF DEUCE BIGALOW: MALE GIGOLO	2014-08-31 11:47:28.826593	2014-08-31 11:47:28.826593
18065	5	20	13	2013-12-06	EFF LIFE OF PI	2014-08-31 11:47:28.854792	2014-08-31 11:47:28.854792
18066	5	21	13	2013-12-06	EFF LIFE OF PI	2014-08-31 11:47:28.884473	2014-08-31 11:47:28.884473
18067	5	21	13	2013-12-06	EFF LIFE OF PI	2014-08-31 11:47:28.909346	2014-08-31 11:47:28.909346
18068	5	23	13	2013-12-06	EFF PRETTY WOMAN	2014-08-31 11:47:28.937898	2014-08-31 11:47:28.937898
18069	5	23	13	2013-12-06	EFF PRETTY WOMAN	2014-08-31 11:47:29.253793	2014-08-31 11:47:29.253793
18070	5	23	13	2013-12-06	EFF PRETTY WOMAN	2014-08-31 11:47:29.281717	2014-08-31 11:47:29.281717
18071	5	10	13	2013-12-07	EFF THE DARKEST HOUR	2014-08-31 11:47:29.308068	2014-08-31 11:47:29.308068
18072	5	10	13	2013-12-07	EFF THE DARKEST HOUR	2014-08-31 11:47:29.339895	2014-08-31 11:47:29.339895
18073	5	12	13	2013-12-07	EFF THE AVENGERS	2014-08-31 11:47:29.36859	2014-08-31 11:47:29.36859
18074	5	15	13	2013-12-07	EFF TERMINATOR 3 RISE OF THE MACHINES	2014-08-31 11:47:29.396337	2014-08-31 11:47:29.396337
18075	5	15	13	2013-12-07	EFF TERMINATOR 3 RISE OF THE MACHINES	2014-08-31 11:47:29.426259	2014-08-31 11:47:29.426259
18076	5	20	13	2013-12-07	EFF DEATH RACE 3	2014-08-31 11:47:29.453709	2014-08-31 11:47:29.453709
18077	5	20	13	2013-12-07	EFF DEATH RACE 3	2014-08-31 11:47:29.777882	2014-08-31 11:47:29.777882
18078	5	21	13	2013-12-07	EFF DEATH RACE 3	2014-08-31 11:47:29.804436	2014-08-31 11:47:29.804436
18079	5	23	13	2013-12-07	EFF THE INCREDIBLE HULK	2014-08-31 11:47:29.840805	2014-08-31 11:47:29.840805
18080	5	23	13	2013-12-07	EFF THE INCREDIBLE HULK	2014-08-31 11:47:29.870395	2014-08-31 11:47:29.870395
18081	5	10	13	2013-12-08	EFF THE BEST EXOTIC MARIGOLD HOTEL	2014-08-31 11:47:29.899564	2014-08-31 11:47:29.899564
18082	5	10	13	2013-12-08	EFF THE BEST EXOTIC MARIGOLD HOTEL	2014-08-31 11:47:29.932708	2014-08-31 11:47:29.932708
18083	5	11	13	2013-12-08	EFF THE BEST EXOTIC MARIGOLD HOTEL	2014-08-31 11:47:29.961833	2014-08-31 11:47:29.961833
18084	5	12	13	2013-12-08	EFF LIFE OF PI	2014-08-31 11:47:29.989594	2014-08-31 11:47:29.989594
18085	5	13	13	2013-12-08	EFF LIFE OF PI	2014-08-31 11:47:30.304939	2014-08-31 11:47:30.304939
18086	5	14	13	2013-12-08	EFF LIFE OF PI	2014-08-31 11:47:30.338088	2014-08-31 11:47:30.338088
18087	5	20	13	2013-12-08	EFF TRUE LIES	2014-08-31 11:47:30.367082	2014-08-31 11:47:30.367082
18088	5	20	13	2013-12-08	EFF TRUE LIES	2014-08-31 11:47:30.395793	2014-08-31 11:47:30.395793
18089	5	23	13	2013-12-08	EFF NATIONAL TREASURE-BOOK OF	2014-08-31 11:47:30.432581	2014-08-31 11:47:30.432581
18090	5	23	13	2013-12-08	EFF NATIONAL TREASURE-BOOK OF	2014-08-31 11:47:30.460842	2014-08-31 11:47:30.460842
18091	5	16	13	2013-12-09	EFF NATIONAL TREASURE-BOOK OF	2014-08-31 11:47:30.488441	2014-08-31 11:47:30.488441
18092	5	16	13	2013-12-09	EFF NATIONAL TREASURE-BOOK OF	2014-08-31 11:47:30.514486	2014-08-31 11:47:30.514486
18093	5	17	13	2013-12-09	EFF NATIONAL TREASURE-BOOK OF	2014-08-31 11:47:30.544254	2014-08-31 11:47:30.544254
18094	5	17	13	2013-12-09	EFF NATIONAL TREASURE-BOOK OF	2014-08-31 11:47:30.869567	2014-08-31 11:47:30.869567
18095	5	21	13	2013-12-09	EFF THE DESCENDANTS	2014-08-31 11:47:30.896353	2014-08-31 11:47:30.896353
18096	5	21	13	2013-12-09	EFF THE DESCENDANTS	2014-08-31 11:47:30.926818	2014-08-31 11:47:30.926818
18097	5	22	13	2013-12-09	EFF GOAL THE DREAM BEGINS	2014-08-31 11:47:30.953728	2014-08-31 11:47:30.953728
18098	5	23	13	2013-12-09	EFF GOAL THE DREAM BEGINS	2014-08-31 11:47:30.979844	2014-08-31 11:47:30.979844
18099	5	16	13	2013-12-10	EFF THE HOT CHICK	2014-08-31 11:47:31.014509	2014-08-31 11:47:31.014509
18100	5	16	13	2013-12-10	EFF THE HOT CHICK	2014-08-31 11:47:31.064239	2014-08-31 11:47:31.064239
18101	5	16	13	2013-12-10	EFF THE HOT CHICK	2014-08-31 11:47:31.089654	2014-08-31 11:47:31.089654
18102	5	16	13	2013-12-10	EFF THE HOT CHICK	2014-08-31 11:47:31.404555	2014-08-31 11:47:31.404555
18103	5	20	13	2013-12-10	EFF THE THREE STOOGES	2014-08-31 11:47:31.436539	2014-08-31 11:47:31.436539
18104	5	21	13	2013-12-10	EFF THE THREE STOOGES	2014-08-31 11:47:31.46548	2014-08-31 11:47:31.46548
18105	5	22	13	2013-12-10	EFF TOM YUM GOONG	2014-08-31 11:47:31.493774	2014-08-31 11:47:31.493774
18106	5	23	13	2013-12-10	EFF TOM YUM GOONG	2014-08-31 11:47:31.524547	2014-08-31 11:47:31.524547
18107	5	16	13	2013-12-11	EFF THE RECRUIT	2014-08-31 11:47:31.552162	2014-08-31 11:47:31.552162
18108	5	16	13	2013-12-11	EFF THE RECRUIT	2014-08-31 11:47:31.579431	2014-08-31 11:47:31.579431
18109	5	17	13	2013-12-11	EFF THE RECRUIT	2014-08-31 11:47:31.605677	2014-08-31 11:47:31.605677
18110	5	17	13	2013-12-11	EFF THE RECRUIT	2014-08-31 11:47:31.918864	2014-08-31 11:47:31.918864
18111	5	20	13	2013-12-11	EFF A WHITE SNAKES REVENGE	2014-08-31 11:47:31.950104	2014-08-31 11:47:31.950104
18112	5	21	13	2013-12-11	EFF A WHITE SNAKES REVENGE	2014-08-31 11:47:31.983172	2014-08-31 11:47:31.983172
18113	5	23	13	2013-12-11	EFF THE HOT CHICK	2014-08-31 11:47:32.009439	2014-08-31 11:47:32.009439
18114	5	23	13	2013-12-11	EFF THE HOT CHICK	2014-08-31 11:47:32.041621	2014-08-31 11:47:32.041621
18115	5	16	13	2013-12-12	EFF THE AVENGERS	2014-08-31 11:47:32.068618	2014-08-31 11:47:32.068618
18116	5	16	13	2013-12-12	EFF THE AVENGERS	2014-08-31 11:47:32.094123	2014-08-31 11:47:32.094123
18117	5	16	13	2013-12-12	EFF THE AVENGERS	2014-08-31 11:47:32.118448	2014-08-31 11:47:32.118448
18118	5	17	13	2013-12-12	EFF THE AVENGERS	2014-08-31 11:47:32.460056	2014-08-31 11:47:32.460056
18119	5	20	13	2013-12-12	EFF TED	2014-08-31 11:47:32.488386	2014-08-31 11:47:32.488386
18120	5	21	13	2013-12-12	EFF TED	2014-08-31 11:47:32.516014	2014-08-31 11:47:32.516014
18121	5	23	13	2013-12-12	EFF TERMINATOR 3 RISE OF THE MACHINES	2014-08-31 11:47:32.549493	2014-08-31 11:47:32.549493
18122	5	23	13	2013-12-12	EFF TERMINATOR 3 RISE OF THE MACHINES	2014-08-31 11:47:32.577121	2014-08-31 11:47:32.577121
18123	5	20	13	2013-12-13	EFF SNOW WHITE AND THE HUNTSMAN	2014-08-31 11:47:32.603566	2014-08-31 11:47:32.603566
18124	5	21	13	2013-12-13	EFF SNOW WHITE AND THE HUNTSMAN	2014-08-31 11:47:32.632825	2014-08-31 11:47:32.632825
18125	5	23	13	2013-12-13	EFF UNDERWORLD AWAKENING	2014-08-31 11:47:32.669057	2014-08-31 11:47:32.669057
18126	5	23	13	2013-12-13	EFF UNDERWORLD AWAKENING	2014-08-31 11:47:32.982417	2014-08-31 11:47:32.982417
18127	5	6	13	2013-12-14	EFF THE BOURNE LEGACY	2014-08-31 11:47:33.009882	2014-08-31 11:47:33.009882
18128	5	9	13	2013-12-14	EFF SNOW WHITE AND THE HUNTSMAN	2014-08-31 11:47:33.042336	2014-08-31 11:47:33.042336
18129	5	12	13	2013-12-14	EFF PIRANHA 3DD	2014-08-31 11:47:33.069803	2014-08-31 11:47:33.069803
18130	5	14	13	2013-12-14	EFF GHOST RIDER	2014-08-31 11:47:33.097287	2014-08-31 11:47:33.097287
18131	5	14	13	2013-12-14	EFF GHOST RIDER	2014-08-31 11:47:33.127422	2014-08-31 11:47:33.127422
18132	5	20	13	2013-12-14	EFF DIARY OF A WIMPY KID DOG DAYS	2014-08-31 11:47:33.153679	2014-08-31 11:47:33.153679
18133	5	20	13	2013-12-14	EFF DIARY OF A WIMPY KID DOG DAYS	2014-08-31 11:47:33.179724	2014-08-31 11:47:33.179724
18134	5	22	13	2013-12-14	EFF THE LOST WORLD JURASSIC PARK	2014-08-31 11:47:33.485314	2014-08-31 11:47:33.485314
18135	5	23	13	2013-12-14	EFF THE LOST WORLD JURASSIC PARK	2014-08-31 11:47:33.512083	2014-08-31 11:47:33.512083
18136	5	11	13	2013-12-15	EFF UP	2014-08-31 11:47:33.548268	2014-08-31 11:47:33.548268
18137	5	12	13	2013-12-15	EFF UP	2014-08-31 11:47:33.575083	2014-08-31 11:47:33.575083
18138	5	13	13	2013-12-15	EFF TERMINATOR 3 RISE OF THE MACHINES	2014-08-31 11:47:33.601529	2014-08-31 11:47:33.601529
18139	5	14	13	2013-12-15	EFF TERMINATOR 3 RISE OF THE MACHINES	2014-08-31 11:47:33.632377	2014-08-31 11:47:33.632377
18140	5	15	13	2013-12-15	EFF TERMINATOR 2 JUDGMENT DAY	2014-08-31 11:47:33.658625	2014-08-31 11:47:33.658625
18141	5	20	13	2013-12-15	EFF TITANIC	2014-08-31 11:47:33.684649	2014-08-31 11:47:33.684649
18142	5	21	13	2013-12-15	EFF TITANIC	2014-08-31 11:47:33.709272	2014-08-31 11:47:33.709272
18143	5	22	13	2013-12-15	EFF TITANIC	2014-08-31 11:47:34.022627	2014-08-31 11:47:34.022627
18144	5	23	13	2013-12-15	EFF TITANIC	2014-08-31 11:47:34.051348	2014-08-31 11:47:34.051348
18145	5	16	13	2013-12-16	EFF THE LOST WORLD JURASSIC PARK	2014-08-31 11:47:34.07923	2014-08-31 11:47:34.07923
18146	5	16	13	2013-12-16	EFF THE LOST WORLD JURASSIC PARK	2014-08-31 11:47:34.108726	2014-08-31 11:47:34.108726
18147	5	16	13	2013-12-16	EFF THE LOST WORLD JURASSIC PARK	2014-08-31 11:47:34.144147	2014-08-31 11:47:34.144147
18148	5	17	13	2013-12-16	EFF THE LOST WORLD JURASSIC PARK	2014-08-31 11:47:34.170669	2014-08-31 11:47:34.170669
18149	5	21	13	2013-12-16	EFF THE BOURNE LEGACY	2014-08-31 11:47:34.19797	2014-08-31 11:47:34.19797
18150	5	21	13	2013-12-16	EFF THE BOURNE LEGACY	2014-08-31 11:47:34.227038	2014-08-31 11:47:34.227038
18151	5	23	13	2013-12-16	EFF KUNG FU HUSTLE	2014-08-31 11:47:34.53518	2014-08-31 11:47:34.53518
18152	5	23	13	2013-12-16	EFF KUNG FU HUSTLE	2014-08-31 11:47:34.563919	2014-08-31 11:47:34.563919
18153	5	16	13	2013-12-17	EFF TITANIC	2014-08-31 11:47:34.592118	2014-08-31 11:47:34.592118
18154	5	16	13	2013-12-17	EFF TITANIC	2014-08-31 11:47:34.618627	2014-08-31 11:47:34.618627
18155	5	17	13	2013-12-17	EFF TITANIC	2014-08-31 11:47:34.650049	2014-08-31 11:47:34.650049
18156	5	17	13	2013-12-17	EFF TITANIC	2014-08-31 11:47:34.677349	2014-08-31 11:47:34.677349
18157	5	20	13	2013-12-17	EFF ICE AGE 4 CONTINENTAL DRIFT	2014-08-31 11:47:34.703547	2014-08-31 11:47:34.703547
18158	5	21	13	2013-12-17	EFF ICE AGE 4 CONTINENTAL DRIFT	2014-08-31 11:47:34.733342	2014-08-31 11:47:34.733342
18159	5	22	13	2013-12-17	EFF PERCY JACKSON & THE LIGHTNING THIEF	2014-08-31 11:47:35.063475	2014-08-31 11:47:35.063475
18160	5	23	13	2013-12-17	EFF PERCY JACKSON & THE LIGHTNING THIEF	2014-08-31 11:47:35.091516	2014-08-31 11:47:35.091516
18161	5	16	13	2013-12-18	EFF PERCY JACKSON & THE LIGHTNING THIEF	2014-08-31 11:47:35.118986	2014-08-31 11:47:35.118986
18162	5	16	13	2013-12-18	EFF PERCY JACKSON & THE LIGHTNING THIEF	2014-08-31 11:47:35.147807	2014-08-31 11:47:35.147807
18163	5	16	13	2013-12-18	EFF PERCY JACKSON & THE LIGHTNING THIEF	2014-08-31 11:47:35.176565	2014-08-31 11:47:35.176565
18164	5	17	13	2013-12-18	EFF PERCY JACKSON & THE LIGHTNING THIEF	2014-08-31 11:47:35.203827	2014-08-31 11:47:35.203827
18165	5	20	13	2013-12-18	EFF PIRANHA 3DD	2014-08-31 11:47:35.235196	2014-08-31 11:47:35.235196
18166	5	20	13	2013-12-18	EFF PIRANHA 3DD	2014-08-31 11:47:35.262775	2014-08-31 11:47:35.262775
18167	5	22	13	2013-12-18	EFF LOCKOUT	2014-08-31 11:47:35.581561	2014-08-31 11:47:35.581561
18168	5	23	13	2013-12-18	EFF LOCKOUT	2014-08-31 11:47:35.608315	2014-08-31 11:47:35.608315
18169	5	16	13	2013-12-19	EFF TED	2014-08-31 11:47:35.638798	2014-08-31 11:47:35.638798
18170	5	16	13	2013-12-19	EFF TED	2014-08-31 11:47:35.665069	2014-08-31 11:47:35.665069
18171	5	16	13	2013-12-19	EFF TED	2014-08-31 11:47:35.691965	2014-08-31 11:47:35.691965
18172	5	17	13	2013-12-19	EFF TED	2014-08-31 11:47:35.723062	2014-08-31 11:47:35.723062
18173	5	22	13	2013-12-19	EFF GLADIATOR	2014-08-31 11:47:35.750141	2014-08-31 11:47:35.750141
18174	5	23	13	2013-12-19	EFF GLADIATOR	2014-08-31 11:47:35.776399	2014-08-31 11:47:35.776399
18175	5	21	13	2013-12-20	EFF BATTLESHIP	2014-08-31 11:47:36.136831	2014-08-31 11:47:36.136831
18176	5	21	13	2013-12-20	EFF BATTLESHIP	2014-08-31 11:47:36.167034	2014-08-31 11:47:36.167034
18177	5	22	13	2013-12-20	EFF THE TWILIGHT SAGA BREAKING DAWN	2014-08-31 11:47:36.195352	2014-08-31 11:47:36.195352
18178	5	23	13	2013-12-20	EFF THE TWILIGHT SAGA BREAKING DAWN	2014-08-31 11:47:36.231727	2014-08-31 11:47:36.231727
18179	5	8	13	2013-12-21	EFF JOHN CARTER	2014-08-31 11:47:36.261121	2014-08-31 11:47:36.261121
18180	5	9	13	2013-12-21	EFF JOHN CARTER	2014-08-31 11:47:36.289282	2014-08-31 11:47:36.289282
18181	5	13	13	2013-12-21	EFF BATTLESHIP	2014-08-31 11:47:36.315816	2014-08-31 11:47:36.315816
18182	5	15	13	2013-12-21	EFF BATTLESHIP	2014-08-31 11:47:36.3475	2014-08-31 11:47:36.3475
18183	5	22	13	2013-12-21	EFF TERMINATOR 2 JUDGMENT DAY	2014-08-31 11:47:36.676309	2014-08-31 11:47:36.676309
18184	5	23	13	2013-12-21	EFF TERMINATOR 2 JUDGMENT DAY	2014-08-31 11:47:36.703104	2014-08-31 11:47:36.703104
18185	5	10	13	2013-12-22	EFF MR BEANS HOLIDAY	2014-08-31 11:47:36.734211	2014-08-31 11:47:36.734211
18186	5	10	13	2013-12-22	EFF MR BEANS HOLIDAY	2014-08-31 11:47:36.760542	2014-08-31 11:47:36.760542
18187	5	11	13	2013-12-22	EFF MR BEANS HOLIDAY	2014-08-31 11:47:36.786904	2014-08-31 11:47:36.786904
18188	5	11	13	2013-12-22	EFF MR BEANS HOLIDAY	2014-08-31 11:47:36.812968	2014-08-31 11:47:36.812968
18189	5	20	13	2013-12-22	EFF VOLCANO	2014-08-31 11:47:36.843605	2014-08-31 11:47:36.843605
18190	5	20	13	2013-12-22	EFF VOLCANO	2014-08-31 11:47:36.870764	2014-08-31 11:47:36.870764
18191	5	16	13	2013-12-23	EFF JOHN CARTER	2014-08-31 11:47:36.895969	2014-08-31 11:47:36.895969
18192	5	17	13	2013-12-23	EFF JOHN CARTER	2014-08-31 11:47:37.219422	2014-08-31 11:47:37.219422
18193	5	17	13	2013-12-23	EFF JOHN CARTER	2014-08-31 11:47:37.250434	2014-08-31 11:47:37.250434
18194	5	17	13	2013-12-24	EFF INDEPENDENCE DAY	2014-08-31 11:47:37.277018	2014-08-31 11:47:37.277018
18195	5	17	13	2013-12-24	EFF INDEPENDENCE DAY	2014-08-31 11:47:37.302944	2014-08-31 11:47:37.302944
18196	5	17	13	2013-12-24	EFF INDEPENDENCE DAY	2014-08-31 11:47:37.333233	2014-08-31 11:47:37.333233
18197	5	16	13	2013-12-25	EFF THE ADVENTURES OF TINTIN	2014-08-31 11:47:37.358786	2014-08-31 11:47:37.358786
18198	5	16	13	2013-12-25	EFF THE ADVENTURES OF TINTIN	2014-08-31 11:47:37.384337	2014-08-31 11:47:37.384337
18199	5	17	13	2013-12-25	EFF THE ADVENTURES OF TINTIN	2014-08-31 11:47:37.410784	2014-08-31 11:47:37.410784
18200	5	16	13	2013-12-26	EFF BRUCE ALMIGHTY	2014-08-31 11:47:37.731462	2014-08-31 11:47:37.731462
18201	5	16	13	2013-12-26	EFF BRUCE ALMIGHTY	2014-08-31 11:47:37.76125	2014-08-31 11:47:37.76125
18202	5	17	13	2013-12-26	EFF BRUCE ALMIGHTY	2014-08-31 11:47:37.78827	2014-08-31 11:47:37.78827
18203	5	20	14	2013-12-01	KOFFEE WITH KARAN 4	2014-08-31 11:47:37.815056	2014-08-31 11:47:37.815056
18204	5	20	14	2013-12-01	KOFFEE WITH KARAN 4	2014-08-31 11:47:37.846755	2014-08-31 11:47:37.846755
18205	5	18	14	2013-12-02	KOFFEE WITH KARAN 4	2014-08-31 11:47:37.873583	2014-08-31 11:47:37.873583
18206	5	18	14	2013-12-02	KOFFEE WITH KARAN 4	2014-08-31 11:47:37.899849	2014-08-31 11:47:37.899849
18207	5	18	14	2013-12-04	KOFFEE WITH KARAN 4	2014-08-31 11:47:37.930819	2014-08-31 11:47:37.930819
18208	5	18	14	2013-12-04	KOFFEE WITH KARAN 4	2014-08-31 11:47:38.232929	2014-08-31 11:47:38.232929
18209	5	20	14	2013-12-08	KOFFEE WITH KARAN 4	2014-08-31 11:47:38.260614	2014-08-31 11:47:38.260614
18210	5	20	14	2013-12-08	KOFFEE WITH KARAN 4	2014-08-31 11:47:38.286892	2014-08-31 11:47:38.286892
18211	5	20	14	2013-12-08	KOFFEE WITH KARAN 4	2014-08-31 11:47:38.314638	2014-08-31 11:47:38.314638
18212	5	20	14	2013-12-08	KOFFEE WITH KARAN 4	2014-08-31 11:47:38.3474	2014-08-31 11:47:38.3474
18213	5	18	14	2013-12-15	KOFFEE WITH KARAN 4	2014-08-31 11:47:38.374343	2014-08-31 11:47:38.374343
18214	5	18	14	2013-12-15	KOFFEE WITH KARAN 4	2014-08-31 11:47:38.400495	2014-08-31 11:47:38.400495
18215	5	18	14	2013-12-15	KOFFEE WITH KARAN 4	2014-08-31 11:47:38.430187	2014-08-31 11:47:38.430187
18216	5	20	14	2013-12-15	KOFFEE WITH KARAN 4	2014-08-31 11:47:38.754288	2014-08-31 11:47:38.754288
18217	5	20	14	2013-12-15	KOFFEE WITH KARAN 4	2014-08-31 11:47:38.781924	2014-08-31 11:47:38.781924
18218	5	20	14	2013-12-15	KOFFEE WITH KARAN 4	2014-08-31 11:47:38.808583	2014-08-31 11:47:38.808583
18219	5	20	14	2013-12-15	KOFFEE WITH KARAN 4	2014-08-31 11:47:38.83919	2014-08-31 11:47:38.83919
18220	5	18	14	2013-12-22	KOFFEE WITH KARAN 4	2014-08-31 11:47:38.865961	2014-08-31 11:47:38.865961
18221	5	18	14	2013-12-22	KOFFEE WITH KARAN 4	2014-08-31 11:47:38.893371	2014-08-31 11:47:38.893371
18222	5	18	14	2013-12-22	KOFFEE WITH KARAN 4	2014-08-31 11:47:38.918509	2014-08-31 11:47:38.918509
18223	5	20	14	2013-12-22	KOFFEE WITH KARAN 4	2014-08-31 11:47:38.947382	2014-08-31 11:47:38.947382
18224	5	20	14	2013-12-22	KOFFEE WITH KARAN 4	2014-08-31 11:47:39.263687	2014-08-31 11:47:39.263687
18225	5	20	14	2013-12-22	KOFFEE WITH KARAN 4	2014-08-31 11:47:39.292815	2014-08-31 11:47:39.292815
18226	5	20	14	2013-12-22	KOFFEE WITH KARAN 4	2014-08-31 11:47:39.323929	2014-08-31 11:47:39.323929
18227	5	16	15	2013-11-29	FLOYDS INDIA	2014-08-31 11:47:39.351096	2014-08-31 11:47:39.351096
18228	5	16	15	2013-11-29	FLOYDS INDIA	2014-08-31 11:47:39.379774	2014-08-31 11:47:39.379774
18229	5	17	15	2013-11-29	FLOYDS INDIA	2014-08-31 11:47:39.406234	2014-08-31 11:47:39.406234
18230	5	18	15	2013-11-29	FABULOUS CAKES	2014-08-31 11:47:39.436871	2014-08-31 11:47:39.436871
18231	5	18	15	2013-11-29	FABULOUS CAKES	2014-08-31 11:47:39.463108	2014-08-31 11:47:39.463108
18232	5	19	15	2013-11-29	RAVINDERS KITCHEN	2014-08-31 11:47:39.77607	2014-08-31 11:47:39.77607
18233	5	19	15	2013-11-29	JAMIES 15 MINUTE MEALS	2014-08-31 11:47:39.804208	2014-08-31 11:47:39.804208
18234	5	20	15	2013-11-29	ARMANDOS ASIAN TWIST	2014-08-31 11:47:39.835289	2014-08-31 11:47:39.835289
18235	5	20	15	2013-11-29	ARMANDOS ASIAN TWIST	2014-08-31 11:47:39.86272	2014-08-31 11:47:39.86272
18236	5	21	15	2013-11-29	RAVINDERS KITCHEN	2014-08-31 11:47:39.890921	2014-08-31 11:47:39.890921
18237	5	22	15	2013-11-29	GET OUT	2014-08-31 11:47:39.917264	2014-08-31 11:47:39.917264
18238	5	22	15	2013-11-29	GET OUT	2014-08-31 11:47:39.946847	2014-08-31 11:47:39.946847
18239	5	7	15	2013-11-30	NAMASTE	2014-08-31 11:47:39.973154	2014-08-31 11:47:39.973154
18240	5	7	15	2013-11-30	NAMASTE	2014-08-31 11:47:40.272673	2014-08-31 11:47:40.272673
18241	5	8	15	2013-11-30	ARMANDOS ASIAN TWIST	2014-08-31 11:47:40.311183	2014-08-31 11:47:40.311183
18242	5	9	15	2013-11-30	THE ORIGINALS WITH EMERIL	2014-08-31 11:47:40.342164	2014-08-31 11:47:40.342164
18243	5	9	15	2013-11-30	THE ORIGINALS WITH EMERIL	2014-08-31 11:47:40.368823	2014-08-31 11:47:40.368823
18244	5	12	15	2013-11-30	THE ORIGINALS WITH EMERIL	2014-08-31 11:47:40.395625	2014-08-31 11:47:40.395625
18245	5	13	15	2013-11-30	THE ORIGINALS WITH EMERIL	2014-08-31 11:47:40.426067	2014-08-31 11:47:40.426067
18246	5	14	15	2013-11-30	THE ORIGINALS WITH EMERIL	2014-08-31 11:47:40.451644	2014-08-31 11:47:40.451644
18247	5	16	15	2013-11-30	RAVINDERS KITCHEN	2014-08-31 11:47:40.482894	2014-08-31 11:47:40.482894
18248	5	16	15	2013-11-30	RAVINDERS KITCHEN	2014-08-31 11:47:40.507007	2014-08-31 11:47:40.507007
18249	5	19	15	2013-11-30	RAVINDERS KITCHEN	2014-08-31 11:47:40.822051	2014-08-31 11:47:40.822051
18250	5	20	15	2013-11-30	EPIC	2014-08-31 11:47:40.849741	2014-08-31 11:47:40.849741
18251	5	21	15	2013-11-30	RAVINDERS KITCHEN	2014-08-31 11:47:40.876809	2014-08-31 11:47:40.876809
18252	5	6	15	2013-12-01	EPIC	2014-08-31 11:47:40.903273	2014-08-31 11:47:40.903273
18253	5	8	15	2013-12-01	ARMANDOS ASIAN TWIST	2014-08-31 11:47:40.933171	2014-08-31 11:47:40.933171
18254	5	9	15	2013-12-01	HOW TO COOK LIKE HESTON	2014-08-31 11:47:40.962288	2014-08-31 11:47:40.962288
18255	5	10	15	2013-12-01	HOW TO COOK LIKE HESTON	2014-08-31 11:47:40.989939	2014-08-31 11:47:40.989939
18256	5	11	15	2013-12-01	WORLDS WEIRDEST RESTAURANTS	2014-08-31 11:47:41.045699	2014-08-31 11:47:41.045699
18257	5	12	15	2013-12-01	WORLDS WEIRDEST RESTAURANTS	2014-08-31 11:47:41.361674	2014-08-31 11:47:41.361674
18258	5	14	15	2013-12-01	WORLDS WEIRDEST RESTAURANTS	2014-08-31 11:47:41.389447	2014-08-31 11:47:41.389447
18259	5	16	15	2013-12-01	PROJECT RUNWAY	2014-08-31 11:47:41.416861	2014-08-31 11:47:41.416861
18260	5	17	15	2013-12-01	STYLE INC WITH AALIM HAKIM	2014-08-31 11:47:41.449203	2014-08-31 11:47:41.449203
18261	5	18	15	2013-12-01	AMAZING EATS	2014-08-31 11:47:41.478279	2014-08-31 11:47:41.478279
18262	5	19	15	2013-12-01	JAMIES 15 MINUTE MEALS	2014-08-31 11:47:41.509521	2014-08-31 11:47:41.509521
18263	5	21	15	2013-12-01	RAVINDERS KITCHEN	2014-08-31 11:47:41.539024	2014-08-31 11:47:41.539024
18264	5	22	15	2013-12-01	AMERICAS WORST TATTOOS	2014-08-31 11:47:41.563959	2014-08-31 11:47:41.563959
18265	5	16	15	2013-12-02	WORLD CAFE ASIA	2014-08-31 11:47:41.877925	2014-08-31 11:47:41.877925
18266	5	16	15	2013-12-02	WORLD CAFE ASIA	2014-08-31 11:47:41.907536	2014-08-31 11:47:41.907536
18267	5	17	15	2013-12-02	WORLD CAFE ASIA	2014-08-31 11:47:41.939237	2014-08-31 11:47:41.939237
18268	5	17	15	2013-12-02	WORLD CAFE ASIA	2014-08-31 11:47:41.96675	2014-08-31 11:47:41.96675
18269	5	18	15	2013-12-02	ULTIMATE CAKE OFF	2014-08-31 11:47:41.994227	2014-08-31 11:47:41.994227
18270	5	18	15	2013-12-02	ULTIMATE CAKE OFF	2014-08-31 11:47:42.026085	2014-08-31 11:47:42.026085
18271	5	19	15	2013-12-02	JAMIES 15 MINUTE MEALS	2014-08-31 11:47:42.053492	2014-08-31 11:47:42.053492
18272	5	20	15	2013-12-02	MATTHEW HAYDENS HOME GROUND	2014-08-31 11:47:42.0835	2014-08-31 11:47:42.0835
18273	5	20	15	2013-12-02	MATTHEW HAYDENS HOME GROUND	2014-08-31 11:47:42.374059	2014-08-31 11:47:42.374059
18274	5	21	15	2013-12-02	THE LITTLE PARIS KITCHEN	2014-08-31 11:47:42.400977	2014-08-31 11:47:42.400977
18275	5	21	15	2013-12-02	TASTE OFF	2014-08-31 11:47:42.43167	2014-08-31 11:47:42.43167
18276	5	21	15	2013-12-02	TASTE OFF	2014-08-31 11:47:42.459002	2014-08-31 11:47:42.459002
18277	5	22	15	2013-12-02	GET OUT	2014-08-31 11:47:42.48606	2014-08-31 11:47:42.48606
18278	5	22	15	2013-12-02	GET OUT	2014-08-31 11:47:42.511965	2014-08-31 11:47:42.511965
18279	5	16	15	2013-12-03	KITCHEN BOSS	2014-08-31 11:47:42.541647	2014-08-31 11:47:42.541647
18280	5	16	15	2013-12-03	KITCHEN BOSS	2014-08-31 11:47:42.567005	2014-08-31 11:47:42.567005
18281	5	17	15	2013-12-03	KITCHEN BOSS	2014-08-31 11:47:42.857802	2014-08-31 11:47:42.857802
18282	5	17	15	2013-12-03	KITCHEN BOSS	2014-08-31 11:47:42.888309	2014-08-31 11:47:42.888309
18283	5	18	15	2013-12-03	ULTIMATE CAKE OFF	2014-08-31 11:47:42.914631	2014-08-31 11:47:42.914631
18284	5	18	15	2013-12-03	ULTIMATE CAKE OFF	2014-08-31 11:47:42.945796	2014-08-31 11:47:42.945796
18285	5	19	15	2013-12-03	RAVINDERS KITCHEN	2014-08-31 11:47:42.978876	2014-08-31 11:47:42.978876
18286	5	19	15	2013-12-03	JAMIES 15 MINUTE MEALS	2014-08-31 11:47:43.009738	2014-08-31 11:47:43.009738
18287	5	20	15	2013-12-03	WORLD CAFE MIDDLE EAST	2014-08-31 11:47:43.04056	2014-08-31 11:47:43.04056
18288	5	20	15	2013-12-03	WORLD CAFE MIDDLE EAST	2014-08-31 11:47:43.068265	2014-08-31 11:47:43.068265
18289	5	21	15	2013-12-03	THE LITTLE PARIS KITCHEN	2014-08-31 11:47:43.385611	2014-08-31 11:47:43.385611
18290	5	21	15	2013-12-03	AMAZING EATS	2014-08-31 11:47:43.415407	2014-08-31 11:47:43.415407
18291	5	22	15	2013-12-03	GET OUT	2014-08-31 11:47:43.446858	2014-08-31 11:47:43.446858
18292	5	22	15	2013-12-03	GET OUT	2014-08-31 11:47:43.473309	2014-08-31 11:47:43.473309
18293	5	16	15	2013-12-04	CHEESE SLICES	2014-08-31 11:47:43.500292	2014-08-31 11:47:43.500292
18294	5	16	15	2013-12-04	CHEESE SLICES	2014-08-31 11:47:43.526815	2014-08-31 11:47:43.526815
18295	5	17	15	2013-12-04	CHEESE SLICES	2014-08-31 11:47:43.555318	2014-08-31 11:47:43.555318
18296	5	17	15	2013-12-04	CHEESE SLICES	2014-08-31 11:47:43.583382	2014-08-31 11:47:43.583382
18297	5	17	15	2013-12-04	CHEESE SLICES	2014-08-31 11:47:43.608675	2014-08-31 11:47:43.608675
18298	5	18	15	2013-12-04	ULTIMATE CAKE OFF	2014-08-31 11:47:43.917042	2014-08-31 11:47:43.917042
18299	5	19	15	2013-12-04	RAVINDERS KITCHEN	2014-08-31 11:47:43.953343	2014-08-31 11:47:43.953343
18300	5	19	15	2013-12-04	JAMIES 15 MINUTE MEALS	2014-08-31 11:47:43.984751	2014-08-31 11:47:43.984751
18301	5	20	15	2013-12-04	BEACH LIFE WITH ANGELA KAN	2014-08-31 11:47:44.014555	2014-08-31 11:47:44.014555
18302	5	20	15	2013-12-04	MAN V FOOD	2014-08-31 11:47:44.043869	2014-08-31 11:47:44.043869
18303	5	21	15	2013-12-04	THE LITTLE PARIS KITCHEN	2014-08-31 11:47:44.071802	2014-08-31 11:47:44.071802
18304	5	21	15	2013-12-04	TRINNY & SUSANNAHS MAKEOVER MISSION INDI	2014-08-31 11:47:44.103204	2014-08-31 11:47:44.103204
18305	5	22	15	2013-12-04	GET OUT	2014-08-31 11:47:44.133416	2014-08-31 11:47:44.133416
18306	5	22	15	2013-12-04	GET OUT	2014-08-31 11:47:44.443613	2014-08-31 11:47:44.443613
18307	5	16	15	2013-12-05	TASTE OFF	2014-08-31 11:47:44.476451	2014-08-31 11:47:44.476451
18308	5	16	15	2013-12-05	TASTE OFF	2014-08-31 11:47:44.507382	2014-08-31 11:47:44.507382
18309	5	16	15	2013-12-05	TASTE OFF	2014-08-31 11:47:44.541198	2014-08-31 11:47:44.541198
18310	5	17	15	2013-12-05	TASTE OFF	2014-08-31 11:47:44.571614	2014-08-31 11:47:44.571614
18311	5	17	15	2013-12-05	TASTE OFF	2014-08-31 11:47:44.599	2014-08-31 11:47:44.599
18312	5	18	15	2013-12-05	ULTIMATE CAKE OFF	2014-08-31 11:47:44.630139	2014-08-31 11:47:44.630139
18313	5	18	15	2013-12-05	ULTIMATE CAKE OFF	2014-08-31 11:47:44.65777	2014-08-31 11:47:44.65777
18314	5	19	15	2013-12-05	JAMIES 15 MINUTE MEALS	2014-08-31 11:47:44.972286	2014-08-31 11:47:44.972286
18315	5	19	15	2013-12-05	JAMIES 15 MINUTE MEALS	2014-08-31 11:47:45.000182	2014-08-31 11:47:45.000182
18316	5	20	15	2013-12-05	PILOT GLOBE GUIDES	2014-08-31 11:47:45.031856	2014-08-31 11:47:45.031856
18317	5	20	15	2013-12-05	LONELY PLANET BEST IN ASIA	2014-08-31 11:47:45.058573	2014-08-31 11:47:45.058573
18318	5	21	15	2013-12-05	FAST FOOD MANIA	2014-08-31 11:47:45.086276	2014-08-31 11:47:45.086276
18319	5	21	15	2013-12-05	FAST FOOD MANIA	2014-08-31 11:47:45.112529	2014-08-31 11:47:45.112529
18320	5	22	15	2013-12-05	GET OUT	2014-08-31 11:47:45.138099	2014-08-31 11:47:45.138099
18321	5	16	15	2013-12-06	JAMIE AT HOME	2014-08-31 11:47:45.164067	2014-08-31 11:47:45.164067
18322	5	16	15	2013-12-06	JAMIE AT HOME	2014-08-31 11:47:45.482365	2014-08-31 11:47:45.482365
18323	5	17	15	2013-12-06	JAMIE AT HOME	2014-08-31 11:47:45.514243	2014-08-31 11:47:45.514243
18324	5	17	15	2013-12-06	JAMIE AT HOME	2014-08-31 11:47:45.548415	2014-08-31 11:47:45.548415
18325	5	18	15	2013-12-06	ULTIMATE CAKE OFF	2014-08-31 11:47:45.577546	2014-08-31 11:47:45.577546
18326	5	19	15	2013-12-06	RAVINDERS KITCHEN	2014-08-31 11:47:45.605634	2014-08-31 11:47:45.605634
18327	5	19	15	2013-12-06	JAMIES 15 MINUTE MEALS	2014-08-31 11:47:45.637453	2014-08-31 11:47:45.637453
18328	5	20	15	2013-12-06	SPICE TRIP	2014-08-31 11:47:45.664128	2014-08-31 11:47:45.664128
18329	5	20	15	2013-12-06	SPICE TRIP	2014-08-31 11:47:45.689364	2014-08-31 11:47:45.689364
18330	5	20	15	2013-12-06	SPICE TRIP	2014-08-31 11:47:45.991978	2014-08-31 11:47:45.991978
18331	5	21	15	2013-12-06	NIGELLISSIMA	2014-08-31 11:47:46.046843	2014-08-31 11:47:46.046843
18332	5	21	15	2013-12-06	JAMIES BIG FESTIVAL	2014-08-31 11:47:46.084701	2014-08-31 11:47:46.084701
18333	5	22	15	2013-12-06	GET OUT	2014-08-31 11:47:46.112195	2014-08-31 11:47:46.112195
18334	5	22	15	2013-12-06	GET OUT	2014-08-31 11:47:46.14315	2014-08-31 11:47:46.14315
18335	5	6	15	2013-12-07	SPICE TRIP	2014-08-31 11:47:46.169667	2014-08-31 11:47:46.169667
18336	5	6	15	2013-12-07	SPICE TRIP	2014-08-31 11:47:46.197335	2014-08-31 11:47:46.197335
18337	5	7	15	2013-12-07	NAMASTE	2014-08-31 11:47:46.227868	2014-08-31 11:47:46.227868
18338	5	7	15	2013-12-07	PILOT GLOBE GUIDES	2014-08-31 11:47:46.606845	2014-08-31 11:47:46.606845
18339	5	8	15	2013-12-07	ARMANDOS ASIAN TWIST	2014-08-31 11:47:46.662933	2014-08-31 11:47:46.662933
18340	5	9	15	2013-12-07	TAKE HOME CHEF	2014-08-31 11:47:46.713733	2014-08-31 11:47:46.713733
18341	5	10	15	2013-12-07	TAKE HOME CHEF	2014-08-31 11:47:46.769741	2014-08-31 11:47:46.769741
18342	5	12	15	2013-12-07	TAKE HOME CHEF	2014-08-31 11:47:46.819224	2014-08-31 11:47:46.819224
18343	5	13	15	2013-12-07	TAKE HOME CHEF	2014-08-31 11:47:46.870669	2014-08-31 11:47:46.870669
18344	5	14	15	2013-12-07	TAKE HOME CHEF	2014-08-31 11:47:46.912909	2014-08-31 11:47:46.912909
18345	5	15	15	2013-12-07	ARMANDOS ASIAN TWIST	2014-08-31 11:47:46.956719	2014-08-31 11:47:46.956719
18346	5	18	15	2013-12-07	INVITE MR WRIGHT	2014-08-31 11:47:46.994768	2014-08-31 11:47:46.994768
18347	5	19	15	2013-12-07	JAMIES 15 MINUTE MEALS	2014-08-31 11:47:47.414392	2014-08-31 11:47:47.414392
18348	5	21	15	2013-12-07	UBERGUIDE	2014-08-31 11:47:47.453633	2014-08-31 11:47:47.453633
18349	5	6	15	2013-12-08	EPIC	2014-08-31 11:47:47.486601	2014-08-31 11:47:47.486601
18350	5	7	15	2013-12-08	NAMASTE	2014-08-31 11:47:47.517636	2014-08-31 11:47:47.517636
18351	5	9	15	2013-12-08	RUDE BOY FOOD	2014-08-31 11:47:47.552033	2014-08-31 11:47:47.552033
18352	5	10	15	2013-12-08	RUDE BOY FOOD	2014-08-31 11:47:47.583504	2014-08-31 11:47:47.583504
18353	5	11	15	2013-12-08	RUDE BOY FOOD	2014-08-31 11:47:47.613911	2014-08-31 11:47:47.613911
18354	5	12	15	2013-12-08	JAMIE AT HOME	2014-08-31 11:47:47.650972	2014-08-31 11:47:47.650972
18355	5	13	15	2013-12-08	JAMIE AT HOME	2014-08-31 11:47:47.977799	2014-08-31 11:47:47.977799
18356	5	14	15	2013-12-08	JAMIE AT HOME	2014-08-31 11:47:48.005386	2014-08-31 11:47:48.005386
18357	5	15	15	2013-12-08	INVITE MR WRIGHT	2014-08-31 11:47:48.041064	2014-08-31 11:47:48.041064
18358	5	17	15	2013-12-08	STYLE STAR	2014-08-31 11:47:48.069281	2014-08-31 11:47:48.069281
18359	5	18	15	2013-12-08	AMAZING EATS	2014-08-31 11:47:48.098316	2014-08-31 11:47:48.098316
18360	5	20	15	2013-12-08	RICK STEINS INDIA	2014-08-31 11:47:48.13189	2014-08-31 11:47:48.13189
18361	5	21	15	2013-12-08	SUPER SWANK	2014-08-31 11:47:48.161161	2014-08-31 11:47:48.161161
18362	5	22	15	2013-12-08	GET OUT	2014-08-31 11:47:48.189421	2014-08-31 11:47:48.189421
18363	5	16	15	2013-12-09	HOW TO COOK LIKE HESTON	2014-08-31 11:47:48.520603	2014-08-31 11:47:48.520603
18364	5	16	15	2013-12-09	HOW TO COOK LIKE HESTON	2014-08-31 11:47:48.552917	2014-08-31 11:47:48.552917
18365	5	17	15	2013-12-09	HOW TO COOK LIKE HESTON	2014-08-31 11:47:48.580202	2014-08-31 11:47:48.580202
18366	5	17	15	2013-12-09	HOW TO COOK LIKE HESTON	2014-08-31 11:47:48.606428	2014-08-31 11:47:48.606428
18367	5	18	15	2013-12-09	ULTIMATE CAKE OFF	2014-08-31 11:47:48.637464	2014-08-31 11:47:48.637464
18368	5	18	15	2013-12-09	ULTIMATE CAKE OFF	2014-08-31 11:47:48.663551	2014-08-31 11:47:48.663551
18369	5	19	15	2013-12-09	NIGELLAS CHRISTMAS KITCHEN	2014-08-31 11:47:48.688402	2014-08-31 11:47:48.688402
18370	5	19	15	2013-12-09	RACHEL ALLEN BAKE	2014-08-31 11:47:48.726726	2014-08-31 11:47:48.726726
18371	5	20	15	2013-12-09	MATTHEW HAYDENS HOME GROUND	2014-08-31 11:47:49.028083	2014-08-31 11:47:49.028083
18372	5	21	15	2013-12-09	THE LITTLE PARIS KITCHEN	2014-08-31 11:47:49.056581	2014-08-31 11:47:49.056581
18373	5	21	15	2013-12-09	RAVINDERS KITCHEN	2014-08-31 11:47:49.085278	2014-08-31 11:47:49.085278
18374	5	22	15	2013-12-09	GET OUT	2014-08-31 11:47:49.113481	2014-08-31 11:47:49.113481
18375	5	22	15	2013-12-09	GET OUT	2014-08-31 11:47:49.145446	2014-08-31 11:47:49.145446
18376	5	22	15	2013-12-09	GET OUT	2014-08-31 11:47:49.173282	2014-08-31 11:47:49.173282
18377	5	16	15	2013-12-10	MY CYPRIOT KITCHEN	2014-08-31 11:47:49.200443	2014-08-31 11:47:49.200443
18378	5	16	15	2013-12-10	MY CYPRIOT KITCHEN	2014-08-31 11:47:49.232166	2014-08-31 11:47:49.232166
18379	5	17	15	2013-12-10	MY CYPRIOT KITCHEN	2014-08-31 11:47:49.640207	2014-08-31 11:47:49.640207
18380	5	17	15	2013-12-10	MY CYPRIOT KITCHEN	2014-08-31 11:47:49.690696	2014-08-31 11:47:49.690696
18381	5	18	15	2013-12-10	ULTIMATE CAKE OFF	2014-08-31 11:47:49.744963	2014-08-31 11:47:49.744963
18382	5	18	15	2013-12-10	ULTIMATE CAKE OFF	2014-08-31 11:47:49.80564	2014-08-31 11:47:49.80564
18383	5	19	15	2013-12-10	NIGELLAS CHRISTMAS KITCHEN	2014-08-31 11:47:49.862344	2014-08-31 11:47:49.862344
18384	5	19	15	2013-12-10	RACHEL ALLEN BAKE	2014-08-31 11:47:49.907884	2014-08-31 11:47:49.907884
18385	5	20	15	2013-12-10	WORLD CAFE MIDDLE EAST	2014-08-31 11:47:49.952565	2014-08-31 11:47:49.952565
18386	5	20	15	2013-12-10	WORLD CAFE MIDDLE EAST	2014-08-31 11:47:49.992131	2014-08-31 11:47:49.992131
18387	5	21	15	2013-12-10	THE LITTLE PARIS KITCHEN	2014-08-31 11:47:50.409538	2014-08-31 11:47:50.409538
18388	5	21	15	2013-12-10	AMAZING EATS	2014-08-31 11:47:50.453569	2014-08-31 11:47:50.453569
18389	5	22	15	2013-12-10	GET OUT	2014-08-31 11:47:50.491046	2014-08-31 11:47:50.491046
18390	5	22	15	2013-12-10	GET OUT	2014-08-31 11:47:50.52894	2014-08-31 11:47:50.52894
18391	5	16	15	2013-12-11	FAST FOOD MANIA	2014-08-31 11:47:50.566598	2014-08-31 11:47:50.566598
18392	5	16	15	2013-12-11	FAST FOOD MANIA	2014-08-31 11:47:50.604253	2014-08-31 11:47:50.604253
18393	5	17	15	2013-12-11	FAST FOOD MANIA	2014-08-31 11:47:50.649344	2014-08-31 11:47:50.649344
18394	5	17	15	2013-12-11	FAST FOOD MANIA	2014-08-31 11:47:50.685683	2014-08-31 11:47:50.685683
18395	5	17	15	2013-12-11	FAST FOOD MANIA	2014-08-31 11:47:50.72342	2014-08-31 11:47:50.72342
18396	5	17	15	2013-12-11	FAST FOOD MANIA	2014-08-31 11:47:51.121617	2014-08-31 11:47:51.121617
18397	5	18	15	2013-12-11	ULTIMATE CAKE OFF	2014-08-31 11:47:51.155658	2014-08-31 11:47:51.155658
18398	5	19	15	2013-12-11	NIGELLAS CHRISTMAS KITCHEN	2014-08-31 11:47:51.190228	2014-08-31 11:47:51.190228
18399	5	19	15	2013-12-11	RACHEL ALLEN BAKE	2014-08-31 11:47:51.230509	2014-08-31 11:47:51.230509
18400	5	20	15	2013-12-11	BEACH LIFE WITH ANGELA KAN	2014-08-31 11:47:51.264719	2014-08-31 11:47:51.264719
18401	5	20	15	2013-12-11	RAVINDERS KITCHEN	2014-08-31 11:47:51.297104	2014-08-31 11:47:51.297104
18402	5	21	15	2013-12-11	THE LITTLE PARIS KITCHEN	2014-08-31 11:47:51.335456	2014-08-31 11:47:51.335456
18403	5	21	15	2013-12-11	TRINNY & SUSANNAHS MAKEOVER MISSION INDI	2014-08-31 11:47:51.366281	2014-08-31 11:47:51.366281
18404	5	22	15	2013-12-11	GET OUT	2014-08-31 11:47:51.690278	2014-08-31 11:47:51.690278
18405	5	16	15	2013-12-12	RAVINDERS KITCHEN	2014-08-31 11:47:51.718503	2014-08-31 11:47:51.718503
18406	5	16	15	2013-12-12	RAVINDERS KITCHEN	2014-08-31 11:47:51.748819	2014-08-31 11:47:51.748819
18407	5	17	15	2013-12-12	RAVINDERS KITCHEN	2014-08-31 11:47:51.775991	2014-08-31 11:47:51.775991
18408	5	17	15	2013-12-12	RAVINDERS KITCHEN	2014-08-31 11:47:51.802677	2014-08-31 11:47:51.802677
18409	5	18	15	2013-12-12	ULTIMATE CAKE OFF	2014-08-31 11:47:51.833212	2014-08-31 11:47:51.833212
18410	5	18	15	2013-12-12	ULTIMATE CAKE OFF	2014-08-31 11:47:51.858686	2014-08-31 11:47:51.858686
18411	5	19	15	2013-12-12	NIGELLAS CHRISTMAS KITCHEN	2014-08-31 11:47:51.883405	2014-08-31 11:47:51.883405
18412	5	20	15	2013-12-12	PILOT GLOBE GUIDES	2014-08-31 11:47:52.197245	2014-08-31 11:47:52.197245
18413	5	20	15	2013-12-12	LONELY PLANET BEST IN ASIA	2014-08-31 11:47:52.22623	2014-08-31 11:47:52.22623
18414	5	21	15	2013-12-12	THE LITTLE PARIS KITCHEN	2014-08-31 11:47:52.253845	2014-08-31 11:47:52.253845
18415	5	21	15	2013-12-12	THE LITTLE PARIS KITCHEN	2014-08-31 11:47:52.280564	2014-08-31 11:47:52.280564
18416	5	22	15	2013-12-12	GET OUT	2014-08-31 11:47:52.307723	2014-08-31 11:47:52.307723
18417	5	22	15	2013-12-12	GET OUT	2014-08-31 11:47:52.341063	2014-08-31 11:47:52.341063
18418	5	16	15	2013-12-13	NIGELLA KITCHEN	2014-08-31 11:47:52.366643	2014-08-31 11:47:52.366643
18419	5	16	15	2013-12-13	NIGELLA KITCHEN	2014-08-31 11:47:52.391876	2014-08-31 11:47:52.391876
18420	5	17	15	2013-12-13	NIGELLA KITCHEN	2014-08-31 11:47:52.710573	2014-08-31 11:47:52.710573
18421	5	17	15	2013-12-13	NIGELLA KITCHEN	2014-08-31 11:47:52.740549	2014-08-31 11:47:52.740549
18422	5	17	15	2013-12-13	NIGELLA KITCHEN	2014-08-31 11:47:52.769936	2014-08-31 11:47:52.769936
18423	5	18	15	2013-12-13	ULTIMATE CAKE OFF	2014-08-31 11:47:52.796847	2014-08-31 11:47:52.796847
18424	5	19	15	2013-12-13	NIGELLAS CHRISTMAS KITCHEN	2014-08-31 11:47:52.829131	2014-08-31 11:47:52.829131
18425	5	20	15	2013-12-13	OMG OH MY GOLD	2014-08-31 11:47:52.857764	2014-08-31 11:47:52.857764
18426	5	20	15	2013-12-13	OMG OH MY GOLD	2014-08-31 11:47:52.884703	2014-08-31 11:47:52.884703
18427	5	20	15	2013-12-13	GLUTTON FOR PUNISHMENT	2014-08-31 11:47:52.909028	2014-08-31 11:47:52.909028
18428	5	21	15	2013-12-13	JAMIES BIG FESTIVAL	2014-08-31 11:47:53.223527	2014-08-31 11:47:53.223527
18429	5	22	15	2013-12-13	GET OUT	2014-08-31 11:47:53.251069	2014-08-31 11:47:53.251069
18430	5	22	15	2013-12-13	GET OUT	2014-08-31 11:47:53.278217	2014-08-31 11:47:53.278217
18431	5	6	15	2013-12-14	SPICE TRIP	2014-08-31 11:47:53.30442	2014-08-31 11:47:53.30442
18432	5	7	15	2013-12-14	PILOT GLOBE GUIDES	2014-08-31 11:47:53.339701	2014-08-31 11:47:53.339701
18433	5	8	15	2013-12-14	CHEESE SLICES	2014-08-31 11:47:53.367896	2014-08-31 11:47:53.367896
18434	5	9	15	2013-12-14	ANTHONY BOURDAIN NO RESE	2014-08-31 11:47:53.395423	2014-08-31 11:47:53.395423
18435	5	11	15	2013-12-14	WORLDS WEIRDEST RESTAURANTS	2014-08-31 11:47:53.423727	2014-08-31 11:47:53.423727
18436	5	12	15	2013-12-14	WORLDS WEIRDEST RESTAURANTS	2014-08-31 11:47:53.731731	2014-08-31 11:47:53.731731
18437	5	13	15	2013-12-14	WORLDS WEIRDEST RESTAURANTS	2014-08-31 11:47:53.761276	2014-08-31 11:47:53.761276
18438	5	14	15	2013-12-14	ANTHONY BOURDAIN NO RESE	2014-08-31 11:47:53.788997	2014-08-31 11:47:53.788997
18439	5	15	15	2013-12-14	NIGELLA KITCHEN	2014-08-31 11:47:53.815325	2014-08-31 11:47:53.815325
18440	5	16	15	2013-12-14	WORLD CAFE ASIA	2014-08-31 11:47:53.847959	2014-08-31 11:47:53.847959
18441	5	18	15	2013-12-14	INVITE MR WRIGHT	2014-08-31 11:47:53.87605	2014-08-31 11:47:53.87605
18442	5	20	15	2013-12-14	RAVINDERS KITCHEN	2014-08-31 11:47:53.901885	2014-08-31 11:47:53.901885
18443	5	6	15	2013-12-15	EPIC	2014-08-31 11:47:53.930829	2014-08-31 11:47:53.930829
18444	5	7	15	2013-12-15	PILOT GLOBE GUIDES	2014-08-31 11:47:53.956393	2014-08-31 11:47:53.956393
18445	5	8	15	2013-12-15	CHUCKS DAY OFF	2014-08-31 11:47:54.272145	2014-08-31 11:47:54.272145
18446	5	9	15	2013-12-15	TASTE OFF	2014-08-31 11:47:54.298925	2014-08-31 11:47:54.298925
18447	5	10	15	2013-12-15	TASTE OFF	2014-08-31 11:47:54.329214	2014-08-31 11:47:54.329214
18448	5	11	15	2013-12-15	TASTE OFF	2014-08-31 11:47:54.357407	2014-08-31 11:47:54.357407
18449	5	13	15	2013-12-15	CHUCKS DAY OFF	2014-08-31 11:47:54.385147	2014-08-31 11:47:54.385147
18450	5	14	15	2013-12-15	CHUCKS DAY OFF	2014-08-31 11:47:54.411105	2014-08-31 11:47:54.411105
18451	5	15	15	2013-12-15	INVITE MR WRIGHT	2014-08-31 11:47:54.447516	2014-08-31 11:47:54.447516
18452	5	17	15	2013-12-15	WORLD PARTY	2014-08-31 11:47:54.472894	2014-08-31 11:47:54.472894
18453	5	18	15	2013-12-15	RAVINDERS KITCHEN	2014-08-31 11:47:54.783685	2014-08-31 11:47:54.783685
18454	5	21	15	2013-12-15	ULTIMATE CAKE OFF	2014-08-31 11:47:54.812134	2014-08-31 11:47:54.812134
18455	5	16	15	2013-12-16	CHUCKS DAY OFF	2014-08-31 11:47:54.848926	2014-08-31 11:47:54.848926
18456	5	16	15	2013-12-16	CHUCKS DAY OFF	2014-08-31 11:47:54.876986	2014-08-31 11:47:54.876986
18457	5	17	15	2013-12-16	CHUCKS DAY OFF	2014-08-31 11:47:54.9039	2014-08-31 11:47:54.9039
18458	5	17	15	2013-12-16	CHUCKS DAY OFF	2014-08-31 11:47:54.939785	2014-08-31 11:47:54.939785
18459	5	17	15	2013-12-16	CHUCKS DAY OFF	2014-08-31 11:47:54.965555	2014-08-31 11:47:54.965555
18460	5	18	15	2013-12-16	ULTIMATE CAKE OFF	2014-08-31 11:47:54.991955	2014-08-31 11:47:54.991955
18461	5	18	15	2013-12-16	ULTIMATE CAKE OFF	2014-08-31 11:47:55.30277	2014-08-31 11:47:55.30277
18462	5	19	15	2013-12-16	RACHEL ALLEN BAKE	2014-08-31 11:47:55.333705	2014-08-31 11:47:55.333705
18463	5	21	15	2013-12-16	RAVINDERS KITCHEN	2014-08-31 11:47:55.363678	2014-08-31 11:47:55.363678
18464	5	21	15	2013-12-16	RAVINDERS KITCHEN	2014-08-31 11:47:55.39529	2014-08-31 11:47:55.39529
18465	5	22	15	2013-12-16	GET OUT	2014-08-31 11:47:55.432166	2014-08-31 11:47:55.432166
18466	5	22	15	2013-12-16	GET OUT	2014-08-31 11:47:55.460881	2014-08-31 11:47:55.460881
18467	5	16	15	2013-12-17	WORLD CAFE MIDDLE EAST	2014-08-31 11:47:55.489409	2014-08-31 11:47:55.489409
18468	5	16	15	2013-12-17	WORLD CAFE MIDDLE EAST	2014-08-31 11:47:55.51485	2014-08-31 11:47:55.51485
18469	5	17	15	2013-12-17	WORLD CAFE MIDDLE EAST	2014-08-31 11:47:55.826906	2014-08-31 11:47:55.826906
18470	5	18	15	2013-12-17	ULTIMATE CAKE OFF	2014-08-31 11:47:55.857721	2014-08-31 11:47:55.857721
18471	5	19	15	2013-12-17	NIGELLAS CHRISTMAS KITCHEN	2014-08-31 11:47:55.885995	2014-08-31 11:47:55.885995
18472	5	19	15	2013-12-17	RACHEL ALLEN BAKE	2014-08-31 11:47:55.914863	2014-08-31 11:47:55.914863
18473	5	20	15	2013-12-17	WORLD CAFE MIDDLE EAST	2014-08-31 11:47:55.949449	2014-08-31 11:47:55.949449
18474	5	21	15	2013-12-17	THE LITTLE PARIS KITCHEN	2014-08-31 11:47:55.977687	2014-08-31 11:47:55.977687
18475	5	21	15	2013-12-17	AMAZING EATS	2014-08-31 11:47:56.012582	2014-08-31 11:47:56.012582
18476	5	22	15	2013-12-17	GET OUT	2014-08-31 11:47:56.066497	2014-08-31 11:47:56.066497
18477	5	22	15	2013-12-17	GET OUT	2014-08-31 11:47:56.374006	2014-08-31 11:47:56.374006
18478	5	22	15	2013-12-17	GET OUT	2014-08-31 11:47:56.401624	2014-08-31 11:47:56.401624
18479	5	16	15	2013-12-18	PLANET FOOD	2014-08-31 11:47:56.436965	2014-08-31 11:47:56.436965
18480	5	16	15	2013-12-18	PLANET FOOD	2014-08-31 11:47:56.464708	2014-08-31 11:47:56.464708
18481	5	18	15	2013-12-18	ULTIMATE CAKE OFF	2014-08-31 11:47:56.492584	2014-08-31 11:47:56.492584
18482	5	18	15	2013-12-18	ULTIMATE CAKE OFF	2014-08-31 11:47:56.527289	2014-08-31 11:47:56.527289
18483	5	19	15	2013-12-18	RACHEL ALLEN BAKE	2014-08-31 11:47:56.554672	2014-08-31 11:47:56.554672
18484	5	20	15	2013-12-18	BEACH LIFE WITH ANGELA KAN	2014-08-31 11:47:56.581985	2014-08-31 11:47:56.581985
18485	5	20	15	2013-12-18	RAVINDERS KITCHEN	2014-08-31 11:47:56.90185	2014-08-31 11:47:56.90185
18486	5	21	15	2013-12-18	THE LITTLE PARIS KITCHEN	2014-08-31 11:47:56.933992	2014-08-31 11:47:56.933992
18487	5	21	15	2013-12-18	THE LITTLE PARIS KITCHEN	2014-08-31 11:47:56.962402	2014-08-31 11:47:56.962402
18488	5	21	15	2013-12-18	TRINNY & SUSANNAHS MAKEOVER MISSION INDI	2014-08-31 11:47:56.991146	2014-08-31 11:47:56.991146
18489	5	21	15	2013-12-18	TRINNY & SUSANNAHS MAKEOVER MISSION INDI	2014-08-31 11:47:57.024576	2014-08-31 11:47:57.024576
18490	5	22	15	2013-12-18	GET OUT	2014-08-31 11:47:57.053164	2014-08-31 11:47:57.053164
18491	5	16	15	2013-12-19	ULTIMATE CAKE OFF	2014-08-31 11:47:57.079688	2014-08-31 11:47:57.079688
18492	5	16	15	2013-12-19	ULTIMATE CAKE OFF	2014-08-31 11:47:57.105087	2014-08-31 11:47:57.105087
18493	5	16	15	2013-12-19	ULTIMATE CAKE OFF	2014-08-31 11:47:57.138543	2014-08-31 11:47:57.138543
18494	5	17	15	2013-12-19	ULTIMATE CAKE OFF	2014-08-31 11:47:57.475058	2014-08-31 11:47:57.475058
18495	5	17	15	2013-12-19	ULTIMATE CAKE OFF	2014-08-31 11:47:57.527966	2014-08-31 11:47:57.527966
18496	5	18	15	2013-12-19	ULTIMATE CAKE OFF	2014-08-31 11:47:57.576067	2014-08-31 11:47:57.576067
18497	5	19	15	2013-12-19	RACHEL ALLEN BAKE	2014-08-31 11:47:57.628371	2014-08-31 11:47:57.628371
18498	5	20	15	2013-12-19	OMG OH MY GOLD	2014-08-31 11:47:57.676402	2014-08-31 11:47:57.676402
18499	5	20	15	2013-12-19	OMG OH MY GOLD	2014-08-31 11:47:57.7276	2014-08-31 11:47:57.7276
18500	5	21	15	2013-12-19	THE LITTLE PARIS KITCHEN	2014-08-31 11:47:57.776289	2014-08-31 11:47:57.776289
18501	5	21	15	2013-12-19	CAKE BOSS	2014-08-31 11:47:57.825772	2014-08-31 11:47:57.825772
18502	5	22	15	2013-12-19	GET OUT	2014-08-31 11:47:58.147481	2014-08-31 11:47:58.147481
18503	5	16	15	2013-12-20	FABULOUS CAKES	2014-08-31 11:47:58.173967	2014-08-31 11:47:58.173967
18504	5	16	15	2013-12-20	FABULOUS CAKES	2014-08-31 11:47:58.20034	2014-08-31 11:47:58.20034
18505	5	17	15	2013-12-20	FABULOUS CAKES	2014-08-31 11:47:58.230041	2014-08-31 11:47:58.230041
18506	5	17	15	2013-12-20	FABULOUS CAKES	2014-08-31 11:47:58.255558	2014-08-31 11:47:58.255558
18507	5	18	15	2013-12-20	ULTIMATE CAKE OFF	2014-08-31 11:47:58.280924	2014-08-31 11:47:58.280924
18508	5	19	15	2013-12-20	NIGELLAS CHRISTMAS KITCHEN	2014-08-31 11:47:58.3055	2014-08-31 11:47:58.3055
18509	5	19	15	2013-12-20	RACHEL ALLEN BAKE	2014-08-31 11:47:58.333014	2014-08-31 11:47:58.333014
18510	5	20	15	2013-12-20	SPICE TRIP	2014-08-31 11:47:58.629027	2014-08-31 11:47:58.629027
18511	5	20	15	2013-12-20	SPICE TRIP	2014-08-31 11:47:58.655936	2014-08-31 11:47:58.655936
18512	5	21	15	2013-12-20	WORLDS MOST LUXURIOUS HO	2014-08-31 11:47:58.687142	2014-08-31 11:47:58.687142
18513	5	22	15	2013-12-20	GET OUT	2014-08-31 11:47:58.713278	2014-08-31 11:47:58.713278
18514	5	22	15	2013-12-20	GET OUT	2014-08-31 11:47:58.748333	2014-08-31 11:47:58.748333
18515	5	6	15	2013-12-21	SPICE TRIP	2014-08-31 11:47:58.774791	2014-08-31 11:47:58.774791
18516	5	9	15	2013-12-21	WORLDS MOST LUXURIOUS HO	2014-08-31 11:47:58.800781	2014-08-31 11:47:58.800781
18517	5	10	15	2013-12-21	WORLDS WEIRDEST RESTAURANTS	2014-08-31 11:47:58.82738	2014-08-31 11:47:58.82738
18518	5	10	15	2013-12-21	HAPPILY EVER LAUGHTER	2014-08-31 11:47:59.170967	2014-08-31 11:47:59.170967
18519	5	12	15	2013-12-21	DONNA HAY FAST FRESH SIMPLE	2014-08-31 11:47:59.199109	2014-08-31 11:47:59.199109
18520	5	13	15	2013-12-21	DONNA HAY FAST FRESH SIMPLE	2014-08-31 11:47:59.231011	2014-08-31 11:47:59.231011
18521	5	14	15	2013-12-21	OMG OH MY GOLD	2014-08-31 11:47:59.258585	2014-08-31 11:47:59.258585
18522	5	15	15	2013-12-21	NIGELLA KITCHEN	2014-08-31 11:47:59.28584	2014-08-31 11:47:59.28584
18523	5	17	15	2013-12-21	NIGELLA EXPRESS	2014-08-31 11:47:59.313153	2014-08-31 11:47:59.313153
18524	5	19	15	2013-12-21	GORDONS GREAT ESCAPE	2014-08-31 11:47:59.347529	2014-08-31 11:47:59.347529
18525	5	20	15	2013-12-21	EPIC	2014-08-31 11:47:59.373989	2014-08-31 11:47:59.373989
18526	5	22	15	2013-12-21	THE LAYOVER NEW ORLEANS	2014-08-31 11:47:59.688241	2014-08-31 11:47:59.688241
18527	5	6	15	2013-12-22	EPIC	2014-08-31 11:47:59.714127	2014-08-31 11:47:59.714127
18528	5	7	15	2013-12-22	PILOT GLOBE GUIDES	2014-08-31 11:47:59.74598	2014-08-31 11:47:59.74598
18529	5	8	15	2013-12-22	NIGELLAS CHRISTMAS KITCHEN	2014-08-31 11:47:59.774038	2014-08-31 11:47:59.774038
18530	5	10	15	2013-12-22	WORLDS WEIRDEST RESTAURANTS	2014-08-31 11:47:59.800528	2014-08-31 11:47:59.800528
18531	5	11	15	2013-12-22	MAN V FOOD THE CARNIVORE CHRONICLES	2014-08-31 11:47:59.83544	2014-08-31 11:47:59.83544
18532	5	13	15	2013-12-22	MAN V FOOD THE CARNIVORE CHRONICLES	2014-08-31 11:47:59.861431	2014-08-31 11:47:59.861431
18533	5	16	15	2013-12-22	PROJECT RUNWAY	2014-08-31 11:47:59.888438	2014-08-31 11:47:59.888438
18534	5	17	15	2013-12-22	WORLD PARTY	2014-08-31 11:48:00.194246	2014-08-31 11:48:00.194246
18535	5	18	15	2013-12-22	RAVINDERS KITCHEN	2014-08-31 11:48:00.224475	2014-08-31 11:48:00.224475
18536	5	20	15	2013-12-22	RICK STEINS INDIA	2014-08-31 11:48:00.252286	2014-08-31 11:48:00.252286
18537	5	20	15	2013-12-22	RICK STEINS INDIA	2014-08-31 11:48:00.279651	2014-08-31 11:48:00.279651
18538	5	22	15	2013-12-22	GET OUT	2014-08-31 11:48:00.306895	2014-08-31 11:48:00.306895
18539	5	16	15	2013-12-23	ULTIMATE COOKERY COURSE	2014-08-31 11:48:00.342543	2014-08-31 11:48:00.342543
18540	5	16	15	2013-12-23	ULTIMATE COOKERY COURSE	2014-08-31 11:48:00.36885	2014-08-31 11:48:00.36885
18541	5	17	15	2013-12-23	ULTIMATE COOKERY COURSE	2014-08-31 11:48:00.394666	2014-08-31 11:48:00.394666
18542	5	18	15	2013-12-23	ULTIMATE CAKE OFF	2014-08-31 11:48:00.41789	2014-08-31 11:48:00.41789
18543	5	19	15	2013-12-23	JAMIE COOKS CHRISTMAS	2014-08-31 11:48:00.728733	2014-08-31 11:48:00.728733
18544	5	21	15	2013-12-23	THE LITTLE PARIS KITCHEN	2014-08-31 11:48:00.756889	2014-08-31 11:48:00.756889
18545	5	22	15	2013-12-23	GET OUT	2014-08-31 11:48:00.784038	2014-08-31 11:48:00.784038
18546	5	16	15	2013-12-24	ULTIMATE CAKE OFF	2014-08-31 11:48:00.809984	2014-08-31 11:48:00.809984
18547	5	17	15	2013-12-24	ULTIMATE CAKE OFF	2014-08-31 11:48:00.845009	2014-08-31 11:48:00.845009
18548	5	18	15	2013-12-24	ULTIMATE CAKE OFF	2014-08-31 11:48:00.871648	2014-08-31 11:48:00.871648
18549	5	19	15	2013-12-24	NIGELLISSIMA	2014-08-31 11:48:00.898245	2014-08-31 11:48:00.898245
18550	5	20	15	2013-12-24	WORLD CAFE MIDDLE EAST	2014-08-31 11:48:00.931199	2014-08-31 11:48:00.931199
18551	5	21	15	2013-12-24	AMAZING EATS	2014-08-31 11:48:01.26889	2014-08-31 11:48:01.26889
18552	5	22	15	2013-12-24	GET OUT	2014-08-31 11:48:01.295843	2014-08-31 11:48:01.295843
18553	5	16	15	2013-12-25	NIGELLAS CHRISTMAS KITCHEN	2014-08-31 11:48:01.326054	2014-08-31 11:48:01.326054
18554	5	17	15	2013-12-25	JAMIE COOKS CHRISTMAS	2014-08-31 11:48:01.354578	2014-08-31 11:48:01.354578
18555	5	19	15	2013-12-25	JAMIES CHRISTMAS WITH BELLS ON	2014-08-31 11:48:01.383783	2014-08-31 11:48:01.383783
18556	5	20	15	2013-12-25	BEACH LIFE WITH ANGELA KAN	2014-08-31 11:48:01.411033	2014-08-31 11:48:01.411033
18557	5	21	15	2013-12-25	THE LITTLE PARIS KITCHEN	2014-08-31 11:48:01.447654	2014-08-31 11:48:01.447654
18558	5	21	15	2013-12-25	TRINNY & SUSANNAHS MAKEOVER MISSION INDI	2014-08-31 11:48:01.47533	2014-08-31 11:48:01.47533
18559	5	22	15	2013-12-25	GET OUT	2014-08-31 11:48:01.781486	2014-08-31 11:48:01.781486
18560	5	16	15	2013-12-26	NIGELLISSIMA	2014-08-31 11:48:01.808424	2014-08-31 11:48:01.808424
18561	5	17	15	2013-12-26	NIGELLISSIMA	2014-08-31 11:48:01.839149	2014-08-31 11:48:01.839149
18562	5	18	15	2013-12-26	ULTIMATE CAKE OFF	2014-08-31 11:48:01.867666	2014-08-31 11:48:01.867666
18563	5	19	15	2013-12-26	JAMIES CHRISTMAS WITH BELLS ON	2014-08-31 11:48:01.89442	2014-08-31 11:48:01.89442
18564	5	20	15	2013-12-26	OMG OH MY GOLD	2014-08-31 11:48:01.928252	2014-08-31 11:48:01.928252
18565	5	21	15	2013-12-26	CAKE BOSS	2014-08-31 11:48:01.954119	2014-08-31 11:48:01.954119
18566	5	22	15	2013-12-26	GET OUT	2014-08-31 11:48:01.978944	2014-08-31 11:48:01.978944
18567	5	6	16	2013-11-29	THE MORNING SHOW	2014-08-31 11:48:02.282891	2014-08-31 11:48:02.282891
18568	5	6	16	2013-11-29	THE MORNING SHOW	2014-08-31 11:48:02.310063	2014-08-31 11:48:02.310063
18569	5	6	16	2013-11-29	THE MORNING SHOW	2014-08-31 11:48:02.341765	2014-08-31 11:48:02.341765
18570	5	7	16	2013-11-29	MORNING PRIME TIME	2014-08-31 11:48:02.373927	2014-08-31 11:48:02.373927
18571	5	8	16	2013-11-29	MORNING PRIME TIME	2014-08-31 11:48:02.401443	2014-08-31 11:48:02.401443
18572	5	8	16	2013-11-29	NEWS NOW	2014-08-31 11:48:02.437339	2014-08-31 11:48:02.437339
18573	5	18	16	2013-11-29	NEWS TONIGHT	2014-08-31 11:48:02.464522	2014-08-31 11:48:02.464522
18574	5	18	16	2013-11-29	NEWS TONIGHT	2014-08-31 11:48:02.491094	2014-08-31 11:48:02.491094
18575	5	18	16	2013-11-29	NEWS TONIGHT	2014-08-31 11:48:02.797927	2014-08-31 11:48:02.797927
18576	5	19	16	2013-11-29	TIMES NOW TONIGHT	2014-08-31 11:48:02.830079	2014-08-31 11:48:02.830079
18577	5	19	16	2013-11-29	THE NEWSHOUR	2014-08-31 11:48:02.861194	2014-08-31 11:48:02.861194
18578	5	21	16	2013-11-29	NEWS 11 NOW	2014-08-31 11:48:02.893292	2014-08-31 11:48:02.893292
18579	5	6	16	2013-11-30	WEEKEND NEWS	2014-08-31 11:48:02.926643	2014-08-31 11:48:02.926643
18580	5	7	16	2013-11-30	THE MORNING SHOW	2014-08-31 11:48:02.956991	2014-08-31 11:48:02.956991
18581	5	7	16	2013-11-30	THE MORNING SHOW	2014-08-31 11:48:02.982893	2014-08-31 11:48:02.982893
18582	5	8	16	2013-11-30	MORNING PRIME TIME	2014-08-31 11:48:03.008182	2014-08-31 11:48:03.008182
18583	5	9	16	2013-11-30	MORNING PRIME TIME	2014-08-31 11:48:03.384339	2014-08-31 11:48:03.384339
18584	5	10	16	2013-11-30	WEEKEND NEWS	2014-08-31 11:48:03.411956	2014-08-31 11:48:03.411956
18585	5	11	16	2013-11-30	WEEKEND NEWS	2014-08-31 11:48:03.44456	2014-08-31 11:48:03.44456
18586	5	11	16	2013-11-30	WEEKEND NEWS	2014-08-31 11:48:03.473575	2014-08-31 11:48:03.473575
18587	5	12	16	2013-11-30	WEEKEND NEWS	2014-08-31 11:48:03.502408	2014-08-31 11:48:03.502408
18588	5	12	16	2013-11-30	WEEKEND NEWS	2014-08-31 11:48:03.530451	2014-08-31 11:48:03.530451
18589	5	14	16	2013-11-30	WEEKEND NEWS	2014-08-31 11:48:03.558875	2014-08-31 11:48:03.558875
18590	5	14	16	2013-11-30	WEEKEND NEWS	2014-08-31 11:48:03.586128	2014-08-31 11:48:03.586128
18591	5	15	16	2013-11-30	WEEKEND NEWS	2014-08-31 11:48:03.610421	2014-08-31 11:48:03.610421
18592	5	18	16	2013-11-30	NEWS TONIGHT	2014-08-31 11:48:03.944219	2014-08-31 11:48:03.944219
18593	5	18	16	2013-11-30	AMAZING INDIANS	2014-08-31 11:48:03.974473	2014-08-31 11:48:03.974473
18594	5	18	16	2013-11-30	AMAZING INDIANS	2014-08-31 11:48:04.002639	2014-08-31 11:48:04.002639
18595	5	19	16	2013-11-30	1899-12-30	2014-08-31 11:48:04.034353	2014-08-31 11:48:04.034353
18596	5	20	16	2013-11-30	THE REAL POLITIK	2014-08-31 11:48:04.063843	2014-08-31 11:48:04.063843
18597	5	21	16	2013-11-30	NEWS NOW OVERNIGHT	2014-08-31 11:48:04.091261	2014-08-31 11:48:04.091261
18598	5	6	16	2013-12-01	WEEKEND NEWS	2014-08-31 11:48:04.116702	2014-08-31 11:48:04.116702
18599	5	6	16	2013-12-01	SPORTS WEEKEND	2014-08-31 11:48:04.147955	2014-08-31 11:48:04.147955
18600	5	7	16	2013-12-01	THE MORNING SHOW	2014-08-31 11:48:04.465958	2014-08-31 11:48:04.465958
18601	5	7	16	2013-12-01	THE MORNING SHOW	2014-08-31 11:48:04.493491	2014-08-31 11:48:04.493491
18602	5	9	16	2013-12-01	CAPEGEMINI SUPER TECHIES SHOW-2	2014-08-31 11:48:04.530172	2014-08-31 11:48:04.530172
18603	5	9	16	2013-12-01	MORNING PRIME TIME	2014-08-31 11:48:04.559399	2014-08-31 11:48:04.559399
18604	5	11	16	2013-12-01	TOTAL RECALL	2014-08-31 11:48:04.586592	2014-08-31 11:48:04.586592
18605	5	12	16	2013-12-01	BOLLYWOOD WEEKEND	2014-08-31 11:48:04.612696	2014-08-31 11:48:04.612696
18606	5	13	16	2013-12-01	AMAZING INDIANS	2014-08-31 11:48:04.643424	2014-08-31 11:48:04.643424
18607	5	13	16	2013-12-01	WEEKEND NEWS	2014-08-31 11:48:04.668572	2014-08-31 11:48:04.668572
18608	5	14	16	2013-12-01	WEEKEND NEWS	2014-08-31 11:48:04.963383	2014-08-31 11:48:04.963383
18609	5	15	16	2013-12-01	WEEKEND NEWS	2014-08-31 11:48:04.990644	2014-08-31 11:48:04.990644
18610	5	18	16	2013-12-01	NEWS TONIGHT	2014-08-31 11:48:05.023188	2014-08-31 11:48:05.023188
18611	5	18	16	2013-12-01	THE FOODIE	2014-08-31 11:48:05.05142	2014-08-31 11:48:05.05142
18612	5	19	16	2013-12-01	TOTAL RECALL	2014-08-31 11:48:05.078659	2014-08-31 11:48:05.078659
18613	5	20	16	2013-12-01	POLITICS FIRST	2014-08-31 11:48:05.105718	2014-08-31 11:48:05.105718
18614	5	21	16	2013-12-01	1899-12-30	2014-08-31 11:48:05.135534	2014-08-31 11:48:05.135534
18615	5	21	16	2013-12-01	AMAZING INDIANS	2014-08-31 11:48:05.162506	2014-08-31 11:48:05.162506
18616	5	21	16	2013-12-01	NEWS NOW OVERNIGHT	2014-08-31 11:48:05.466133	2014-08-31 11:48:05.466133
18617	5	6	16	2013-12-02	THE MORNING SHOW	2014-08-31 11:48:05.4953	2014-08-31 11:48:05.4953
18618	5	6	16	2013-12-02	THE MORNING SHOW	2014-08-31 11:48:05.531046	2014-08-31 11:48:05.531046
18619	5	6	16	2013-12-02	THE MORNING SHOW	2014-08-31 11:48:05.558032	2014-08-31 11:48:05.558032
18620	5	7	16	2013-12-02	THE MORNING SHOW	2014-08-31 11:48:05.585039	2014-08-31 11:48:05.585039
18621	5	7	16	2013-12-02	MORNING PRIME TIME	2014-08-31 11:48:05.613212	2014-08-31 11:48:05.613212
18622	5	7	16	2013-12-02	MORNING PRIME TIME	2014-08-31 11:48:05.647417	2014-08-31 11:48:05.647417
18623	5	8	16	2013-12-02	MORNING PRIME TIME	2014-08-31 11:48:05.672613	2014-08-31 11:48:05.672613
18624	5	8	16	2013-12-02	MORNING PRIME TIME	2014-08-31 11:48:05.967745	2014-08-31 11:48:05.967745
18625	5	8	16	2013-12-02	NEWS NOW	2014-08-31 11:48:05.997406	2014-08-31 11:48:05.997406
18626	5	18	16	2013-12-02	NEWS TONIGHT	2014-08-31 11:48:06.063605	2014-08-31 11:48:06.063605
18627	5	18	16	2013-12-02	NEWS NOW 8	2014-08-31 11:48:06.091629	2014-08-31 11:48:06.091629
18628	5	19	16	2013-12-02	TIMES NOW TONIGHT	2014-08-31 11:48:06.124475	2014-08-31 11:48:06.124475
18629	5	19	16	2013-12-02	TIMES NOW TONIGHT	2014-08-31 11:48:06.151583	2014-08-31 11:48:06.151583
18630	5	21	16	2013-12-02	NEWS 11 NOW	2014-08-31 11:48:06.178484	2014-08-31 11:48:06.178484
18631	5	21	16	2013-12-02	NEWS 11 NOW	2014-08-31 11:48:06.204194	2014-08-31 11:48:06.204194
18632	5	6	16	2013-12-03	THE MORNING SHOW	2014-08-31 11:48:06.495958	2014-08-31 11:48:06.495958
18633	5	6	16	2013-12-03	THE MORNING SHOW	2014-08-31 11:48:06.530541	2014-08-31 11:48:06.530541
18634	5	7	16	2013-12-03	THE MORNING SHOW	2014-08-31 11:48:06.557778	2014-08-31 11:48:06.557778
18635	5	7	16	2013-12-03	THE MORNING SHOW	2014-08-31 11:48:06.586332	2014-08-31 11:48:06.586332
18636	5	7	16	2013-12-03	THE MORNING SHOW	2014-08-31 11:48:06.614602	2014-08-31 11:48:06.614602
18637	5	8	16	2013-12-03	MORNING PRIME TIME	2014-08-31 11:48:06.647246	2014-08-31 11:48:06.647246
18638	5	8	16	2013-12-03	MORNING PRIME TIME	2014-08-31 11:48:06.673534	2014-08-31 11:48:06.673534
18639	5	8	16	2013-12-03	NEWS NOW	2014-08-31 11:48:06.699199	2014-08-31 11:48:06.699199
18640	5	8	16	2013-12-03	NEWS NOW	2014-08-31 11:48:06.726594	2014-08-31 11:48:06.726594
18641	5	18	16	2013-12-03	THE POLITICAL JUICE	2014-08-31 11:48:07.035629	2014-08-31 11:48:07.035629
18642	5	18	16	2013-12-03	THE POLITICAL JUICE	2014-08-31 11:48:07.062911	2014-08-31 11:48:07.062911
18643	5	18	16	2013-12-03	NEWS NOW 8	2014-08-31 11:48:07.0901	2014-08-31 11:48:07.0901
18644	5	18	16	2013-12-03	NEWS NOW 8	2014-08-31 11:48:07.123566	2014-08-31 11:48:07.123566
18645	5	19	16	2013-12-03	NEWS NOW 8	2014-08-31 11:48:07.155026	2014-08-31 11:48:07.155026
18646	5	21	16	2013-12-03	NEWS 11 NOW	2014-08-31 11:48:07.183119	2014-08-31 11:48:07.183119
18647	5	6	16	2013-12-04	THE MORNING SHOW	2014-08-31 11:48:07.212652	2014-08-31 11:48:07.212652
18648	5	6	16	2013-12-04	THE MORNING SHOW	2014-08-31 11:48:07.255932	2014-08-31 11:48:07.255932
18649	5	6	16	2013-12-04	THE MORNING SHOW	2014-08-31 11:48:07.561354	2014-08-31 11:48:07.561354
18650	5	6	16	2013-12-04	THE MORNING SHOW	2014-08-31 11:48:07.589043	2014-08-31 11:48:07.589043
18651	5	7	16	2013-12-04	THE MORNING SHOW	2014-08-31 11:48:07.616044	2014-08-31 11:48:07.616044
18652	5	7	16	2013-12-04	THE MORNING SHOW	2014-08-31 11:48:07.64833	2014-08-31 11:48:07.64833
18653	5	7	16	2013-12-04	MORNING PRIME TIME	2014-08-31 11:48:07.675281	2014-08-31 11:48:07.675281
18654	5	8	16	2013-12-04	MORNING PRIME TIME	2014-08-31 11:48:07.701283	2014-08-31 11:48:07.701283
18655	5	8	16	2013-12-04	MORNING PRIME TIME	2014-08-31 11:48:07.730254	2014-08-31 11:48:07.730254
18656	5	18	16	2013-12-04	MANDATE 2013-POLL OF POLLS	2014-08-31 11:48:07.755758	2014-08-31 11:48:07.755758
18657	5	18	16	2013-12-04	MANDATE 2013-POLL OF POLLS	2014-08-31 11:48:08.066761	2014-08-31 11:48:08.066761
18658	5	18	16	2013-12-04	MANDATE 2013-POLL OF POLLS	2014-08-31 11:48:08.094909	2014-08-31 11:48:08.094909
18659	5	19	16	2013-12-04	MANDATE 2013-POLL OF POLLS	2014-08-31 11:48:08.125551	2014-08-31 11:48:08.125551
18660	5	19	16	2013-12-04	THE MANDATE DEBATE	2014-08-31 11:48:08.152478	2014-08-31 11:48:08.152478
18661	5	21	16	2013-12-04	THE MANDATE DEBATE	2014-08-31 11:48:08.182044	2014-08-31 11:48:08.182044
18662	5	21	16	2013-12-04	THE MANDATE DEBATE	2014-08-31 11:48:08.210637	2014-08-31 11:48:08.210637
18663	5	6	16	2013-12-05	THE MORNING SHOW	2014-08-31 11:48:08.241714	2014-08-31 11:48:08.241714
18664	5	6	16	2013-12-05	THE MORNING SHOW	2014-08-31 11:48:08.268618	2014-08-31 11:48:08.268618
18665	5	6	16	2013-12-05	THE MORNING SHOW	2014-08-31 11:48:08.585592	2014-08-31 11:48:08.585592
18666	5	7	16	2013-12-05	THE MORNING SHOW	2014-08-31 11:48:08.613879	2014-08-31 11:48:08.613879
18667	5	7	16	2013-12-05	THE MORNING SHOW	2014-08-31 11:48:08.647776	2014-08-31 11:48:08.647776
18668	5	7	16	2013-12-05	MORNING PRIME TIME	2014-08-31 11:48:08.675828	2014-08-31 11:48:08.675828
18669	5	8	16	2013-12-05	MORNING PRIME TIME	2014-08-31 11:48:08.703843	2014-08-31 11:48:08.703843
18670	5	8	16	2013-12-05	NEWS NOW	2014-08-31 11:48:08.735385	2014-08-31 11:48:08.735385
18671	5	8	16	2013-12-05	NEWS NOW	2014-08-31 11:48:08.763202	2014-08-31 11:48:08.763202
18672	5	18	16	2013-12-05	NEWS TONIGHT	2014-08-31 11:48:08.790465	2014-08-31 11:48:08.790465
18673	5	18	16	2013-12-05	NEWS NOW 8	2014-08-31 11:48:09.141918	2014-08-31 11:48:09.141918
18674	5	18	16	2013-12-05	NEWS NOW 8	2014-08-31 11:48:09.171185	2014-08-31 11:48:09.171185
18675	5	19	16	2013-12-05	TIMES NOW TONIGHT	2014-08-31 11:48:09.200809	2014-08-31 11:48:09.200809
18676	5	19	16	2013-12-05	THE NEWSHOUR	2014-08-31 11:48:09.232464	2014-08-31 11:48:09.232464
18677	5	21	16	2013-12-05	NEWS 11 NOW	2014-08-31 11:48:09.261738	2014-08-31 11:48:09.261738
18678	5	6	16	2013-12-06	THE MORNING SHOW	2014-08-31 11:48:09.289318	2014-08-31 11:48:09.289318
18679	5	6	16	2013-12-06	THE MORNING SHOW	2014-08-31 11:48:09.315693	2014-08-31 11:48:09.315693
18680	5	6	16	2013-12-06	THE MORNING SHOW	2014-08-31 11:48:09.347246	2014-08-31 11:48:09.347246
18681	5	6	16	2013-12-06	THE MORNING SHOW	2014-08-31 11:48:09.66087	2014-08-31 11:48:09.66087
18682	5	7	16	2013-12-06	THE MORNING SHOW	2014-08-31 11:48:09.691321	2014-08-31 11:48:09.691321
18683	5	7	16	2013-12-06	THE MORNING SHOW	2014-08-31 11:48:09.723058	2014-08-31 11:48:09.723058
18684	5	8	16	2013-12-06	MORNING PRIME TIME	2014-08-31 11:48:09.751353	2014-08-31 11:48:09.751353
18685	5	8	16	2013-12-06	MORNING PRIME TIME	2014-08-31 11:48:09.779848	2014-08-31 11:48:09.779848
18686	5	8	16	2013-12-06	NEWS NOW	2014-08-31 11:48:09.808368	2014-08-31 11:48:09.808368
18687	5	18	16	2013-12-06	NEWS TONIGHT	2014-08-31 11:48:09.835632	2014-08-31 11:48:09.835632
18688	5	18	16	2013-12-06	NEWS TONIGHT	2014-08-31 11:48:09.863639	2014-08-31 11:48:09.863639
18689	5	18	16	2013-12-06	NEWS NOW 8	2014-08-31 11:48:09.890767	2014-08-31 11:48:09.890767
18690	5	19	16	2013-12-06	TIMES NOW TONIGHT	2014-08-31 11:48:10.23179	2014-08-31 11:48:10.23179
18691	5	21	16	2013-12-06	NEWS NOW	2014-08-31 11:48:10.260611	2014-08-31 11:48:10.260611
18692	5	21	16	2013-12-06	NEWS NOW	2014-08-31 11:48:10.288994	2014-08-31 11:48:10.288994
18693	5	6	16	2013-12-07	POLITICS FIRST	2014-08-31 11:48:10.324677	2014-08-31 11:48:10.324677
18694	5	7	16	2013-12-07	THE MORNING SHOW	2014-08-31 11:48:10.353401	2014-08-31 11:48:10.353401
18695	5	7	16	2013-12-07	THE MORNING SHOW	2014-08-31 11:48:10.382266	2014-08-31 11:48:10.382266
18696	5	8	16	2013-12-07	MORNING PRIME TIME	2014-08-31 11:48:10.408762	2014-08-31 11:48:10.408762
18697	5	8	16	2013-12-07	MORNING PRIME TIME	2014-08-31 11:48:10.439124	2014-08-31 11:48:10.439124
18698	5	9	16	2013-12-07	MORNING PRIME TIME	2014-08-31 11:48:10.769216	2014-08-31 11:48:10.769216
18699	5	10	16	2013-12-07	MORNING PRIME TIME	2014-08-31 11:48:10.798433	2014-08-31 11:48:10.798433
18700	5	10	16	2013-12-07	WEEKEND NEWS	2014-08-31 11:48:10.832634	2014-08-31 11:48:10.832634
18701	5	11	16	2013-12-07	THE REAL POLITIK	2014-08-31 11:48:10.861412	2014-08-31 11:48:10.861412
18702	5	12	16	2013-12-07	WEEKEND NEWS	2014-08-31 11:48:10.889654	2014-08-31 11:48:10.889654
18703	5	12	16	2013-12-07	FRANKLY SPEAKING WITH ARNAB	2014-08-31 11:48:10.926145	2014-08-31 11:48:10.926145
18704	5	13	16	2013-12-07	FRANKLY SPEAKING WITH ARNAB	2014-08-31 11:48:10.952886	2014-08-31 11:48:10.952886
18705	5	13	16	2013-12-07	WEEKEND NEWS	2014-08-31 11:48:10.980683	2014-08-31 11:48:10.980683
18706	5	14	16	2013-12-07	POLITICS FIRST	2014-08-31 11:48:11.329997	2014-08-31 11:48:11.329997
18707	5	15	16	2013-12-07	WEEKEND NEWS	2014-08-31 11:48:11.359221	2014-08-31 11:48:11.359221
18708	5	15	16	2013-12-07	WEEKEND NEWS	2014-08-31 11:48:11.387276	2014-08-31 11:48:11.387276
18709	5	15	16	2013-12-07	WEEKEND NEWS	2014-08-31 11:48:11.414365	2014-08-31 11:48:11.414365
18710	5	18	16	2013-12-07	THE MANDATE DEBATE	2014-08-31 11:48:11.450609	2014-08-31 11:48:11.450609
18711	5	18	16	2013-12-07	THE MANDATE DEBATE	2014-08-31 11:48:11.479565	2014-08-31 11:48:11.479565
18712	5	19	16	2013-12-07	THE MANDATE DEBATE	2014-08-31 11:48:11.507298	2014-08-31 11:48:11.507298
18713	5	20	16	2013-12-07	THE MANDATE DEBATE	2014-08-31 11:48:11.538298	2014-08-31 11:48:11.538298
18714	5	21	16	2013-12-07	THE MANDATE DEBATE	2014-08-31 11:48:11.848867	2014-08-31 11:48:11.848867
18715	5	21	16	2013-12-07	THE MANDATE DEBATE	2014-08-31 11:48:11.87726	2014-08-31 11:48:11.87726
18716	5	21	16	2013-12-07	THE MANDATE DEBATE	2014-08-31 11:48:11.90486	2014-08-31 11:48:11.90486
18717	5	6	16	2013-12-09	THE MORNING SHOW	2014-08-31 11:48:11.937225	2014-08-31 11:48:11.937225
18718	5	6	16	2013-12-09	THE MORNING SHOW	2014-08-31 11:48:11.966901	2014-08-31 11:48:11.966901
18719	5	7	16	2013-12-09	THE MORNING SHOW	2014-08-31 11:48:11.994875	2014-08-31 11:48:11.994875
18720	5	7	16	2013-12-09	MORNING PRIME TIME	2014-08-31 11:48:12.025031	2014-08-31 11:48:12.025031
18721	5	8	16	2013-12-09	MORNING PRIME TIME	2014-08-31 11:48:12.051753	2014-08-31 11:48:12.051753
18722	5	8	16	2013-12-09	NEWS NOW	2014-08-31 11:48:12.369154	2014-08-31 11:48:12.369154
18723	5	8	16	2013-12-09	NEWS NOW	2014-08-31 11:48:12.397173	2014-08-31 11:48:12.397173
18724	5	18	16	2013-12-09	NEWS TONIGHT	2014-08-31 11:48:12.429003	2014-08-31 11:48:12.429003
18725	5	19	16	2013-12-09	NEWS NOW 8	2014-08-31 11:48:12.459755	2014-08-31 11:48:12.459755
18726	5	19	16	2013-12-09	THE NEWSHOUR	2014-08-31 11:48:12.487119	2014-08-31 11:48:12.487119
18727	5	19	16	2013-12-09	THE NEWSHOUR	2014-08-31 11:48:12.511687	2014-08-31 11:48:12.511687
18728	5	21	16	2013-12-09	NEWS 11 NOW	2014-08-31 11:48:12.536942	2014-08-31 11:48:12.536942
18729	5	21	16	2013-12-09	NEWS 11 NOW	2014-08-31 11:48:12.562949	2014-08-31 11:48:12.562949
18730	5	6	16	2013-12-10	THE MORNING SHOW	2014-08-31 11:48:12.867433	2014-08-31 11:48:12.867433
18731	5	6	16	2013-12-10	THE MORNING SHOW	2014-08-31 11:48:12.894564	2014-08-31 11:48:12.894564
18732	5	7	16	2013-12-10	THE MORNING SHOW	2014-08-31 11:48:12.925266	2014-08-31 11:48:12.925266
18733	5	7	16	2013-12-10	MORNING PRIME TIME	2014-08-31 11:48:12.953646	2014-08-31 11:48:12.953646
18734	5	7	16	2013-12-10	MORNING PRIME TIME	2014-08-31 11:48:12.981168	2014-08-31 11:48:12.981168
18735	5	8	16	2013-12-10	MORNING PRIME TIME	2014-08-31 11:48:13.008385	2014-08-31 11:48:13.008385
18736	5	8	16	2013-12-10	NEWS NOW	2014-08-31 11:48:13.037782	2014-08-31 11:48:13.037782
18737	5	18	16	2013-12-10	DEMOLISH THE LAL BATTI	2014-08-31 11:48:13.064773	2014-08-31 11:48:13.064773
18738	5	18	16	2013-12-10	DEMOLISH THE LAL BATTI	2014-08-31 11:48:13.367244	2014-08-31 11:48:13.367244
18739	5	19	16	2013-12-10	TIMES NOW TONIGHT	2014-08-31 11:48:13.402504	2014-08-31 11:48:13.402504
18740	5	19	16	2013-12-10	THE NEWSHOUR	2014-08-31 11:48:13.429157	2014-08-31 11:48:13.429157
18741	5	21	16	2013-12-10	REMEMBERING MADIBA	2014-08-31 11:48:13.455797	2014-08-31 11:48:13.455797
18742	5	21	16	2013-12-10	REMEMBERING MADIBA	2014-08-31 11:48:13.484328	2014-08-31 11:48:13.484328
18743	5	6	16	2013-12-11	THE MORNING SHOW	2014-08-31 11:48:13.511874	2014-08-31 11:48:13.511874
18744	5	6	16	2013-12-11	THE MORNING SHOW	2014-08-31 11:48:13.54296	2014-08-31 11:48:13.54296
18745	5	6	16	2013-12-11	THE MORNING SHOW	2014-08-31 11:48:13.569755	2014-08-31 11:48:13.569755
18746	5	7	16	2013-12-11	THE MORNING SHOW	2014-08-31 11:48:13.596263	2014-08-31 11:48:13.596263
18747	5	8	16	2013-12-11	MORNING PRIME TIME	2014-08-31 11:48:13.911602	2014-08-31 11:48:13.911602
18748	5	8	16	2013-12-11	MORNING PRIME TIME	2014-08-31 11:48:13.943615	2014-08-31 11:48:13.943615
18749	5	8	16	2013-12-11	NEWS NOW	2014-08-31 11:48:13.971787	2014-08-31 11:48:13.971787
18750	5	18	16	2013-12-11	NEWS TONIGHT	2014-08-31 11:48:13.999608	2014-08-31 11:48:13.999608
18751	5	18	16	2013-12-11	NEWS NOW 8	2014-08-31 11:48:14.031048	2014-08-31 11:48:14.031048
18752	5	19	16	2013-12-11	THE NEWSHOUR	2014-08-31 11:48:14.057101	2014-08-31 11:48:14.057101
18753	5	21	16	2013-12-11	NEWS 11 NOW	2014-08-31 11:48:14.082383	2014-08-31 11:48:14.082383
18754	5	21	16	2013-12-11	NEWS 11 NOW	2014-08-31 11:48:14.108189	2014-08-31 11:48:14.108189
18755	5	21	16	2013-12-11	NEWS 11 NOW	2014-08-31 11:48:14.415452	2014-08-31 11:48:14.415452
18756	5	6	16	2013-12-12	THE MORNING SHOW	2014-08-31 11:48:14.448869	2014-08-31 11:48:14.448869
18757	5	6	16	2013-12-12	THE MORNING SHOW	2014-08-31 11:48:14.475428	2014-08-31 11:48:14.475428
18758	5	6	16	2013-12-12	THE MORNING SHOW	2014-08-31 11:48:14.502787	2014-08-31 11:48:14.502787
18759	5	7	16	2013-12-12	THE MORNING SHOW	2014-08-31 11:48:14.533649	2014-08-31 11:48:14.533649
18760	5	7	16	2013-12-12	THE MORNING SHOW	2014-08-31 11:48:14.560565	2014-08-31 11:48:14.560565
18761	5	7	16	2013-12-12	MORNING PRIME TIME	2014-08-31 11:48:14.586255	2014-08-31 11:48:14.586255
18762	5	8	16	2013-12-12	MORNING PRIME TIME	2014-08-31 11:48:14.612399	2014-08-31 11:48:14.612399
18763	5	18	16	2013-12-12	NEWS TONIGHT	2014-08-31 11:48:14.920509	2014-08-31 11:48:14.920509
18764	5	18	16	2013-12-12	NEWS NOW 8	2014-08-31 11:48:14.951778	2014-08-31 11:48:14.951778
18765	5	19	16	2013-12-12	TIMES NOW TONIGHT	2014-08-31 11:48:14.979317	2014-08-31 11:48:14.979317
18766	5	19	16	2013-12-12	TIMES NOW TONIGHT	2014-08-31 11:48:15.008377	2014-08-31 11:48:15.008377
18767	5	19	16	2013-12-12	THE NEWSHOUR	2014-08-31 11:48:15.040135	2014-08-31 11:48:15.040135
18768	5	21	16	2013-12-12	NEWS 11 NOW	2014-08-31 11:48:15.067175	2014-08-31 11:48:15.067175
18769	5	6	16	2013-12-13	THE MORNING SHOW	2014-08-31 11:48:15.094657	2014-08-31 11:48:15.094657
18770	5	6	16	2013-12-13	THE MORNING SHOW	2014-08-31 11:48:15.123822	2014-08-31 11:48:15.123822
18771	5	6	16	2013-12-13	THE MORNING SHOW	2014-08-31 11:48:15.429651	2014-08-31 11:48:15.429651
18772	5	7	16	2013-12-13	MORNING PRIME TIME	2014-08-31 11:48:15.460459	2014-08-31 11:48:15.460459
18773	5	8	16	2013-12-13	MORNING PRIME TIME	2014-08-31 11:48:15.488234	2014-08-31 11:48:15.488234
18774	5	6	16	2013-12-14	WEEKEND NEWS	2014-08-31 11:48:15.516579	2014-08-31 11:48:15.516579
18775	5	6	16	2013-12-14	E NOW	2014-08-31 11:48:15.55059	2014-08-31 11:48:15.55059
18776	5	8	16	2013-12-14	MORNING PRIME TIME	2014-08-31 11:48:15.579203	2014-08-31 11:48:15.579203
18777	5	8	16	2013-12-14	AMAZING INDIANS	2014-08-31 11:48:15.606516	2014-08-31 11:48:15.606516
18778	5	9	16	2013-12-14	TIMES DRIVE	2014-08-31 11:48:15.6416	2014-08-31 11:48:15.6416
18779	5	10	16	2013-12-14	THE FOODIE	2014-08-31 11:48:15.953772	2014-08-31 11:48:15.953772
18780	5	10	16	2013-12-14	TOTAL RECALL	2014-08-31 11:48:15.983765	2014-08-31 11:48:15.983765
18781	5	11	16	2013-12-14	TOTAL RECALL	2014-08-31 11:48:16.029293	2014-08-31 11:48:16.029293
18782	5	12	16	2013-12-14	WEEKEND NEWS	2014-08-31 11:48:16.084824	2014-08-31 11:48:16.084824
18783	5	13	16	2013-12-14	WEEKEND NEWS	2014-08-31 11:48:16.115404	2014-08-31 11:48:16.115404
18784	5	14	16	2013-12-14	WEEKEND NEWS	2014-08-31 11:48:16.149495	2014-08-31 11:48:16.149495
18785	5	15	16	2013-12-14	WEEKEND NEWS	2014-08-31 11:48:16.178532	2014-08-31 11:48:16.178532
18786	5	18	16	2013-12-14	AMAZING INDIANS	2014-08-31 11:48:16.205928	2014-08-31 11:48:16.205928
18787	5	18	16	2013-12-14	AMAZING INDIANS	2014-08-31 11:48:16.518586	2014-08-31 11:48:16.518586
18788	5	19	16	2013-12-14	POLITICS FIRST	2014-08-31 11:48:16.551687	2014-08-31 11:48:16.551687
18789	5	21	16	2013-12-14	LATITUDE	2014-08-31 11:48:16.580301	2014-08-31 11:48:16.580301
18790	5	21	16	2013-12-14	LATITUDE	2014-08-31 11:48:16.607767	2014-08-31 11:48:16.607767
18791	5	6	16	2013-12-15	INSIDE	2014-08-31 11:48:16.640197	2014-08-31 11:48:16.640197
18792	5	6	16	2013-12-15	INSIDE	2014-08-31 11:48:16.668908	2014-08-31 11:48:16.668908
18793	5	7	16	2013-12-15	THE MORNING SHOW	2014-08-31 11:48:16.696269	2014-08-31 11:48:16.696269
18794	5	7	16	2013-12-15	THE MORNING SHOW	2014-08-31 11:48:16.726803	2014-08-31 11:48:16.726803
18795	5	7	16	2013-12-15	MORNING PRIME TIME	2014-08-31 11:48:16.752883	2014-08-31 11:48:16.752883
18796	5	9	16	2013-12-15	CAPEGEMINI SUPER TECHIES SHOW-2	2014-08-31 11:48:17.065847	2014-08-31 11:48:17.065847
18797	5	11	16	2013-12-15	TOTAL RECALL	2014-08-31 11:48:17.094903	2014-08-31 11:48:17.094903
18798	5	12	16	2013-12-15	WEEKEND NEWS	2014-08-31 11:48:17.130308	2014-08-31 11:48:17.130308
18799	5	12	16	2013-12-15	WEEKEND NEWS	2014-08-31 11:48:17.15855	2014-08-31 11:48:17.15855
18800	5	13	16	2013-12-15	WEEKEND NEWS	2014-08-31 11:48:17.186818	2014-08-31 11:48:17.186818
18801	5	14	16	2013-12-15	TIMES DRIVE	2014-08-31 11:48:17.214774	2014-08-31 11:48:17.214774
18802	5	15	16	2013-12-15	WEEKEND NEWS	2014-08-31 11:48:17.245952	2014-08-31 11:48:17.245952
18803	5	18	16	2013-12-15	THE FOODIE	2014-08-31 11:48:17.272408	2014-08-31 11:48:17.272408
18804	5	18	16	2013-12-15	THE FOODIE	2014-08-31 11:48:17.685927	2014-08-31 11:48:17.685927
18805	5	19	16	2013-12-15	1899-12-30	2014-08-31 11:48:17.738177	2014-08-31 11:48:17.738177
18806	5	20	16	2013-12-15	1899-12-30	2014-08-31 11:48:17.785903	2014-08-31 11:48:17.785903
18807	5	21	16	2013-12-15	NEWS NOW OVERNIGHT	2014-08-31 11:48:17.837193	2014-08-31 11:48:17.837193
18808	5	6	16	2013-12-16	THE MORNING SHOW	2014-08-31 11:48:17.88492	2014-08-31 11:48:17.88492
18809	5	6	16	2013-12-16	THE MORNING SHOW	2014-08-31 11:48:17.927943	2014-08-31 11:48:17.927943
18810	5	7	16	2013-12-16	THE MORNING SHOW	2014-08-31 11:48:17.970851	2014-08-31 11:48:17.970851
18811	5	7	16	2013-12-16	MORNING PRIME TIME	2014-08-31 11:48:18.009563	2014-08-31 11:48:18.009563
18812	5	8	16	2013-12-16	MORNING PRIME TIME	2014-08-31 11:48:18.408869	2014-08-31 11:48:18.408869
18813	5	18	16	2013-12-16	NEWS TONIGHT	2014-08-31 11:48:18.453554	2014-08-31 11:48:18.453554
18814	5	18	16	2013-12-16	NEWS TONIGHT	2014-08-31 11:48:18.493821	2014-08-31 11:48:18.493821
18815	5	19	16	2013-12-16	TIMES NOW TONIGHT	2014-08-31 11:48:18.538085	2014-08-31 11:48:18.538085
18816	5	19	16	2013-12-16	THE NEWSHOUR	2014-08-31 11:48:18.579279	2014-08-31 11:48:18.579279
18817	5	21	16	2013-12-16	NEWS 11 NOW	2014-08-31 11:48:18.618102	2014-08-31 11:48:18.618102
18818	5	6	16	2013-12-17	THE MORNING SHOW	2014-08-31 11:48:18.662663	2014-08-31 11:48:18.662663
18819	5	6	16	2013-12-17	THE MORNING SHOW	2014-08-31 11:48:18.699662	2014-08-31 11:48:18.699662
18820	5	7	16	2013-12-17	THE MORNING SHOW	2014-08-31 11:48:19.090591	2014-08-31 11:48:19.090591
18821	5	8	16	2013-12-17	MORNING PRIME TIME	2014-08-31 11:48:19.132682	2014-08-31 11:48:19.132682
18822	5	8	16	2013-12-17	MORNING PRIME TIME	2014-08-31 11:48:19.171056	2014-08-31 11:48:19.171056
18823	5	18	16	2013-12-17	NEWS TONIGHT	2014-08-31 11:48:19.207616	2014-08-31 11:48:19.207616
18824	5	19	16	2013-12-17	TIMES NOW TONIGHT	2014-08-31 11:48:19.258268	2014-08-31 11:48:19.258268
18825	5	19	16	2013-12-17	THE NEWSHOUR	2014-08-31 11:48:19.297372	2014-08-31 11:48:19.297372
18826	5	21	16	2013-12-17	NEWS 11 NOW	2014-08-31 11:48:19.338554	2014-08-31 11:48:19.338554
18827	5	6	16	2013-12-18	THE MORNING SHOW	2014-08-31 11:48:19.378647	2014-08-31 11:48:19.378647
18828	5	7	16	2013-12-18	THE MORNING SHOW	2014-08-31 11:48:19.730824	2014-08-31 11:48:19.730824
18829	5	7	16	2013-12-18	MORNING PRIME TIME	2014-08-31 11:48:19.766049	2014-08-31 11:48:19.766049
18830	5	8	16	2013-12-18	MORNING PRIME TIME	2014-08-31 11:48:19.800261	2014-08-31 11:48:19.800261
18831	5	8	16	2013-12-18	MORNING PRIME TIME	2014-08-31 11:48:19.837882	2014-08-31 11:48:19.837882
18832	5	6	16	2013-12-19	THE MORNING SHOW	2014-08-31 11:48:19.872627	2014-08-31 11:48:19.872627
18833	5	6	16	2013-12-19	THE MORNING SHOW	2014-08-31 11:48:19.90239	2014-08-31 11:48:19.90239
18834	5	7	16	2013-12-19	THE MORNING SHOW	2014-08-31 11:48:19.933742	2014-08-31 11:48:19.933742
18835	5	8	16	2013-12-19	MORNING PRIME TIME	2014-08-31 11:48:19.962061	2014-08-31 11:48:19.962061
18836	5	8	16	2013-12-19	MORNING PRIME TIME	2014-08-31 11:48:20.286219	2014-08-31 11:48:20.286219
18837	5	6	16	2013-12-20	THE MORNING SHOW	2014-08-31 11:48:20.320851	2014-08-31 11:48:20.320851
18838	5	6	16	2013-12-20	THE MORNING SHOW	2014-08-31 11:48:20.352353	2014-08-31 11:48:20.352353
18839	5	7	16	2013-12-20	MORNING PRIME TIME	2014-08-31 11:48:20.381561	2014-08-31 11:48:20.381561
18840	5	8	16	2013-12-20	NEWS NOW	2014-08-31 11:48:20.407954	2014-08-31 11:48:20.407954
18841	5	6	16	2013-12-21	WEEKEND NEWS	2014-08-31 11:48:20.440116	2014-08-31 11:48:20.440116
18842	5	7	16	2013-12-21	MORNING PRIME TIME	2014-08-31 11:48:20.467636	2014-08-31 11:48:20.467636
18843	5	8	16	2013-12-21	MORNING PRIME TIME	2014-08-31 11:48:20.494148	2014-08-31 11:48:20.494148
18844	5	9	16	2013-12-21	MORNING PRIME TIME	2014-08-31 11:48:20.518169	2014-08-31 11:48:20.518169
18845	5	10	16	2013-12-21	MORNING PRIME TIME	2014-08-31 11:48:20.833562	2014-08-31 11:48:20.833562
18846	5	10	16	2013-12-21	THE FOODIE	2014-08-31 11:48:20.864258	2014-08-31 11:48:20.864258
18847	5	11	16	2013-12-21	TOTAL RECALL	2014-08-31 11:48:20.892906	2014-08-31 11:48:20.892906
18848	5	12	16	2013-12-21	BOLLYWOOD WEEKEND	2014-08-31 11:48:20.924178	2014-08-31 11:48:20.924178
18849	5	13	16	2013-12-21	INSIDE	2014-08-31 11:48:20.96597	2014-08-31 11:48:20.96597
18850	5	14	16	2013-12-21	WHERE LIFE MEETS LIFESTYLE	2014-08-31 11:48:20.995213	2014-08-31 11:48:20.995213
18851	5	15	16	2013-12-21	ENLIGHTENING LIVES	2014-08-31 11:48:21.059023	2014-08-31 11:48:21.059023
18852	5	15	16	2013-12-21	WEEKEND NEWS	2014-08-31 11:48:21.084557	2014-08-31 11:48:21.084557
18853	5	6	16	2013-12-22	LEGENDS WE LOST	2014-08-31 11:48:21.393018	2014-08-31 11:48:21.393018
18854	5	7	16	2013-12-22	THE MORNING SHOW	2014-08-31 11:48:21.424925	2014-08-31 11:48:21.424925
18855	5	7	16	2013-12-22	MORNING PRIME TIME	2014-08-31 11:48:21.453443	2014-08-31 11:48:21.453443
18856	5	8	16	2013-12-22	MORNING PRIME TIME	2014-08-31 11:48:21.483341	2014-08-31 11:48:21.483341
18857	5	9	16	2013-12-22	MORNING PRIME TIME	2014-08-31 11:48:21.509594	2014-08-31 11:48:21.509594
18858	5	11	16	2013-12-22	TOTAL RECALL	2014-08-31 11:48:21.541249	2014-08-31 11:48:21.541249
18859	5	13	16	2013-12-22	WEEKEND NEWS	2014-08-31 11:48:21.566657	2014-08-31 11:48:21.566657
18860	5	13	16	2013-12-22	WEEKEND NEWS	2014-08-31 11:48:21.592293	2014-08-31 11:48:21.592293
18861	5	14	16	2013-12-22	WEEKEND NEWS	2014-08-31 11:48:21.903994	2014-08-31 11:48:21.903994
18862	5	15	16	2013-12-22	WHERE LIFE MEETS LIFESTYLE	2014-08-31 11:48:21.935351	2014-08-31 11:48:21.935351
18863	5	15	16	2013-12-22	WHERE LIFE MEETS LIFESTYLE	2014-08-31 11:48:21.964235	2014-08-31 11:48:21.964235
18864	5	6	17	2013-11-29	EFF WES CRAVENS NEW NIGHTMARE	2014-08-31 11:48:21.991348	2014-08-31 11:48:21.991348
18865	5	6	17	2013-11-29	EFF WES CRAVENS NEW NIGHTMARE	2014-08-31 11:48:22.017647	2014-08-31 11:48:22.017647
18866	5	7	17	2013-11-29	EFF OBSERVE AND REPORT	2014-08-31 11:48:22.048758	2014-08-31 11:48:22.048758
18867	5	8	17	2013-11-29	EFF OBSERVE AND REPORT	2014-08-31 11:48:22.07652	2014-08-31 11:48:22.07652
18868	5	9	17	2013-11-29	EFF HAPPY FEET	2014-08-31 11:48:22.101485	2014-08-31 11:48:22.101485
18869	5	15	17	2013-11-29	EFF RETURN TO HOUSE ON HAUNTED HILL	2014-08-31 11:48:22.40839	2014-08-31 11:48:22.40839
18870	5	15	17	2013-11-29	EFF RETURN TO HOUSE ON HAUNTED HILL	2014-08-31 11:48:22.440479	2014-08-31 11:48:22.440479
18871	5	16	17	2013-11-29	EFF RETURN TO HOUSE ON HAUNTED HILL	2014-08-31 11:48:22.469977	2014-08-31 11:48:22.469977
18872	5	17	17	2013-11-29	EFF HOUSE OF WAX	2014-08-31 11:48:22.496277	2014-08-31 11:48:22.496277
18873	5	19	17	2013-11-29	EFF DISTRICT 9	2014-08-31 11:48:22.52657	2014-08-31 11:48:22.52657
18874	5	20	17	2013-11-29	EFF THE HANGOVER	2014-08-31 11:48:22.554568	2014-08-31 11:48:22.554568
18875	5	21	17	2013-11-29	EFF THE HANGOVER	2014-08-31 11:48:22.580468	2014-08-31 11:48:22.580468
18876	5	22	17	2013-11-29	EFF SUPERMAN RETURNS	2014-08-31 11:48:22.604694	2014-08-31 11:48:22.604694
18877	5	22	17	2013-11-29	EFF SUPERMAN RETURNS	2014-08-31 11:48:22.905254	2014-08-31 11:48:22.905254
18878	5	23	17	2013-11-29	EFF SUPERMAN RETURNS	2014-08-31 11:48:22.937126	2014-08-31 11:48:22.937126
18879	5	6	17	2013-11-30	EFF LUCKY YOU	2014-08-31 11:48:22.965338	2014-08-31 11:48:22.965338
18880	5	6	17	2013-11-30	EFF LUCKY YOU	2014-08-31 11:48:22.997167	2014-08-31 11:48:22.997167
18881	5	6	17	2013-11-30	EFF LUCKY YOU	2014-08-31 11:48:23.031831	2014-08-31 11:48:23.031831
18882	5	8	17	2013-11-30	EFF SUPERMAN RETURNS	2014-08-31 11:48:23.057998	2014-08-31 11:48:23.057998
18883	5	10	17	2013-11-30	EFF SUPERMAN RETURNS	2014-08-31 11:48:23.083916	2014-08-31 11:48:23.083916
18884	5	15	17	2013-11-30	EFF RUSH HOUR	2014-08-31 11:48:23.108255	2014-08-31 11:48:23.108255
18885	5	16	17	2013-11-30	EFF RUSH HOUR	2014-08-31 11:48:23.41538	2014-08-31 11:48:23.41538
18886	5	17	17	2013-11-30	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:48:24.630263	2014-08-31 11:48:24.630263
18887	5	17	17	2013-11-30	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:48:24.657345	2014-08-31 11:48:24.657345
18888	5	18	17	2013-11-30	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:48:24.68448	2014-08-31 11:48:24.68448
18889	5	18	17	2013-11-30	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:48:24.724571	2014-08-31 11:48:24.724571
18890	5	19	17	2013-11-30	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:48:24.758334	2014-08-31 11:48:24.758334
18891	5	23	17	2013-11-30	EFF BLOOD MONEY	2014-08-31 11:48:24.784962	2014-08-31 11:48:24.784962
18892	5	23	17	2013-11-30	EFF BLOOD MONEY	2014-08-31 11:48:24.810303	2014-08-31 11:48:24.810303
18893	5	23	17	2013-11-30	EFF BLOOD MONEY	2014-08-31 11:48:24.843698	2014-08-31 11:48:24.843698
18894	5	6	17	2013-12-01	EFF BAIT	2014-08-31 11:48:25.152316	2014-08-31 11:48:25.152316
18895	5	7	17	2013-12-01	TWO & A HALF MEN	2014-08-31 11:48:25.180484	2014-08-31 11:48:25.180484
18896	5	9	17	2013-12-01	EFF JACKFROST	2014-08-31 11:48:25.207923	2014-08-31 11:48:25.207923
18897	5	13	17	2013-12-01	EFF JONAH HEX	2014-08-31 11:48:25.239389	2014-08-31 11:48:25.239389
18898	5	14	17	2013-12-01	EFF THE FUGITIVE	2014-08-31 11:48:25.266608	2014-08-31 11:48:25.266608
18899	5	15	17	2013-12-01	EFF THE FUGITIVE	2014-08-31 11:48:25.293601	2014-08-31 11:48:25.293601
18900	5	16	17	2013-12-01	EFF SPACE JAM	2014-08-31 11:48:25.318796	2014-08-31 11:48:25.318796
18901	5	17	17	2013-12-01	EFF SPACE JAM	2014-08-31 11:48:25.34775	2014-08-31 11:48:25.34775
18902	5	19	17	2013-12-01	EFF 300	2014-08-31 11:48:25.756662	2014-08-31 11:48:25.756662
18903	5	20	17	2013-12-01	EFF QUARANTINE	2014-08-31 11:48:25.784132	2014-08-31 11:48:25.784132
18904	5	20	17	2013-12-01	EFF QUARANTINE	2014-08-31 11:48:25.810906	2014-08-31 11:48:25.810906
18905	5	21	17	2013-12-01	EFF QUARANTINE	2014-08-31 11:48:25.841758	2014-08-31 11:48:25.841758
18906	5	22	17	2013-12-01	EFF HOUSE OF WAX	2014-08-31 11:48:25.868039	2014-08-31 11:48:25.868039
18907	5	22	17	2013-12-01	EFF HOUSE OF WAX	2014-08-31 11:48:25.896793	2014-08-31 11:48:25.896793
18908	5	23	17	2013-12-01	EFF HOUSE OF WAX	2014-08-31 11:48:25.927025	2014-08-31 11:48:25.927025
18909	5	15	17	2013-12-02	EFF RUSH HOUR 2	2014-08-31 11:48:25.952491	2014-08-31 11:48:25.952491
18910	5	17	17	2013-12-02	EFF DEMOLITION MAN	2014-08-31 11:48:26.296119	2014-08-31 11:48:26.296119
18911	5	17	17	2013-12-02	EFF DEMOLITION MAN	2014-08-31 11:48:26.327768	2014-08-31 11:48:26.327768
18912	5	19	17	2013-12-02	EFF BLOOD MONEY	2014-08-31 11:48:26.354619	2014-08-31 11:48:26.354619
18913	5	19	17	2013-12-02	EFF BLOOD MONEY	2014-08-31 11:48:26.381597	2014-08-31 11:48:26.381597
18914	5	20	17	2013-12-02	EFF TEKKEN	2014-08-31 11:48:26.408696	2014-08-31 11:48:26.408696
18915	5	20	17	2013-12-02	EFF TEKKEN	2014-08-31 11:48:26.439574	2014-08-31 11:48:26.439574
18916	5	21	17	2013-12-02	EFF TEKKEN	2014-08-31 11:48:26.464859	2014-08-31 11:48:26.464859
18917	5	22	17	2013-12-02	EFF THE TOWN	2014-08-31 11:48:26.489384	2014-08-31 11:48:26.489384
18918	5	22	17	2013-12-02	EFF THE TOWN	2014-08-31 11:48:26.797202	2014-08-31 11:48:26.797202
18919	5	23	17	2013-12-02	EFF THE TOWN	2014-08-31 11:48:26.832784	2014-08-31 11:48:26.832784
18920	5	23	17	2013-12-02	EFF THE TOWN	2014-08-31 11:48:26.860414	2014-08-31 11:48:26.860414
18921	5	23	17	2013-12-02	EFF THE TOWN	2014-08-31 11:48:26.888055	2014-08-31 11:48:26.888055
18922	5	15	17	2013-12-03	EFF HARRY POTTER AND THE PHILOSOPHERS ST	2014-08-31 11:48:26.91536	2014-08-31 11:48:26.91536
18923	5	15	17	2013-12-03	EFF HARRY POTTER AND THE PHILOSOPHERS ST	2014-08-31 11:48:26.942886	2014-08-31 11:48:26.942886
18924	5	16	17	2013-12-03	EFF HARRY POTTER AND THE PHILOSOPHERS ST	2014-08-31 11:48:26.968645	2014-08-31 11:48:26.968645
18925	5	16	17	2013-12-03	EFF HARRY POTTER AND THE PHILOSOPHERS ST	2014-08-31 11:48:26.99378	2014-08-31 11:48:26.99378
18926	5	17	17	2013-12-03	EFF HARRY POTTER AND THE PHILOSOPHERS ST	2014-08-31 11:48:27.30558	2014-08-31 11:48:27.30558
18927	5	18	17	2013-12-03	EFF CLASH OF THE TITANS	2014-08-31 11:48:27.338165	2014-08-31 11:48:27.338165
18928	5	19	17	2013-12-03	EFF CLASH OF THE TITANS	2014-08-31 11:48:27.36581	2014-08-31 11:48:27.36581
18929	5	20	17	2013-12-03	EFF FLYBOYS	2014-08-31 11:48:27.39338	2014-08-31 11:48:27.39338
18930	5	20	17	2013-12-03	EFF FLYBOYS	2014-08-31 11:48:27.424599	2014-08-31 11:48:27.424599
18931	5	21	17	2013-12-03	EFF FLYBOYS	2014-08-31 11:48:27.452018	2014-08-31 11:48:27.452018
18932	5	21	17	2013-12-03	EFF FLYBOYS	2014-08-31 11:48:27.47836	2014-08-31 11:48:27.47836
18933	5	22	17	2013-12-03	EFF FLYBOYS	2014-08-31 11:48:27.504036	2014-08-31 11:48:27.504036
18934	5	23	17	2013-12-03	EFF SNAKES ON A PLANE	2014-08-31 11:48:27.814713	2014-08-31 11:48:27.814713
18935	5	15	17	2013-12-04	EFF CLASH OF THE TITANS	2014-08-31 11:48:27.850271	2014-08-31 11:48:27.850271
18936	5	15	17	2013-12-04	EFF CLASH OF THE TITANS	2014-08-31 11:48:27.877459	2014-08-31 11:48:27.877459
18937	5	15	17	2013-12-04	EFF CLASH OF THE TITANS	2014-08-31 11:48:27.91531	2014-08-31 11:48:27.91531
18938	5	15	17	2013-12-04	EFF CLASH OF THE TITANS	2014-08-31 11:48:27.970179	2014-08-31 11:48:27.970179
18939	5	16	17	2013-12-04	EFF HOUSE OF WAX	2014-08-31 11:48:28.018692	2014-08-31 11:48:28.018692
18940	5	16	17	2013-12-04	EFF HOUSE OF WAX	2014-08-31 11:48:28.071763	2014-08-31 11:48:28.071763
18941	5	16	17	2013-12-04	EFF HOUSE OF WAX	2014-08-31 11:48:28.118732	2014-08-31 11:48:28.118732
18942	5	17	17	2013-12-04	EFF HOUSE OF WAX	2014-08-31 11:48:28.175416	2014-08-31 11:48:28.175416
18943	5	20	17	2013-12-04	EFF SUPERMAN RETURNS	2014-08-31 11:48:28.645015	2014-08-31 11:48:28.645015
18944	5	20	17	2013-12-04	EFF SUPERMAN RETURNS	2014-08-31 11:48:28.694693	2014-08-31 11:48:28.694693
18945	5	22	17	2013-12-04	EFF SUPERMAN RETURNS	2014-08-31 11:48:28.747904	2014-08-31 11:48:28.747904
18946	5	23	17	2013-12-04	EFF MORTAL KOMBAT	2014-08-31 11:48:28.797891	2014-08-31 11:48:28.797891
18947	5	23	17	2013-12-04	EFF MORTAL KOMBAT	2014-08-31 11:48:28.851035	2014-08-31 11:48:28.851035
18948	5	15	17	2013-12-05	EFF SUPERMAN RETURNS	2014-08-31 11:48:28.897535	2014-08-31 11:48:28.897535
18949	5	15	17	2013-12-05	EFF SUPERMAN RETURNS	2014-08-31 11:48:28.939912	2014-08-31 11:48:28.939912
18950	5	16	17	2013-12-05	EFF THE FUGITIVE	2014-08-31 11:48:28.977272	2014-08-31 11:48:28.977272
18951	5	17	17	2013-12-05	EFF THE FUGITIVE	2014-08-31 11:48:29.37993	2014-08-31 11:48:29.37993
18952	5	17	17	2013-12-05	EFF THE FUGITIVE	2014-08-31 11:48:29.409845	2014-08-31 11:48:29.409845
18953	5	19	17	2013-12-05	EFF 300	2014-08-31 11:48:29.441082	2014-08-31 11:48:29.441082
18954	5	20	17	2013-12-05	EFF JOURNEY TO THE CENTER OF THE EARTH	2014-08-31 11:48:29.46872	2014-08-31 11:48:29.46872
18955	5	21	17	2013-12-05	EFF JOURNEY TO THE CENTER OF THE EARTH	2014-08-31 11:48:29.49658	2014-08-31 11:48:29.49658
18956	5	21	17	2013-12-05	EFF JOURNEY TO THE CENTER OF THE EARTH	2014-08-31 11:48:29.526886	2014-08-31 11:48:29.526886
18957	5	21	17	2013-12-05	EFF JOURNEY TO THE CENTER OF THE EARTH	2014-08-31 11:48:29.55387	2014-08-31 11:48:29.55387
18958	5	22	17	2013-12-05	EFF DEMOLITION MAN	2014-08-31 11:48:29.579812	2014-08-31 11:48:29.579812
18959	5	22	17	2013-12-05	EFF DEMOLITION MAN	2014-08-31 11:48:29.90397	2014-08-31 11:48:29.90397
18960	5	23	17	2013-12-05	EFF DEMOLITION MAN	2014-08-31 11:48:29.937039	2014-08-31 11:48:29.937039
18961	5	6	17	2013-12-06	EFF SILK	2014-08-31 11:48:29.96524	2014-08-31 11:48:29.96524
18962	5	6	17	2013-12-06	EFF SILK	2014-08-31 11:48:29.993484	2014-08-31 11:48:29.993484
18963	5	7	17	2013-12-06	EFF NATIONAL LAMPOONS LOADED W	2014-08-31 11:48:30.025794	2014-08-31 11:48:30.025794
18964	5	8	17	2013-12-06	TWO & A HALF MEN	2014-08-31 11:48:30.05463	2014-08-31 11:48:30.05463
18965	5	10	17	2013-12-06	EFF THE SPECIALIST	2014-08-31 11:48:30.084304	2014-08-31 11:48:30.084304
18966	5	15	17	2013-12-06	EFF MORTAL KOMBAT	2014-08-31 11:48:30.110814	2014-08-31 11:48:30.110814
18967	5	15	17	2013-12-06	EFF MORTAL KOMBAT	2014-08-31 11:48:30.400828	2014-08-31 11:48:30.400828
18968	5	16	17	2013-12-06	EFF MORTAL KOMBAT	2014-08-31 11:48:30.433029	2014-08-31 11:48:30.433029
18969	5	19	17	2013-12-06	EFF ENTER THE DRAGON	2014-08-31 11:48:30.460989	2014-08-31 11:48:30.460989
18970	5	19	17	2013-12-06	EFF ENTER THE DRAGON	2014-08-31 11:48:30.489307	2014-08-31 11:48:30.489307
18971	5	20	17	2013-12-06	EFF CHARLIES ANGELS	2014-08-31 11:48:30.517842	2014-08-31 11:48:30.517842
18972	5	20	17	2013-12-06	EFF CHARLIES ANGELS	2014-08-31 11:48:30.549829	2014-08-31 11:48:30.549829
18973	5	21	17	2013-12-06	EFF CHARLIES ANGELS	2014-08-31 11:48:30.576331	2014-08-31 11:48:30.576331
18974	5	22	17	2013-12-06	EFF THE FUGITIVE	2014-08-31 11:48:30.602582	2014-08-31 11:48:30.602582
18975	5	23	17	2013-12-06	EFF THE FUGITIVE	2014-08-31 11:48:30.90926	2014-08-31 11:48:30.90926
18976	5	6	17	2013-12-07	EFF MONEY TALKS	2014-08-31 11:48:30.941677	2014-08-31 11:48:30.941677
18977	5	7	17	2013-12-07	TWO & A HALF MEN	2014-08-31 11:48:30.97031	2014-08-31 11:48:30.97031
18978	5	11	17	2013-12-07	EFF DEMOLITION MAN	2014-08-31 11:48:30.997758	2014-08-31 11:48:30.997758
18979	5	12	17	2013-12-07	EFF QUARANTINE	2014-08-31 11:48:31.063641	2014-08-31 11:48:31.063641
18980	5	13	17	2013-12-07	EFF HOUSE OF WAX	2014-08-31 11:48:31.090571	2014-08-31 11:48:31.090571
18981	5	15	17	2013-12-07	EFF HOUSE OF WAX	2014-08-31 11:48:31.116273	2014-08-31 11:48:31.116273
18982	5	15	17	2013-12-07	EFF HOUSE OF WAX	2014-08-31 11:48:31.14618	2014-08-31 11:48:31.14618
18983	5	15	17	2013-12-07	EFF HOUSE OF WAX	2014-08-31 11:48:31.434351	2014-08-31 11:48:31.434351
18984	5	15	17	2013-12-07	EFF HOUSE OF WAX	2014-08-31 11:48:31.462801	2014-08-31 11:48:31.462801
18985	5	17	17	2013-12-07	EFF DRUNKEN MASTER II	2014-08-31 11:48:31.49457	2014-08-31 11:48:31.49457
18986	5	17	17	2013-12-07	EFF DRUNKEN MASTER II	2014-08-31 11:48:31.524836	2014-08-31 11:48:31.524836
18987	5	21	17	2013-12-07	EFF 21	2014-08-31 11:48:31.555248	2014-08-31 11:48:31.555248
18988	5	22	17	2013-12-07	EFF 21	2014-08-31 11:48:31.582535	2014-08-31 11:48:31.582535
18989	5	22	17	2013-12-07	EFF 21	2014-08-31 11:48:31.607594	2014-08-31 11:48:31.607594
18990	5	22	17	2013-12-07	EFF 21	2014-08-31 11:48:31.641896	2014-08-31 11:48:31.641896
18991	5	23	17	2013-12-07	EFF FRIDAY THE 13TH	2014-08-31 11:48:31.668144	2014-08-31 11:48:31.668144
18992	5	6	17	2013-12-08	EFF HARRY POTTER AND THE GOBLE	2014-08-31 11:48:31.989988	2014-08-31 11:48:31.989988
18993	5	8	17	2013-12-08	TWO & A HALF MEN	2014-08-31 11:48:32.022889	2014-08-31 11:48:32.022889
18994	5	9	17	2013-12-08	EFF 21	2014-08-31 11:48:32.051503	2014-08-31 11:48:32.051503
18995	5	11	17	2013-12-08	EFF CHARLIES ANGELS	2014-08-31 11:48:32.080227	2014-08-31 11:48:32.080227
18996	5	12	17	2013-12-08	EFF CHARLIES ANGELS	2014-08-31 11:48:32.107454	2014-08-31 11:48:32.107454
18997	5	16	17	2013-12-08	EFF THE TOWN	2014-08-31 11:48:32.138725	2014-08-31 11:48:32.138725
18998	5	17	17	2013-12-08	EFF THE TOWN	2014-08-31 11:48:32.165269	2014-08-31 11:48:32.165269
18999	5	17	17	2013-12-08	EFF THE TOWN	2014-08-31 11:48:32.190552	2014-08-31 11:48:32.190552
19000	5	17	17	2013-12-08	EFF THE TOWN	2014-08-31 11:48:32.504937	2014-08-31 11:48:32.504937
19001	5	18	17	2013-12-08	EFF FRIDAY THE 13TH	2014-08-31 11:48:32.537112	2014-08-31 11:48:32.537112
19002	5	18	17	2013-12-08	EFF FRIDAY THE 13TH	2014-08-31 11:48:32.564394	2014-08-31 11:48:32.564394
19003	5	19	17	2013-12-08	EFF FRIDAY THE 13TH	2014-08-31 11:48:32.591345	2014-08-31 11:48:32.591345
19004	5	20	17	2013-12-08	EFF 300	2014-08-31 11:48:32.617487	2014-08-31 11:48:32.617487
19005	5	21	17	2013-12-08	EFF 300	2014-08-31 11:48:32.647064	2014-08-31 11:48:32.647064
19006	5	22	17	2013-12-08	EFF THE HURT LOCKER	2014-08-31 11:48:32.673244	2014-08-31 11:48:32.673244
19007	5	15	17	2013-12-09	EFF MORTAL KOMBAT	2014-08-31 11:48:32.701507	2014-08-31 11:48:32.701507
19008	5	15	17	2013-12-09	EFF MORTAL KOMBAT	2014-08-31 11:48:33.02297	2014-08-31 11:48:33.02297
19009	5	15	17	2013-12-09	EFF MORTAL KOMBAT	2014-08-31 11:48:33.052173	2014-08-31 11:48:33.052173
19010	5	17	17	2013-12-09	EFF HARRY POTTER AND THE PHILOSOPHERS ST	2014-08-31 11:48:33.082168	2014-08-31 11:48:33.082168
19011	5	17	17	2013-12-09	EFF HARRY POTTER AND THE PHILOSOPHERS ST	2014-08-31 11:48:33.109985	2014-08-31 11:48:33.109985
19012	5	18	17	2013-12-09	EFF HARRY POTTER AND THE PHILOSOPHERS ST	2014-08-31 11:48:33.138088	2014-08-31 11:48:33.138088
19013	5	19	17	2013-12-09	EFF HARRY POTTER AND THE PHILOSOPHERS ST	2014-08-31 11:48:33.164323	2014-08-31 11:48:33.164323
19014	5	20	17	2013-12-09	EFF THE HANGOVER	2014-08-31 11:48:33.189789	2014-08-31 11:48:33.189789
19015	5	20	17	2013-12-09	EFF THE HANGOVER	2014-08-31 11:48:33.214848	2014-08-31 11:48:33.214848
19016	5	21	17	2013-12-09	EFF THE HANGOVER	2014-08-31 11:48:33.518586	2014-08-31 11:48:33.518586
19017	5	22	17	2013-12-09	EFF AUSTIN POWERS IN GOLDMEMBER	2014-08-31 11:48:33.55085	2014-08-31 11:48:33.55085
19018	5	23	17	2013-12-09	EFF AUSTIN POWERS IN GOLDMEMBER	2014-08-31 11:48:33.580275	2014-08-31 11:48:33.580275
19019	5	23	17	2013-12-09	EFF AUSTIN POWERS IN GOLDMEMBER	2014-08-31 11:48:33.612315	2014-08-31 11:48:33.612315
19020	5	15	17	2013-12-10	EFF HARRY POTTER AND THE GOBLE	2014-08-31 11:48:33.644537	2014-08-31 11:48:33.644537
19021	5	15	17	2013-12-10	EFF HARRY POTTER AND THE GOBLE	2014-08-31 11:48:33.671885	2014-08-31 11:48:33.671885
19022	5	16	17	2013-12-10	EFF CONSTANTINE	2014-08-31 11:48:33.698536	2014-08-31 11:48:33.698536
19023	5	17	17	2013-12-10	EFF CONSTANTINE	2014-08-31 11:48:33.723861	2014-08-31 11:48:33.723861
19024	5	19	17	2013-12-10	EFF THE RING 2	2014-08-31 11:48:34.038703	2014-08-31 11:48:34.038703
19025	5	20	17	2013-12-10	EFF ULTRAVIOLET	2014-08-31 11:48:34.066343	2014-08-31 11:48:34.066343
19026	5	21	17	2013-12-10	EFF ULTRAVIOLET	2014-08-31 11:48:34.093492	2014-08-31 11:48:34.093492
19027	5	21	17	2013-12-10	EFF ULTRAVIOLET	2014-08-31 11:48:34.123245	2014-08-31 11:48:34.123245
19028	5	21	17	2013-12-10	EFF ULTRAVIOLET	2014-08-31 11:48:34.151828	2014-08-31 11:48:34.151828
19029	5	22	17	2013-12-10	EFF THE FUGITIVE	2014-08-31 11:48:34.17918	2014-08-31 11:48:34.17918
19030	5	22	17	2013-12-10	EFF THE FUGITIVE	2014-08-31 11:48:34.205023	2014-08-31 11:48:34.205023
19031	5	23	17	2013-12-10	EFF THE FUGITIVE	2014-08-31 11:48:34.233986	2014-08-31 11:48:34.233986
19032	5	23	17	2013-12-10	EFF THE FUGITIVE	2014-08-31 11:48:34.538622	2014-08-31 11:48:34.538622
19033	5	15	17	2013-12-11	EFF THE GOLDEN COMPASS	2014-08-31 11:48:34.566765	2014-08-31 11:48:34.566765
19034	5	15	17	2013-12-11	EFF THE GOLDEN COMPASS	2014-08-31 11:48:34.594564	2014-08-31 11:48:34.594564
19035	5	16	17	2013-12-11	EFF THE GOLDEN COMPASS	2014-08-31 11:48:34.62893	2014-08-31 11:48:34.62893
19036	5	16	17	2013-12-11	EFF THE GOLDEN COMPASS	2014-08-31 11:48:34.656486	2014-08-31 11:48:34.656486
19037	5	17	17	2013-12-11	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:48:34.683782	2014-08-31 11:48:34.683782
19038	5	18	17	2013-12-11	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:48:34.710153	2014-08-31 11:48:34.710153
19039	5	19	17	2013-12-11	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:48:34.750468	2014-08-31 11:48:34.750468
19040	5	20	17	2013-12-11	EFF RED CLIFF	2014-08-31 11:48:34.774597	2014-08-31 11:48:34.774597
19041	5	22	17	2013-12-11	EFF RED CLIFF	2014-08-31 11:48:35.084628	2014-08-31 11:48:35.084628
19042	5	23	17	2013-12-11	EFF ENTER THE DRAGON	2014-08-31 11:48:35.111083	2014-08-31 11:48:35.111083
19043	5	23	17	2013-12-11	EFF ENTER THE DRAGON	2014-08-31 11:48:35.138785	2014-08-31 11:48:35.138785
19044	5	15	17	2013-12-12	EFF DRUNKEN MASTER II	2014-08-31 11:48:35.165995	2014-08-31 11:48:35.165995
19045	5	15	17	2013-12-12	EFF DRUNKEN MASTER II	2014-08-31 11:48:35.192916	2014-08-31 11:48:35.192916
19046	5	16	17	2013-12-12	EFF DRUNKEN MASTER II	2014-08-31 11:48:35.218207	2014-08-31 11:48:35.218207
19047	5	17	17	2013-12-12	EFF RED CLIFF	2014-08-31 11:48:35.248444	2014-08-31 11:48:35.248444
19048	5	19	17	2013-12-12	EFF RED CLIFF	2014-08-31 11:48:35.274563	2014-08-31 11:48:35.274563
19049	5	20	17	2013-12-12	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:48:35.580375	2014-08-31 11:48:35.580375
19050	5	22	17	2013-12-12	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:48:35.607137	2014-08-31 11:48:35.607137
19051	5	22	17	2013-12-12	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:48:35.638246	2014-08-31 11:48:35.638246
19052	5	23	17	2013-12-12	EFF WHO AM I	2014-08-31 11:48:35.66503	2014-08-31 11:48:35.66503
19053	5	23	17	2013-12-12	EFF WHO AM I	2014-08-31 11:48:35.69219	2014-08-31 11:48:35.69219
19054	5	23	17	2013-12-12	EFF WHO AM I	2014-08-31 11:48:35.71761	2014-08-31 11:48:35.71761
19055	5	6	17	2013-12-13	EFF OSMOSIS JONES	2014-08-31 11:48:35.747954	2014-08-31 11:48:35.747954
19056	5	7	17	2013-12-13	EFF HIGHWAYMEN	2014-08-31 11:48:35.772857	2014-08-31 11:48:35.772857
19057	5	8	17	2013-12-13	EFF MR MAGORIUMS WONDER EMPORIUM	2014-08-31 11:48:36.107182	2014-08-31 11:48:36.107182
19058	5	9	17	2013-12-13	EFF MR MAGORIUMS WONDER EMPORIUM	2014-08-31 11:48:36.13924	2014-08-31 11:48:36.13924
19059	5	15	17	2013-12-13	EFF GRINDHOUSE PLANET TERROR	2014-08-31 11:48:36.166438	2014-08-31 11:48:36.166438
19060	5	15	17	2013-12-13	EFF GRINDHOUSE PLANET TERROR	2014-08-31 11:48:36.193343	2014-08-31 11:48:36.193343
19061	5	16	17	2013-12-13	EFF ERASER	2014-08-31 11:48:36.218458	2014-08-31 11:48:36.218458
19062	5	17	17	2013-12-13	EFF ERASER	2014-08-31 11:48:36.24972	2014-08-31 11:48:36.24972
19063	5	17	17	2013-12-13	EFF ERASER	2014-08-31 11:48:36.276626	2014-08-31 11:48:36.276626
19064	5	19	17	2013-12-13	EFF THE SPECIALIST	2014-08-31 11:48:36.301596	2014-08-31 11:48:36.301596
19065	5	20	17	2013-12-13	EFF XXX	2014-08-31 11:48:36.607267	2014-08-31 11:48:36.607267
19066	5	20	17	2013-12-13	EFF XXX	2014-08-31 11:48:36.641169	2014-08-31 11:48:36.641169
19067	5	21	17	2013-12-13	EFF XXX	2014-08-31 11:48:36.670181	2014-08-31 11:48:36.670181
19068	5	7	17	2013-12-14	TWO & A HALF MEN	2014-08-31 11:48:36.69876	2014-08-31 11:48:36.69876
19069	5	8	17	2013-12-14	TWO & A HALF MEN	2014-08-31 11:48:36.729237	2014-08-31 11:48:36.729237
19070	5	9	17	2013-12-14	EFF JACKFROST	2014-08-31 11:48:36.757843	2014-08-31 11:48:36.757843
19071	5	11	17	2013-12-14	EFF HARRY POTTER AND THE PRISO	2014-08-31 11:48:36.785027	2014-08-31 11:48:36.785027
19072	5	12	17	2013-12-14	EFF HARRY POTTER AND THE PRISO	2014-08-31 11:48:36.810867	2014-08-31 11:48:36.810867
19073	5	15	17	2013-12-14	EFF SNAKES ON A PLANE	2014-08-31 11:48:37.225356	2014-08-31 11:48:37.225356
19074	5	17	17	2013-12-14	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:48:37.252525	2014-08-31 11:48:37.252525
19075	5	18	17	2013-12-14	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:48:37.280007	2014-08-31 11:48:37.280007
19076	5	18	17	2013-12-14	EFF HARRY POTTER AND THE HALF-BLOOD PRIN	2014-08-31 11:48:37.306469	2014-08-31 11:48:37.306469
19077	5	20	17	2013-12-14	EFF FRIDAY THE 13TH	2014-08-31 11:48:37.337381	2014-08-31 11:48:37.337381
19078	5	20	17	2013-12-14	EFF FRIDAY THE 13TH	2014-08-31 11:48:37.364017	2014-08-31 11:48:37.364017
19079	5	22	17	2013-12-14	EFF SHERLOCK HOLMES	2014-08-31 11:48:37.391143	2014-08-31 11:48:37.391143
19080	5	22	17	2013-12-14	EFF SHERLOCK HOLMES	2014-08-31 11:48:37.434122	2014-08-31 11:48:37.434122
19081	5	23	17	2013-12-14	EFF SHERLOCK HOLMES	2014-08-31 11:48:37.739608	2014-08-31 11:48:37.739608
19082	5	9	17	2013-12-15	EFF HARRY POTTER AND THE PRISO	2014-08-31 11:48:37.767599	2014-08-31 11:48:37.767599
19083	5	12	17	2013-12-15	EFF SEX AND THE CITY 2	2014-08-31 11:48:37.794175	2014-08-31 11:48:37.794175
19084	5	13	17	2013-12-15	EFF SEX AND THE CITY 2	2014-08-31 11:48:37.829849	2014-08-31 11:48:37.829849
19085	5	14	17	2013-12-15	EFF THE INVASION	2014-08-31 11:48:37.85758	2014-08-31 11:48:37.85758
19086	5	15	17	2013-12-15	EFF THE INVASION	2014-08-31 11:48:37.884564	2014-08-31 11:48:37.884564
19087	5	18	17	2013-12-15	EFF XXX	2014-08-31 11:48:37.910238	2014-08-31 11:48:37.910238
19088	5	18	17	2013-12-15	EFF XXX	2014-08-31 11:48:37.940076	2014-08-31 11:48:37.940076
19089	5	19	17	2013-12-15	EFF XXX	2014-08-31 11:48:37.964954	2014-08-31 11:48:37.964954
19090	5	19	17	2013-12-15	EFF XXX	2014-08-31 11:48:38.264504	2014-08-31 11:48:38.264504
19091	5	21	17	2013-12-15	EFF SEX AND THE CITY 2	2014-08-31 11:48:38.291358	2014-08-31 11:48:38.291358
19092	5	21	17	2013-12-15	EFF SEX AND THE CITY 2	2014-08-31 11:48:38.31819	2014-08-31 11:48:38.31819
19093	5	23	17	2013-12-15	EFF STRIPTEASE	2014-08-31 11:48:38.360485	2014-08-31 11:48:38.360485
19094	5	23	17	2013-12-15	EFF STRIPTEASE	2014-08-31 11:48:38.389139	2014-08-31 11:48:38.389139
19095	5	15	17	2013-12-16	EFF SUPERMAN III	2014-08-31 11:48:38.42665	2014-08-31 11:48:38.42665
19096	5	15	17	2013-12-16	EFF SUPERMAN III	2014-08-31 11:48:38.456361	2014-08-31 11:48:38.456361
19097	5	16	17	2013-12-16	EFF THE EYE	2014-08-31 11:48:38.486239	2014-08-31 11:48:38.486239
19098	5	16	17	2013-12-16	EFF THE EYE	2014-08-31 11:48:38.812976	2014-08-31 11:48:38.812976
19099	5	17	17	2013-12-16	EFF THE EYE	2014-08-31 11:48:38.851612	2014-08-31 11:48:38.851612
19100	5	17	17	2013-12-16	EFF THE EYE	2014-08-31 11:48:38.88121	2014-08-31 11:48:38.88121
19101	5	19	17	2013-12-16	EFF THE INVASION	2014-08-31 11:48:38.908926	2014-08-31 11:48:38.908926
19102	5	21	17	2013-12-16	EFF SPHERE	2014-08-31 11:48:38.941651	2014-08-31 11:48:38.941651
19103	5	22	17	2013-12-16	EFF SPHERE	2014-08-31 11:48:38.970477	2014-08-31 11:48:38.970477
19104	5	23	17	2013-12-16	EFF SPHERE	2014-08-31 11:48:38.999162	2014-08-31 11:48:38.999162
19105	5	23	17	2013-12-16	EFF SPHERE	2014-08-31 11:48:39.024279	2014-08-31 11:48:39.024279
19106	5	15	17	2013-12-17	EFF MORTAL KOMBAT	2014-08-31 11:48:39.339445	2014-08-31 11:48:39.339445
19107	5	15	17	2013-12-17	EFF MORTAL KOMBAT	2014-08-31 11:48:39.368796	2014-08-31 11:48:39.368796
19108	5	15	17	2013-12-17	EFF MORTAL KOMBAT	2014-08-31 11:48:39.396059	2014-08-31 11:48:39.396059
19109	5	16	17	2013-12-17	EFF ERASER	2014-08-31 11:48:39.425928	2014-08-31 11:48:39.425928
19110	5	17	17	2013-12-17	EFF ERASER	2014-08-31 11:48:39.454275	2014-08-31 11:48:39.454275
19111	5	18	17	2013-12-17	EFF RUMBLE IN THE BRONX	2014-08-31 11:48:39.481726	2014-08-31 11:48:39.481726
19112	5	19	17	2013-12-17	EFF RUMBLE IN THE BRONX	2014-08-31 11:48:39.506472	2014-08-31 11:48:39.506472
19113	5	21	17	2013-12-17	EFF STUART LITTLE 2	2014-08-31 11:48:39.535966	2014-08-31 11:48:39.535966
19114	5	22	17	2013-12-17	EFF THE GOLDEN COMPASS	2014-08-31 11:48:39.83786	2014-08-31 11:48:39.83786
19115	5	22	17	2013-12-17	EFF THE GOLDEN COMPASS	2014-08-31 11:48:39.865818	2014-08-31 11:48:39.865818
19116	5	23	17	2013-12-17	EFF THE GOLDEN COMPASS	2014-08-31 11:48:39.893742	2014-08-31 11:48:39.893742
19117	5	15	17	2013-12-18	EFF DEEP BLUE SEA	2014-08-31 11:48:39.924605	2014-08-31 11:48:39.924605
19118	5	15	17	2013-12-18	EFF DEEP BLUE SEA	2014-08-31 11:48:39.952789	2014-08-31 11:48:39.952789
19119	5	16	17	2013-12-18	EFF JOURNEY TO THE CENTER OF THE EARTH	2014-08-31 11:48:39.980029	2014-08-31 11:48:39.980029
19120	5	16	17	2013-12-18	EFF JOURNEY TO THE CENTER OF THE EARTH	2014-08-31 11:48:40.005701	2014-08-31 11:48:40.005701
19121	5	16	17	2013-12-18	EFF JOURNEY TO THE CENTER OF THE EARTH	2014-08-31 11:48:40.039705	2014-08-31 11:48:40.039705
19122	5	17	17	2013-12-18	EFF JOURNEY TO THE CENTER OF THE EARTH	2014-08-31 11:48:40.341229	2014-08-31 11:48:40.341229
19123	5	17	17	2013-12-18	EFF JOURNEY TO THE CENTER OF THE EARTH	2014-08-31 11:48:40.369565	2014-08-31 11:48:40.369565
19124	5	19	17	2013-12-18	EFF THE HANGOVER	2014-08-31 11:48:40.398051	2014-08-31 11:48:40.398051
19125	5	20	17	2013-12-18	EFF SEX AND THE CITY 2	2014-08-31 11:48:40.428801	2014-08-31 11:48:40.428801
19126	5	22	17	2013-12-18	EFF SEX AND THE CITY 2	2014-08-31 11:48:40.457172	2014-08-31 11:48:40.457172
19127	5	23	17	2013-12-18	EFF DRUNKEN MASTER II	2014-08-31 11:48:40.485322	2014-08-31 11:48:40.485322
19128	5	15	17	2013-12-19	EFF CLASH OF THE TITANS	2014-08-31 11:48:40.511693	2014-08-31 11:48:40.511693
19129	5	16	17	2013-12-19	EFF DISTRICT 9	2014-08-31 11:48:40.547171	2014-08-31 11:48:40.547171
19130	5	17	17	2013-12-19	EFF SEX AND THE CITY 2	2014-08-31 11:48:40.859307	2014-08-31 11:48:40.859307
19131	5	18	17	2013-12-19	EFF SEX AND THE CITY 2	2014-08-31 11:48:40.887621	2014-08-31 11:48:40.887621
19132	5	19	17	2013-12-19	EFF SEX AND THE CITY 2	2014-08-31 11:48:40.914569	2014-08-31 11:48:40.914569
19133	5	19	17	2013-12-19	EFF SEX AND THE CITY 2	2014-08-31 11:48:40.949195	2014-08-31 11:48:40.949195
19134	5	20	17	2013-12-19	EFF SHERLOCK HOLMES	2014-08-31 11:48:40.977157	2014-08-31 11:48:40.977157
19135	5	22	17	2013-12-19	EFF SHERLOCK HOLMES	2014-08-31 11:48:41.012425	2014-08-31 11:48:41.012425
19136	5	22	17	2013-12-19	EFF SHERLOCK HOLMES	2014-08-31 11:48:41.066596	2014-08-31 11:48:41.066596
19137	5	23	17	2013-12-19	EFF MORTAL KOMBAT	2014-08-31 11:48:41.092611	2014-08-31 11:48:41.092611
19138	5	23	17	2013-12-19	EFF MORTAL KOMBAT	2014-08-31 11:48:41.117774	2014-08-31 11:48:41.117774
19139	5	6	17	2013-12-20	EFF PRACTICAL MAGIC	2014-08-31 11:48:41.428996	2014-08-31 11:48:41.428996
19140	5	6	17	2013-12-20	EFF PRACTICAL MAGIC	2014-08-31 11:48:41.456986	2014-08-31 11:48:41.456986
19141	5	7	17	2013-12-20	EFF LOTTERY TICKET	2014-08-31 11:48:41.484796	2014-08-31 11:48:41.484796
19142	5	8	17	2013-12-20	EFF LOTTERY TICKET	2014-08-31 11:48:41.511292	2014-08-31 11:48:41.511292
19143	5	15	17	2013-12-20	EFF THE FUGITIVE	2014-08-31 11:48:41.543038	2014-08-31 11:48:41.543038
19144	5	15	17	2013-12-20	EFF THE FUGITIVE	2014-08-31 11:48:41.569706	2014-08-31 11:48:41.569706
19145	5	15	17	2013-12-20	EFF THE FUGITIVE	2014-08-31 11:48:41.596653	2014-08-31 11:48:41.596653
19146	5	15	17	2013-12-20	EFF THE FUGITIVE	2014-08-31 11:48:41.625431	2014-08-31 11:48:41.625431
19147	5	17	17	2013-12-20	EFF THUNDERBOLT	2014-08-31 11:48:41.924546	2014-08-31 11:48:41.924546
19148	5	19	17	2013-12-20	EFF DEMOLITION MAN	2014-08-31 11:48:41.953228	2014-08-31 11:48:41.953228
19149	5	21	17	2013-12-20	EFF HOSTEL	2014-08-31 11:48:41.98109	2014-08-31 11:48:41.98109
19150	5	22	17	2013-12-20	EFF JASON X	2014-08-31 11:48:42.009247	2014-08-31 11:48:42.009247
19151	5	23	17	2013-12-20	EFF POLICE ACADEMY 4 CITIZENS ON PATROL	2014-08-31 11:48:42.042426	2014-08-31 11:48:42.042426
19152	5	6	17	2013-12-21	EFF MONEY TALKS	2014-08-31 11:48:42.070467	2014-08-31 11:48:42.070467
19153	5	7	17	2013-12-21	EFF MISS CONGENIALITY	2014-08-31 11:48:42.097538	2014-08-31 11:48:42.097538
19154	5	9	17	2013-12-21	EFF MISS CONGENIALITY	2014-08-31 11:48:42.129215	2014-08-31 11:48:42.129215
19155	5	10	17	2013-12-21	EFF THE GOLDEN COMPASS	2014-08-31 11:48:42.428199	2014-08-31 11:48:42.428199
19156	5	15	17	2013-12-21	EFF THE INVASION	2014-08-31 11:48:42.455854	2014-08-31 11:48:42.455854
19157	5	16	17	2013-12-21	EFF THE INVASION	2014-08-31 11:48:42.482227	2014-08-31 11:48:42.482227
19158	5	16	17	2013-12-21	EFF THE INVASION	2014-08-31 11:48:42.508308	2014-08-31 11:48:42.508308
19159	5	17	17	2013-12-21	EFF RED CLIFF	2014-08-31 11:48:42.538392	2014-08-31 11:48:42.538392
19160	5	17	17	2013-12-21	EFF RED CLIFF	2014-08-31 11:48:42.563431	2014-08-31 11:48:42.563431
19161	5	18	17	2013-12-21	EFF RED CLIFF	2014-08-31 11:48:42.587725	2014-08-31 11:48:42.587725
19162	5	20	17	2013-12-21	EFF A NIGHTMARE ON ELM STREET	2014-08-31 11:48:42.611512	2014-08-31 11:48:42.611512
19163	5	22	17	2013-12-21	EFF STRIPTEASE	2014-08-31 11:48:42.911122	2014-08-31 11:48:42.911122
19164	5	23	17	2013-12-21	EFF STRIPTEASE	2014-08-31 11:48:42.942816	2014-08-31 11:48:42.942816
19165	5	6	17	2013-12-22	EFF BAIT	2014-08-31 11:48:42.970744	2014-08-31 11:48:42.970744
19166	5	6	17	2013-12-22	EFF BAIT	2014-08-31 11:48:42.997813	2014-08-31 11:48:42.997813
19167	5	6	17	2013-12-22	EFF BAIT	2014-08-31 11:48:43.028329	2014-08-31 11:48:43.028329
19168	5	7	17	2013-12-22	TWO & A HALF MEN	2014-08-31 11:48:43.054131	2014-08-31 11:48:43.054131
19169	5	16	17	2013-12-22	EFF RED CLIFF	2014-08-31 11:48:43.078693	2014-08-31 11:48:43.078693
19170	5	17	17	2013-12-22	EFF A NIGHTMARE ON ELM STREET	2014-08-31 11:48:43.10296	2014-08-31 11:48:43.10296
19171	5	18	17	2013-12-22	EFF A NIGHTMARE ON ELM STREET	2014-08-31 11:48:43.411126	2014-08-31 11:48:43.411126
19172	5	18	17	2013-12-22	EFF A NIGHTMARE ON ELM STREET	2014-08-31 11:48:43.44347	2014-08-31 11:48:43.44347
19173	5	19	17	2013-12-22	EFF SCOOBY DOO CURSE OF THE LAKE MONSTER	2014-08-31 11:48:43.470079	2014-08-31 11:48:43.470079
19174	5	19	17	2013-12-22	EFF SCOOBY DOO CURSE OF THE LAKE MONSTER	2014-08-31 11:48:43.495996	2014-08-31 11:48:43.495996
19175	5	19	17	2013-12-22	EFF SCOOBY DOO CURSE OF THE LAKE MONSTER	2014-08-31 11:48:43.526203	2014-08-31 11:48:43.526203
19176	5	20	17	2013-12-22	EFF SEX AND THE CITY 2	2014-08-31 11:48:43.552377	2014-08-31 11:48:43.552377
19177	5	21	17	2013-12-22	EFF SEX AND THE CITY 2	2014-08-31 11:48:43.5774	2014-08-31 11:48:43.5774
19178	5	15	17	2013-12-23	EFF THE INVASION	2014-08-31 11:48:43.602198	2014-08-31 11:48:43.602198
19179	5	15	17	2013-12-23	EFF THE INVASION	2014-08-31 11:48:43.904847	2014-08-31 11:48:43.904847
19180	5	16	17	2013-12-23	EFF SOLDIER	2014-08-31 11:48:43.936176	2014-08-31 11:48:43.936176
19181	5	17	17	2013-12-23	EFF SOLDIER	2014-08-31 11:48:43.962792	2014-08-31 11:48:43.962792
19182	5	18	17	2013-12-23	EFF CONSTANTINE	2014-08-31 11:48:43.990099	2014-08-31 11:48:43.990099
19183	5	19	17	2013-12-23	EFF CONSTANTINE	2014-08-31 11:48:44.017388	2014-08-31 11:48:44.017388
19184	5	20	17	2013-12-23	EFF 14 BALDES	2014-08-31 11:48:44.049029	2014-08-31 11:48:44.049029
19185	5	20	17	2013-12-23	EFF 14 BALDES	2014-08-31 11:48:44.075744	2014-08-31 11:48:44.075744
19186	5	21	17	2013-12-23	EFF 14 BALDES	2014-08-31 11:48:44.100536	2014-08-31 11:48:44.100536
19187	5	22	17	2013-12-23	EFF COP OUT	2014-08-31 11:48:44.384649	2014-08-31 11:48:44.384649
19188	5	23	17	2013-12-23	EFF COP OUT	2014-08-31 11:48:44.422986	2014-08-31 11:48:44.422986
19189	5	15	17	2013-12-24	EFF WHITEOUT	2014-08-31 11:48:44.449677	2014-08-31 11:48:44.449677
19190	5	15	17	2013-12-24	EFF WHITEOUT	2014-08-31 11:48:44.475809	2014-08-31 11:48:44.475809
19191	5	15	17	2013-12-24	EFF WHITEOUT	2014-08-31 11:48:44.502349	2014-08-31 11:48:44.502349
19192	5	15	17	2013-12-24	EFF WHITEOUT	2014-08-31 11:48:44.532583	2014-08-31 11:48:44.532583
19193	5	15	17	2013-12-24	EFF WHITEOUT	2014-08-31 11:48:44.558265	2014-08-31 11:48:44.558265
19194	5	17	17	2013-12-24	EFF DUMA	2014-08-31 11:48:44.583385	2014-08-31 11:48:44.583385
19195	5	17	17	2013-12-24	EFF DUMA	2014-08-31 11:48:44.607495	2014-08-31 11:48:44.607495
19196	5	18	17	2013-12-24	EFF DEEP BLUE SEA	2014-08-31 11:48:44.906797	2014-08-31 11:48:44.906797
19197	5	20	17	2013-12-24	EFF DAYBREAKERS	2014-08-31 11:48:44.938028	2014-08-31 11:48:44.938028
19198	5	23	17	2013-12-24	EFF 300	2014-08-31 11:48:44.964896	2014-08-31 11:48:44.964896
19199	5	23	17	2013-12-24	EFF 300	2014-08-31 11:48:44.99088	2014-08-31 11:48:44.99088
19200	5	15	17	2013-12-25	EFF HAPPY FEET	2014-08-31 11:48:45.016678	2014-08-31 11:48:45.016678
19201	5	15	17	2013-12-25	EFF HAPPY FEET	2014-08-31 11:48:45.046572	2014-08-31 11:48:45.046572
19202	5	16	17	2013-12-25	EFF HAPPY FEET	2014-08-31 11:48:45.071193	2014-08-31 11:48:45.071193
19203	5	16	17	2013-12-25	EFF HAPPY FEET	2014-08-31 11:48:45.094951	2014-08-31 11:48:45.094951
19204	5	17	17	2013-12-25	EFF SUPERMAN RETURNS	2014-08-31 11:48:45.392191	2014-08-31 11:48:45.392191
19205	5	17	17	2013-12-25	EFF SUPERMAN RETURNS	2014-08-31 11:48:45.423082	2014-08-31 11:48:45.423082
19206	5	18	17	2013-12-25	EFF SUPERMAN RETURNS	2014-08-31 11:48:45.449174	2014-08-31 11:48:45.449174
19207	5	20	17	2013-12-25	EFF CLASH OF THE TITANS	2014-08-31 11:48:45.478831	2014-08-31 11:48:45.478831
19208	5	22	17	2013-12-25	EFF DAYS OF THUNDER	2014-08-31 11:48:45.504939	2014-08-31 11:48:45.504939
19209	5	23	17	2013-12-25	EFF DAYS OF THUNDER	2014-08-31 11:48:45.530043	2014-08-31 11:48:45.530043
19210	5	23	17	2013-12-25	EFF DAYS OF THUNDER	2014-08-31 11:48:45.555195	2014-08-31 11:48:45.555195
19211	5	15	17	2013-12-26	EFF SUPERMAN RETURNS	2014-08-31 11:48:45.579034	2014-08-31 11:48:45.579034
19212	5	16	17	2013-12-26	EFF HOSTEL	2014-08-31 11:48:45.870211	2014-08-31 11:48:45.870211
19213	5	17	17	2013-12-26	EFF HOSTEL	2014-08-31 11:48:45.896827	2014-08-31 11:48:45.896827
19214	5	18	17	2013-12-26	EFF 14 BALDES	2014-08-31 11:48:45.923287	2014-08-31 11:48:45.923287
19215	5	18	17	2013-12-26	EFF 14 BALDES	2014-08-31 11:48:45.949186	2014-08-31 11:48:45.949186
19216	5	19	17	2013-12-26	EFF 14 BALDES	2014-08-31 11:48:45.97482	2014-08-31 11:48:45.97482
19217	5	19	17	2013-12-26	EFF 14 BALDES	2014-08-31 11:48:46.007355	2014-08-31 11:48:46.007355
19218	5	20	17	2013-12-26	EFF JONAH HEX	2014-08-31 11:48:46.059171	2014-08-31 11:48:46.059171
19219	5	20	17	2013-12-26	EFF JONAH HEX	2014-08-31 11:48:46.083386	2014-08-31 11:48:46.083386
19220	5	22	17	2013-12-26	EFF SOLDIER	2014-08-31 11:48:46.376079	2014-08-31 11:48:46.376079
19221	5	16	18	2013-11-29	JUST FOR LAUGHS GAGS	2014-08-31 11:48:46.403598	2014-08-31 11:48:46.403598
19222	5	16	18	2013-11-29	JUST FOR LAUGHS GAGS	2014-08-31 11:48:46.430636	2014-08-31 11:48:46.430636
19223	5	17	18	2013-11-29	THE LYING GAME	2014-08-31 11:48:46.45758	2014-08-31 11:48:46.45758
19224	5	18	18	2013-11-29	ELLEN DEGENERES SHOW	2014-08-31 11:48:46.483963	2014-08-31 11:48:46.483963
19225	5	18	18	2013-11-29	ELLEN DEGENERES SHOW	2014-08-31 11:48:46.510161	2014-08-31 11:48:46.510161
19226	5	19	18	2013-11-29	MALIBU COUNTRY	2014-08-31 11:48:46.53951	2014-08-31 11:48:46.53951
19227	5	20	18	2013-11-29	LOST	2014-08-31 11:48:46.564228	2014-08-31 11:48:46.564228
19228	5	21	18	2013-11-29	THE LYING GAME	2014-08-31 11:48:46.860191	2014-08-31 11:48:46.860191
19229	5	21	18	2013-11-29	THE LYING GAME	2014-08-31 11:48:46.890102	2014-08-31 11:48:46.890102
19230	5	22	18	2013-11-29	POIROT	2014-08-31 11:48:46.916498	2014-08-31 11:48:46.916498
19231	5	22	18	2013-11-29	POIROT	2014-08-31 11:48:46.948063	2014-08-31 11:48:46.948063
19232	5	7	18	2013-11-30	JUST FOR LAUGHS GAGS	2014-08-31 11:48:46.974591	2014-08-31 11:48:46.974591
19233	5	7	18	2013-11-30	JUST FOR LAUGHS GAGS	2014-08-31 11:48:47.000545	2014-08-31 11:48:47.000545
19234	5	8	18	2013-11-30	JUST FOR LAUGHS GAGS	2014-08-31 11:48:47.02748	2014-08-31 11:48:47.02748
19235	5	8	18	2013-11-30	JUST FOR LAUGHS GAGS	2014-08-31 11:48:47.053761	2014-08-31 11:48:47.053761
19236	5	8	18	2013-11-30	JUST FOR LAUGHS GAGS	2014-08-31 11:48:47.352379	2014-08-31 11:48:47.352379
19237	5	10	18	2013-11-30	THE BIG BANG THEORY	2014-08-31 11:48:47.379458	2014-08-31 11:48:47.379458
19238	5	10	18	2013-11-30	THE BIG BANG THEORY	2014-08-31 11:48:47.405666	2014-08-31 11:48:47.405666
19239	5	11	18	2013-11-30	THE BIG BANG THEORY	2014-08-31 11:48:47.435506	2014-08-31 11:48:47.435506
19240	5	11	18	2013-11-30	THE BIG BANG THEORY	2014-08-31 11:48:47.461336	2014-08-31 11:48:47.461336
19241	5	12	18	2013-11-30	NIRMALAS SPICE WORLD	2014-08-31 11:48:47.486793	2014-08-31 11:48:47.486793
19242	5	13	18	2013-11-30	PRIVATE PRACTICE	2014-08-31 11:48:47.511264	2014-08-31 11:48:47.511264
19243	5	13	18	2013-11-30	PRIVATE PRACTICE	2014-08-31 11:48:47.539893	2014-08-31 11:48:47.539893
19244	5	13	18	2013-11-30	PRIVATE PRACTICE	2014-08-31 11:48:47.56296	2014-08-31 11:48:47.56296
19245	5	14	18	2013-11-30	THE LYING GAME	2014-08-31 11:48:47.857073	2014-08-31 11:48:47.857073
19246	5	14	18	2013-11-30	THE LYING GAME	2014-08-31 11:48:47.883668	2014-08-31 11:48:47.883668
19247	5	15	18	2013-11-30	THE LYING GAME	2014-08-31 11:48:47.909388	2014-08-31 11:48:47.909388
19248	5	16	18	2013-11-30	THE LYING GAME	2014-08-31 11:48:47.939228	2014-08-31 11:48:47.939228
19249	5	18	18	2013-11-30	THE LYING GAME	2014-08-31 11:48:47.965014	2014-08-31 11:48:47.965014
19250	5	19	18	2013-11-30	THE BIG BANG THEORY	2014-08-31 11:48:47.989694	2014-08-31 11:48:47.989694
19251	5	21	18	2013-11-30	PRIVATE PRACTICE	2014-08-31 11:48:48.014604	2014-08-31 11:48:48.014604
19252	5	22	18	2013-11-30	POIROT	2014-08-31 11:48:48.043033	2014-08-31 11:48:48.043033
19253	5	23	18	2013-11-30	POIROT	2014-08-31 11:48:48.334522	2014-08-31 11:48:48.334522
19254	5	7	18	2013-12-01	JUST FOR LAUGHS GAGS	2014-08-31 11:48:48.360965	2014-08-31 11:48:48.360965
19255	5	7	18	2013-12-01	JUST FOR LAUGHS GAGS	2014-08-31 11:48:48.386713	2014-08-31 11:48:48.386713
19256	5	8	18	2013-12-01	JUST FOR LAUGHS GAGS	2014-08-31 11:48:48.430362	2014-08-31 11:48:48.430362
19257	5	8	18	2013-12-01	JUST FOR LAUGHS GAGS	2014-08-31 11:48:48.473329	2014-08-31 11:48:48.473329
19258	5	8	18	2013-12-01	JUST FOR LAUGHS GAGS	2014-08-31 11:48:48.515555	2014-08-31 11:48:48.515555
19259	5	9	18	2013-12-01	MIKE AND MOLLY	2014-08-31 11:48:48.561439	2014-08-31 11:48:48.561439
19260	5	9	18	2013-12-01	MIKE AND MOLLY	2014-08-31 11:48:48.601622	2014-08-31 11:48:48.601622
19261	5	10	18	2013-12-01	MIKE AND MOLLY	2014-08-31 11:48:49.001308	2014-08-31 11:48:49.001308
19262	5	10	18	2013-12-01	MIKE AND MOLLY	2014-08-31 11:48:49.03814	2014-08-31 11:48:49.03814
19263	5	11	18	2013-12-01	MIKE AND MOLLY	2014-08-31 11:48:49.074353	2014-08-31 11:48:49.074353
19264	5	12	18	2013-12-01	MIKE AND MOLLY	2014-08-31 11:48:49.111353	2014-08-31 11:48:49.111353
19265	5	13	18	2013-12-01	THE VAMPIRE DIARIES	2014-08-31 11:48:49.152597	2014-08-31 11:48:49.152597
19266	5	13	18	2013-12-01	THE VAMPIRE DIARIES	2014-08-31 11:48:49.188668	2014-08-31 11:48:49.188668
19267	5	14	18	2013-12-01	LOST	2014-08-31 11:48:49.22819	2014-08-31 11:48:49.22819
19268	5	14	18	2013-12-01	LOST	2014-08-31 11:48:49.263142	2014-08-31 11:48:49.263142
19269	5	15	18	2013-12-01	LOST	2014-08-31 11:48:49.588204	2014-08-31 11:48:49.588204
19270	5	17	18	2013-12-01	LOST	2014-08-31 11:48:49.616396	2014-08-31 11:48:49.616396
19271	5	18	18	2013-12-01	LOST	2014-08-31 11:48:49.656027	2014-08-31 11:48:49.656027
19272	5	19	18	2013-12-01	MIKE AND MOLLY	2014-08-31 11:48:49.68565	2014-08-31 11:48:49.68565
19273	5	19	18	2013-12-01	MIKE AND MOLLY	2014-08-31 11:48:49.717511	2014-08-31 11:48:49.717511
19274	5	20	18	2013-12-01	THE BIG BANG THEORY	2014-08-31 11:48:49.748947	2014-08-31 11:48:49.748947
19275	5	20	18	2013-12-01	THE BIG BANG THEORY	2014-08-31 11:48:49.774233	2014-08-31 11:48:49.774233
19276	5	20	18	2013-12-01	THE BIG BANG THEORY	2014-08-31 11:48:49.801033	2014-08-31 11:48:49.801033
19277	5	20	18	2013-12-01	THE BIG BANG THEORY	2014-08-31 11:48:50.109917	2014-08-31 11:48:50.109917
19278	5	21	18	2013-12-01	THE VAMPIRE DIARIES	2014-08-31 11:48:50.143548	2014-08-31 11:48:50.143548
19279	5	22	18	2013-12-01	POIROT	2014-08-31 11:48:50.171806	2014-08-31 11:48:50.171806
19280	5	23	18	2013-12-01	POIROT	2014-08-31 11:48:50.199192	2014-08-31 11:48:50.199192
19281	5	16	18	2013-12-02	JUST FOR LAUGHS GAGS	2014-08-31 11:48:50.230312	2014-08-31 11:48:50.230312
19282	5	17	18	2013-12-02	THE LYING GAME	2014-08-31 11:48:50.259843	2014-08-31 11:48:50.259843
19283	5	18	18	2013-12-02	ELLEN DEGENERES SHOW	2014-08-31 11:48:50.286609	2014-08-31 11:48:50.286609
19284	5	18	18	2013-12-02	ELLEN DEGENERES SHOW	2014-08-31 11:48:50.311878	2014-08-31 11:48:50.311878
19285	5	19	18	2013-12-02	MALIBU COUNTRY	2014-08-31 11:48:50.617893	2014-08-31 11:48:50.617893
19286	5	20	18	2013-12-02	LOST	2014-08-31 11:48:50.653582	2014-08-31 11:48:50.653582
19287	5	20	18	2013-12-02	LOST	2014-08-31 11:48:50.680944	2014-08-31 11:48:50.680944
19288	5	21	18	2013-12-02	THE LYING GAME	2014-08-31 11:48:50.707962	2014-08-31 11:48:50.707962
19289	5	21	18	2013-12-02	THE LYING GAME	2014-08-31 11:48:50.734663	2014-08-31 11:48:50.734663
19290	5	22	18	2013-12-02	POIROT	2014-08-31 11:48:50.763105	2014-08-31 11:48:50.763105
19291	5	22	18	2013-12-02	POIROT	2014-08-31 11:48:50.791141	2014-08-31 11:48:50.791141
19292	5	23	18	2013-12-02	LOST	2014-08-31 11:48:50.816286	2014-08-31 11:48:50.816286
19293	5	23	18	2013-12-02	LOST	2014-08-31 11:48:50.845788	2014-08-31 11:48:50.845788
19294	5	16	18	2013-12-03	JUST FOR LAUGHS GAGS	2014-08-31 11:48:51.191079	2014-08-31 11:48:51.191079
19295	5	17	18	2013-12-03	THE LYING GAME	2014-08-31 11:48:51.217307	2014-08-31 11:48:51.217307
19296	5	19	18	2013-12-03	MALIBU COUNTRY	2014-08-31 11:48:51.248812	2014-08-31 11:48:51.248812
19297	5	20	18	2013-12-03	LOST	2014-08-31 11:48:51.276148	2014-08-31 11:48:51.276148
19298	5	20	18	2013-12-03	LOST	2014-08-31 11:48:51.303595	2014-08-31 11:48:51.303595
19299	5	21	18	2013-12-03	THE LYING GAME	2014-08-31 11:48:51.333121	2014-08-31 11:48:51.333121
19300	5	21	18	2013-12-03	THE LYING GAME	2014-08-31 11:48:51.358093	2014-08-31 11:48:51.358093
19301	5	22	18	2013-12-03	POIROT	2014-08-31 11:48:51.382947	2014-08-31 11:48:51.382947
19302	5	22	18	2013-12-03	POIROT	2014-08-31 11:48:51.713134	2014-08-31 11:48:51.713134
19303	5	23	18	2013-12-03	LOST	2014-08-31 11:48:51.740768	2014-08-31 11:48:51.740768
19304	5	16	18	2013-12-04	JUST FOR LAUGHS GAGS	2014-08-31 11:48:51.768916	2014-08-31 11:48:51.768916
19305	5	17	18	2013-12-04	THE LYING GAME	2014-08-31 11:48:51.798211	2014-08-31 11:48:51.798211
19306	5	19	18	2013-12-04	MALIBU COUNTRY	2014-08-31 11:48:51.83176	2014-08-31 11:48:51.83176
19307	5	20	18	2013-12-04	LOST	2014-08-31 11:48:51.860707	2014-08-31 11:48:51.860707
19308	5	21	18	2013-12-04	THE LYING GAME	2014-08-31 11:48:51.888584	2014-08-31 11:48:51.888584
19309	5	21	18	2013-12-04	THE LYING GAME	2014-08-31 11:48:51.913786	2014-08-31 11:48:51.913786
19310	5	22	18	2013-12-04	POIROT	2014-08-31 11:48:52.224201	2014-08-31 11:48:52.224201
19311	5	22	18	2013-12-04	POIROT	2014-08-31 11:48:52.253359	2014-08-31 11:48:52.253359
19312	5	23	18	2013-12-04	LOST	2014-08-31 11:48:52.281518	2014-08-31 11:48:52.281518
19313	5	23	18	2013-12-04	LOST	2014-08-31 11:48:52.307742	2014-08-31 11:48:52.307742
19314	5	16	18	2013-12-05	JUST FOR LAUGHS GAGS	2014-08-31 11:48:52.345024	2014-08-31 11:48:52.345024
19315	5	17	18	2013-12-05	THE LYING GAME	2014-08-31 11:48:52.376808	2014-08-31 11:48:52.376808
19316	5	19	18	2013-12-05	MALIBU COUNTRY	2014-08-31 11:48:52.401844	2014-08-31 11:48:52.401844
19317	5	20	18	2013-12-05	LOST	2014-08-31 11:48:52.434658	2014-08-31 11:48:52.434658
19318	5	21	18	2013-12-05	THE LYING GAME	2014-08-31 11:48:52.715534	2014-08-31 11:48:52.715534
19319	5	22	18	2013-12-05	POIROT	2014-08-31 11:48:52.747867	2014-08-31 11:48:52.747867
19320	5	22	18	2013-12-05	POIROT	2014-08-31 11:48:52.774663	2014-08-31 11:48:52.774663
19321	5	23	18	2013-12-05	LOST	2014-08-31 11:48:52.80092	2014-08-31 11:48:52.80092
19322	5	16	18	2013-12-06	JUST FOR LAUGHS GAGS	2014-08-31 11:48:52.832123	2014-08-31 11:48:52.832123
19323	5	17	18	2013-12-06	THE LYING GAME	2014-08-31 11:48:52.858678	2014-08-31 11:48:52.858678
19324	5	19	18	2013-12-06	MALIBU COUNTRY	2014-08-31 11:48:52.887655	2014-08-31 11:48:52.887655
19325	5	20	18	2013-12-06	LOST	2014-08-31 11:48:52.912952	2014-08-31 11:48:52.912952
19326	5	21	18	2013-12-06	THE LYING GAME	2014-08-31 11:48:53.222488	2014-08-31 11:48:53.222488
19327	5	21	18	2013-12-06	THE LYING GAME	2014-08-31 11:48:53.251855	2014-08-31 11:48:53.251855
19328	5	22	18	2013-12-06	POIROT	2014-08-31 11:48:53.280023	2014-08-31 11:48:53.280023
19329	5	22	18	2013-12-06	POIROT	2014-08-31 11:48:53.307244	2014-08-31 11:48:53.307244
19330	5	23	18	2013-12-06	LOST	2014-08-31 11:48:53.339395	2014-08-31 11:48:53.339395
19331	5	23	18	2013-12-06	LOST	2014-08-31 11:48:53.369238	2014-08-31 11:48:53.369238
19332	5	7	18	2013-12-07	JUST FOR LAUGHS GAGS	2014-08-31 11:48:53.397341	2014-08-31 11:48:53.397341
19333	5	7	18	2013-12-07	JUST FOR LAUGHS GAGS	2014-08-31 11:48:53.426378	2014-08-31 11:48:53.426378
19334	5	8	18	2013-12-07	JUST FOR LAUGHS GAGS	2014-08-31 11:48:53.736425	2014-08-31 11:48:53.736425
19335	5	8	18	2013-12-07	JUST FOR LAUGHS GAGS	2014-08-31 11:48:53.765568	2014-08-31 11:48:53.765568
19336	5	8	18	2013-12-07	JUST FOR LAUGHS GAGS	2014-08-31 11:48:53.795021	2014-08-31 11:48:53.795021
19337	5	9	18	2013-12-07	THE BIG BANG THEORY	2014-08-31 11:48:53.825059	2014-08-31 11:48:53.825059
19338	5	9	18	2013-12-07	THE BIG BANG THEORY	2014-08-31 11:48:53.85354	2014-08-31 11:48:53.85354
19339	5	10	18	2013-12-07	THE BIG BANG THEORY	2014-08-31 11:48:53.883781	2014-08-31 11:48:53.883781
19340	5	10	18	2013-12-07	THE BIG BANG THEORY	2014-08-31 11:48:53.911464	2014-08-31 11:48:53.911464
19341	5	11	18	2013-12-07	THE BIG BANG THEORY	2014-08-31 11:48:53.94306	2014-08-31 11:48:53.94306
19342	5	11	18	2013-12-07	THE BIG BANG THEORY	2014-08-31 11:48:53.97057	2014-08-31 11:48:53.97057
19343	5	11	18	2013-12-07	THE BIG BANG THEORY	2014-08-31 11:48:54.296465	2014-08-31 11:48:54.296465
19344	5	12	18	2013-12-07	NIRMALAS SPICE WORLD	2014-08-31 11:48:54.329149	2014-08-31 11:48:54.329149
19345	5	13	18	2013-12-07	PRIVATE PRACTICE	2014-08-31 11:48:54.357856	2014-08-31 11:48:54.357856
19346	5	14	18	2013-12-07	THE LYING GAME	2014-08-31 11:48:54.387345	2014-08-31 11:48:54.387345
19347	5	15	18	2013-12-07	THE LYING GAME	2014-08-31 11:48:54.414534	2014-08-31 11:48:54.414534
19348	5	16	18	2013-12-07	THE LYING GAME	2014-08-31 11:48:54.446113	2014-08-31 11:48:54.446113
19349	5	17	18	2013-12-07	THE LYING GAME	2014-08-31 11:48:54.473517	2014-08-31 11:48:54.473517
19350	5	19	18	2013-12-07	THE BIG BANG THEORY	2014-08-31 11:48:54.499031	2014-08-31 11:48:54.499031
19351	5	20	18	2013-12-07	THE BIG BANG THEORY	2014-08-31 11:48:54.812691	2014-08-31 11:48:54.812691
19352	5	21	18	2013-12-07	PRIVATE PRACTICE	2014-08-31 11:48:54.849754	2014-08-31 11:48:54.849754
19353	5	22	18	2013-12-07	POIROT	2014-08-31 11:48:54.878318	2014-08-31 11:48:54.878318
19354	5	23	18	2013-12-07	POIROT	2014-08-31 11:48:54.905503	2014-08-31 11:48:54.905503
19355	5	7	18	2013-12-08	JUST FOR LAUGHS GAGS	2014-08-31 11:48:54.937193	2014-08-31 11:48:54.937193
19356	5	7	18	2013-12-08	JUST FOR LAUGHS GAGS	2014-08-31 11:48:54.967349	2014-08-31 11:48:54.967349
19357	5	8	18	2013-12-08	JUST FOR LAUGHS GAGS	2014-08-31 11:48:54.994691	2014-08-31 11:48:54.994691
19358	5	8	18	2013-12-08	JUST FOR LAUGHS GAGS	2014-08-31 11:48:55.025384	2014-08-31 11:48:55.025384
19359	5	9	18	2013-12-08	FRIENDS-Z ENG	2014-08-31 11:48:55.336503	2014-08-31 11:48:55.336503
19360	5	9	18	2013-12-08	FRIENDS-Z ENG	2014-08-31 11:48:55.365983	2014-08-31 11:48:55.365983
19361	5	10	18	2013-12-08	FRIENDS-Z ENG	2014-08-31 11:48:55.394289	2014-08-31 11:48:55.394289
19362	5	10	18	2013-12-08	FRIENDS-Z ENG	2014-08-31 11:48:55.425359	2014-08-31 11:48:55.425359
19363	5	11	18	2013-12-08	FRIENDS-Z ENG	2014-08-31 11:48:55.454255	2014-08-31 11:48:55.454255
19364	5	12	18	2013-12-08	FRIENDS-Z ENG	2014-08-31 11:48:55.481887	2014-08-31 11:48:55.481887
19365	5	12	18	2013-12-08	THE BIG BANG THEORY	2014-08-31 11:48:55.507518	2014-08-31 11:48:55.507518
19366	5	12	18	2013-12-08	THE BIG BANG THEORY	2014-08-31 11:48:55.537009	2014-08-31 11:48:55.537009
19367	5	12	18	2013-12-08	THE BIG BANG THEORY	2014-08-31 11:48:55.838664	2014-08-31 11:48:55.838664
19368	5	12	18	2013-12-08	THE BIG BANG THEORY	2014-08-31 11:48:55.868492	2014-08-31 11:48:55.868492
19369	5	13	18	2013-12-08	THE VAMPIRE DIARIES	2014-08-31 11:48:55.897026	2014-08-31 11:48:55.897026
19370	5	13	18	2013-12-08	THE VAMPIRE DIARIES	2014-08-31 11:48:55.927499	2014-08-31 11:48:55.927499
19371	5	14	18	2013-12-08	LOST	2014-08-31 11:48:55.956422	2014-08-31 11:48:55.956422
19372	5	15	18	2013-12-08	LOST	2014-08-31 11:48:55.984149	2014-08-31 11:48:55.984149
19373	5	15	18	2013-12-08	LOST	2014-08-31 11:48:56.034229	2014-08-31 11:48:56.034229
19374	5	15	18	2013-12-08	LOST	2014-08-31 11:48:56.072371	2014-08-31 11:48:56.072371
19375	5	16	18	2013-12-08	LOST	2014-08-31 11:48:56.385832	2014-08-31 11:48:56.385832
19376	5	18	18	2013-12-08	LOST	2014-08-31 11:48:56.414199	2014-08-31 11:48:56.414199
19377	5	19	18	2013-12-08	FRIENDS-Z ENG	2014-08-31 11:48:56.449823	2014-08-31 11:48:56.449823
19378	5	19	18	2013-12-08	FRIENDS-Z ENG	2014-08-31 11:48:56.479515	2014-08-31 11:48:56.479515
19379	5	20	18	2013-12-08	THE BIG BANG THEORY	2014-08-31 11:48:56.506647	2014-08-31 11:48:56.506647
19380	5	20	18	2013-12-08	THE BIG BANG THEORY	2014-08-31 11:48:56.534383	2014-08-31 11:48:56.534383
19381	5	20	18	2013-12-08	THE BIG BANG THEORY	2014-08-31 11:48:56.562387	2014-08-31 11:48:56.562387
19382	5	20	18	2013-12-08	THE BIG BANG THEORY	2014-08-31 11:48:56.589852	2014-08-31 11:48:56.589852
19383	5	21	18	2013-12-08	THE VAMPIRE DIARIES	2014-08-31 11:48:56.909772	2014-08-31 11:48:56.909772
19384	5	22	18	2013-12-08	POIROT	2014-08-31 11:48:56.936854	2014-08-31 11:48:56.936854
19385	5	23	18	2013-12-08	POIROT	2014-08-31 11:48:56.964383	2014-08-31 11:48:56.964383
19386	5	16	18	2013-12-09	JUST FOR LAUGHS GAGS	2014-08-31 11:48:56.992577	2014-08-31 11:48:56.992577
19387	5	17	18	2013-12-09	THE LYING GAME	2014-08-31 11:48:57.02357	2014-08-31 11:48:57.02357
19388	5	19	18	2013-12-09	MALIBU COUNTRY	2014-08-31 11:48:57.051436	2014-08-31 11:48:57.051436
19389	5	21	18	2013-12-09	THE LYING GAME	2014-08-31 11:48:57.07834	2014-08-31 11:48:57.07834
19390	5	21	18	2013-12-09	THE LYING GAME	2014-08-31 11:48:57.104439	2014-08-31 11:48:57.104439
19391	5	22	18	2013-12-09	POIROT	2014-08-31 11:48:57.147193	2014-08-31 11:48:57.147193
19392	5	22	18	2013-12-09	POIROT	2014-08-31 11:48:57.44517	2014-08-31 11:48:57.44517
19393	5	23	18	2013-12-09	LOST	2014-08-31 11:48:57.473956	2014-08-31 11:48:57.473956
19394	5	16	18	2013-12-10	JUST FOR LAUGHS GAGS	2014-08-31 11:48:57.501449	2014-08-31 11:48:57.501449
19395	5	17	18	2013-12-10	THE LYING GAME	2014-08-31 11:48:57.5323	2014-08-31 11:48:57.5323
19396	5	19	18	2013-12-10	MALIBU COUNTRY	2014-08-31 11:48:57.560823	2014-08-31 11:48:57.560823
19397	5	22	18	2013-12-10	POIROT	2014-08-31 11:48:57.587964	2014-08-31 11:48:57.587964
19398	5	22	18	2013-12-10	POIROT	2014-08-31 11:48:57.612343	2014-08-31 11:48:57.612343
19399	5	23	18	2013-12-10	LOST	2014-08-31 11:48:57.641568	2014-08-31 11:48:57.641568
19400	5	16	18	2013-12-11	JUST FOR LAUGHS GAGS	2014-08-31 11:48:57.948656	2014-08-31 11:48:57.948656
19401	5	17	18	2013-12-11	THE LYING GAME	2014-08-31 11:48:57.976145	2014-08-31 11:48:57.976145
19402	5	19	18	2013-12-11	MALIBU COUNTRY	2014-08-31 11:48:58.00388	2014-08-31 11:48:58.00388
19403	5	22	18	2013-12-11	POIROT	2014-08-31 11:48:58.035229	2014-08-31 11:48:58.035229
19404	5	22	18	2013-12-11	POIROT	2014-08-31 11:48:58.062625	2014-08-31 11:48:58.062625
19405	5	23	18	2013-12-11	LOST	2014-08-31 11:48:58.089753	2014-08-31 11:48:58.089753
19406	5	16	18	2013-12-12	JUST FOR LAUGHS GAGS	2014-08-31 11:48:58.114758	2014-08-31 11:48:58.114758
19407	5	17	18	2013-12-12	SWITCHED AT BIRTH	2014-08-31 11:48:58.143844	2014-08-31 11:48:58.143844
19408	5	19	18	2013-12-12	MALIBU COUNTRY	2014-08-31 11:48:58.444855	2014-08-31 11:48:58.444855
19409	5	22	18	2013-12-12	POIROT	2014-08-31 11:48:58.473455	2014-08-31 11:48:58.473455
19410	5	22	18	2013-12-12	POIROT	2014-08-31 11:48:58.501602	2014-08-31 11:48:58.501602
19411	5	23	18	2013-12-12	LOST	2014-08-31 11:48:58.533149	2014-08-31 11:48:58.533149
19412	5	16	18	2013-12-13	JUST FOR LAUGHS GAGS	2014-08-31 11:48:58.563823	2014-08-31 11:48:58.563823
19413	5	17	18	2013-12-13	SWITCHED AT BIRTH	2014-08-31 11:48:58.597198	2014-08-31 11:48:58.597198
19414	5	22	18	2013-12-13	POIROT	2014-08-31 11:48:58.629509	2014-08-31 11:48:58.629509
19415	5	22	18	2013-12-13	POIROT	2014-08-31 11:48:58.665827	2014-08-31 11:48:58.665827
19416	5	23	18	2013-12-13	LOST	2014-08-31 11:48:58.978145	2014-08-31 11:48:58.978145
19417	5	7	18	2013-12-14	JUST FOR LAUGHS GAGS	2014-08-31 11:48:59.00607	2014-08-31 11:48:59.00607
19418	5	7	18	2013-12-14	JUST FOR LAUGHS GAGS	2014-08-31 11:48:59.038223	2014-08-31 11:48:59.038223
19419	5	8	18	2013-12-14	JUST FOR LAUGHS GAGS	2014-08-31 11:48:59.065499	2014-08-31 11:48:59.065499
19420	5	8	18	2013-12-14	JUST FOR LAUGHS GAGS	2014-08-31 11:48:59.093776	2014-08-31 11:48:59.093776
19421	5	9	18	2013-12-14	THE BIG BANG THEORY	2014-08-31 11:48:59.129862	2014-08-31 11:48:59.129862
19422	5	9	18	2013-12-14	THE BIG BANG THEORY	2014-08-31 11:48:59.155124	2014-08-31 11:48:59.155124
19423	5	9	18	2013-12-14	THE BIG BANG THEORY	2014-08-31 11:48:59.183907	2014-08-31 11:48:59.183907
19424	5	10	18	2013-12-14	THE BIG BANG THEORY	2014-08-31 11:48:59.499891	2014-08-31 11:48:59.499891
19425	5	10	18	2013-12-14	THE BIG BANG THEORY	2014-08-31 11:48:59.538875	2014-08-31 11:48:59.538875
19426	5	11	18	2013-12-14	THE BIG BANG THEORY	2014-08-31 11:48:59.567364	2014-08-31 11:48:59.567364
19427	5	11	18	2013-12-14	THE BIG BANG THEORY	2014-08-31 11:48:59.595324	2014-08-31 11:48:59.595324
19428	5	12	18	2013-12-14	NIRMALAS SPICE WORLD	2014-08-31 11:48:59.629788	2014-08-31 11:48:59.629788
19429	5	13	18	2013-12-14	PRIVATE PRACTICE	2014-08-31 11:48:59.655496	2014-08-31 11:48:59.655496
19430	5	13	18	2013-12-14	PRIVATE PRACTICE	2014-08-31 11:48:59.683564	2014-08-31 11:48:59.683564
19431	5	14	18	2013-12-14	THE LYING GAME	2014-08-31 11:48:59.707594	2014-08-31 11:48:59.707594
19432	5	15	18	2013-12-14	THE LYING GAME	2014-08-31 11:49:00.004138	2014-08-31 11:49:00.004138
19433	5	16	18	2013-12-14	SWITCHED AT BIRTH	2014-08-31 11:49:00.035617	2014-08-31 11:49:00.035617
19434	5	17	18	2013-12-14	SWITCHED AT BIRTH	2014-08-31 11:49:00.062755	2014-08-31 11:49:00.062755
19435	5	19	18	2013-12-14	THE BIG BANG THEORY	2014-08-31 11:49:00.090491	2014-08-31 11:49:00.090491
19436	5	21	18	2013-12-14	PRIVATE PRACTICE	2014-08-31 11:49:00.11754	2014-08-31 11:49:00.11754
19437	5	22	18	2013-12-14	POIROT	2014-08-31 11:49:00.148218	2014-08-31 11:49:00.148218
19438	5	23	18	2013-12-14	POIROT	2014-08-31 11:49:00.174277	2014-08-31 11:49:00.174277
19439	5	7	18	2013-12-15	JUST FOR LAUGHS GAGS	2014-08-31 11:49:00.200056	2014-08-31 11:49:00.200056
19440	5	7	18	2013-12-15	JUST FOR LAUGHS GAGS	2014-08-31 11:49:00.229329	2014-08-31 11:49:00.229329
19441	5	8	18	2013-12-15	JUST FOR LAUGHS GAGS	2014-08-31 11:49:00.536568	2014-08-31 11:49:00.536568
19442	5	8	18	2013-12-15	JUST FOR LAUGHS GAGS	2014-08-31 11:49:00.563577	2014-08-31 11:49:00.563577
19443	5	9	18	2013-12-15	FRIENDS-Z ENG	2014-08-31 11:49:00.589817	2014-08-31 11:49:00.589817
19444	5	9	18	2013-12-15	FRIENDS-Z ENG	2014-08-31 11:49:00.616192	2014-08-31 11:49:00.616192
19445	5	9	18	2013-12-15	FRIENDS-Z ENG	2014-08-31 11:49:00.652536	2014-08-31 11:49:00.652536
19446	5	10	18	2013-12-15	FRIENDS-Z ENG	2014-08-31 11:49:00.678551	2014-08-31 11:49:00.678551
19447	5	10	18	2013-12-15	FRIENDS-Z ENG	2014-08-31 11:49:00.704347	2014-08-31 11:49:00.704347
19448	5	10	18	2013-12-15	FRIENDS-Z ENG	2014-08-31 11:49:00.732639	2014-08-31 11:49:00.732639
19449	5	11	18	2013-12-15	FRIENDS-Z ENG	2014-08-31 11:49:01.062587	2014-08-31 11:49:01.062587
19450	5	12	18	2013-12-15	FRIENDS-Z ENG	2014-08-31 11:49:01.091694	2014-08-31 11:49:01.091694
19451	5	12	18	2013-12-15	THE BIG BANG THEORY	2014-08-31 11:49:01.123873	2014-08-31 11:49:01.123873
19452	5	12	18	2013-12-15	THE BIG BANG THEORY	2014-08-31 11:49:01.151519	2014-08-31 11:49:01.151519
19453	5	12	18	2013-12-15	THE BIG BANG THEORY	2014-08-31 11:49:01.179904	2014-08-31 11:49:01.179904
19454	5	12	18	2013-12-15	THE BIG BANG THEORY	2014-08-31 11:49:01.208534	2014-08-31 11:49:01.208534
19455	5	13	18	2013-12-15	THE VAMPIRE DIARIES	2014-08-31 11:49:01.24071	2014-08-31 11:49:01.24071
19456	5	14	18	2013-12-15	LOST	2014-08-31 11:49:01.267447	2014-08-31 11:49:01.267447
19457	5	15	18	2013-12-15	LOST	2014-08-31 11:49:01.565856	2014-08-31 11:49:01.565856
19458	5	15	18	2013-12-15	LOST	2014-08-31 11:49:01.592712	2014-08-31 11:49:01.592712
19459	5	17	18	2013-12-15	LOST	2014-08-31 11:49:01.62354	2014-08-31 11:49:01.62354
19460	5	17	18	2013-12-15	LOST	2014-08-31 11:49:01.650463	2014-08-31 11:49:01.650463
19461	5	19	18	2013-12-15	FRIENDS-Z ENG	2014-08-31 11:49:01.677684	2014-08-31 11:49:01.677684
19462	5	20	18	2013-12-15	THE BIG BANG THEORY	2014-08-31 11:49:01.703863	2014-08-31 11:49:01.703863
19463	5	20	18	2013-12-15	THE BIG BANG THEORY	2014-08-31 11:49:01.734213	2014-08-31 11:49:01.734213
19464	5	20	18	2013-12-15	THE BIG BANG THEORY	2014-08-31 11:49:01.760662	2014-08-31 11:49:01.760662
19465	5	20	18	2013-12-15	THE BIG BANG THEORY	2014-08-31 11:49:02.090991	2014-08-31 11:49:02.090991
19466	5	21	18	2013-12-15	THE VAMPIRE DIARIES	2014-08-31 11:49:02.117961	2014-08-31 11:49:02.117961
19467	5	22	18	2013-12-15	POIROT	2014-08-31 11:49:02.150798	2014-08-31 11:49:02.150798
19468	5	23	18	2013-12-15	POIROT	2014-08-31 11:49:02.180082	2014-08-31 11:49:02.180082
19469	5	16	18	2013-12-16	JUST FOR LAUGHS GAGS	2014-08-31 11:49:02.208244	2014-08-31 11:49:02.208244
19470	5	17	18	2013-12-16	SWITCHED AT BIRTH	2014-08-31 11:49:02.238142	2014-08-31 11:49:02.238142
19471	5	22	18	2013-12-16	POIROT	2014-08-31 11:49:02.264735	2014-08-31 11:49:02.264735
19472	5	22	18	2013-12-16	POIROT	2014-08-31 11:49:02.299252	2014-08-31 11:49:02.299252
19473	5	23	18	2013-12-16	LOST	2014-08-31 11:49:02.613588	2014-08-31 11:49:02.613588
19474	5	16	18	2013-12-17	JUST FOR LAUGHS GAGS	2014-08-31 11:49:02.646538	2014-08-31 11:49:02.646538
19475	5	17	18	2013-12-17	SWITCHED AT BIRTH	2014-08-31 11:49:02.674355	2014-08-31 11:49:02.674355
19476	5	22	18	2013-12-17	POIROT	2014-08-31 11:49:02.702377	2014-08-31 11:49:02.702377
19477	5	23	18	2013-12-17	LOST	2014-08-31 11:49:02.734547	2014-08-31 11:49:02.734547
19478	5	16	18	2013-12-18	JUST FOR LAUGHS GAGS	2014-08-31 11:49:02.762657	2014-08-31 11:49:02.762657
19479	5	17	18	2013-12-18	SWITCHED AT BIRTH	2014-08-31 11:49:02.790781	2014-08-31 11:49:02.790781
19480	5	22	18	2013-12-18	POIROT	2014-08-31 11:49:02.827725	2014-08-31 11:49:02.827725
19481	5	23	18	2013-12-18	LOST	2014-08-31 11:49:03.150647	2014-08-31 11:49:03.150647
19482	5	16	18	2013-12-19	JUST FOR LAUGHS GAGS	2014-08-31 11:49:03.180425	2014-08-31 11:49:03.180425
19483	5	17	18	2013-12-19	SWITCHED AT BIRTH	2014-08-31 11:49:03.209863	2014-08-31 11:49:03.209863
19484	5	22	18	2013-12-19	POIROT	2014-08-31 11:49:03.251574	2014-08-31 11:49:03.251574
19485	5	16	18	2013-12-20	JUST FOR LAUGHS GAGS	2014-08-31 11:49:03.293398	2014-08-31 11:49:03.293398
19486	5	16	18	2013-12-20	JUST FOR LAUGHS GAGS	2014-08-31 11:49:03.360989	2014-08-31 11:49:03.360989
19487	5	16	18	2013-12-20	JUST FOR LAUGHS GAGS	2014-08-31 11:49:03.395635	2014-08-31 11:49:03.395635
19488	5	17	18	2013-12-20	SWITCHED AT BIRTH	2014-08-31 11:49:03.424772	2014-08-31 11:49:03.424772
19489	5	22	18	2013-12-20	POIROT	2014-08-31 11:49:03.450464	2014-08-31 11:49:03.450464
19490	5	7	18	2013-12-21	JUST FOR LAUGHS GAGS	2014-08-31 11:49:03.760744	2014-08-31 11:49:03.760744
19491	5	7	18	2013-12-21	JUST FOR LAUGHS GAGS	2014-08-31 11:49:03.788211	2014-08-31 11:49:03.788211
19492	5	7	18	2013-12-21	JUST FOR LAUGHS GAGS	2014-08-31 11:49:03.817162	2014-08-31 11:49:03.817162
19493	5	8	18	2013-12-21	JUST FOR LAUGHS GAGS	2014-08-31 11:49:03.844256	2014-08-31 11:49:03.844256
19494	5	9	18	2013-12-21	THE BIG BANG THEORY	2014-08-31 11:49:03.872984	2014-08-31 11:49:03.872984
19495	5	9	18	2013-12-21	THE BIG BANG THEORY	2014-08-31 11:49:03.8995	2014-08-31 11:49:03.8995
19496	5	10	18	2013-12-21	THE BIG BANG THEORY	2014-08-31 11:49:03.929662	2014-08-31 11:49:03.929662
19497	5	10	18	2013-12-21	THE BIG BANG THEORY	2014-08-31 11:49:03.954882	2014-08-31 11:49:03.954882
19498	5	11	18	2013-12-21	THE BIG BANG THEORY	2014-08-31 11:49:04.271209	2014-08-31 11:49:04.271209
19499	5	11	18	2013-12-21	THE BIG BANG THEORY	2014-08-31 11:49:04.299691	2014-08-31 11:49:04.299691
19500	5	12	18	2013-12-21	NIRMALAS SPICE WORLD	2014-08-31 11:49:04.334198	2014-08-31 11:49:04.334198
19501	5	13	18	2013-12-21	PRIVATE PRACTICE	2014-08-31 11:49:04.361221	2014-08-31 11:49:04.361221
19502	5	13	18	2013-12-21	PRIVATE PRACTICE	2014-08-31 11:49:04.38784	2014-08-31 11:49:04.38784
19503	5	14	18	2013-12-21	SWITCHED AT BIRTH	2014-08-31 11:49:04.414124	2014-08-31 11:49:04.414124
19504	5	15	18	2013-12-21	SWITCHED AT BIRTH	2014-08-31 11:49:04.446432	2014-08-31 11:49:04.446432
19505	5	16	18	2013-12-21	SWITCHED AT BIRTH	2014-08-31 11:49:04.473009	2014-08-31 11:49:04.473009
19506	5	17	18	2013-12-21	SWITCHED AT BIRTH	2014-08-31 11:49:04.792243	2014-08-31 11:49:04.792243
19507	5	19	18	2013-12-21	THE BIG BANG THEORY	2014-08-31 11:49:04.823178	2014-08-31 11:49:04.823178
19508	5	21	18	2013-12-21	PRIVATE PRACTICE	2014-08-31 11:49:04.850097	2014-08-31 11:49:04.850097
19509	5	22	18	2013-12-21	POIROT	2014-08-31 11:49:04.876929	2014-08-31 11:49:04.876929
19510	5	23	18	2013-12-21	POIROT	2014-08-31 11:49:04.904578	2014-08-31 11:49:04.904578
19511	5	7	18	2013-12-22	JUST FOR LAUGHS GAGS	2014-08-31 11:49:04.936076	2014-08-31 11:49:04.936076
19512	5	7	18	2013-12-22	JUST FOR LAUGHS GAGS	2014-08-31 11:49:04.96428	2014-08-31 11:49:04.96428
19513	5	7	18	2013-12-22	JUST FOR LAUGHS GAGS	2014-08-31 11:49:04.990786	2014-08-31 11:49:04.990786
19514	5	8	18	2013-12-22	JUST FOR LAUGHS GAGS	2014-08-31 11:49:05.297651	2014-08-31 11:49:05.297651
19515	5	8	18	2013-12-22	JUST FOR LAUGHS GAGS	2014-08-31 11:49:05.329392	2014-08-31 11:49:05.329392
19516	5	8	18	2013-12-22	JUST FOR LAUGHS GAGS	2014-08-31 11:49:05.356721	2014-08-31 11:49:05.356721
19517	5	9	18	2013-12-22	FRIENDS-Z ENG	2014-08-31 11:49:05.38503	2014-08-31 11:49:05.38503
19518	5	9	18	2013-12-22	FRIENDS-Z ENG	2014-08-31 11:49:05.41095	2014-08-31 11:49:05.41095
19519	5	9	18	2013-12-22	FRIENDS-Z ENG	2014-08-31 11:49:05.441372	2014-08-31 11:49:05.441372
19520	5	10	18	2013-12-22	FRIENDS-Z ENG	2014-08-31 11:49:05.469001	2014-08-31 11:49:05.469001
19521	5	10	18	2013-12-22	FRIENDS-Z ENG	2014-08-31 11:49:05.494518	2014-08-31 11:49:05.494518
19522	5	11	18	2013-12-22	FRIENDS-Z ENG	2014-08-31 11:49:05.805182	2014-08-31 11:49:05.805182
19523	5	12	18	2013-12-22	THE BIG BANG THEORY	2014-08-31 11:49:05.837286	2014-08-31 11:49:05.837286
19524	5	12	18	2013-12-22	THE BIG BANG THEORY	2014-08-31 11:49:05.864799	2014-08-31 11:49:05.864799
19525	5	12	18	2013-12-22	THE BIG BANG THEORY	2014-08-31 11:49:05.891577	2014-08-31 11:49:05.891577
19526	5	12	18	2013-12-22	THE BIG BANG THEORY	2014-08-31 11:49:05.923167	2014-08-31 11:49:05.923167
19527	5	13	18	2013-12-22	THE VAMPIRE DIARIES	2014-08-31 11:49:05.952182	2014-08-31 11:49:05.952182
19528	5	14	18	2013-12-22	LOST	2014-08-31 11:49:05.980346	2014-08-31 11:49:05.980346
19529	5	15	18	2013-12-22	LOST	2014-08-31 11:49:06.024295	2014-08-31 11:49:06.024295
19530	5	15	18	2013-12-22	LOST	2014-08-31 11:49:06.366482	2014-08-31 11:49:06.366482
19531	5	16	18	2013-12-22	LOST	2014-08-31 11:49:06.393721	2014-08-31 11:49:06.393721
19532	5	17	18	2013-12-22	LOST	2014-08-31 11:49:06.423976	2014-08-31 11:49:06.423976
19533	5	18	18	2013-12-22	FRIENDS-Z ENG	2014-08-31 11:49:06.451649	2014-08-31 11:49:06.451649
19534	5	20	18	2013-12-22	FRIENDS-Z ENG	2014-08-31 11:49:06.4781	2014-08-31 11:49:06.4781
19535	5	20	18	2013-12-22	THE BIG BANG THEORY	2014-08-31 11:49:06.503988	2014-08-31 11:49:06.503988
19536	5	20	18	2013-12-22	THE BIG BANG THEORY	2014-08-31 11:49:06.537673	2014-08-31 11:49:06.537673
19537	5	20	18	2013-12-22	THE BIG BANG THEORY	2014-08-31 11:49:06.562579	2014-08-31 11:49:06.562579
19538	5	20	18	2013-12-22	THE BIG BANG THEORY	2014-08-31 11:49:06.586909	2014-08-31 11:49:06.586909
19539	5	22	18	2013-12-22	POIROT	2014-08-31 11:49:06.875461	2014-08-31 11:49:06.875461
19540	5	23	18	2013-12-22	POIROT	2014-08-31 11:49:06.901949	2014-08-31 11:49:06.901949
19541	5	16	18	2013-12-23	JUST FOR LAUGHS GAGS	2014-08-31 11:49:06.937304	2014-08-31 11:49:06.937304
19542	5	16	18	2013-12-23	JUST FOR LAUGHS GAGS	2014-08-31 11:49:06.964513	2014-08-31 11:49:06.964513
19543	5	17	18	2013-12-23	SWITCHED AT BIRTH	2014-08-31 11:49:06.992216	2014-08-31 11:49:06.992216
19544	5	16	18	2013-12-24	JUST FOR LAUGHS GAGS	2014-08-31 11:49:07.017514	2014-08-31 11:49:07.017514
19545	5	16	18	2013-12-24	JUST FOR LAUGHS GAGS	2014-08-31 11:49:07.046214	2014-08-31 11:49:07.046214
19546	5	17	18	2013-12-24	SWITCHED AT BIRTH	2014-08-31 11:49:07.069897	2014-08-31 11:49:07.069897
19547	5	16	18	2013-12-25	THE MIDDLE	2014-08-31 11:49:07.363411	2014-08-31 11:49:07.363411
19548	5	17	18	2013-12-25	THE MIDDLE	2014-08-31 11:49:07.390147	2014-08-31 11:49:07.390147
19549	5	17	18	2013-12-25	THE MIDDLE	2014-08-31 11:49:07.415919	2014-08-31 11:49:07.415919
19550	5	16	18	2013-12-26	JUST FOR LAUGHS GAGS	2014-08-31 11:49:07.447155	2014-08-31 11:49:07.447155
19551	5	16	18	2013-12-26	JUST FOR LAUGHS GAGS	2014-08-31 11:49:07.472548	2014-08-31 11:49:07.472548
19552	5	17	18	2013-12-26	SWITCHED AT BIRTH	2014-08-31 11:49:07.497172	2014-08-31 11:49:07.497172
\.


--
-- Name: spots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spots_id_seq', 19552, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, client_id) FROM stdin;
3	demo@spatialaccessapp.in	$2a$10$F/fEdprLndH.AnPO/qDeFO9cIDIGcpbzicpMprIW/ey/U5YDRBV2a	\N	\N	\N	0	\N	\N	\N	\N	2014-07-30 12:26:27.523303	2014-07-30 12:26:27.523303	1
4	admin@spatialaccessapp.in	$2a$10$S6SVwVv7EuKlptPYfU1mRuHF9K5O5.qlp67ryIEPN/5xIpeJZ.9bC	\N	\N	\N	0	\N	\N	\N	\N	2014-08-19 07:03:05.431125	2014-08-19 07:03:05.431125	2
5	content@spatialaccessapp.in	$2a$10$rnJjvvMSN49lck8byHqW..faS/QhebJIQUjy4hQHN3wkuKg1DMm52	\N	\N	\N	0	\N	\N	\N	\N	2014-08-19 07:03:05.552821	2014-08-19 07:03:05.552821	2
6	demo@spatialaccessapp.in	$2a$10$tfH4ODXXdvn.2ucOXscW.u8boA8VJWNic/vnjta4mjFyLOFMEAtI2	\N	\N	\N	0	\N	\N	\N	\N	2014-08-19 07:03:05.675135	2014-08-19 07:03:05.675135	2
7	rahul@adanigroup.com	$2a$10$m4H86AlET6tcg3WBF74zjeFt2ky5JSROazG8smEEX6cnH0Ez0JTaO	\N	\N	\N	0	\N	\N	\N	\N	2014-08-19 07:07:09.38872	2014-08-19 07:07:09.38872	2
2	content@spatialaccessapp.in	$2a$10$5ejLYHJpWLGD0Dtu6jIjfO9Hz2RuiN7iaQZa0Va76XgnaF2zNYIEu	\N	\N	\N	7	2014-08-19 07:11:20.931937	2014-08-19 06:40:08.802688	122.179.177.91	122.179.177.91	2014-07-30 12:26:27.405299	2014-08-19 07:11:20.934624	1
1	admin@spatialaccessapp.in	$2a$10$7LGrlDi4ezjx6rnYN5Z0kuDyQkAhdpYgppuoMDWJOJI3.MdtP0l1m	\N	\N	\N	9	2014-08-30 06:18:57.434099	2014-08-26 05:25:43.426693	182.237.150.56	111.119.219.227	2014-07-30 12:26:27.241995	2014-08-30 06:18:57.437453	1
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 7, true);


--
-- Name: annochannels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY annochannels
    ADD CONSTRAINT annochannels_pkey PRIMARY KEY (id);


--
-- Name: annotations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY annotations
    ADD CONSTRAINT annotations_pkey PRIMARY KEY (id);


--
-- Name: calculated_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY calculated_data
    ADD CONSTRAINT calculated_data_pkey PRIMARY KEY (id);


--
-- Name: campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (id);


--
-- Name: channels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY channels
    ADD CONSTRAINT channels_pkey PRIMARY KEY (id);


--
-- Name: clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: cslides_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cslides
    ADD CONSTRAINT cslides_pkey PRIMARY KEY (id);


--
-- Name: customizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customizations
    ADD CONSTRAINT customizations_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY delayed_jobs
    ADD CONSTRAINT delayed_jobs_pkey PRIMARY KEY (id);


--
-- Name: hours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hours
    ADD CONSTRAINT hours_pkey PRIMARY KEY (id);


--
-- Name: presentation_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY presentation_templates
    ADD CONSTRAINT presentation_templates_pkey PRIMARY KEY (id);


--
-- Name: presentations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY presentations
    ADD CONSTRAINT presentations_pkey PRIMARY KEY (id);


--
-- Name: rails_admin_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rails_admin_histories
    ADD CONSTRAINT rails_admin_histories_pkey PRIMARY KEY (id);


--
-- Name: slides_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY slides
    ADD CONSTRAINT slides_pkey PRIMARY KEY (id);


--
-- Name: slots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY slots
    ADD CONSTRAINT slots_pkey PRIMARY KEY (id);


--
-- Name: spots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spots
    ADD CONSTRAINT spots_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs_priority; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX delayed_jobs_priority ON delayed_jobs USING btree (priority, run_at);


--
-- Name: index_rails_admin_histories; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_rails_admin_histories ON rails_admin_histories USING btree (item, "table", month, year);


--
-- Name: index_users_on_client_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_users_on_client_id ON users USING btree (client_id);


--
-- Name: index_users_on_email_and_client_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email_and_client_id ON users USING btree (email, client_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

