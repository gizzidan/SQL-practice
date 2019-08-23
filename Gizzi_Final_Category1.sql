SELECT DISTINCT S.Name "Supplier Name",
		        S.City "Supplier City",
		        S.State "Supplier State",
	   	        P.Product_Packaging "Product Packaging",
				P.Product_Category "Product Category",
				P.Product_Line "Product Line",
				P.Name "Product Name",
	   	        SUM(Quantity) "Total Offer Quantity",
				SUM(Quantity * Price) "Total Amount",
				MAX(Price) "Max Price",
				MIN(Price) "Min Price"
INTO Tb_Offers_Cube
FROM Tb_Supplier S, Tb_Product P, Tb_Offers O
WHERE S.Supp_ID=O.Supp_ID AND
	  P.Prod_ID=O.Prod_ID 	    
GROUP BY CUBE((S.State, S.City, S.Name),
			(P.Product_Packaging, P.Product_Category, P.Product_Line, P.Name)),
		ROLLUP(S.State, S.City, S.Name),
		ROLLUP(P.Product_Packaging, P.Name),
		ROLLUP(P.Product_Category, P.Product_Line, P.Name)


SELECT "Supplier Name", "Product Packaging", "Total Amount"
FROM Tb_Offers_Cube
WHERE "Supplier Name" IS NOT NULL
	AND "Supplier City" IS NOT NULL
  	AND "Supplier State" IS NOT NULL
 	AND "Product Packaging" IS NOT NULL
 	AND "Product Category" IS NULL
  	AND "Product Line" IS NULL
  	AND "Product Name" IS NULL


SELECT "Supplier Name", "Supplier State", "Product Name", "Total Offer Quantity"
FROM Tb_Offers_Cube
WHERE "Supplier Name" IS NOT NULL
	AND "Supplier City" IS NOT NULL
  	AND "Supplier State" = 'Wisconsin'
 	AND "Product Packaging" IS NOT NULL
 	AND "Product Category" IS NULL
  	AND "Product Line" IS NULL
  	AND "Product Name" = 'Milk'

 
SELECT "Supplier City", "Product Name", "Max Price"
FROM Tb_Offers_Cube
WHERE "Supplier Name" IS NULL
	AND "Supplier City" = 'Madison'
  	AND "Supplier State" IS NOT NULL
 	AND "Product Packaging" IS NOT NULL
 	AND "Product Category" IS NULL
  	AND "Product Line" IS NULL
  	AND "Product Name" IS NOT NULL



SELECT * FROM ( 
SELECT "Supplier City", 
		"Product Name", 
		"Total Offer Quantity",
		ROW_NUMBER() OVER (
                     PARTITION BY "Supplier City" 
                     ORDER BY "Total Offer Quantity" DESC
         	   ) AS "Row Number"
	FROM Tb_Offers_Cube 
	WHERE"Supplier Name" IS NULL
		AND "Supplier City" IS NOT NULL
  		AND "Supplier State" IS NOT NULL
 		AND "Product Packaging" IS NOT NULL
 		AND "Product Category" IS NULL
  		AND "Product Line" IS NULL
  		AND "Product Name" IS NOT NULL
	) groups
WHERE groups."Row Number" = 1
ORDER BY groups."Total Offer Quantity" DESC


SELECT * FROM ( 
SELECT "Product Name", 
		"Supplier City", 
		"Min Price",
		ROW_NUMBER() OVER (
                     PARTITION BY "Product Name" 
                     ORDER BY "Min Price" ASC
         	   ) AS "Row Number"
	FROM Tb_Offers_Cube 
	WHERE"Supplier Name" IS NULL
		AND "Supplier City" IS NOT NULL
  		AND "Supplier State" IS NOT NULL
 		AND "Product Packaging" IS NOT NULL
 		AND "Product Category" IS NULL
  		AND "Product Line" IS NULL
  		AND "Product Name" IS NOT NULL
	) groups
WHERE groups."Row Number" = 1
ORDER BY groups."Min Price" ASC





   


