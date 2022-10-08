--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    distance_from_earth integer,
    description text,
    is_spherical boolean,
    constellation character varying(40),
    superclusters_id integer NOT NULL,
    radius integer
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
    planet_id integer NOT NULL,
    mean_radius_km numeric(5,1),
    orbital_semi_major_axis_km integer
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
    is_spherical boolean,
    has_life boolean,
    star_id integer NOT NULL,
    distance_from_star_in_au numeric(5,2),
    orbital_period_in_years numeric(8,4)
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
    galaxy_id integer NOT NULL,
    mass_in_solar_mass numeric(5,3),
    constellation character varying(30),
    distance_in_light_years numeric(6,3)
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
-- Name: superclusters; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.superclusters (
    superclusters_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_galaxies integer
);


ALTER TABLE public.superclusters OWNER TO freecodecamp;

--
-- Name: superclusters_supercluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.superclusters_supercluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.superclusters_supercluster_id_seq OWNER TO freecodecamp;

--
-- Name: superclusters_supercluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.superclusters_supercluster_id_seq OWNED BY public.superclusters.superclusters_id;


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
-- Name: superclusters superclusters_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.superclusters ALTER COLUMN superclusters_id SET DEFAULT nextval('public.superclusters_supercluster_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 13610, 0, 'This is the galaxy containing the sun, our solar system and our Earth. Most things visible to the naked eye in the sky are part of the Milky way including the Milky way composing of Zone of Avoidance', false, 'saggittarius', 1, 52850);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 1101, 158200, 'Visible only from the southern hemisphere. This is the brightest patch of nebulosity in the sky', false, 'Dorado, Mensa', 1, 7000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 10010, 2537, 'A spiral shaped galaxy. It is the closest big galaxy to the Milky Way and expected to collide with Milky Way around 4.5 billion years from now and form a new galaxy Milkdromeda', false, 'Andromeda', 1, 110000);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 13000, 199000, 'Visible only from the southern hemisphere. Scientific name: NGC 292', false, 'Tucana, Hydrus', 1, 3500);
INSERT INTO public.galaxy VALUES (5, 'Triangulum galaxy', NULL, 2723000, 'It is a spiral galaxy, catalogued as Meisser 33 or M33. It is the third largest member of the local group of galaxies behind Andromeda galaxy and Milky way galaxy.', false, 'Triangulum', 1, 30000);
INSERT INTO public.galaxy VALUES (6, 'Centauraus A galaxy', 13270, 13050000, 'It is a eliptical galaxy with a supermassive black hole at its heart. This galaxy is visible to the naked eye', false, 'Centaurus', 1, 48500);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1738.0, 384399);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.2, 9380);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.2, 23460);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821.6, 421800);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560.8, 671100);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.3, 1882700);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 83.5, 181400);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634.1, 1070400);
INSERT INTO public.moon VALUES (9, 'Mimas', 6, 198.2, 185540);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 252.1, 238040);
INSERT INTO public.moon VALUES (11, 'Tethys', 6, 533.1, 294670);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 561.4, 377420);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, 763.8, 527070);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 578.9, 190900);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 584.7, 266000);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 788.9, 436300);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 761.4, 583500);
INSERT INTO public.moon VALUES (18, 'Miranda', 7, 235.8, 129900);
INSERT INTO public.moon VALUES (19, 'Triton', 8, 1353.4, 354800);
INSERT INTO public.moon VALUES (20, 'Nereid', 8, 170.0, 5513820);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (5, 'Jupiter', true, false, 1, 5.20, 11.8600);
INSERT INTO public.planet VALUES (1, 'Mercury', true, false, 1, 0.39, 0.2400);
INSERT INTO public.planet VALUES (4, 'Mars', true, false, 1, 1.52, 1.8800);
INSERT INTO public.planet VALUES (2, 'Venus', true, false, 1, 0.72, 0.6100);
INSERT INTO public.planet VALUES (3, 'Earth', true, true, 1, 1.00, 1.0000);
INSERT INTO public.planet VALUES (6, 'Saturn', true, false, 1, 9.54, 29.4600);
INSERT INTO public.planet VALUES (7, 'Uranus', true, false, 1, 19.18, 84.0100);
INSERT INTO public.planet VALUES (8, 'Neptune', true, false, 1, 30.06, 164.9000);
INSERT INTO public.planet VALUES (10, 'Proxima Centuri b', NULL, false, 2, 0.05, 0.0306);
INSERT INTO public.planet VALUES (9, 'Proxima Centuri d', NULL, false, 2, 0.03, 0.0140);
INSERT INTO public.planet VALUES (11, 'Proxima Centuri c', NULL, false, 2, 1.49, 5.2822);
INSERT INTO public.planet VALUES (12, 'Bernards star b', NULL, false, 3, 0.40, 0.6378);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.000, 'N/A', 0.000);
INSERT INTO public.star VALUES (2, 'Proxima Centuri', 1, 0.122, 'Centaurus', 4.246);
INSERT INTO public.star VALUES (3, 'Barnards star', 1, 0.144, 'Ophiuchus', 5.963);
INSERT INTO public.star VALUES (4, 'Wolf 359', 1, 0.090, 'Leo', 7.856);
INSERT INTO public.star VALUES (5, 'Lalande 21185', 1, 0.390, 'Ursa Major', 8.304);
INSERT INTO public.star VALUES (6, 'Sirius A', 1, 2.063, 'Canis Major', 8.709);
INSERT INTO public.star VALUES (7, 'Sirius B', 1, 1.018, 'Canis Major', 8.709);


