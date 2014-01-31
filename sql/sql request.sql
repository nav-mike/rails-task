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