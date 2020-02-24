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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: curriculum_topic_ancestry_level; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.curriculum_topic_ancestry_level AS ENUM (
    'subject',
    'branch',
    'topic',
    'section'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: curriculum_board_subjects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.curriculum_board_subjects (
    id bigint NOT NULL,
    board_id bigint NOT NULL,
    subject_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: curriculum_board_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.curriculum_board_subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: curriculum_board_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.curriculum_board_subjects_id_seq OWNED BY public.curriculum_board_subjects.id;


--
-- Name: curriculum_boards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.curriculum_boards (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: curriculum_boards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.curriculum_boards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: curriculum_boards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.curriculum_boards_id_seq OWNED BY public.curriculum_boards.id;


--
-- Name: curriculum_sections_learning_skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.curriculum_sections_learning_skills (
    id bigint NOT NULL,
    section_id bigint NOT NULL,
    learning_skill_id bigint NOT NULL,
    grade integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: curriculum_sections_learning_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.curriculum_sections_learning_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: curriculum_sections_learning_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.curriculum_sections_learning_skills_id_seq OWNED BY public.curriculum_sections_learning_skills.id;


--
-- Name: curriculum_topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.curriculum_topics (
    id bigint NOT NULL,
    title character varying,
    description text,
    ancestry_level public.curriculum_topic_ancestry_level NOT NULL,
    ancestry character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: curriculum_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.curriculum_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: curriculum_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.curriculum_topics_id_seq OWNED BY public.curriculum_topics.id;


--
-- Name: knowledge_concepts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.knowledge_concepts (
    id bigint NOT NULL,
    title character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: knowledge_concepts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.knowledge_concepts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: knowledge_concepts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.knowledge_concepts_id_seq OWNED BY public.knowledge_concepts.id;


--
-- Name: learning_skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.learning_skills (
    id bigint NOT NULL,
    body character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: learning_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.learning_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: learning_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.learning_skills_id_seq OWNED BY public.learning_skills.id;


--
-- Name: learning_skills_knowledge_concepts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.learning_skills_knowledge_concepts (
    id bigint NOT NULL,
    skill_id bigint NOT NULL,
    knowledge_concept_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: learning_skills_knowledge_concepts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.learning_skills_knowledge_concepts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: learning_skills_knowledge_concepts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.learning_skills_knowledge_concepts_id_seq OWNED BY public.learning_skills_knowledge_concepts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: curriculum_board_subjects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curriculum_board_subjects ALTER COLUMN id SET DEFAULT nextval('public.curriculum_board_subjects_id_seq'::regclass);


--
-- Name: curriculum_boards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curriculum_boards ALTER COLUMN id SET DEFAULT nextval('public.curriculum_boards_id_seq'::regclass);


--
-- Name: curriculum_sections_learning_skills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curriculum_sections_learning_skills ALTER COLUMN id SET DEFAULT nextval('public.curriculum_sections_learning_skills_id_seq'::regclass);


--
-- Name: curriculum_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curriculum_topics ALTER COLUMN id SET DEFAULT nextval('public.curriculum_topics_id_seq'::regclass);


--
-- Name: knowledge_concepts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.knowledge_concepts ALTER COLUMN id SET DEFAULT nextval('public.knowledge_concepts_id_seq'::regclass);


--
-- Name: learning_skills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.learning_skills ALTER COLUMN id SET DEFAULT nextval('public.learning_skills_id_seq'::regclass);


--
-- Name: learning_skills_knowledge_concepts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.learning_skills_knowledge_concepts ALTER COLUMN id SET DEFAULT nextval('public.learning_skills_knowledge_concepts_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: curriculum_board_subjects curriculum_board_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curriculum_board_subjects
    ADD CONSTRAINT curriculum_board_subjects_pkey PRIMARY KEY (id);


--
-- Name: curriculum_boards curriculum_boards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curriculum_boards
    ADD CONSTRAINT curriculum_boards_pkey PRIMARY KEY (id);


--
-- Name: curriculum_sections_learning_skills curriculum_sections_learning_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curriculum_sections_learning_skills
    ADD CONSTRAINT curriculum_sections_learning_skills_pkey PRIMARY KEY (id);


--
-- Name: curriculum_topics curriculum_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curriculum_topics
    ADD CONSTRAINT curriculum_topics_pkey PRIMARY KEY (id);


--
-- Name: knowledge_concepts knowledge_concepts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.knowledge_concepts
    ADD CONSTRAINT knowledge_concepts_pkey PRIMARY KEY (id);


--
-- Name: learning_skills_knowledge_concepts learning_skills_knowledge_concepts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.learning_skills_knowledge_concepts
    ADD CONSTRAINT learning_skills_knowledge_concepts_pkey PRIMARY KEY (id);


--
-- Name: learning_skills learning_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.learning_skills
    ADD CONSTRAINT learning_skills_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_c_sections_l_skills_on_l_skill_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_c_sections_l_skills_on_l_skill_id ON public.curriculum_sections_learning_skills USING btree (learning_skill_id);


--
-- Name: index_curriculum_board_subjects_on_board_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_curriculum_board_subjects_on_board_id ON public.curriculum_board_subjects USING btree (board_id);


--
-- Name: index_curriculum_board_subjects_on_subject_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_curriculum_board_subjects_on_subject_id ON public.curriculum_board_subjects USING btree (subject_id);


--
-- Name: index_curriculum_sections_learning_skills_on_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_curriculum_sections_learning_skills_on_section_id ON public.curriculum_sections_learning_skills USING btree (section_id);


--
-- Name: index_curriculum_topics_on_ancestry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_curriculum_topics_on_ancestry ON public.curriculum_topics USING btree (ancestry);


--
-- Name: index_l_skills_k_concepts_on_k_concept_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_l_skills_k_concepts_on_k_concept_id ON public.learning_skills_knowledge_concepts USING btree (knowledge_concept_id);


--
-- Name: index_learning_skills_knowledge_concepts_on_skill_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_learning_skills_knowledge_concepts_on_skill_id ON public.learning_skills_knowledge_concepts USING btree (skill_id);


--
-- Name: curriculum_board_subjects fk_rails_08e786c7af; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curriculum_board_subjects
    ADD CONSTRAINT fk_rails_08e786c7af FOREIGN KEY (subject_id) REFERENCES public.curriculum_topics(id);


--
-- Name: curriculum_board_subjects fk_rails_1c8f810b99; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curriculum_board_subjects
    ADD CONSTRAINT fk_rails_1c8f810b99 FOREIGN KEY (board_id) REFERENCES public.curriculum_boards(id);


--
-- Name: curriculum_sections_learning_skills fk_rails_37b5baa6e0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curriculum_sections_learning_skills
    ADD CONSTRAINT fk_rails_37b5baa6e0 FOREIGN KEY (section_id) REFERENCES public.curriculum_topics(id);


--
-- Name: learning_skills_knowledge_concepts fk_rails_7020b230e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.learning_skills_knowledge_concepts
    ADD CONSTRAINT fk_rails_7020b230e3 FOREIGN KEY (knowledge_concept_id) REFERENCES public.knowledge_concepts(id);


--
-- Name: curriculum_sections_learning_skills fk_rails_86a4e5b39b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curriculum_sections_learning_skills
    ADD CONSTRAINT fk_rails_86a4e5b39b FOREIGN KEY (learning_skill_id) REFERENCES public.learning_skills(id);


--
-- Name: learning_skills_knowledge_concepts fk_rails_d741619a2b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.learning_skills_knowledge_concepts
    ADD CONSTRAINT fk_rails_d741619a2b FOREIGN KEY (skill_id) REFERENCES public.learning_skills(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20200212235427'),
('20200213020607'),
('20200213020718'),
('20200213220455'),
('20200213223950'),
('20200217234035'),
('20200218001113');


