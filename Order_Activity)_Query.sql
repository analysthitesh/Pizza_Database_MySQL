SELECT
	O.ORDER_ID,
	I.ITEM_PRICE,
	O.QUANTITY,
	I.ITEM_CAT,
	I.ITEM_NAME,
	O.CREATED_AT,
	A.delivery_address1,
	a.delivery_address2,
	a.delivery_city,
	a.delivery_zipcode,
	o.delivery
FROM ORDERS AS O
LEFT JOIN ITEM AS I ON I.item_id = O.item_id
LEFT JOIN ADDRESS AS A ON A.address_id = O.address_id
