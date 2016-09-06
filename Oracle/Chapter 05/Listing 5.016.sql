-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example. 

ALTER SESSION SET CURRENT_SCHEMA = SalesOrdersSample;

-- Cannot use nested subqueries with direct references so CTEs are used instead.
WITH TotalPerProductNumber AS (
  SELECT 
  	P2.CategoryID, P2.ProductNumber,
   SUM(OD2.QuotedPrice * OD2.QuantityOrdered) AS SumCategory 
  FROM Products P2 
  INNER JOIN Order_Details OD2 
    ON P2.ProductNumber = OD2.ProductNumber 
  INNER JOIN Orders O2
    ON O2.OrderNumber = OD2.OrderNumber
  WHERE O2.OrderDate BETWEEN DATE '2015-10-01' AND DATE '2015-12-31'
  GROUP BY P2.CategoryID, P2.ProductNumber
), AveragePerCategory AS (
   SELECT t.CategoryID, AVG(t.SumCategory) AS AverageOfCategory 
   FROM TotalPerProductNumber t
   GROUP BY t.CategoryID
), CatProdData AS (
	SELECT C.CategoryID, C.CategoryDescription, P.ProductName, OD.QuotedPrice, OD.QuantityOrdered
	FROM Products P 
	   INNER JOIN Order_Details OD 
	     ON P.ProductNumber=OD.ProductNumber
	   INNER JOIN Categories C
	     ON C.CategoryID = P.CategoryID
	   INNER JOIN Orders O
	     ON O.OrderNumber = OD.OrderNumber
	WHERE O.OrderDate BETWEEN DATE '2015-10-01' AND DATE '2015-12-31'
)
SELECT D.CategoryDescription, D.ProductName, 
  SUM(D.QuotedPrice * D.QuantityOrdered) AS TotalSales
FROM CatProdData D
GROUP BY D.CategoryID, D.CategoryDescription, D.ProductName
HAVING SUM(D.QuotedPrice * D.QuantityOrdered) > (
	SELECT a.AverageOfCategory 
	FROM AveragePerCategory a 
	WHERE a.CategoryID = D.CategoryID
)
ORDER BY CategoryDescription, ProductName;
