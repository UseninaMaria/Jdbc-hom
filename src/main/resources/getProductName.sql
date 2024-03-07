SELECT
    ord.product_name
FROM
    task1.orders ord
        INNER JOIN task1.customers cus on cus.id = ord.customer_id
WHERE
    LOWER(cus.name) = LOWER(:name);