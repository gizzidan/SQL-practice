SELECT *
FROM Tb_Transactions, Tb_Supplier, Tb_Consumer
WHERE Tb_Transactions.Supp_ID=Tb_Supplier.Supp_ID
	AND Tb_Supplier.City='Madison'
	AND Tb_Transactions.Con_ID=Tb_Consumer.Con_ID
	AND Tb_Consumer.City='Stevens Point'
	AND Tb_Transactions.Price > 10000

(SELECT Tb_Supplier.Name
FROM Tb_Supplier, Tb_Offers, Tb_Product
WHERE Tb_Supplier.Supp_ID=Tb_Offers.Supp_ID
	AND Tb_Offers.Prod_ID=Tb_Product.Prod_ID
	AND Tb_Product.Name='computer')
INTERSECT
(SELECT Tb_Supplier.Name
FROM Tb_Supplier, Tb_Offers, Tb_Product
WHERE Tb_Supplier.Supp_ID=Tb_Offers.Supp_ID
	AND Tb_Offers.Prod_ID=Tb_Product.Prod_ID
	AND Tb_Product.Name='orange');

SELECT DISTINCT Tb_Supplier.Name
FROM Tb_Supplier, Tb_Offers, Tb_Product
WHERE (City='Wausau')
	OR (Tb_Offers.Prod_ID=Tb_Product.Prod_ID
		AND Tb_Supplier.Supp_ID=Tb_Offers.Supp_ID
		AND Tb_Product.Name IN ('Orange','Computer'))

(SELECT Tb_Supplier.Name
FROM Tb_Supplier, Tb_Offers, Tb_Product
WHERE Tb_Supplier.Supp_ID=Tb_Offers.Supp_ID
	AND Tb_Offers.Prod_ID=Tb_Product.Prod_ID
	AND Tb_Product.Name='computer')
INTERSECT
(SELECT Tb_Supplier.Name
FROM Tb_Supplier, Tb_Offers, Tb_Product
WHERE Tb_Supplier.Supp_ID=Tb_Offers.Supp_ID
	AND Tb_Offers.Prod_ID=Tb_Product.Prod_ID
	AND Tb_Product.Name='auto')
INTERSECT
(SELECT Tb_Supplier.Name
FROM Tb_Supplier, Tb_Offers, Tb_Product
WHERE Tb_Supplier.Supp_ID=Tb_Offers.Supp_ID
	AND Tb_Offers.Prod_ID=Tb_Product.Prod_ID
	AND Tb_Product.Name='orange');

SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, Tb_Offers, Tb_Supplier
WHERE Tb_Supplier.Supp_ID=Tb_Offers.Supp_ID
	AND Tb_Offers.Prod_ID=Tb_Product.Prod_ID
	AND Tb_Supplier.City<>'Chicago'
	AND Tb_Product.Prod_ID NOT IN
		(SELECT DISTINCT Prod_ID
		FROM Tb_Transactions, Tb_Supplier
		WHERE Tb_Transactions.Supp_ID=Tb_Supplier.Supp_ID 
		      AND City='Chicago')

SELECT Tb_Consumer.Name
FROM Tb_Product, Tb_Requests, Tb_Consumer
WHERE Tb_Consumer.Con_ID=Tb_Requests.Con_ID
	AND Tb_Requests.Prod_ID=Tb_Product.Prod_ID
	AND Tb_Product.Name='Computer'
	AND Tb_Consumer.Con_ID NOT IN
		(SELECT DISTINCT Tb_Consumer.Con_ID
		FROM Tb_Requests, Tb_Consumer
		WHERE Tb_Requests.Con_ID=Tb_Consumer.Con_ID 
		      AND Tb_Product.Name<>'Computer')

SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, Tb_Requests, Tb_Consumer
WHERE Tb_Consumer.Con_ID=Tb_Requests.Con_ID
	AND Tb_Requests.Prod_ID=Tb_Product.Prod_ID

SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, Tb_Offers, Tb_Supplier
WHERE Tb_Supplier.Supp_ID=Tb_Offers.Supp_ID
	AND Tb_Offers.Prod_ID=Tb_Product.Prod_ID
	AND Tb_Product.Prod_ID NOT IN
		(SELECT DISTINCT Prod_ID
		FROM Tb_Transactions, Tb_Supplier
		WHERE Tb_Transactions.Supp_ID=Tb_Supplier.Supp_ID 
		      AND City='Stevens Point')

SELECT DISTINCT P.Name, S.Name
FROM Tb_Product P, Tb_Offers, Tb_Supplier S
WHERE P.Prod_ID=Tb_Offers.Prod_ID
AND Tb_Offers.Supp_ID= S.Supp_ID
       AND Price >=ALL (SELECT Price
		FROM Tb_Offers
		WHERE Prod_ID=P.Prod_ID)

SELECT DISTINCT P.Name, S.City
FROM Tb_Product P, Tb_Transactions, Tb_Supplier S
WHERE P.Prod_ID=Tb_Transactions.Prod_ID
	AND Tb_Transactions.Supp_ID= S.Supp_ID
       AND Quantity >=ALL (SELECT Quantity
		FROM Tb_Transactions
		WHERE Prod_ID=P.Prod_ID)



   


