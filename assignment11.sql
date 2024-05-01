
DECLARE @order_id INT = 1;
DECLARE @tvp_Order  sales.tvp_orderss_item 
 
INSERT INTO @tvp_Order (product_id, quantity, list_price) 
VALUES (1, 10, 2456), (2, 30, 3245), (34, 8, 234);
 
MERGE INTO Sales.order_items AS Dest
USING (
    SELECT 
        @order_id AS order_id, 
        t.product_id, 
        t.quantity, 
        CASE 
            WHEN (oi.item_id IS NOT NULL) THEN oi.item_id 
            ELSE ROW_NUMBER() OVER (ORDER BY t.product_id) + (SELECT MAX(item_id) FROM sales.order_items WHERE order_id = @order_id) + 1 
        END AS item_id, 
        CASE 
            WHEN (p.list_price > 5000) THEN p.list_price + (p.list_price * 2 / 100) 
            ELSE p.list_price 
        END AS list_price
    FROM @tvp_Order t
    LEFT JOIN production.products p ON t.product_id = p.product_id
    LEFT JOIN sales.order_items oi ON oi.order_id = @order_id AND oi.product_id = t.product_id
) AS Sou
ON Sou.order_id = Dest.Order_id AND Sou.product_id = Dest.product_id
WHEN MATCHED THEN
    UPDATE SET Dest.quantity = Sou.quantity, Dest.list_price = Sou.list_price, Dest.item_id = Sou.item_id
WHEN NOT MATCHED THEN
    INSERT (order_id, product_id, item_id, quantity, list_price) 
    VALUES (Sou.order_id, Sou.product_id, Sou.item_id, Sou.quantity, Sou.list_price)
WHEN NOT MATCHED BY SOURCE and Dest.order_id = @order_id 
THEN
    DELETE;
	select * from sales.order_items