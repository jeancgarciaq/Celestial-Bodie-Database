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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: biome; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.biome (
    biome_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text
);


ALTER TABLE public.biome OWNER TO freecodecamp;

--
-- Name: biome_biome_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.biome_biome_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.biome_biome_id_seq OWNER TO freecodecamp;

--
-- Name: biome_biome_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.biome_biome_id_seq OWNED BY public.biome.biome_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    num_planet integer NOT NULL,
    num_moon integer,
    size_in_km numeric(5,1)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    size integer,
    distance_planet numeric(4,1),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    is_moon boolean,
    quantity_moon integer,
    close_star integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_biomes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_biomes (
    planet_id integer NOT NULL,
    biome_id integer NOT NULL,
    planet_biomes_id integer NOT NULL,
    boleano boolean,
    name character varying(3),
    unico integer
);


ALTER TABLE public.planet_biomes OWNER TO freecodecamp;

--
-- Name: planet_biomes_planet_biomes_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_biomes_planet_biomes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_biomes_planet_biomes_id_seq OWNER TO freecodecamp;

--
-- Name: planet_biomes_planet_biomes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_biomes_planet_biomes_id_seq OWNED BY public.planet_biomes.planet_biomes_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    size integer,
    lumens integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: biome biome_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.biome ALTER COLUMN biome_id SET DEFAULT nextval('public.biome_biome_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_biomes planet_biomes_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_biomes ALTER COLUMN planet_biomes_id SET DEFAULT nextval('public.planet_biomes_planet_biomes_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: biome; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.biome VALUES (1, 'dessert', NULL);
INSERT INTO public.biome VALUES (2, 'iceland', NULL);
INSERT INTO public.biome VALUES (3, 'rainy', NULL);
INSERT INTO public.biome VALUES (4, 'isolated', NULL);
INSERT INTO public.biome VALUES (5, 'calm', NULL);
INSERT INTO public.biome VALUES (6, 'torm', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 12, 15, 650.0);
INSERT INTO public.galaxy VALUES (2, 'Galipanda', 23, 12, 780.0);
INSERT INTO public.galaxy VALUES (3, 'Tormentibiris', 7, 1, 120.0);
INSERT INTO public.galaxy VALUES (4, 'Asipuesoro', 24, 12, 670.0);
INSERT INTO public.galaxy VALUES (5, 'Blancoñol', 77, 125, 990.0);
INSERT INTO public.galaxy VALUES (6, 'Bitcoinaso', 13, 45, 770.0);
INSERT INTO public.galaxy VALUES (7, 'Finalista', 34, 10, 890.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna1', 45, 300.0, 17);
INSERT INTO public.moon VALUES (22, 'Luna2', 45, 300.0, 18);
INSERT INTO public.moon VALUES (23, 'Luna3', 45, 300.0, 19);
INSERT INTO public.moon VALUES (24, 'Luna4', 45, 300.0, 20);
INSERT INTO public.moon VALUES (25, 'Luna5', 45, 300.0, 21);
INSERT INTO public.moon VALUES (26, 'Luna6', 45, 300.0, 22);
INSERT INTO public.moon VALUES (27, 'Luna7', 45, 300.0, 23);
INSERT INTO public.moon VALUES (28, 'Luna8', 45, 300.0, 24);
INSERT INTO public.moon VALUES (29, 'Luna9', 45, 300.0, 25);
INSERT INTO public.moon VALUES (30, 'Luna10', 45, 300.0, 26);
INSERT INTO public.moon VALUES (31, 'Luna11', 45, 300.0, 27);
INSERT INTO public.moon VALUES (32, 'Luna12', 45, 300.0, 28);
INSERT INTO public.moon VALUES (33, 'Luna13', 45, 300.0, 29);
INSERT INTO public.moon VALUES (34, 'Luna14', 45, 300.0, 30);
INSERT INTO public.moon VALUES (35, 'Luna15', 45, 300.0, 31);
INSERT INTO public.moon VALUES (36, 'Luna16', 45, 300.0, 32);
INSERT INTO public.moon VALUES (37, 'Luna17', 45, 300.0, 33);
INSERT INTO public.moon VALUES (38, 'Luna18', 45, 300.0, 34);
INSERT INTO public.moon VALUES (39, 'Luna19', 45, 300.0, 35);
INSERT INTO public.moon VALUES (40, 'Luna20', 45, 300.0, 36);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (17, 'Planet1', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 1);
INSERT INTO public.planet VALUES (18, 'Planet2', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 2);
INSERT INTO public.planet VALUES (19, 'Planet3', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 3);
INSERT INTO public.planet VALUES (20, 'Planet4', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 4);
INSERT INTO public.planet VALUES (21, 'Planet5', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 5);
INSERT INTO public.planet VALUES (22, 'Planet6', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 6);
INSERT INTO public.planet VALUES (23, 'Planet7', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 7);
INSERT INTO public.planet VALUES (24, 'Planet8', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 1);
INSERT INTO public.planet VALUES (25, 'Planet9', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 2);
INSERT INTO public.planet VALUES (26, 'Planet10', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 3);
INSERT INTO public.planet VALUES (27, 'Planet11', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 4);
INSERT INTO public.planet VALUES (28, 'Planet12', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 5);
INSERT INTO public.planet VALUES (29, 'Planet13', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 6);
INSERT INTO public.planet VALUES (30, 'Planet14', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 7);
INSERT INTO public.planet VALUES (31, 'Planet15', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 1);
INSERT INTO public.planet VALUES (32, 'Planet16', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 2);
INSERT INTO public.planet VALUES (33, 'Planet17', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 3);
INSERT INTO public.planet VALUES (34, 'Planet18', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 4);
INSERT INTO public.planet VALUES (35, 'Planet19', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 5);
INSERT INTO public.planet VALUES (36, 'Planet20', 'Loremp ipsum ect dominium noem alls', true, 1, 1000, 6);


--
-- Data for Name: planet_biomes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_biomes VALUES (17, 1, 1, true, NULL, NULL);
INSERT INTO public.planet_biomes VALUES (17, 3, 2, true, NULL, NULL);
INSERT INTO public.planet_biomes VALUES (18, 2, 3, true, NULL, NULL);
INSERT INTO public.planet_biomes VALUES (18, 4, 4, true, NULL, NULL);
INSERT INTO public.planet_biomes VALUES (20, 1, 5, true, NULL, NULL);
INSERT INTO public.planet_biomes VALUES (20, 6, 6, true, NULL, NULL);
INSERT INTO public.planet_biomes VALUES (21, 5, 7, true, NULL, NULL);
INSERT INTO public.planet_biomes VALUES (19, 1, 8, true, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Estrella1', 35, 325, 1);
INSERT INTO public.star VALUES (2, 'Estrella2', 25, 400, 2);
INSERT INTO public.star VALUES (3, 'Estrella3', 890, 1000, 3);
INSERT INTO public.star VALUES (4, 'Estrella4', 900, 35000, 4);
INSERT INTO public.star VALUES (5, 'Estrella5', 13, 42, 5);
INSERT INTO public.star VALUES (6, 'Estrella6', 76, 54, 6);
INSERT INTO public.star VALUES (7, 'Estrella7', 234, 456, 7);


--
-- Name: biome_biome_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.biome_biome_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_biomes_planet_biomes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_biomes_planet_biomes_id_seq', 8, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 36, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: biome biome_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.biome
    ADD CONSTRAINT biome_description_key UNIQUE (description);


--
-- Name: biome biome_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.biome
    ADD CONSTRAINT biome_pkey PRIMARY KEY (biome_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_key UNIQUE (planet_id);


--
-- Name: planet_biomes planet_biomes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_biomes
    ADD CONSTRAINT planet_biomes_pkey PRIMARY KEY (planet_biomes_id);


--
-- Name: planet_biomes planet_biomes_unico_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_biomes
    ADD CONSTRAINT planet_biomes_unico_key UNIQUE (unico);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_biomes planet_biomes_biome_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_biomes
    ADD CONSTRAINT planet_biomes_biome_id_fkey FOREIGN KEY (biome_id) REFERENCES public.biome(biome_id);


--
-- Name: planet_biomes planet_biomes_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_biomes
    ADD CONSTRAINT planet_biomes_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

