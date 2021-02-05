-- SOLUTIONS

1. Write a query that returns the count for all records in the purchases table.

SELECT COUNT ( * )
FROM purchases;

MYANSWER:

SELECT COUNT(*)
FROM purchases;

2. Write a query that returns the count of records for the months after May. Store this in an alias named num_after_may.

SELECT COUNT(*) AS num_after_may
FROM purchases
WHERE EXTRACT (month FROM created_at) > 5;

MYANSWER:

SELECT COUNT(created_at) AS num_after_may
FROM purchases
WHERE EXTRACT(MONTH FROM created_at) > 5;

3. Write a query that returns the name of the customer and the state for all the purchases made in Florida.

SELECT name, state
FROM purchases
WHERE state = 'FL';

MYANSWER:

SELECT name, state
FROM purchases
WHERE state = 'FL';

4. Write a query that returns the count of purchases in zipcode 11065.

SELECT COUNT(*)
FROM purchases
WHERE zipcode = 11065;

MYANSWER:

SELECT COUNT(created_at)
FROM purchases
WHERE zipcode = 11065;

5. Write a query that returns the count of purchases where the user_id is between 1 and 10 inclusive and where the states are not Florida or Georgia.

SELECT COUNT(*)
FROM purchases
WHERE user_id BETWEEN 1 AND 10 AND state NOT IN ('FL','GA');

MYANSWER:

SELECT COUNT(created_at) AS count
FROM purchases
WHERE user_id BETWEEN 1 AND 10 
  AND (state <>'FL' AND state <> 'GA');

6. Write a query that returns the count of purchases from the zipcodes 99652, 11065, and 66513.

SELECT COUNT(*)
FROM purchases
WHERE zipcode IN(99652, 11065, 66513);

MYANSWER:

SELECT COUNT(created_at) AS count
FROM purchases
WHERE zipcode IN (99652, 11065, 66513);

7. Write a query that returns the count of all user_id records between 10 and 50, exclusive of the user_ids 20 and 30.

SELECT COUNT(*)
FROM purchases
WHERE user_id BETWEEN 10 and 50
AND user_id NOT IN (20, 30);

MYANSWER:

SELECT COUNT(user_id) AS count
FROM purchases
WHERE user_id BETWEEN 10 AND 50
AND user_id <> 20 AND user_id <> 30;

8. Write a query that returns the name, address, state, and zipcode from all purchases. For the names, return only the first 5 characters, and display them in all uppercase letters, sorted in alphabetical order.

SELECT UPPER(LEFT(name,5)), address, state, zipcode
FROM purchases
ORDER BY name;

MYANSWER:

SELECT UPPER(SUBSTRING(name, 1, 5)), address, state, zipcode
FROM purchases
ORDER BY name;

9, Write a query that returns a new field called name_date that combines the name and date fields with the labels ‘name:’ and ‘date:’. Your first row should look like this:
name: Harrison Jonson; date: 2011-03-16

SELECT CONCAT('name: ', name, '; date: ', created_at) as name_date
FROM purchases;

MYANSWER:

SELECT CONCAT('name: ', name, '; date: ', created_at) as name_date
FROM purchases;

10. You want to know if any of the zip codes are missing (null). Write a query that finds all of the null zip codes and list this by name.

SELECT name
FROM purchases
WHERE zipcode IS NULL;

MYANSWER:

SELECT *
FROM purchases
WHERE zipcode = NULL
ORDER BY name;

11. Write a query that returns id, created_at, name and address for all records where the state is Georgia and user_id is 18, or where the user_id is 20 with any state. Order the list by the date that the order was created from newest to oldest.

SELECT id, created_at, name, address
FROM purchases
WHERE
    state = 'GA'
    AND user_id = 18
    OR user_id = 20
ORDER BY created_at DESC;

MYANSWER:

SELECT id, created_at, name, address
FROM purchases
WHERE (state = 'GA' AND user_id = 18)
OR user_id = 20
ORDER BY created_at DESC;

12. Write a query that returns name, address, state, and zipcode where (1) the state is Illinois, (2) or the zipcode is between 30000 and 80000, and the first two characters in the address are 23 or 12, and the state is either Colorado, Texas, or Wyoming.

SELECT name, address, state, zipcode
FROM purchases
WHERE state = 'IL'
    OR (zipcode BETWEEN 30000 AND 80000
    AND (LEFT(address,2) = '23' OR LEFT(address,2) = '12')
    AND (state = 'CO' OR state = 'TX' OR state = 'WY'));

MYANSWER:

SELECT name, address, state, zipcode
FROM purchases
WHERE state = 'IL' 
OR (zipcode BETWEEN 30000 AND 80000
AND (address LIKE '23%' OR address LIKE '12%')
AND state IN ('CO', 'TX', 'WY'))

13. Write a query that returns all the records for the top 10 purchases with the highest zip code number (descending order).

SELECT *
FROM purchases
ORDER BY zipcode DESC
LIMIT 10;

MYANSWER:

SELECT *
FROM purchases
ORDER BY zipcode DESC
LIMIT 10;

14. Write a query that returns all the records of purchases where the buyer's first name starts with a capital "S". Sort the list by name.

SELECT *
FROM purchases
WHERE name LIKE 'S%'
ORDER BY name;

MYANSWER:

SELECT *
FROM purchases
WHERE name ILIKE 's%'
ORDER BY name;

14. Part 2. Write a query that returns all the records of purchases where the buyer's first name starts with a capital "S" or a capital "T". Sort the list by name.

SELECT *
FROM purchases
WHERE name LIKE 'S%'
OR name LIKE 'T%'
ORDER BY name;

MYANSWER:

SELECT *
FROM purchases
WHERE name LIKE 'S%' OR name LIKE 'T%'
ORDER BY name;

15. Write a query that returns the count of records where the size of the name field is greater than or equal to 15 characters.

SELECT COUNT(*)
FROM purchases
WHERE LENGTH(name) >= 15;

MYANSWER:

SELECT COUNT(*) AS count
FROM purchases
WHERE LENGTH(name) >=15;

16. Write a query that returns the count of all records where state starts with a letter greater than "M", zipcode is greater than 50000, and user_id is greater than 10 (all non-inclusive).

SELECT COUNT(*)
FROM purchases
WHERE
    state > 'M'
    AND zipcode > 50000
    AND user_id > 10;

MYANSWER:

SELECT COUNT(*) AS count
FROM purchases
WHERE state > 'M%' AND
zipcode > 50000 AND
user_id > 10;

17. Write a query that returns all records where the buyer name has a (lowercase) "e" in its 3rd position.

SELECT *
FROM purchases
WHERE name LIKE '__e%';

MYANSWER:

SELECT id, created_at, name, address, state, zipcode, user_id
FROM purchases
WHERE name LIKE '__e%';
