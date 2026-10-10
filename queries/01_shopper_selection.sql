SELECT
IFNULL(shoppers.shopper_first_name, 'Not Known') AS [Name],
IFNULL(shoppers.shopper_surname, 'Not Known' ) AS [Surname],
IFNULL(shoppers.shopper_email_address, 'Not Known') AS [Email], 
IFNULL(shoppers.gender, 'Not Known') AS [Gender],
IFNULL(strftime('%d-%m-%Y', shoppers.date_joined), 'Not Known') AS [Date Joined],
IFNULL(CAST(strftime('%Y', 'now') - strftime('%Y', shoppers.date_of_birth) -
(strftime('%m-%d', 'now') < strftime('%m-%d', shoppers.date_of_birth))
AS TEXT), 'Not Known') AS [Current Age]
FROM shoppers
WHERE shoppers.date_joined >= '2020-01-01' OR shoppers.gender = 'F'
ORDER BY [gender], shoppers.date_of_birth ASC;
