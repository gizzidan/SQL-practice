SELECT Product_Category, COUNT(Prod_ID)
FROM Tb_Product
GROUP BY Product_Category

SELECT City, COUNT(Con_ID)
FROM Tb_Consumer
GROUP BY City
HAVING COUNT(*)>=3
 
SELECT Tb_Supplier.City, COUNT(Tb_Product.Product_Category)
FROM Tb_Supplier, Tb_Offers, Tb_Product
WHERE Tb_Supplier.Supp_ID=Tb_Offers.Supp_ID AND
	Tb_Product.Prod_ID=Tb_Offers.Prod_ID
GROUP BY Tb_Supplier.City

SELECT Tb_Supplier.State, COUNT(Tb_Supplier.Supp_ID)
FROM Tb_Supplier, Tb_Offers, Tb_Product
WHERE Tb_Supplier.Supp_ID=Tb_Offers.Supp_ID AND
	Tb_Product.Prod_ID=Tb_Offers.Prod_ID AND
	Tb_Product.Name='Auto'
GROUP BY Tb_Supplier.State

SELECT Tb_Supplier.City, Tb_Product.Name, SUM(Quantity)
FROM Tb_Supplier, Tb_Offers, Tb_Product
WHERE Tb_Supplier.Supp_ID=Tb_Offers.Supp_ID AND
	Tb_Product.Prod_ID=Tb_Offers.Prod_ID
GROUP BY Tb_Supplier.City, Tb_Product.Name
ORDER BY Tb_Supplier.City, Tb_Product.Name

SELECT Tb_Supplier.Name, Tb_Consumer.City, SUM(Quantity)
FROM Tb_Supplier, Tb_Transactions, Tb_Product, Tb_Consumer
WHERE Tb_Supplier.Supp_ID=Tb_Transactions.Supp_ID AND
	Tb_Product.Prod_ID=Tb_Transactions.Prod_ID AND
	Tb_Consumer.Con_ID=Tb_Transactions.Con_ID AND
	Tb_Product.Name='TV'
GROUP BY Tb_Supplier.Name, Tb_Consumer.City

SELECT Tb_Supplier.Name, Tb_Consumer.Name, Tb_Product.Name, SUM(Quantity*Price)
FROM Tb_Supplier, Tb_Transactions, Tb_Product, Tb_Consumer
WHERE Tb_Supplier.Supp_ID=Tb_Transactions.Supp_ID AND
	Tb_Product.Prod_ID=Tb_Transactions.Prod_ID AND
	Tb_Consumer.Con_ID=Tb_Transactions.Con_ID
GROUP BY Tb_Supplier.Name, Tb_Consumer.Name, Tb_Product.Name

SELECT Tb_Supplier.City, Tb_Consumer.City, Tb_Product.Name, SUM(Quantity*Price)
FROM Tb_Supplier, Tb_Transactions, Tb_Product, Tb_Consumer
WHERE Tb_Supplier.Supp_ID=Tb_Transactions.Supp_ID AND
	Tb_Product.Prod_ID=Tb_Transactions.Prod_ID AND
	Tb_Consumer.Con_ID=Tb_Transactions.Con_ID AND
	Tb_Supplier.City!=Tb_Consumer.City
GROUP BY Tb_Supplier.City, Tb_Consumer.City, Tb_Product.Name

SELECT Tb_Supplier.State, COUNT(distinct Tb_Supplier.Supp_ID) "Supplier Count", COUNT(distinct Tb_Consumer.Con_ID) "Consumer Count"
FROM Tb_Supplier, Tb_Consumer, Tb_Transactions
WHERE Tb_Supplier.Supp_ID=Tb_Transactions.Supp_ID AND
	Tb_Transactions.Con_ID=Tb_Consumer.Con_ID
GROUP BY Tb_Supplier.State
HAVING COUNT(distinct Tb_Supplier.Supp_ID) > COUNT(distinct Tb_Consumer.Con_ID)

SELECT Tb_Supplier.State, Tb_Supplier.City, COUNT(distinct Tb_Supplier.Supp_ID) "Supplier Count", COUNT(distinct Tb_Consumer.Con_ID) "Consumer Count"
FROM Tb_Supplier, Tb_Consumer, Tb_Transactions
WHERE Tb_Supplier.Supp_ID=Tb_Transactions.Supp_ID AND
	Tb_Transactions.Con_ID=Tb_Consumer.Con_ID
GROUP BY Tb_Supplier.State, Tb_Supplier.City



   


