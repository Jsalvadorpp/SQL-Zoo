--//More JOIN operations

--#List the films where the yr is 1962 [Show id, title] 
SELECT id, title
 FROM movie
 WHERE yr=1962

--#Give year of 'Citizen Kane'
SELECT yr FROM movie
WHERE title = 'Citizen Kane'

--#List all of the Star Trek movies, 
--#include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year. 
SELECT id , title , yr FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr

--#What id number does the actor 'Glenn Close' have? 
SELECT id FROM actor
WHERE name = 'Glenn Close' 

--#What is the id of the film 'Casablanca' 
SELECT id FROM movie
WHERE title = 'Casablanca'

--#Obtain the cast list for 'Casablanca'.
SELECT actor.name FROM actor JOIN casting ON actor.id = actorid
WHERE movieid=11768

--#Obtain the cast list for the film 'Alien' 
SELECT actor.name FROM actor JOIN casting ON actor.id = actorid
        JOIN movie ON (movieid = movie.id)
WHERE title = 'Alien' 

--#List the films in which 'Harrison Ford' has appeared 
SELECT title FROM movie JOIN casting ON (movie.id = movieid)
                         JOIN actor ON (actor.id = actorid)
WHERE actor.name = 'Harrison Ford'

--#List the films where 'Harrison Ford' has appeared - but not in the starring role
SELECT title FROM movie JOIN casting ON (movie.id = movieid)
                         JOIN actor ON (actor.id = actorid)
WHERE actor.name = 'Harrison Ford' AND casting.ord != 1

--#List the films together with the leading star for all 1962 films. 
SELECT title , actor.name FROM movie JOIN casting ON (movie.id = movieid)
                                     JOIN actor ON (actor.id = actorid)
WHERE movie.yr = 1962 AND casting.ord = 1

--#Joining two tables
SELECT * FROM casting JOIN actor
          ON casting.actorid=actor.id
  WHERE actor.name='John Hurt'

--#Joining three tables
SELECT * FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
  WHERE actor.name='John Hurt'