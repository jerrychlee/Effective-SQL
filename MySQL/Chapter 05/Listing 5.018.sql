-- Ensure you've run Item33StructureAndDataMY.sql in the Sample Databases folder
-- in order to create the Inventory table

USE Item33Example;

-- Listing 5.18 Incorrect SQL Statement to determine originating country for beer with highest alcohol level
SELECT Category, Country, MAX(MaxABV) AS MaxAlcohol
FROM BeerStyles
GROUP BY Category, Country;
