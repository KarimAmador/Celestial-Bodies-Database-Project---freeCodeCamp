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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    dimensions_in_km numeric,
    remarks text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(15),
    mass_in_solar_mass numeric,
    number_of_stars_in_billions integer,
    size_in_kpc numeric
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
    mean_radius_km numeric,
    volume_cubic_km numeric,
    is_tidally_locked boolean
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
    star_id integer,
    mean_radius_earth_ratio numeric,
    mass_earth_ratio numeric,
    temperature_kelvin integer,
    is_terrestrial boolean
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
    galaxy_id integer,
    mass_in_solar_mass numeric,
    age_in_billions numeric
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, '951 Gaspra', 12.2, 'Flyby; first asteroid visited by a spacecraft.');
INSERT INTO public.asteroid VALUES (2, '243 Ida', 28, 'Flyby; discovered Dactyl; first asteroid with a moon visited by a spacecraft, largest asteroid visited by spacecraft at the time.');
INSERT INTO public.asteroid VALUES (3, '253 Mathilde', 58, 'Flyby; largest asteroid visited by a spacecraft at the time.');
INSERT INTO public.asteroid VALUES (4, '433 Eros', 17, '1998 flyby; 2000 orbited (first asteroid studied from orbit); 2001 landing; first asteroid landing, first asteroid orbited by a spacecraft, first near-Earth asteroid (NEA) visited by a spacecraft.');
INSERT INTO public.asteroid VALUES (5, '9969 Braille', 1.6, 'Flyby; followed by flyby of Comet Borrelly; failed to image it during closest approach, only taking images 14,000 km from the asteroid.');
INSERT INTO public.asteroid VALUES (6, '5535 Annefrank', 4.0, 'Flyby');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'SB(rb)bc', 1500000000000, 100, 30);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'SA(s)b', 1230000000, 1000000, 46.56);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'SA(s)cd', 50000000000, 40, 18.74);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'SB(s)m', 138000000000, 20, 9.86);
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 'SA(s)ab', NULL, NULL, 29.44);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'SAB(rs)cd', NULL, 1000000, 51.91);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737.4, 21958000000, true);
INSERT INTO public.moon VALUES (2, 'Deimos', 4, 6.27, 1033, true);
INSERT INTO public.moon VALUES (3, 'Phobos', 4, 11.08, 5695, true);
INSERT INTO public.moon VALUES (4, 'Callisto', 5, 2410.3, 59000000000, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, 2634.1, 76600000000, true);
INSERT INTO public.moon VALUES (6, 'Io', 5, 1821.6, 25319064907, true);
INSERT INTO public.moon VALUES (7, 'Amalthea', 5, 83.5, 2430000, true);
INSERT INTO public.moon VALUES (8, 'Adrastea', 5, 8.2, 2345, true);
INSERT INTO public.moon VALUES (9, 'Thebe', 5, 49.3, 500000, true);
INSERT INTO public.moon VALUES (10, 'Europa', 5, 1560.8, 15930000000000, true);
INSERT INTO public.moon VALUES (11, 'Metis', 5, 21.5, 42700, true);
INSERT INTO public.moon VALUES (13, 'Pan', 6, 13.7, 10748, true);
INSERT INTO public.moon VALUES (14, 'Atlas', 6, 14.9, 13950, true);
INSERT INTO public.moon VALUES (15, 'Prometheus', 6, 42.8, 327740, true);
INSERT INTO public.moon VALUES (16, 'Pandora', 6, 40, 268990, true);
INSERT INTO public.moon VALUES (17, 'Epimetheus', 6, 58.6, 843290, true);
INSERT INTO public.moon VALUES (18, 'Janus', 6, 89, 2953010, true);
INSERT INTO public.moon VALUES (19, 'Mimas', 6, 198.2, 32600000, true);
INSERT INTO public.moon VALUES (20, 'Telesto', 6, 12.3, 7795, true);
INSERT INTO public.moon VALUES (12, 'Hyperion', 6, 135, NULL, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.3829, 0.055, 437, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.9499, 0.815, 232, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 1, 255, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.532, 0.107, 209, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 10.973, 317.8, 88, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 9.1402, 95.159, NULL, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 3.9808, 14.536, NULL, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 3.8646, 17.147, NULL, false);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri d', 2, 0.81, 0.26, 360, false);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 2, 0.94, 1.07, 234, false);
INSERT INTO public.planet VALUES (11, 'Kepler-90g', 3, 8.1, 15, 349, false);
INSERT INTO public.planet VALUES (12, 'Kepler-90h', 3, 1.01, 0.639, 292, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 4.6);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 0.1221, 4.85);
INSERT INTO public.star VALUES (3, 'Kepler-90', 1, 1.2, NULL);
INSERT INTO public.star VALUES (4, 'Gliese 367', 1, 0.454, 8);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 14, 8);
INSERT INTO public.star VALUES (6, 'Antares', 1, 11, 15);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

