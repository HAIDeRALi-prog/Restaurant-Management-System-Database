------------------------------------------------
-- Business_Queries.sql
------------------------------------------------

-- 1. Show all customers
SELECT * FROM CUSTOMER;

-- 2. Show all menu items
SELECT * FROM MENU_ITEM;

-- 3. Employees working in each branch
SELECT E.Employee_Name, B.Branch_Name
FROM EMPLOYEE E
JOIN BRANCH B ON E.Branch_ID = B.Branch_ID;

-- 4. Orders with customer names
SELECT O.Order_ID, C.Customer_Name, O.Total_Amount
FROM ORDERS O
JOIN CUSTOMER C ON O.Customer_ID = C.Customer_ID;

-- 5. Orders handled by waiters
SELECT O.Order_ID, E.Employee_Name AS Waiter
FROM ORDERS O
JOIN WAITER W ON O.Waiter_ID = W.Waiter_ID
JOIN EMPLOYEE E ON W.Employee_ID = E.Employee_ID;

-- 6. Order details with items
SELECT OD.Order_ID, M.Item_Name, OD.Quantity
FROM ORDER_DETAILS OD
JOIN MENU_ITEM M ON OD.Item_ID = M.Item_ID;

-- 7. Total revenue
SELECT SUM(Amount) AS Total_Revenue FROM PAYMENT;

-- 8. Average order value
SELECT AVG(Total_Amount) FROM ORDERS;

-- 9. Most expensive menu item
SELECT * FROM MENU_ITEM
WHERE Price = (SELECT MAX(Price) FROM MENU_ITEM);

-- 10. Customers with highest order
SELECT Customer_Name
FROM CUSTOMER
WHERE Customer_ID IN (
    SELECT Customer_ID
    FROM ORDERS
    WHERE Total_Amount = (SELECT MAX(Total_Amount) FROM ORDERS)
);
