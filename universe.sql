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
    name character varying(60) NOT NULL,
    description text,
    age_in_million_of_years integer,
    is_spiral boolean NOT NULL,
    is_elliptic boolean,
    distance_from_earth_in_million_light_years integer,
    size_estimate_in_millions numeric(4,1)
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
    name character varying(60) NOT NULL,
    description text,
    distance_from_sun_in_million_km integer,
    produces_light boolean NOT NULL,
    has_life boolean,
    age_in_million_years integer,
    diameter_in_km numeric(4,1),
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
    name character varying(60) NOT NULL,
    description text,
    distance_from_sun_in_million_km integer,
    produces_light boolean NOT NULL,
    has_life boolean,
    continents integer,
    diameter_in_km numeric(4,1),
    star_id integer
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
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    name character varying(60) NOT NULL,
    escape_velocity_in_km_per_sec numeric(4,1),
    has_life boolean,
    produces_light boolean,
    satellites integer,
    position_from_sun integer NOT NULL,
    description text
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    age_in_million_of_years integer,
    produces_light boolean NOT NULL,
    has_life boolean,
    distance_from_earth_in_million_light_years integer,
    size_estimate_in_millions numeric(4,1),
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
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'SWAW 567', 'Generally round but can stretch longer along one axis than along the other', 432457, false, true, 22, 56.9);
INSERT INTO public.galaxy VALUES (2, 'ADS34 R', 'Resemble lenses', 243521, false, true, 31, 43.7);
INSERT INTO public.galaxy VALUES (3, 'FXVSF 78', 'They are more often parts of larger associations known as groups', 253263, true, false, 29, 27.2);
INSERT INTO public.galaxy VALUES (4, 'TDDGS-97', 'They are more often parts of larger associations known as groups', 325323, false, true, 36, 32.2);
INSERT INTO public.galaxy VALUES (5, 'TRETT00L', 'Are embedded in huge haloes of dark matter', 325340, true, false, 41, 33.3);
INSERT INTO public.galaxy VALUES (6, 'UDS34 R', 'Resemble lenses', 243521, false, true, 31, 40.7);
INSERT INTO public.galaxy VALUES (7, 'TRET2X00L', 'Are embedded in huge haloes of dark matter', 325340, true, false, 41, 36.3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, '10T0cx0L', 'Are embedded in huge haloes of dark matter', 400741, false, true, 40, 833.3, 1);
INSERT INTO public.moon VALUES (2, 'cx0L', 'Are  matter', 670741, true, true, 760, 693.3, 12);
INSERT INTO public.moon VALUES (3, '100L', 'Are embedded', 22741, false, false, 67, 973.3, 10);
INSERT INTO public.moon VALUES (4, 'zzxce', 'huge haloes of dark matter', 400741, false, true, 990, 700.3, 9);
INSERT INTO public.moon VALUES (5, '10i6r0L', 'Ahaloes', 78641, true, false, 140, 887.5, 13);
INSERT INTO public.moon VALUES (6, 'q0T0cx0L', 'Are embematter', 905748, true, true, 487, 213.3, 11);
INSERT INTO public.moon VALUES (7, '100tq', 'Auytrmatter', 940741, true, false, 5486, 833.3, 2);
INSERT INTO public.moon VALUES (8, 'fu0L', 'in huge haloes', 980531, true, true, 321, 543.0, 6);
INSERT INTO public.moon VALUES (9, 'wxcx0L', 'reembed in haloes matter', 99741, false, false, 549, 907.6, 3);
INSERT INTO public.moon VALUES (10, 'ytw0cx0L', 'Areof dark matter', 900741, true, true, 4240, 133.3, 8);
INSERT INTO public.moon VALUES (11, '10cx054', 'Are haloes of darmatter', 740741, false, false, 4409, 89.3, 5);
INSERT INTO public.moon VALUES (12, 'hdtex345', 'huge darker', 90874, true, true, 653, 103.9, 7);
INSERT INTO public.moon VALUES (13, '10Tyezcx23', 'Are embedded haloes', 400741, true, true, 234, 789.7, 4);
INSERT INTO public.moon VALUES (14, 'zmpox0L', 'Ardark er', 810041, false, true, 4420, 232.1, 13);
INSERT INTO public.moon VALUES (15, 'nty10T0cx0L', 'utArehithaloes of dark ', 240920, false, false, 40, 543.0, 10);
INSERT INTO public.moon VALUES (16, 'qpjdcx0L', 'Areembeddedin hugematter', 7879, false, false, 2400, 403.7, 9);
INSERT INTO public.moon VALUES (17, '234cx0L', 'matter', 230741, false, false, 210, 120.9, 11);
INSERT INTO public.moon VALUES (18, 'vbrew1cx0L', 'emof dark', 98345, false, true, 984, 875.5, 1);
INSERT INTO public.moon VALUES (19, 'wtd010T0cx0L', 'sqahaloes mattr', 1400741, true, false, 40, 833.3, 3);
INSERT INTO public.moon VALUES (20, '0pp10T0cx0L', 'hyehaloeofdarmatter', 90642, false, true, 6707, 389.6, 8);
INSERT INTO public.moon VALUES (21, '7777777xd', '77777777777edded in huge haloes of dark matter', 77741, true, false, 77, 777.7, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'p567', 'Generally round', 123422, true, false, 7, 326.9, 6);
INSERT INTO public.planet VALUES (2, 'S34 R', 'Resemble lenses', 44231, true, false, 24, 424.7, 2);
INSERT INTO public.planet VALUES (3, 'VSF 78', 'They are more often parts of larger associations known as groups', 525029, false, true, 253, 467.2, 5);
INSERT INTO public.planet VALUES (4, '21FRS-97', 'They are more often parts of larger associations known as groups', 778636, true, false, 32, 673.2, 7);
INSERT INTO public.planet VALUES (5, 'T0cx0L', 'Are embedded in huge haloes of dark matter', 800741, false, true, 40, 833.3, 1);
INSERT INTO public.planet VALUES (6, 'n478tu R', 'Resemble lenses', 314533, true, false, 12, 540.7, 3);
INSERT INTO public.planet VALUES (7, 'x80j535L', 'Are embedded in huge haloes of dark matter', 975341, false, true, 30, 336.3, 4);
INSERT INTO public.planet VALUES (8, 'VS89F 78', 'They are more often parts of larger associations known as groups', 525029, false, true, 253, 567.2, 2);
INSERT INTO public.planet VALUES (9, '7ye7', 'They are more often parts groups', 5250219, true, false, 23, 457.2, 1);
INSERT INTO public.planet VALUES (10, '040cxi0L', 'Are embedded in dark matter', 8007451, false, true, 46, 933.3, 7);
INSERT INTO public.planet VALUES (11, '643T0cx0L', 'Are huge haloes', 8107415, true, true, 40, 83.3, 6);
INSERT INTO public.planet VALUES (12, '0L', 'Are embedmatter', 660741, true, true, 40, 133.3, 5);
INSERT INTO public.planet VALUES (13, 'zzT0cx0L', 'Are dark matter', 8741, false, false, 340, 553.3, 3);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 'Mercury', 4.3, false, true, 0, 1, 'Mercury is the first planet from the Sun and the smallest planet in the Solar System. It is a terrestrial planet with a heavily cratered surface due to the planet having no geological activity and an extremely tenuous atmosphere (called an exosphere). Despite being the smallest planet in the Solar System with a mean diameter of 4,880 km (3,030 mi), 38% of that of Earth.');
INSERT INTO public.solar_system VALUES (2, 'Venus', 10.4, false, true, 0, 2, 'Venus is the second planet from the Sun. It is a rocky planet with a mass and size narrowly second in the Solar System to Earth, and with an atmosphere, which is the thickest of all four rocky planets of the Solar System and substantially thicker than Earths. Its orbit is the next closest to Earths, orbiting the Sun inferior inside of Earths orbit, appearing (like Mercury) in Earths sky always close to the Sun as either a morning star or evening star. In Earths sky it is also the natural object with the third highest maximum apparent brightness, after the Sun and the Moon, due to its proximity to Earth and the Sun, its size, and its highly reflective global cloud cover. Because of these prominent appearances in Earths sky, Venus has been, particularly among the other four star-like classical planets, a common and important object for humans, in their cultures and astronomy. ');
INSERT INTO public.solar_system VALUES (3, 'Earth', 11.2, true, false, 1, 3, 'Earth is the third planet from the Sun and the only place known in the universe where life has originated and found habitability. While Earth may not contain the largest volumes of water in the Solar System, only Earth sustains liquid surface water, extending over 70.8% of the planet with its ocean, making it an ocean world. The polar regions currently retain most of all other water with large sheets of ice covering ocean and land, dwarfing Earths groundwater, lakes, rivers and atmospheric water. The other 29.2% of the Earths surface is land, consisting of continents and islands, and is widely covered by vegetation. Below the planets surface lies the crust, consisting of several slowly moving tectonic plates, which interact to produce mountain ranges, volcanoes, and earthquakes. Inside the Earths crust is a liquid outer core that generates the magnetosphere, deflecting most of the destructive solar winds and cosmic radiation.');
INSERT INTO public.solar_system VALUES (4, 'Mars', 5.0, false, false, 2, 4, 'Mars is the fourth planet and the furthest terrestrial planet from the Sun. The reddish color of its surface is due to finely grained iron(III) oxide dust in the soil, giving it the nickname- the Red Planet. There is a sharp contrast between the two Martian hemispheres: the northern hemisphere is on average flatter and smoother than the southern hemisphere. The planets two poles are covered by water and carbon dioxide ice caps. Surrounding the Martian surface is a dynamic thin atmosphere (1% of Earths surface pressure), made primarily of carbon dioxide. Mars has two irregularly shaped natural satellites, Phobos and Deimos.');
INSERT INTO public.solar_system VALUES (5, 'Jupiter', 59.5, false, true, 95, 5, 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined, and slightly less than one one-thousandth the mass of the Sun. Jupiter is the third brightest natural object in the Earths night sky after the Moon and Venus, and it has been observed since prehistoric times. It was named after Jupiter, the chief deity of ancient Roman religion. ');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, '85SWAW 567', 'Generally round but can stretch longer along one axis than along the other', 432457, true, false, 22, 56.9, 4);
INSERT INTO public.star VALUES (2, 'ADS34 R', 'Resemble lenses', 243521, true, false, 31, 43.7, 2);
INSERT INTO public.star VALUES (3, '875XVSF 78', 'They are more often parts of larger associations known as groups', 253263, false, true, 29, 27.2, 3);
INSERT INTO public.star VALUES (4, 'FRWGS-97', 'They are more often parts of larger associations known as groups', 325323, true, false, 36, 32.2, 1);
INSERT INTO public.star VALUES (5, 'WXAQT00L', 'Are embedded in huge haloes of dark matter', 325340, false, true, 41, 33.3, 5);
INSERT INTO public.star VALUES (6, '478tu R', 'Resemble lenses', 243521, true, false, 31, 40.7, 7);
INSERT INTO public.star VALUES (7, 'T535L', 'Are embedded in huge haloes of dark matter', 325340, false, true, 41, 36.3, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: solar_system solar_system_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_planet_name_key UNIQUE (name);


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

