SELECT *
FROM `10000 sales records`;

SELECT DISTINCT Region
FROM `10000 sales records`;

SELECT DISTINCT Country
FROM `10000 sales records`;

-- Checking for doublicates
WITH doublicate_cte AS
(
SELECT *, ROW_NUMBER() OVER(
PARTITION BY Region, Country, `Item Type`, `Sales Channel`, `Order Priority`, `Order Date`, `Order ID`, `Ship Date`, `Units Sold`, `Unit Price`
) AS row_num
FROM `10000 sales records`
)
SELECT *
FROM doublicate_cte
WHERE row_num > 1;


-- Cheching for missing values
select COUNT(Region)
from `10000 sales records`
WHERE Region = " " OR Region IS NULL;

select COUNT(Country)
from `10000 sales records`
WHERE Country = " " OR Country IS NULL;

select COUNT(`Sales Channel`)
from `10000 sales records`
WHERE `Sales Channel` = " " OR `Sales Channel` IS NULL;

select COUNT(`Order Priority`)
from `10000 sales records`
WHERE `Order Priority` = " " OR `Order Priority` IS NULL;

select COUNT(`Order Date`)
from `10000 sales records`
WHERE `Order Date` = " " OR `Order Date` IS NULL;


select COUNT(`Order ID`)
from `10000 sales records`
WHERE `Order ID` = " " OR `Order ID` IS NULL;

select COUNT(`Ship Date`)
from `10000 sales records`
WHERE `Ship Date` = " " OR `Ship Date` IS NULL;

-- Changing data types to conform with values
SELECT *
FROM `10000 sales records`;

UPDATE `10000 sales records`
SET `Ship Date` = STR_TO_DATE(`Ship Date`, '%m/%d/%Y');


UPDATE `10000 sales records`
SET `Order Date` = STR_TO_DATE(`Order Date`, '%m/%d/%Y');

SELECT *
FROM `10000 sales records`;

ALTER TABLE `10000 sales records`
MODIFY `Order Date` date;

ALTER TABLE `10000 sales records`
MODIFY `Ship Date` date;

-- change some column positions

ALTER TABLE `10000 sales records`
MODIFY `Order ID` int FIRST;