--
-- Data for Name: superclusters; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.superclusters VALUES (1, 'Virgo supercluster', 2000);
INSERT INTO public.superclusters VALUES (2, 'Hydra-Centaurus supercluster', 157);
INSERT INTO public.superclusters VALUES (3, 'Fornax cluster', 60);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: superclusters_supercluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.superclusters_supercluster_id_seq', 3, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: superclusters superclusters_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.superclusters
    ADD CONSTRAINT superclusters_pkey PRIMARY KEY (superclusters_id);


--
-- Name: superclusters superclusters_superclusters_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.superclusters
    ADD CONSTRAINT superclusters_superclusters_id_key UNIQUE (superclusters_id);


--
-- Name: galaxy galaxy_supercluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_supercluster_id_fkey FOREIGN KEY (superclusters_id) REFERENCES public.superclusters(superclusters_id);


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

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    distance_from_earth integer,
    description text,
    is_spherical boolean,
    constellation character varying(40),
    superclusters_id integer NOT NULL,
    radius integer
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
    planet_id integer NOT NULL,
    mean_radius_km numeric(5,1),
    orbital_semi_major_axis_km integer
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
    is_spherical boolean,
    has_life boolean,
    star_id integer NOT NULL,
    distance_from_star_in_au numeric(5,2),
    orbital_period_in_years numeric(8,4)
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
    galaxy_id integer NOT NULL,
    mass_in_solar_mass numeric(5,3),
    constellation character varying(30),
    distance_in_light_years numeric(6,3)
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
-- Name: superclusters; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.superclusters (
    superclusters_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_galaxies integer
);


ALTER TABLE public.superclusters OWNER TO freecodecamp;

--
-- Name: superclusters_supercluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.superclusters_supercluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.superclusters_supercluster_id_seq OWNER TO freecodecamp;

