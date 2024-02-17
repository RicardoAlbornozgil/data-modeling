DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  planet_name TEXT NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL
);

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  galaxy_name TEXT NOT NULL
);

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  star_name TEXT NOT NULL
);

CREATE TABLE galaxies_planets
(
  id SERIAL PRIMARY KEY,
  galaxy_id INT,
  planet_id INT,
  CONSTRAINT fk_galaxies FOREIGN KEY (galaxy_id) REFERENCES galaxies(id),
  CONSTRAINT fk_planets FOREIGN KEY (planet_id) REFERENCES planets(id)
);

CREATE TABLE planets_moons
(
  id SERIAL PRIMARY KEY,
  planet_id INT,
  moon_id INT,
  CONSTRAINT fk_planets FOREIGN KEY (planet_id) REFERENCES planets(id),
  CONSTRAINT fk_moons FOREIGN KEY (moon_id) REFERENCES moons(id)
);

CREATE TABLE planets_stars
(
  id SERIAL PRIMARY KEY,
  orbital_period_in_years FLOAT NOT NULL,
  planet_id INT,
  star_id INT,
  CONSTRAINT fk_planets FOREIGN KEY (planet_id) REFERENCES planets(id),
  CONSTRAINT fk_stars FOREIGN KEY (star_id) REFERENCES stars(id)
);

INSERT INTO galaxies
  (galaxy_name)
VALUES
  ('Milky Way');

INSERT INTO planets
  (planet_name)
VALUES
  ('Earth'),
  ('Mars'),
  ('Venus'),
  ('Neptune'),
  ('Proxima Centauri b'),
  ('Gliese 876 b');

INSERT INTO stars 
  (star_name)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO moons
  (moon_name)
VALUES
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),
  ('Naiad'),
  ('Thalassa'),
  ('Despina'),
  ('Galatea');

INSERT INTO galaxies_planets
  (galaxy_id, planet_id)
VALUES
  (1,1),
  (1,2),
  (1,3),
  (1,4),
  (1,5),
  (1,6);

INSERT INTO planets_moons
  (planet_id, moon_id)
VALUES
  (1,1),
  (2,2),
  (2,3),
  (4,4),
  (4,5),
  (4,6),
  (4,7);

INSERT INTO planets_stars
  (star_id, planet_id, orbital_period_in_years)
VALUES
  (1,1, 1.00),
  (1,2, 1.88),
  (1,3, 0.62),
  (1,4, 164.8),
  (1,5, 0.03),
  (1,6, 0.23);
