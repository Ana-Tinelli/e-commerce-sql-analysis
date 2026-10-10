SELECT 
shoppers.shopper_first_name AS [Shopper first name],
shoppers.shopper_surname As [Shopper surname],
shopper_orders.order_id AS [Order ID],
strftime('%d-%m-%Y', shopper_orders.order_date) AS [Order Date],
products.product_description AS [Product Description],
sellers.seller_name AS [Seller Name],
ordered_products.quantity AS [Qty ordered],
printf('£%.2f', ordered_products.price) AS [Price],
ordered_products.ordered_product_status As [Order Status]
FROM shoppers
INNER JOIN shopper_orders ON
shoppers.shopper_id = shopper_orders.shopper_id
INNER JOIN ordered_products ON
shopper_orders.order_id = ordered_products.order_id
INNER JOIN products ON
ordered_products.product_id = products.product_id
INNER JOIN sellers ON

ordered_products.seller_id = sellers.seller_id
WHERE shoppers.shopper_id = @shopper_id
ORDER BY shopper_orders.order_date DESC;
