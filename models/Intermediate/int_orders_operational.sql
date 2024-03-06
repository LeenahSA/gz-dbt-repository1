WITH joined_data AS (    
SELECT         
o_margin.*,         
ship.shipping_fee,         
ship.logcost,         
ship.ship_cost     
FROM {{ ref('int_orders_margin') }} AS o_margin     
INNER JOIN {{ ref('stg_gz_raw_data__ship') }} AS ship     
ON o_margin.orders_id = ship.orders_id ) 	
SELECT *,     
ROUND(CAST(margin AS FLOAT64) + CAST(shipping_fee AS FLOAT64) - CAST(logcost AS FLOAT64) - CAST(ship_cost AS FLOAT64),2) AS operational_margin 
FROM joined_data

