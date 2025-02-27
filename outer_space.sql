-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space


-- ORIGINAL:

-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');

-- PLANETS TABLE
CREATE TABLE planets(
  id SERIAL PRIMARY KEY,
  planet_name TEXT NOT NULL
);

-- ORBITAL YEARS TABLE
CREATE TABLE orbital_period_in_years(
  id SERIAL PRIMARY KEY,
  period_in_years INT NOT NULL
);

-- ORBITS AROUND TABLE
CREATE TABLE orbits_around(
  id SERIAL PRIMARY KEY,
  orbit_name TEXT NOT NULL
);

-- GALAXIES TABLE
CREATE TABLE galaxies(
  id SERIAL PRIMARY KEY,
  galaxy_name TEXT NOT NULL
);

-- MOONS TABLE
CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  moon_name TEXT
);

INSERT INTO planets(planet_name)
VALUES
  ('Earth'),
  ('Mars'),
  ('Venus'),
  ('Neptune'),
  ('Proxima Centauri b'),
  ('Gliese 876 b');

INSERT INTO orbital_period_in_years(period_in_years)
VALUES
  (1.00),
  (1.88),
  (0.62),
  (164.8),
  (0.03),
  (0.23);

INSERT INTO orbits_around(orbit_name)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO galaxies(galaxy_name)
VALUES
  ('Milky Way');

INSERT INTO moons(moon_name)
VALUES
  ('{"The Moon"}'),
  ('{"Phobos", "Deimos"}'),
  ('{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('{}');
  -- ('Phobos'),
  -- ('Deimos'),
  -- ('Naiad'),
  -- ('Thalassa'),
  -- ('Despina'),
  -- ('Galatea'),
  -- ('Larissa'),
  -- ('S/2004 N 1'),
  -- ('Proteus'),
  -- ('Triton'),
  -- ('Nereid'),
  -- ('Halimede'),
  -- ('Sao'),
  -- ('Laomedeia'),
  -- ('Psamathe'),
  -- ('Neso');

  -- RELATIONS

  CREATE TABLE planet_moons(
    id SERIAL PRIMARY KEY,
    planet_id INT REFERENCES planets,
    moon_id INT REFERENCES moons
  );

  CREATE TABLE universe(
    id SERIAL PRIMARY KEY,
    planet_id INT REFERENCES planets,
    orbital_period_id INT REFERENCES orbital_period_in_years,
    orbits_around_id INT REFERENCES orbits_around,
    galaxy_id INT REFERENCES galaxies,
    moon_id INT REFERENCES moons
  );

  INSERT INTO universe(planet_id, orbital_period_id, orbits_around_id, galaxy_id, moon_id)
  VALUES
    (1,1,1,1,1),
    (2,2,1,1,2),
    (3,3,1,1,4),
    (4,4,1,1,3),
    (5,5,2,1,4),
    (6,6,3,1,4);

