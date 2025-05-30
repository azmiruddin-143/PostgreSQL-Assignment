-- Table Create 

-- rangers table start--
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(40),
    region VARCHAR(60)
);


INSERT INTO rangers (name, region)
VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');

-- rangers table end--

-- species table start--

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50),
    scientific_name VARCHAR(35),
    discovery_date DATE,
    conservation_status VARCHAR(30)
);

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status)
VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


-- species table end--

-- sightings table start--

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INTEGER REFERENCES species(species_id),
    ranger_id INTEGER REFERENCES rangers(ranger_id),
    location VARCHAR(100),
    sighting_time TIMESTAMP,
    notes TEXT
);

INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes)
VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);


-- sightings table end--

SELECT * FROM rangers

SELECT * FROM species

SELECT * FROM sightings

-- Problem Solve-1 start---


INSERT INTO rangers (name, region)  VALUES('Derek Fox','Coastal Plains');


-- Problem Solve-1 end---



-- Problem Solve-2 start---

SELECT count(DISTINCT species_id) AS unique_species_count FROM sightings;

-- Problem Solve-2 end---


-- Problem Solve-3 start---

SELECT * FROM sightings
WHERE location ILIKE '%Pass%';

-- Problem Solve-3 end---

-- Problem Solve-4 start---

SELECT name,count(*) AS total_sightings FROM sightings
JOIN rangers ON sightings.ranger_id = rangers.ranger_id
GROUP BY name
ORDER BY name 

-- Problem Solve-4 end---


-- Problem Solve-5 start---

SELECT species.common_name FROM species 
Left JOIN sightings ON species.species_id = sightings.species_id
WHERE sightings.species_id IS NULL

-- Problem Solve-5 end---


-- Problem Solve-6 start---

SELECT common_name,sighting_time, name    FROM  sightings
JOIN species ON sightings.species_id = species.species_id
JOIN rangers ON sightings.ranger_id = rangers.ranger_id
ORDER BY sighting_time DESC
LIMIT 2

-- Problem Solve-6 end---


-- Problem Solve-7  start---

UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01'


-- Problem Solve-7 end---

-- Problem Solve-8  start---


 SELECT sighting_id,
 CASE 
    WHEN extract(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN extract(HOUR FROM sighting_time) BETWEEN 12 AND 17  THEN 'Afternoon'
    WHEN extract(HOUR FROM sighting_time) > 17 THEN 'Evening'
    end AS time_of_day
    FROM sightings


-- Problem Solve-8 end---

-- Problem Solve-9  start---

  DELETE  FROM rangers
  WHERE ranger_id NOT IN (SELECT DISTINCT ranger_id FROM sightings)

-- Problem Solve-9 end---


-- All Problem Solve COmeple--