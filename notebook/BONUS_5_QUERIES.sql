
select actores.full_name, peliculas.title
from actores
INNER JOIN reparto on actores.actor_id = reparto.actor_id
INNER JOIN peliculas on peliculas.film_id = reparto.film_id   AND actores.full_name = 'ALEC WAYNE'
ORDER BY actores.full_name


SELECT peliculas.title, AVG(rental_duration) as `RentalDuration`
from peliculas
INNER JOIN inventario on inventario.film_id = peliculas.film_id 
INNER JOIN alquileres on alquileres.inventory_id  = inventario.inventory_id
GROUP BY peliculas.title
ORDER BY AVG(rental_duration) DESC
LIMIT 5;


SELECT peliculas.title, categorias.name
FROM peliculas
INNER JOIN categorias on categorias.category_id = peliculas.category_id and categorias.name = 'Action'

SELECT peliculas.title, idiomas.name
FROM peliculas
INNER JOIN idiomas on idiomas.language_id = peliculas.language_id and idiomas.name = 'English'

SELECT peliculas.title, categorias.name
FROM peliculas
INNER JOIN categorias on categorias.category_id = peliculas.category_id and categorias.name = 'Action'


SELECT peliculas.title, peliculas.rating
FROM peliculas
WHERE peliculas.rating = 'NC-17'
LIMIT 5