--
-- Name: superclusters_supercluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.superclusters_supercluster_id_seq OWNED BY public.superclusters.superclusters_id;


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
-- Name: superclusters superclusters_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.superclusters ALTER COLUMN superclusters_id SET DEFAULT nextval('public.superclusters_supercluster_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 13610, 0, 'This is the galaxy containing the sun, our solar system and our Earth. Most things visible to the naked eye in the sky are part of the Milky way including the Milky way composing of Zone of Avoidance', false, 'saggittarius', 1, 52850);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 1101, 158200, 'Visible only from the southern hemisphere. This is the brightest patch of nebulosity in the sky', false, 'Dorado, Mensa', 1, 7000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 10010, 2537, 'A spiral shaped galaxy. It is the closest big galaxy to the Milky Way and expected to collide with Milky Way around 4.5 billion years from now and form a new galaxy Milkdromeda', false, 'Andromeda', 1, 110000);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 13000, 199000, 'Visible only from the southern hemisphere. Scientific name: NGC 292', false, 'Tucana, Hydrus', 1, 3500);
INSERT INTO public.galaxy VALUES (5, 'Triangulum galaxy', NULL, 2723000, 'It is a spiral galaxy, catalogued as Meisser 33 or M33. It is the third largest member of the local group of galaxies behind Andromeda galaxy and Milky way galaxy.', false, 'Triangulum', 1, 30000);
INSERT INTO public.galaxy VALUES (6, 'Centauraus A galaxy', 13270, 13050000, 'It is a eliptical galaxy with a supermassive black hole at its heart. This galaxy is visible to the naked eye', false, 'Centaurus', 1, 48500);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1738.0, 384399);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.2, 9380);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.2, 23460);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821.6, 421800);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560.8, 671100);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.3, 1882700);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 83.5, 181400);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634.1, 1070400);
INSERT INTO public.moon VALUES (9, 'Mimas', 6, 198.2, 185540);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 252.1, 238040);
INSERT INTO public.moon VALUES (11, 'Tethys', 6, 533.1, 294670);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 561.4, 377420);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, 763.8, 527070);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 578.9, 190900);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 584.7, 266000);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 788.9, 436300);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 761.4, 583500);
INSERT INTO public.moon VALUES (18, 'Miranda', 7, 235.8, 129900);
INSERT INTO public.moon VALUES (19, 'Triton', 8, 1353.4, 354800);
INSERT INTO public.moon VALUES (20, 'Nereid', 8, 170.0, 5513820);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (5, 'Jupiter', true, false, 1, 5.20, 11.8600);
INSERT INTO public.planet VALUES (1, 'Mercury', true, false, 1, 0.39, 0.2400);
INSERT INTO public.planet VALUES (4, 'Mars', true, false, 1, 1.52, 1.8800);
INSERT INTO public.planet VALUES (2, 'Venus', true, false, 1, 0.72, 0.6100);
INSERT INTO public.planet VALUES (3, 'Earth', true, true, 1, 1.00, 1.0000);
INSERT INTO public.planet VALUES (6, 'Saturn', true, false, 1, 9.54, 29.4600);
INSERT INTO public.planet VALUES (7, 'Uranus', true, false, 1, 19.18, 84.0100);
INSERT INTO public.planet VALUES (8, 'Neptune', true, false, 1, 30.06, 164.9000);
INSERT INTO public.planet VALUES (10, 'Proxima Centuri b', NULL, false, 2, 0.05, 0.0306);
INSERT INTO public.planet VALUES (9, 'Proxima Centuri d', NULL, false, 2, 0.03, 0.0140);
INSERT INTO public.planet VALUES (11, 'Proxima Centuri c', NULL, false, 2, 1.49, 5.2822);
INSERT INTO public.planet VALUES (12, 'Bernards star b', NULL, false, 3, 0.40, 0.6378);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.000, 'N/A', 0.000);
INSERT INTO public.star VALUES (2, 'Proxima Centuri', 1, 0.122, 'Centaurus', 4.246);
INSERT INTO public.star VALUES (3, 'Barnards star', 1, 0.144, 'Ophiuchus', 5.963);
INSERT INTO public.star VALUES (4, 'Wolf 359', 1, 0.090, 'Leo', 7.856);
INSERT INTO public.star VALUES (5, 'Lalande 21185', 1, 0.390, 'Ursa Major', 8.304);
INSERT INTO public.star VALUES (6, 'Sirius A', 1, 2.063, 'Canis Major', 8.709);
INSERT INTO public.star VALUES (7, 'Sirius B', 1, 1.018, 'Canis Major', 8.709);


--
-- Data for Name: superclusters; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.superclusters VALUES (1, 'Virgo supercluster', 2000);
INSERT INTO public.superclusters VALUES (2, 'Hydra-Centaurus supercluster', 157);
INSERT INTO public.superclusters VALUES (3, 'Fornax cluster', 60);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: superclusters_supercluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.superclusters_supercluster_id_seq', 3, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: superclusters superclusters_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.superclusters
    ADD CONSTRAINT superclusters_pkey PRIMARY KEY (superclusters_id);


--
-- Name: superclusters superclusters_superclusters_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.superclusters
    ADD CONSTRAINT superclusters_superclusters_id_key UNIQUE (superclusters_id);


--
-- Name: galaxy galaxy_supercluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_supercluster_id_fkey FOREIGN KEY (superclusters_id) REFERENCES public.superclusters(superclusters_id);


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

