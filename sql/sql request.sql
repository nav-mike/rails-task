/* Запрос на получение количества турбаз в каждом городе. */
SELECT
	cities.name,
	count (hostels.id) as num_hostels
FROM
	cities
INNER JOIN hostels ON hostels.city_id = cities.id
GROUP BY
	cities.id
	
	
/* Запрос на получение количества турбаз в каждом регионе */
SELECT
	regions.name,
	count (hostels.id) as num_hostels
FROM
	regions,
	cities
INNER JOIN hostels ON hostels.city_id = cities.id AND cities.region_id = regions.id
GROUP BY
	regions.id
	
	
/* Запрос на получение количества трубаз в каждой стране. */
SELECT
	countries.name,
	count (hostels.id) as num_hostels
FROM
	countries,
	regions,
	cities
INNER JOIN hostels ON hostels.city_id = cities.id AND cities.region_id = regions.id AND countries.id = regions.country_id
GROUP BY
	countries.id

/* Запрос на получение количества турбаз со всех географических сущностей. */	
SELECT 	cities.name as name ,count (hostels.id) as num_hostels FROM 	cities INNER JOIN hostels ON hostels.city_id = cities.id GROUP BY 	cities.id
UNION
SELECT 	regions.name,count (hostels.id) as num_hostels FROM 	regions, 	cities INNER JOIN hostels ON hostels.city_id = cities.id AND cities.region_id = regions.id GROUP BY 	regions.id
UNION
SELECT countries.name, count (hostels.id) as num_hostels FROM countries, regions, cities INNER JOIN hostels ON hostels.city_id = cities.id AND cities.region_id = regions.id AND countries.id = regions.country_id GROUP BY countries.id