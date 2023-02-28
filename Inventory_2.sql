SELECT 
S2.ing_name,
S2.ORDERED_WEIGHT,
(ING.ING_WEIGHT*INV.QUANTITY) AS 'Total_Weight',
(ING.ING_WEIGHT*INV.QUANTITY) - S2.ORDERED_WEIGHT as 'Remaining_Weight'
FROM
(SELECT 
ING_ID,
ING_NAME, 
SUM(ORDERED_WEIGHT) AS 'Ordered_Weight'
FROM 
stock1
GROUP BY 
ING_ID, 
ING_NAME) S2 
LEFT JOIN INVENTORY AS INV ON INV.ITEM_ID = S2.ING_ID
LEFT JOIN INGREDIENT AS ING ON ING.ING_ID = S2.ING_ID