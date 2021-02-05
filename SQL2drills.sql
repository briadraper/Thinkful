-- SOLUTIONS

1. Write a query that returns a list of distinct values in the yearbuilt field.

SELECT DISTINCT yearbuilt
FROM houseprices;

MYANSWER:

SELECT DISTINCT(yearbuilt)
FROM houseprices;

2. How many unique values are there for the mszoning field (alias this as count_mszoning), and mssubclass field (alias this as count_mssubclass)?

SELECT COUNT(DISTINCT mszoning) as count_mszoning, COUNT(DISTINCT mssubclass) as count_mssubclass
FROM houseprices;

MYANSWER:

SELECT COUNT(DISTINCT(mszoning)) AS count_mszoning, COUNT(DISTINCT(mssubclass)) AS count_mssubclass
FROM houseprices;

3. Write a query that returns a list of all the unique combinations for street and lotshape, sorted alphabetically by street.

SELECT DISTINCT street, lotshape 
FROM houseprices
ORDER BY street;

MYANSWER:

SELECT DISTINCT street, lotshape
FROM houseprices
ORDER BY street;

4. Write a query that returns the neighborhood, lotconfig, and number of different lot configurations (using the alias count_lotconfig) and group them by unique lot configurations per neighborhood, ordered by neighborhood and then by count_lotconfig.

SELECT neighborhood, lotconfig, COUNT(lotconfig) AS count_lotconfig
FROM houseprices
GROUP BY lotconfig, neighborhood
ORDER BY neighborhood, count_lotconfig;

MYANSWER:

SELECT neighborhood, lotconfig, COUNT(lotconfig) AS count_lotconfig
FROM houseprices
GROUP BY lotconfig, neighborhood
ORDER BY neighborhood, count_lotconfig;

5. Write a query that returns the average saleprice of houses per yearbuilt – call this field avg_saleprice – rounded to the nearest whole number and sorted from newest to oldest.

*HINT: Within the first line of your query, use this code so that the proper datatype is used to avoid results displaying in scientific notation:*

`ROUND(AVG(saleprice),0)::float`

SELECT yearbuilt, ROUND(AVG(saleprice),0)::float as avg_saleprice
FROM houseprices
GROUP BY yearbuilt
ORDER BY yearbuilt DESC;

MYANSWER:

SELECT yearbuilt, ROUND(AVG(saleprice),0)::float AS avg_saleprice
FROM houseprices
GROUP BY yearbuilt
ORDER BY yearbuilt DESC;

6. Write a query that shows the average number of cars for the column garagecars (using the alias avg_garage) per yearbuilt – include only the houses that have 1 or more garages. Round your answer to the nearest whole number.

*HINT: Within  the first line of your query, use this code so that the proper datatype is used to avoid results displaying in scientific notation:*

`ROUND(AVG(garagecars),0)::float`

SELECT yearbuilt, ROUND(AVG(garagecars),0)::float as avg_garage
FROM houseprices
WHERE garagecars >= 1
GROUP BY yearbuilt;

MYANSWER:

SELECT yearbuilt, ROUND(AVG(garagecars),0)::float AS avg_garage
FROM houseprices
WHERE garagecars >= 1
GROUP BY yearbuilt;

7. Write a query that shows for each yearbuilt, how many houses had zero garages and the largest lotarea amount for that year.

SELECT yearbuilt, MAX(lotarea), COUNT(*)
FROM houseprices
WHERE garagecars = 0
GROUP BY yearbuilt;

MYANSWER:

SELECT yearbuilt, COUNT(*), MAX(lotarea)
FROM houseprices
WHERE garagetype IS NULL 
GROUP BY yearbuilt;

8. For each yearbuilt find the average lotarea – call it avg_lot_per_year, and return only those results for which the average is smaller than 10,000, sorted high to low.

*HINT: Within the first line of your query, use this code so that the proper datatype is used to avoid results displaying in scientific notation:*

`avg(lotarea)::float`

SELECT yearbuilt, avg(lotarea)::float as avg_lot_per_year
FROM houseprices
GROUP BY yearbuilt
HAVING avg(lotarea) < 10000
ORDER BY avg_lot_per_year DESC;

MYANSWER:

SELECT yearbuilt, AVG(lotarea)::float AS avg_lot_per_year
FROM houseprices
GROUP BY yearbuilt
HAVING AVG(lotarea) < 10000
ORDER BY avg_lot_per_year DESC;

9. Write a query that shows, for each yearbuilt, how many houses had a lotarea between 10,000 and 15,000, inclusive. Finally, order it by yearbuilt from oldest to newest.

SELECT yearbuilt, COUNT(*)
FROM houseprices
WHERE lotarea BETWEEN 10000 AND 15000
GROUP BY yearbuilt
ORDER BY yearbuilt;

MYANSWER:

SELECT yearbuilt, COUNT(lotarea)
FROM houseprices
WHERE lotarea BETWEEN 10000 AND 15000
GROUP BY yearbuilt
ORDER BY yearbuilt;

10. Write a query that shows the average overall quality overallqual (rounded to 0 decimals and renamed as avg_quality) and the number of unique garage types (garagetype) renamed as garage_count for each neighborhood sorted by neighborhood, being careful to not include NULL values.

*HINT: Within the first line of your query, use this code so that the proper datatype is used to avoid results displaying in scientific notation:*

`ROUND(AVG(overallqual),0)::float`

SELECT neighborhood, ROUND(AVG(overallqual),0)::float AS avg_quality, COUNT(DISTINCT(garagetype)) AS garage_count
FROM houseprices
GROUP BY neighborhood
ORDER BY neighborhood;

MYANSWER:

SELECT neighborhood, ROUND(AVG(overallqual),0)::float AS avg_quality,
  COUNT(DISTINCT(garagetype)) AS garage_count
FROM houseprices
GROUP BY neighborhood
ORDER BY neighborhood;

11. Write a query that selects the average lotarea (rounded to 2 decimals) per yearbuilt where the street is not gravel (Grvl) and lotconfig is a corner (Corner). Moreover, select only the average lotareas greater than 1,000, and sort your results by yearbuilt from oldest to newest.

*HINT: Within the first line of your query, use this code so that the proper datatype is used to avoid results displaying in scientific notation:*

`ROUND(AVG(lotarea),2)::float`

SELECT yearbuilt, ROUND(AVG(lotarea),2)::float
FROM houseprices
WHERE street NOT IN('Grvl') AND lotconfig = 'Corner'
GROUP BY yearbuilt
HAVING AVG(lotarea) > 1000
ORDER BY yearbuilt;

MYANSWER:

SELECT yearbuilt, ROUND(AVG(lotarea),2)::float 
FROM houseprices
WHERE street <> 'Grvl' AND lotconfig = 'Corner'
GROUP BY yearbuilt
HAVING AVG(lotarea) > 1000
ORDER BY yearbuilt;
