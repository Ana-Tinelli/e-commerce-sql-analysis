WITH product_averages AS (
SELECT 
products.product_id,
IFNULL(AVG(CASE 

WHEN shopper_orders.order_status <> 'Cancelled'
THEN ordered_products.quantity
END), 0) AS product_average
FROM products
LEFT JOIN ordered_products
ON products.product_id = ordered_products.product_id
LEFT JOIN shopper_orders
ON ordered_products.order_id = shopper_orders.order_id
GROUP BY products.product_id
),
category_averages AS (
SELECT 
products.category_id,
AVG(ordered_products.quantity) As category_average
FROM products
INNER JOIN ordered_products
ON products.product_id = ordered_products.product_id
INNER JOIN shopper_orders
ON ordered_products.order_id = shopper_orders.order_id
WHERE shopper_orders.order_status <> 'Cancelled'
GROUP BY products.category_id
)
SELECT
categories.category_description AS [Category Description],
products.product_code AS [Product Code],

products.product_description AS [Product Description],
printf('%.2f', product_averages.product_average)
AS [Average Quantity Sold],
printf('%.2f', category_averages.category_average)
AS [Average Quantity Sold for Category]
FROM products
INNER JOIN categories
ON products.category_id = categories.category_id
INNER JOIN product_averages
ON products.product_id = product_averages.product_id
INNER JOIN category_averages
ON products.category_id = category_averages.category_id
WHERE product_averages.product_average
< category_averages.category_average
ORDER BY
categories.category_description,
products.product_description;
