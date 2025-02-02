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
    secret_number integer NOT NULL,
    number_of_guesses integer NOT NULL
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

INSERT INTO public.games VALUES (1, 1, 632, 633);
INSERT INTO public.games VALUES (2, 1, 852, 853);
INSERT INTO public.games VALUES (3, 2, 28, 29);
INSERT INTO public.games VALUES (4, 2, 811, 812);
INSERT INTO public.games VALUES (5, 1, 697, 700);
INSERT INTO public.games VALUES (6, 1, 5, 7);
INSERT INTO public.games VALUES (7, 1, 890, 891);
INSERT INTO public.games VALUES (8, 3, 292, 293);
INSERT INTO public.games VALUES (9, 3, 630, 631);
INSERT INTO public.games VALUES (10, 4, 472, 473);
INSERT INTO public.games VALUES (11, 4, 569, 570);
INSERT INTO public.games VALUES (12, 3, 755, 758);
INSERT INTO public.games VALUES (13, 3, 895, 897);
INSERT INTO public.games VALUES (14, 3, 83, 84);
INSERT INTO public.games VALUES (15, 5, 533, 534);
INSERT INTO public.games VALUES (16, 5, 419, 420);
INSERT INTO public.games VALUES (17, 6, 241, 242);
INSERT INTO public.games VALUES (18, 6, 651, 652);
INSERT INTO public.games VALUES (19, 5, 694, 697);
INSERT INTO public.games VALUES (20, 5, 210, 212);
INSERT INTO public.games VALUES (21, 5, 161, 162);
INSERT INTO public.games VALUES (22, 7, 839, 840);
INSERT INTO public.games VALUES (23, 7, 639, 640);
INSERT INTO public.games VALUES (24, 8, 298, 299);
INSERT INTO public.games VALUES (25, 8, 21, 22);
INSERT INTO public.games VALUES (26, 7, 447, 450);
INSERT INTO public.games VALUES (27, 7, 359, 361);
INSERT INTO public.games VALUES (28, 7, 486, 487);
INSERT INTO public.games VALUES (29, 9, 530, 531);
INSERT INTO public.games VALUES (30, 9, 106, 107);
INSERT INTO public.games VALUES (31, 10, 840, 841);
INSERT INTO public.games VALUES (32, 10, 721, 722);
INSERT INTO public.games VALUES (33, 9, 836, 839);
INSERT INTO public.games VALUES (34, 9, 80, 82);
INSERT INTO public.games VALUES (35, 9, 505, 506);
INSERT INTO public.games VALUES (36, 11, 219, 220);
INSERT INTO public.games VALUES (37, 11, 744, 745);
INSERT INTO public.games VALUES (38, 12, 288, 289);
INSERT INTO public.games VALUES (39, 12, 993, 994);
INSERT INTO public.games VALUES (40, 11, 2, 5);
INSERT INTO public.games VALUES (41, 11, 434, 436);
INSERT INTO public.games VALUES (42, 11, 925, 926);
INSERT INTO public.games VALUES (43, 13, 590, 591);
INSERT INTO public.games VALUES (44, 13, 862, 863);
INSERT INTO public.games VALUES (45, 14, 829, 830);
INSERT INTO public.games VALUES (46, 14, 538, 539);
INSERT INTO public.games VALUES (47, 13, 828, 831);
INSERT INTO public.games VALUES (48, 13, 824, 826);
INSERT INTO public.games VALUES (49, 13, 557, 558);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1722953606367');
INSERT INTO public.users VALUES (2, 'user_1722953606366');
INSERT INTO public.users VALUES (3, 'user_1722954068711');
INSERT INTO public.users VALUES (4, 'user_1722954068710');
INSERT INTO public.users VALUES (5, 'user_1722954298172');
INSERT INTO public.users VALUES (6, 'user_1722954298171');
INSERT INTO public.users VALUES (7, 'user_1722954343862');
INSERT INTO public.users VALUES (8, 'user_1722954343861');
INSERT INTO public.users VALUES (9, 'user_1722954502182');
INSERT INTO public.users VALUES (10, 'user_1722954502181');
INSERT INTO public.users VALUES (11, 'user_1722954553355');
INSERT INTO public.users VALUES (12, 'user_1722954553354');
INSERT INTO public.users VALUES (13, 'user_1722954600430');
INSERT INTO public.users VALUES (14, 'user_1722954600429');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 49, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 14, true);


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

