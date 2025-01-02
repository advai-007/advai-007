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
-- Name: astronauts; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronauts (
    astronauts_id integer NOT NULL,
    name character varying(50) NOT NULL,
    country character varying(50) NOT NULL
);


ALTER TABLE public.astronauts OWNER TO freecodecamp;

--
-- Name: astronauts_astronaut_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronauts_astronaut_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronauts_astronaut_id_seq OWNER TO freecodecamp;

--
-- Name: astronauts_astronaut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronauts_astronaut_id_seq OWNED BY public.astronauts.astronauts_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_light_years numeric(10,2) NOT NULL,
    fully_explored boolean NOT NULL,
    galaxy_type character varying(20)
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
    name character varying(30) NOT NULL,
    planet_id integer,
    is_habitable boolean,
    discovery_date date
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
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    radius_km integer NOT NULL,
    climate text,
    star_id integer,
    has_rings boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
    name character varying(30) NOT NULL,
    age_in_millions integer NOT NULL,
    mass numeric(10,2) NOT NULL,
    galaxy_id integer,
    temperature numeric(6,2)
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
-- Name: astronauts astronauts_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronauts ALTER COLUMN astronauts_id SET DEFAULT nextval('public.astronauts_astronaut_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: astronauts; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronauts VALUES (1, 'Neil Armstrong', 'USA');
INSERT INTO public.astronauts VALUES (2, 'Buzz Aldrin', 'USA');
INSERT INTO public.astronauts VALUES (3, 'Yuri Gagarin', 'Russia');
INSERT INTO public.astronauts VALUES (4, 'Valentina Tereshkova', 'Russia');
INSERT INTO public.astronauts VALUES (5, 'Sally Ride', 'USA');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (4, 'Sombrero', 29000000.00, true, NULL);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 23000000.00, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 17000000.00, false, NULL);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.00, true, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000.00, false, 'Elliptical');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000.00, false, 'Irregular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (24, 'Earth Moon', 1, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'Phobos', 2, NULL, NULL);
INSERT INTO public.moon VALUES (26, 'Deimos', 2, NULL, NULL);
INSERT INTO public.moon VALUES (27, 'Titan', 3, NULL, NULL);
INSERT INTO public.moon VALUES (28, 'Rhea', 4, NULL, NULL);
INSERT INTO public.moon VALUES (29, 'Enceladus', 4, NULL, NULL);
INSERT INTO public.moon VALUES (30, 'Mimas', 4, NULL, NULL);
INSERT INTO public.moon VALUES (31, 'Triton', 5, NULL, NULL);
INSERT INTO public.moon VALUES (32, 'Proteus', 5, NULL, NULL);
INSERT INTO public.moon VALUES (33, 'Miranda', 6, NULL, NULL);
INSERT INTO public.moon VALUES (34, 'Ariel', 6, NULL, NULL);
INSERT INTO public.moon VALUES (35, 'Umbriel', 6, NULL, NULL);
INSERT INTO public.moon VALUES (36, 'Titania', 6, NULL, NULL);
INSERT INTO public.moon VALUES (37, 'Oberon', 6, NULL, NULL);
INSERT INTO public.moon VALUES (38, 'Ganymede', 3, NULL, NULL);
INSERT INTO public.moon VALUES (39, 'Callisto', 3, NULL, NULL);
INSERT INTO public.moon VALUES (40, 'Europa', 3, NULL, NULL);
INSERT INTO public.moon VALUES (41, 'Io', 3, NULL, NULL);
INSERT INTO public.moon VALUES (42, 'Charon', 2, NULL, NULL);
INSERT INTO public.moon VALUES (43, 'Ceres', 2, NULL, NULL);
INSERT INTO public.moon VALUES (44, 'Eris', 5, NULL, NULL);
INSERT INTO public.moon VALUES (45, 'Haumea', 5, NULL, NULL);
INSERT INTO public.moon VALUES (46, 'Makemake', 5, NULL, NULL);
INSERT INTO public.moon VALUES (47, 'Sedna', 6, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Venus', false, 6051, 'Hot and Toxic', 1, NULL);
INSERT INTO public.planet VALUES (5, 'Saturn', false, 58232, 'Gas Giant', 4, NULL);
INSERT INTO public.planet VALUES (6, 'Neptune', false, 24622, 'Cold and Windy', 5, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 25362, 'Cold and Windy', 6, NULL);
INSERT INTO public.planet VALUES (8, 'Mercury', false, 2439, 'Desert-like', 1, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 1188, 'Cold', 2, NULL);
INSERT INTO public.planet VALUES (10, 'Titan', false, 2575, 'Thick Atmosphere', 3, NULL);
INSERT INTO public.planet VALUES (11, 'Europa', false, 1565, 'Icy Surface', 4, NULL);
INSERT INTO public.planet VALUES (12, 'Callisto', false, 4821, 'Icy and Rocky', 5, NULL);
INSERT INTO public.planet VALUES (13, 'Ganymede', false, 5262, 'Rocky and Icy', 6, NULL);
INSERT INTO public.planet VALUES (14, 'Io', false, 3643, 'Volcanic', 1, NULL);
INSERT INTO public.planet VALUES (15, 'Ceres', false, 940, 'Frozen', 2, NULL);
INSERT INTO public.planet VALUES (16, 'Oberon', false, 761, 'Icy', 3, NULL);
INSERT INTO public.planet VALUES (17, 'Triton', false, 1353, 'Icy and Gaseous', 4, NULL);
INSERT INTO public.planet VALUES (18, 'Charon', false, 606, 'Icy', 5, NULL);
INSERT INTO public.planet VALUES (19, 'Eris', false, 1163, 'Frozen', 6, NULL);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, 69911, 'Gas Giant', 3, true);
INSERT INTO public.planet VALUES (1, 'Earth', true, 6371, 'Temperate', 1, false);
INSERT INTO public.planet VALUES (2, 'Mars', false, 3389, 'Arid', 2, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 'Betelgeuse', 100, 18.00, 3, NULL);
INSERT INTO public.star VALUES (5, 'Rigel', 10, 21.00, 4, NULL);
INSERT INTO public.star VALUES (6, 'Polaris', 70, 5.80, 5, NULL);
INSERT INTO public.star VALUES (1, 'Sun', 4600, 1.99, 1, 5778.00);
INSERT INTO public.star VALUES (2, 'Sirius', 200, 4.06, 2, 9940.00);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 5, 2.19, 1, 5800.00);


--
-- Name: astronauts_astronaut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronauts_astronaut_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 47, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 19, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: astronauts astronauts_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronauts
    ADD CONSTRAINT astronauts_pkey PRIMARY KEY (astronauts_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy un_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT un_name UNIQUE (name);


--
-- Name: astronauts un_name_astro; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronauts
    ADD CONSTRAINT un_name_astro UNIQUE (name);


--
-- Name: moon un_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT un_name_moon UNIQUE (name);


--
-- Name: planet un_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT un_name_planet UNIQUE (name);


--
-- Name: star un_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT un_name_star UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

