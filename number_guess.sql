--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 4, 23);
INSERT INTO public.games VALUES (2, 5, 25);
INSERT INTO public.games VALUES (3, 4, 6);
INSERT INTO public.games VALUES (4, 4, 4);
INSERT INTO public.games VALUES (5, 5, 10);
INSERT INTO public.games VALUES (6, 5, 1);
INSERT INTO public.games VALUES (7, 17, 267);
INSERT INTO public.games VALUES (8, 17, 842);
INSERT INTO public.games VALUES (9, 18, 581);
INSERT INTO public.games VALUES (10, 18, 81);
INSERT INTO public.games VALUES (11, 17, 131);
INSERT INTO public.games VALUES (12, 17, 64);
INSERT INTO public.games VALUES (13, 17, 134);
INSERT INTO public.games VALUES (14, 4, 11);
INSERT INTO public.games VALUES (15, 19, 921);
INSERT INTO public.games VALUES (16, 19, 40);
INSERT INTO public.games VALUES (17, 20, 642);
INSERT INTO public.games VALUES (18, 20, 150);
INSERT INTO public.games VALUES (19, 19, 884);
INSERT INTO public.games VALUES (20, 19, 255);
INSERT INTO public.games VALUES (21, 19, 698);
INSERT INTO public.games VALUES (22, 21, 203);
INSERT INTO public.games VALUES (23, 21, 193);
INSERT INTO public.games VALUES (24, 22, 330);
INSERT INTO public.games VALUES (25, 22, 564);
INSERT INTO public.games VALUES (26, 21, 524);
INSERT INTO public.games VALUES (27, 21, 65);
INSERT INTO public.games VALUES (28, 21, 581);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (4, 'Shaun');
INSERT INTO public.users VALUES (5, 'Bryan');
INSERT INTO public.users VALUES (6, 'user_1727212859885');
INSERT INTO public.users VALUES (7, 'user_1727212859884');
INSERT INTO public.users VALUES (8, 'Test');
INSERT INTO public.users VALUES (9, 'user_1727213754053');
INSERT INTO public.users VALUES (10, 'user_1727213754052');
INSERT INTO public.users VALUES (11, 'user_1727213786656');
INSERT INTO public.users VALUES (12, 'user_1727213786655');
INSERT INTO public.users VALUES (13, 'user_1727213843572');
INSERT INTO public.users VALUES (14, 'user_1727213843571');
INSERT INTO public.users VALUES (15, 'user_1727215475081');
INSERT INTO public.users VALUES (16, 'user_1727215475080');
INSERT INTO public.users VALUES (17, 'user_1727215788692');
INSERT INTO public.users VALUES (18, 'user_1727215788691');
INSERT INTO public.users VALUES (19, 'user_1727215883825');
INSERT INTO public.users VALUES (20, 'user_1727215883824');
INSERT INTO public.users VALUES (21, 'user_1727216198422');
INSERT INTO public.users VALUES (22, 'user_1727216198421');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 28, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 22, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

