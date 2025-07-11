create database tut11;
use tut11;

create table users(
	user_id int primary key,
    full_name varchar(100),
    email varchar(100),
    city varchar(50)
);

insert into users
(user_id,full_name,email,city)
values
(1, 'Kunal Mehta', 'kunal.mehta@gmail.com', 'Mumbai'),
(2, 'Sneha Shah', 'sneha.shah@yahoo.com', 'Delhi'),
(3, 'RAHUL GUPTA', 'rahul123@outlook.com', 'Bangalore'),
(4, 'megha jain', 'megha.jain@gmail.com', 'Pune'),
(5, 'Amit', 'AMIT.K@GMAIL.COM', 'Chennai');

/*

| Function                   | Description                    | Example                                    |
| -------------------------- | ------------------------------ | ------------------------------------------ |
| `UPPER()`                  | Converts to uppercase          | `UPPER('kunal') → 'KUNAL'`                 |
| `LOWER()`                  | Converts to lowercase          | `LOWER('KUNAL') → 'kunal'`                 |
| `LENGTH()`                 | Returns length of string       | `LENGTH('Hello') → 5`                      |
| `CHAR_LENGTH()`            | Same as `LENGTH()`             |                                            |
| `CONCAT()`                 | Combines strings               | `CONCAT('Kunal', ' Mehta')`                |
| `SUBSTRING()` / `SUBSTR()` | Extract part of string         | `SUBSTRING('Kunal', 1, 3) → 'Kun'`         |
| `LEFT()` / `RIGHT()`       | Get first or last N characters | `LEFT('Kunal', 2) → 'Ku'`                  |
| `INSTR()`                  | Position of substring          | `INSTR('kunal.mehta', '.') → 6`            |
| `REPLACE()`                | Replace substring              | `REPLACE('Hello Kunal', 'Kunal', 'Sneha')` |
| `TRIM()`                   | Remove spaces                  | `TRIM(' Kunal ') → 'Kunal'`                |

*/

-- 1. Convert all names to uppercase

select full_name, UPPER(full_name) as upper_name from users;

-- 2. Extract domain from email
select email, substring(email, instr(email,'@')+1) as domain from users;

-- 3. First 3 letters of city
select city, left(city,3) as first_3_letter_city from users;

-- 4. Replace .com with .in in email
select email, replace(email,'.com','.in') as replaced_email from users;

-- 5. Trim spaces from name (if any)
select full_name, trim(full_name) as trimmed_name from users;

-- 6. Show all usernames in lowercase.
select full_name, lower(full_name) as lower_case from users;

-- 7. Get the length of each user's full name.
select full_name, length(full_name) as length_of_name from users;

-- 8. Concatenate full_name and city in one column as "Name from City".
select full_name, city, concat(full_name,' from ',city) as concat from users;

-- 9. Replace all "." in email with "-" and display the result.
select email, replace(email,'.','-') as replaced from users;

-- 10. Show first 4 characters of full name and last 4 of email in one column.
select full_name, left(full_name,4) as first_4_char from users;

-- 11. Extract the email service provider (like gmail, yahoo) from each email.
SELECT 
  email,
  LOWER(SUBSTRING_INDEX(SUBSTRING_INDEX(email, '@', -1), '.', 1)) AS provider
FROM 
  users;

-- SUBSTRING_INDEX(email, '@', -1) --> This extracts everything after the last @ in the email.
-- SUBSTRING_INDEX('kunal.mehta@gmail.com', '@', -1) --> Returns: 'gmail.com'
-- SUBSTRING_INDEX('gmail.com', '.', 1) -->  This extracts everything before the first . from that result.
-- SUBSTRING_INDEX('gmail.com', '.', 1) --> Returns: 'gmail'
-- LOWER('GMAIL') → 'gmail'







