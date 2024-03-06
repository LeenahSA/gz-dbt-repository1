SELECT
   date_date,
   operational_margin-ads_cost As ads_margin,
   ROUND(average_basket,2) As average_basket,
   operational_margin,
   ads_cost,
   ads_impression,
   ads_clicks,
   quantity,
   revenue,
   purchase_cost,
   margin,
   shipping_fee,
   logcost,
   ship_cost
   from  {{ ref('int_campaigns_day') }}
   Full OUTER JOIN {{ ref('Finance_days') }}
     USING (date_date)
     ORDER BY date_date DESC