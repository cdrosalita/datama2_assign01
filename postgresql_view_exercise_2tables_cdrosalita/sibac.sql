--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

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

DROP DATABASE "sibac";
--
-- Name: sibac; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "sibac" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


\connect "sibac"

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

SET default_table_access_method = "heap";

--
-- Name: docu_agree; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."docu_agree" (
    "id" integer,
    "da_date" "date",
    "da_status" character varying,
    "da_duration" integer,
    "franchi_franchi_id" integer,
    "franchi_man_id" integer,
    "franchi_doc_agree_id" integer,
    "franchi_form_id" integer,
    "franchi_loc_id" integer,
    "fd_id" integer NOT NULL
);


--
-- Name: docu_agree_fd_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."docu_agree_fd_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: docu_agree_fd_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."docu_agree_fd_id_seq" OWNED BY "public"."docu_agree"."fd_id";


--
-- Name: franchisee; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."franchisee" (
    "id" integer,
    "fran_fname" character varying,
    "fran_lname" character varying,
    "fran_bday" "date",
    "fran_addr" character varying,
    "fran_sala" integer,
    "fran_email" character varying,
    "fran_num" integer,
    "franchi_id" integer,
    "manage_id" integer,
    "docargee_id" integer,
    "form_id" integer,
    "location_id" integer,
    "fd_id" integer NOT NULL
);


--
-- Name: fran_agree; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW "public"."fran_agree" AS
 SELECT "franchisee"."fran_fname",
    "docu_agree"."da_status",
    "franchisee"."fran_bday",
    "docu_agree"."da_duration",
    "franchisee"."fran_addr"
   FROM ("public"."franchisee"
     JOIN "public"."docu_agree" ON (("franchisee"."fd_id" = "docu_agree"."fd_id")))
  WHERE ("docu_agree"."da_duration" < 32);


--
-- Name: franchisee_fd_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."franchisee_fd_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: franchisee_fd_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."franchisee_fd_id_seq" OWNED BY "public"."franchisee"."fd_id";


--
-- Name: docu_agree fd_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."docu_agree" ALTER COLUMN "fd_id" SET DEFAULT "nextval"('"public"."docu_agree_fd_id_seq"'::"regclass");


--
-- Name: franchisee fd_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."franchisee" ALTER COLUMN "fd_id" SET DEFAULT "nextval"('"public"."franchisee_fd_id_seq"'::"regclass");


--
-- Data for Name: docu_agree; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."docu_agree" ("id", "da_date", "da_status", "da_duration", "franchi_franchi_id", "franchi_man_id", "franchi_doc_agree_id", "franchi_form_id", "franchi_loc_id", "fd_id") VALUES (12, '2019-11-11', 'active', 10, 12, 12, 12, 12, 12, 1);
INSERT INTO "public"."docu_agree" ("id", "da_date", "da_status", "da_duration", "franchi_franchi_id", "franchi_man_id", "franchi_doc_agree_id", "franchi_form_id", "franchi_loc_id", "fd_id") VALUES (31, '2019-03-03', 'active', 31, 31, 31, 31, 31, 31, 2);
INSERT INTO "public"."docu_agree" ("id", "da_date", "da_status", "da_duration", "franchi_franchi_id", "franchi_man_id", "franchi_doc_agree_id", "franchi_form_id", "franchi_loc_id", "fd_id") VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99);


--
-- Data for Name: franchisee; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."franchisee" ("id", "fran_fname", "fran_lname", "fran_bday", "fran_addr", "fran_sala", "fran_email", "fran_num", "franchi_id", "manage_id", "docargee_id", "form_id", "location_id", "fd_id") VALUES (1, 'aron', 'realto', '2000-11-11', 'taguig', 500, 'aron@mail', 11, 11, 11, 11, 11, 11, 1);
INSERT INTO "public"."franchisee" ("id", "fran_fname", "fran_lname", "fran_bday", "fran_addr", "fran_sala", "fran_email", "fran_num", "franchi_id", "manage_id", "docargee_id", "form_id", "location_id", "fd_id") VALUES (2, 'jhay', 'realti', '2000-12-12', 'makati', 600, 'jhay@mail', 22, 22, 22, 22, 22, 22, 2);
INSERT INTO "public"."franchisee" ("id", "fran_fname", "fran_lname", "fran_bday", "fran_addr", "fran_sala", "fran_email", "fran_num", "franchi_id", "manage_id", "docargee_id", "form_id", "location_id", "fd_id") VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 66);


--
-- Name: docu_agree_fd_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."docu_agree_fd_id_seq"', 2, true);


--
-- Name: franchisee_fd_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."franchisee_fd_id_seq"', 2, true);


--
-- PostgreSQL database dump complete
--

