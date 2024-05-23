-- Enable PostGIS (as of 3.0 contains just geometry/geography)
CREATE EXTENSION postgis;

--Check if Postgis is installed or not.
SELECT PostGIS_full_version();

--Drop the table if the table exists
DROP TABLE hw3_points;

--create the table to store the geo-spatial data and also store the name of the location.
CREATE TABLE hw3_points (name VARCHAR(64),location geometry(POINT,4326));


--insert the data that has been collected from the 13 different locations.
INSERT INTO hw3_points VALUES ('Tropicana',ST_SetSRID(ST_MakePoint(-118.28801713286317,34.0282433537532),4326));
INSERT INTO hw3_points VALUES ('CineArtsMediaPract',ST_SetSRID(ST_MakePoint(-118.2874793813252,34.024121605373935),4326));
INSERT INTO hw3_points VALUES ('CineArtsScreenTele',ST_SetSRID(ST_MakePoint(-118.28652760962723,34.02332142900857),4326));
INSERT INTO hw3_points VALUES ('AnnCenterPR',ST_SetSRID(ST_MakePoint(-118.2870175950515,34.02103762815113),4326));
INSERT INTO hw3_points VALUES ('AnnTechOps',ST_SetSRID(ST_MakePoint(-118.28717820271102,34.02099382875511),4326));
INSERT INTO hw3_points VALUES ('DornsifeTeaching',ST_SetSRID(ST_MakePoint(-118.28768492185675,34.021149492035626),4326));
INSERT INTO hw3_points VALUES ('DornsifeNeurology',ST_SetSRID(ST_MakePoint(-118.28871858146675,34.02137038126856),4326));
INSERT INTO hw3_points VALUES ('ViterbiAero',ST_SetSRID(ST_MakePoint(-118.2896769319321,34.02086164437948),4326));
INSERT INTO hw3_points VALUES ('ViterbiEE',ST_SetSRID(ST_MakePoint(-118.28988595031649,34.02011340855391),4326));
INSERT INTO hw3_points VALUES ('ThrontonContemporary',ST_SetSRID(ST_MakePoint(-118.28610346309036,34.02290580360448),4326));
INSERT INTO hw3_points VALUES ('ThrontonClassical',ST_SetSRID(ST_MakePoint(-118.2853771720012,34.02261694173428),4326));
INSERT INTO hw3_points VALUES ('PriceGovenrnance',ST_SetSRID(ST_MakePoint(-118.28355120452969,34.0194095817662),4326));
INSERT INTO hw3_points VALUES ('PriceRealEstate',ST_SetSRID(ST_MakePoint(-118.28335460286428,34.01917392391155),4326));


--selecting all the records from the table to see if they have all been inserted or not into the table that we have created before.
SELECT * FROM hw3_points;

--Query to create the convex hull for all the locations that we have collected and then convert the location data into a human readable geo-spatial format (longitude and latitude) which shall be used to create the convex hull and visualize in Google Earth
SELECT ST_AsText(ST_ConvexHull(ST_Collect(location))) FROM hw3_points;

--Query to select the 4 nearest neighbours from the home co-ordinates (excluding the home co-ordinates).
SELECT name, ST_AsText(location) FROM hw3_points WHERE name not in ('Tropicana') ORDER BY location <-> ST_SetSRID(ST_MakePoint(-118.28801713286317,34.0282433537532),4326) LIMIT 4;