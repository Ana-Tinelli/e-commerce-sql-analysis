SELECT 
sellers.seller_account_ref AS [Seller Account Ref],
sellers.seller_name AS [Seller Name], 
products.product_code AS [Product Code],
products.product_description AS [Product Description],
COUNT(
DISTINCT ordered_products.order_id) AS [Number of Orders],
IFNULL(SUM(ordered_products.quantity), 0) AS [Total Quantity Sold],
printf('£%.2f', IFNULL(SUM(ordered_products.quantity * ordered_products.price), 0)
)AS [Total Sales]
FROM product_sellers
INNER JOIN sellers ON
product_sellers.seller_id = sellers.seller_id
INNER JOIN products ON
product_sellers.product_id = products.product_id
LEFT JOIN ordered_products 
ON product_sellers.seller_id = ordered_products.seller_id
AND product_sellers.product_id = ordered_products.product_id
GROUP BY
sellers.seller_id,
sellers.seller_account_ref,
sellers.seller_name, 
products.product_id,
products.product_code, 
products.product_description
ORDER BY
IFNULL(SUM(ordered_products.quantity), 0) ASC;
