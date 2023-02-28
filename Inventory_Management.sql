SELECT 
S1.ing_id,
S1.item_name,
S1.ing_name,
S1.ing_weight,
S1.ING_PRICE,
S1.Order_quantity,
S1.Recipe_quantity,
(S1.Order_quantity * S1.Recipe_quantity) AS Ordered_weight,
(s1.ing_price/s1.ing_weight) as price_per_unit,
(S1.Order_quantity * S1.Recipe_quantity)*(s1.ing_price/s1.ing_weight) as total_ingredient_cost
FROM
(SELECT
	O.item_id,
	I.sku,
	I.item_name,
	R.ing_id,
	ING.ing_name,
	R.quantity AS "Recipe_quantity",
	sum( o.quantity ) AS "Order_quantity",
	ING.ing_weight,
	ING.ing_price
FROM
	ORDERS AS O
	LEFT JOIN ITEM AS I ON I.item_id = O.item_id
	LEFT JOIN Recipe AS R ON r.recipe_id = i.sku 
	LEFT JOIN Ingredient AS ING ON ING.ing_id = R.ing_id
GROUP BY
	O.ITEM_ID,
	I.sku,
	I.item_name,
	R.ing_id,
	ING.ing_name,
	R.quantity,
	ING.ing_weight,
	ING.ing_price) S1