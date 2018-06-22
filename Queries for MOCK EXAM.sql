/*Write a Query to display the distributor name, mobile number and email of distributors selling model 'Nokia 1100'. 
Display the unique records sorted in ascending order based on the distributor name. 
*/
SELECT  DISTINCT (D.Distributor_Name), D.Mobile, D.Email
FROM Distributor D JOIN Mobile_Master MM ON (D.Distributor_ID = MM.Distributor_ID )
WHERE MM.Model_Name = 'Nokia 1100'
ORDER BY D.Distributor_Name ASC

/*Write a Query to Display the IME Number and Model Name of mobiles which are manufactured by "Nokia". 
Display the records sorted in ascending order based on the IME Number. 
*/

SELECT  IME_No, Model_Name
FROM Mobile_Master
WHERE Manufacturer = 'Nokia'
ORDER BY IME_No ASC

/*Write a Query to display IME number, Model Name, Manufacturer and Camera Quality of mobiles whose camera quality is 5MP. 
Display the records sorted in ascending order based on the IME Number. 
*/

SELECT MM.IME_No, MM.Model_Name, MM.Manufacturer, MS.Camera_Quality 
FROM Mobile_Master MM JOIN Mobile_Specification MS ON (MM.IME_No = MS.IME_No)
WHERE MS.Camera_Quality = '5MP'
ORDER BY MS.Camera_Quality ASC

/*Write a Query to display the customer name, IME Number, Model Name, Sales Date and Net amount paid by the customer and sort by customer name in ascending order and then by IME Number in ascending order. 
*/

SELECT C.Customer_Name, S.IME_No,S.Model_Name,S.Sale_Date,S.Net_Amount
FROM Customer_Info C JOIN Sales_Info S ON (C.Customer_ID = S.Customer_ID)
ORDER BY C.Customer_Name ASC, S.IME_No ASC

/*Write a Query to display the unique  model name, manufacturer and  price of the most expensive mobile phone manufactured by "Samsung". (Unique Records Only). 
*/

SELECT Model_Name, Manufacturer, MAX(Price)
FROM Mobile_Master
WHERE Manufacturer = 'Samsung'
GROUP BY Model_Name, Manufacturer

/*Write a Query to display the unique mobile model name and manufacturer of the mobile which has highest sales.
Hint: Get the maximum count of mobile model from Sales info and get the manufacturer using the mobile model.

For example, Nokia has three models M1, M2, M3 and Samsung has 2 models S1,S2. Assume M1 model has 5 sales, M2, 3, M3, 2 and S1, 3 and S2 2. If that is the case the records to be displayed as M1 Nokia since it has the highest sales.
In case of multiple records, display the records sorted in ascending order based on model name. 
*/

SELECT MM.Model_Name, MM.Manufacturer, COUNT(S.SalesID)
FROM Mobile_Master MM JOIN Sales_Info S ON (MM.IME_No = S.IME_No)
GROUP BY MM.Model_Name, MM.Manufacturer
ORDER BY MM.Model_Name ASC

SELECT MM.Model_Name, MM.Manufacturer, COUNT(S.SalesID) as "Sales_Count"
FROM Mobile_Master MM JOIN Sales_Info S ON (MM.IME_No = S.IME_No)
GROUP BY MM.Model_Name, MM.Manufacturer
Having COUNT(S.SalesID) > 2
ORDER BY MM.Model_Name ASC

SELECT MAX (SELECT COUNT(SalesID)
FROM Sales_Info
GROUP BY  Model_Name)