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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ahoy_events; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ahoy_events (
    id uuid NOT NULL,
    visit_id uuid,
    user_id integer,
    name character varying,
    properties text,
    "time" timestamp without time zone
);


--
-- Name: ahoy_messages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ahoy_messages (
    id integer NOT NULL,
    token character varying,
    "to" text,
    user_id integer,
    user_type character varying,
    mailer character varying,
    subject text,
    content text,
    utm_source character varying,
    utm_medium character varying,
    utm_campaign character varying,
    sent_at timestamp without time zone,
    opened_at timestamp without time zone,
    clicked_at timestamp without time zone
);


--
-- Name: ahoy_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ahoy_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ahoy_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ahoy_messages_id_seq OWNED BY ahoy_messages.id;


--
-- Name: audits; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE audits (
    id integer NOT NULL,
    auditable_id integer,
    auditable_type character varying,
    associated_id integer,
    associated_type character varying,
    user_id integer,
    user_type character varying,
    username character varying,
    action character varying,
    audited_changes text,
    version integer DEFAULT 0,
    comment character varying,
    remote_address character varying,
    request_uuid character varying,
    created_at timestamp without time zone
);


--
-- Name: audits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE audits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: audits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE audits_id_seq OWNED BY audits.id;


--
-- Name: authentications; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE authentications (
    id integer NOT NULL,
    user_id integer NOT NULL,
    provider character varying NOT NULL,
    uid character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: authentications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authentications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authentications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authentications_id_seq OWNED BY authentications.id;


--
-- Name: blog_assets; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE blog_assets (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying DEFAULT ''::character varying,
    asset character varying,
    post_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: blog_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE blog_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE blog_assets_id_seq OWNED BY blog_assets.id;


--
-- Name: blog_posts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE blog_posts (
    id integer NOT NULL,
    text_raw text,
    text text,
    title character varying,
    author_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: blog_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE blog_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE blog_posts_id_seq OWNED BY blog_posts.id;


--
-- Name: documentation_pages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE documentation_pages (
    id integer NOT NULL,
    title character varying,
    permalink character varying,
    content text,
    compiled_content text,
    parent_id integer,
    "position" integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: documentation_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE documentation_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: documentation_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE documentation_pages_id_seq OWNED BY documentation_pages.id;


--
-- Name: documentation_screenshots; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE documentation_screenshots (
    id integer NOT NULL,
    alt_text character varying
);


--
-- Name: documentation_screenshots_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE documentation_screenshots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: documentation_screenshots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE documentation_screenshots_id_seq OWNED BY documentation_screenshots.id;


--
-- Name: nifty_attachments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nifty_attachments (
    id integer NOT NULL,
    parent_id integer,
    parent_type character varying,
    token character varying,
    digest character varying,
    role character varying,
    file_name character varying,
    file_type character varying,
    data bytea,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: nifty_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nifty_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nifty_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nifty_attachments_id_seq OWNED BY nifty_attachments.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying,
    resource_id integer,
    resource_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying NOT NULL,
    crypted_password character varying,
    salt character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    remember_me_token character varying,
    remember_me_token_expires_at timestamp without time zone,
    reset_password_token character varying,
    reset_password_token_expires_at timestamp without time zone,
    reset_password_email_sent_at timestamp without time zone,
    activation_state character varying,
    activation_token character varying,
    activation_token_expires_at timestamp without time zone,
    nickname character varying NOT NULL,
    first_name character varying,
    last_name character varying,
    birthday date
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: visits; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE visits (
    id uuid NOT NULL,
    visitor_id uuid,
    ip character varying,
    user_agent text,
    referrer text,
    landing_page text,
    user_id integer,
    referring_domain character varying,
    search_keyword character varying,
    browser character varying,
    os character varying,
    device_type character varying,
    screen_height integer,
    screen_width integer,
    country character varying,
    region character varying,
    city character varying,
    postal_code character varying,
    latitude numeric,
    longitude numeric,
    utm_source character varying,
    utm_medium character varying,
    utm_term character varying,
    utm_content character varying,
    utm_campaign character varying,
    started_at timestamp without time zone
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ahoy_messages ALTER COLUMN id SET DEFAULT nextval('ahoy_messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY audits ALTER COLUMN id SET DEFAULT nextval('audits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authentications ALTER COLUMN id SET DEFAULT nextval('authentications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_assets ALTER COLUMN id SET DEFAULT nextval('blog_assets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_posts ALTER COLUMN id SET DEFAULT nextval('blog_posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY documentation_pages ALTER COLUMN id SET DEFAULT nextval('documentation_pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY documentation_screenshots ALTER COLUMN id SET DEFAULT nextval('documentation_screenshots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nifty_attachments ALTER COLUMN id SET DEFAULT nextval('nifty_attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: ahoy_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ahoy_events
    ADD CONSTRAINT ahoy_events_pkey PRIMARY KEY (id);


--
-- Name: ahoy_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ahoy_messages
    ADD CONSTRAINT ahoy_messages_pkey PRIMARY KEY (id);


--
-- Name: audits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);


--
-- Name: authentications_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY authentications
    ADD CONSTRAINT authentications_pkey PRIMARY KEY (id);


--
-- Name: blog_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blog_assets
    ADD CONSTRAINT blog_assets_pkey PRIMARY KEY (id);


--
-- Name: blog_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blog_posts
    ADD CONSTRAINT blog_posts_pkey PRIMARY KEY (id);


--
-- Name: documentation_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY documentation_pages
    ADD CONSTRAINT documentation_pages_pkey PRIMARY KEY (id);


--
-- Name: documentation_screenshots_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY documentation_screenshots
    ADD CONSTRAINT documentation_screenshots_pkey PRIMARY KEY (id);


--
-- Name: nifty_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nifty_attachments
    ADD CONSTRAINT nifty_attachments_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: visits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);


--
-- Name: associated_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX associated_index ON audits USING btree (associated_id, associated_type);


--
-- Name: auditable_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auditable_index ON audits USING btree (auditable_id, auditable_type);


--
-- Name: index_ahoy_events_on_time; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_ahoy_events_on_time ON ahoy_events USING btree ("time");


--
-- Name: index_ahoy_events_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_ahoy_events_on_user_id ON ahoy_events USING btree (user_id);


--
-- Name: index_ahoy_events_on_visit_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_ahoy_events_on_visit_id ON ahoy_events USING btree (visit_id);


--
-- Name: index_ahoy_messages_on_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_ahoy_messages_on_token ON ahoy_messages USING btree (token);


--
-- Name: index_ahoy_messages_on_user_id_and_user_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_ahoy_messages_on_user_id_and_user_type ON ahoy_messages USING btree (user_id, user_type);


--
-- Name: index_audits_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_audits_on_created_at ON audits USING btree (created_at);


--
-- Name: index_audits_on_request_uuid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_audits_on_request_uuid ON audits USING btree (request_uuid);


--
-- Name: index_authentications_on_provider_and_uid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_authentications_on_provider_and_uid ON authentications USING btree (provider, uid);


--
-- Name: index_blog_assets_on_post_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_blog_assets_on_post_id ON blog_assets USING btree (post_id);


--
-- Name: index_blog_posts_on_author_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_blog_posts_on_author_id ON blog_posts USING btree (author_id);


--
-- Name: index_roles_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roles_on_name ON roles USING btree (name);


--
-- Name: index_roles_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roles_on_name_and_resource_type_and_resource_id ON roles USING btree (name, resource_type, resource_id);


--
-- Name: index_users_on_activation_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_activation_token ON users USING btree (activation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_lowercase_nickname; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_lowercase_nickname ON users USING btree (lower((nickname)::text));


--
-- Name: index_users_on_remember_me_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_remember_me_token ON users USING btree (remember_me_token);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_visits_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_visits_on_user_id ON visits USING btree (user_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: user_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX user_index ON audits USING btree (user_id, user_type);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20140416011605');

INSERT INTO schema_migrations (version) VALUES ('20140501145459');

INSERT INTO schema_migrations (version) VALUES ('20140711185212');

INSERT INTO schema_migrations (version) VALUES ('20140724111844');

INSERT INTO schema_migrations (version) VALUES ('20140724114255');

INSERT INTO schema_migrations (version) VALUES ('20141122144400');

INSERT INTO schema_migrations (version) VALUES ('20150606111017');

INSERT INTO schema_migrations (version) VALUES ('20150621211550');

INSERT INTO schema_migrations (version) VALUES ('20150622094904');

INSERT INTO schema_migrations (version) VALUES ('20150622094949');

INSERT INTO schema_migrations (version) VALUES ('20150622094950');

INSERT INTO schema_migrations (version) VALUES ('20150622094952');

INSERT INTO schema_migrations (version) VALUES ('20150622094953');

INSERT INTO schema_migrations (version) VALUES ('20150622115029');

INSERT INTO schema_migrations (version) VALUES ('20150622115034');

INSERT INTO schema_migrations (version) VALUES ('20150622115708');

INSERT INTO schema_migrations (version) VALUES ('20150622132630');

INSERT INTO schema_migrations (version) VALUES ('20150628134605');

