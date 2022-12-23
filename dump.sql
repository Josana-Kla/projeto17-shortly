--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token uuid NOT NULL,
    "isActived" boolean DEFAULT true NOT NULL,
    "createdAt" date DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "createdAt" date DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" date DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: visits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.visits (
    id integer NOT NULL,
    "urlId" integer NOT NULL,
    "qtdVisits" integer DEFAULT 0 NOT NULL
);


--
-- Name: visits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.visits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.visits_id_seq OWNED BY public.visits.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: visits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visits ALTER COLUMN id SET DEFAULT nextval('public.visits_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 5, 'f885102c-55be-4879-9b7d-fde215946b49', true, '2022-12-23');
INSERT INTO public.sessions VALUES (2, 6, '0aa9c1c6-0dd7-41cd-beee-2221b4e3223d', true, '2022-12-23');
INSERT INTO public.sessions VALUES (3, 6, '0a078f3d-5263-4509-b16f-815c4f52d3a5', true, '2022-12-23');
INSERT INTO public.sessions VALUES (4, 5, 'f3a23d8c-07bc-4360-a8ea-ddf9993b2aa4', true, '2022-12-23');
INSERT INTO public.sessions VALUES (5, 7, 'b8ac135e-dd2e-4ecc-8aca-3c617def9a6d', true, '2022-12-23');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (1, 6, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.techtudo.com.br%2Fnoticias%2F2019%2F12%2Fapple-revela-que-mario-kart-tour-e-o-jogo-mais-baixado-de-2019-no-iphone.ghtml&psig=AOvVaw02EKcLTjVRjjzhbxYa6W8n&ust=1671900114426000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJi1nqaXkPwCFQAAAAAdAAAAABAD', '_8J3DmCohM', '2022-12-23');
INSERT INTO public.urls VALUES (2, 5, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.techtudo.com.br%2Fnoticias%2F2019%2F12%2Fapple-revela-que-mario-kart-tour-e-o-jogo-mais-baixado-de-2019-no-iphone.ghtml&psig=AOvVaw02EKcLTjVRjjzhbxYa6W8n&ust=1671900114426000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJi1nqaXkPwCFQAAAAAdAAAAABAD', 'xVRrTbZese', '2022-12-23');
INSERT INTO public.urls VALUES (3, 7, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.techtudo.com.br%2Fnoticias%2F2019%2F12%2Fapple-revela-que-mario-kart-tour-e-o-jogo-mais-baixado-de-2019-no-iphone.ghtml&psig=AOvVaw02EKcLTjVRjjzhbxYa6W8n&ust=1671900114426000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJi1nqaXkPwCFQAAAAAdAAAAABAD', 'GduCfxEBQn', '2022-12-23');
INSERT INTO public.urls VALUES (4, 7, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.techtudo.com.br%2Fnoticias%2F2019%2F12%2Fapple-revela-que-mario-kart-tour-e-o-jogo-mais-baixado-de-2019-no-iphone.ghtml&psig=AOvVaw02EKcLTjVRjjzhbxYa6W8n&ust=1671900114426000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJi1nqaXkPwCFQAAAAAdAAAAABAD', 'Ybxjm5FFcR', '2022-12-23');
INSERT INTO public.urls VALUES (5, 7, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.techtudo.com.br%2Fnoticias%2F2019%2F12%2Fapple-revela-que-mario-kart-tour-e-o-jogo-mais-baixado-de-2019-no-iphone.ghtml&psig=AOvVaw02EKcLTjVRjjzhbxYa6W8n&ust=1671900114426000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJi1nqaXkPwCFQAAAAAdAAAAABAD', 'pOVbFBRKOW', '2022-12-23');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Carolina', 'ca@gmail.com', '12345678', '2022-12-19');
INSERT INTO public.users VALUES (2, 'Mariana', 'maah@gmail.com', '12345678', '2022-12-19');
INSERT INTO public.users VALUES (3, 'Tia Dulce', 'dulce@gmail.com', '12345678', '2022-12-19');
INSERT INTO public.users VALUES (4, 'Camila', 'cami@gmail.com', '$2b$10$iH8ATHZJI50WtttfjNTMle53F7bQ0jQ/nhVmHZKck8AAkvT96RSbS', '2022-12-23');
INSERT INTO public.users VALUES (5, 'Gina', 'gi@gmail.com', '$2b$10$ZK.Tjjxzs3qV53e77WiiTuCCoqNXlVCRpBoPD6Dw681qc9HDNp4JO', '2022-12-23');
INSERT INTO public.users VALUES (6, 'Jojo', 'jojo@gmail.com', '$2b$10$ufDRRlXVwd1VqOZMt1O8NecGkA2ZUjeXXoCePMPwzovETlPThTytu', '2022-12-23');
INSERT INTO public.users VALUES (7, 'Mia', 'mia@gmail.com', '$2b$10$L8N9DWQNCg5.KLuJOcUC1OvIe4dzXxPwscUORS6fUdT5hB1h6BGT6', '2022-12-23');


--
-- Data for Name: visits; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.visits VALUES (1, 1, 3);
INSERT INTO public.visits VALUES (2, 1, 3);
INSERT INTO public.visits VALUES (3, 2, 2);
INSERT INTO public.visits VALUES (4, 2, 2);
INSERT INTO public.visits VALUES (5, 3, 8);
INSERT INTO public.visits VALUES (6, 3, 8);
INSERT INTO public.visits VALUES (7, 3, 8);
INSERT INTO public.visits VALUES (8, 3, 8);
INSERT INTO public.visits VALUES (9, 3, 8);
INSERT INTO public.visits VALUES (10, 3, 8);
INSERT INTO public.visits VALUES (11, 3, 8);
INSERT INTO public.visits VALUES (12, 3, 8);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 5, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- Name: visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.visits_id_seq', 12, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: visits visits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: visits visits_urlId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT "visits_urlId_fkey" FOREIGN KEY ("urlId") REFERENCES public.urls(id);


--
-- PostgreSQL database dump complete
--

