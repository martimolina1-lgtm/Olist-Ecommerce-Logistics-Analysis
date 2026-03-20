SELECT 
  C.customer_state,
  AVG(R.review_score) AS puntaje_promedio,
  AVG(DATE_DIFF(DATE(O.order_delivered_customer_date), DATE(O.order_delivered_carrier_date), DAY)) AS promedio_transporte
FROM 
  `bigquery-public-data-488421.olist_ecommerce_analysis.orders` AS O
JOIN 
  `bigquery-public-data-488421.olist_ecommerce_analysis.customers` AS C ON O.customer_id = C.customer_id
JOIN 
  `bigquery-public-data-488421.olist_ecommerce_analysis.reviews` AS R ON O.order_id = R.order_id
WHERE 
  O.order_status = 'delivered'
GROUP BY 
  C.customer_state
ORDER BY 
  promedio_transporte DESC
