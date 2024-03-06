WITH joined AS( 
    SELECT  
    sales.*, 
    CAST(product.purchase_price AS FLOAT64) as purchase_price, 
    FROM {{ ref('stg_gz_raw_data__product') }} AS product 
    INNER JOIN {{ ref('stg_gz_raw_data__sales') }} AS sales 
    ON product.products_id = sales.products_id ) SELECT *,     
    ROUND(quantity*purchase_price, 2) AS purchase_cost,     
    ROUND(revenue-(quantity*purchase_price), 2) AS margin 
    FROM     
    joined
    
