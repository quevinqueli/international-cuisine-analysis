-- Question 1: Revenue by category

SELECT
  m.item_name,
  m.category,
  COUNT(*) AS total_orders,
  ROUND(SUM(m.price), 2) AS total_revenue
FROM `ageless-fire-492718-j9.international_cuisine.order_details` o
JOIN `ageless-fire-492718-j9.international_cuisine.menu_items` m
  ON SAFE_CAST(o.item_id AS INT64) = m.menu_item_id
WHERE o.item_id IS NOT NULL
  AND o.item_id != 'NULL'
  AND SAFE_CAST(o.item_id AS INT64) IS NOT NULL
GROUP BY m.item_name, m.category
ORDER BY total_revenue DESC

-- Question 1b: Revenue by category split across day of week

SELECT
  m.category,
  FORMAT_DATE('%A', o.order_date) AS day_of_week,
  COUNT(*) AS total_orders,
  ROUND(SUM(m.price), 2) AS total_revenue
FROM `ageless-fire-492718-j9.international_cuisine.order_details` o
JOIN `ageless-fire-492718-j9.international_cuisine.menu_items` m
  ON CAST(o.item_id AS INT64) = m.menu_item_id
WHERE o.item_id IS NOT NULL
  AND o.item_id != 'NULL'
  AND SAFE_CAST(o.item_id AS INT64) IS NOT NULL
GROUP BY m.category, day_of_week
ORDER BY m.category, total_revenue DESC


-- Question 2: Peak ordering hours and days

SELECT
  FORMAT_DATE('%A', o.order_date) AS day_of_week,
  EXTRACT(HOUR FROM PARSE_TIME('%I:%M:%S %p', o.order_time)) AS hour_of_day,
  COUNT(*) AS total_orders
FROM `ageless-fire-492718-j9.international_cuisine.order_details` o
WHERE o.item_id IS NOT NULL
  AND o.item_id != 'NULL'
  AND SAFE_CAST(o.item_id AS INT64) IS NOT NULL
GROUP BY day_of_week, hour_of_day
ORDER BY total_orders DESC

-- Question 3: Menu items by volume and revenue

SELECT
  m.category,
  COUNT(*) AS total_orders,
  ROUND(SUM(m.price), 2) AS total_revenue
FROM `ageless-fire-492718-j9.international_cuisine.order_details` o
JOIN `ageless-fire-492718-j9.international_cuisine.menu_items` m
  ON CAST(o.item_id AS INT64) = m.menu_item_id
WHERE o.item_id IS NOT NULL
  AND o.item_id != 'NULL'
  AND SAFE_CAST(o.item_id AS INT64) IS NOT NULL
GROUP BY m.category
ORDER BY total_revenue DESC

-- Question 4: Average order value by time period

SELECT
  CASE
    WHEN EXTRACT(HOUR FROM PARSE_TIME('%I:%M:%S %p', o.order_time)) BETWEEN 11 AND 15 THEN 'Lunch'
    WHEN EXTRACT(HOUR FROM PARSE_TIME('%I:%M:%S %p', o.order_time)) BETWEEN 16 AND 22 THEN 'Dinner'
    ELSE 'Other'
  END AS time_period,
  EXTRACT(MONTH FROM o.order_date) AS month,
  COUNT(*) AS total_orders,
  ROUND(AVG(m.price), 2) AS avg_order_value
FROM `ageless-fire-492718-j9.international_cuisine.order_details` o
JOIN `ageless-fire-492718-j9.international_cuisine.menu_items` m
  ON SAFE_CAST(o.item_id AS INT64) = m.menu_item_id
WHERE o.item_id IS NOT NULL
  AND o.item_id != 'NULL'
  AND SAFE_CAST(o.item_id AS INT64) IS NOT NULL
GROUP BY time_period, month
ORDER BY month, time_period

-- Question 5: Underperforming menu items

SELECT
  m.item_name,
  m.category,
  COUNT(*) AS total_orders,
  ROUND(SUM(m.price), 2) AS total_revenue
FROM `ageless-fire-492718-j9.international_cuisine.order_details` o
JOIN `ageless-fire-492718-j9.international_cuisine.menu_items` m
  ON SAFE_CAST(o.item_id AS INT64) = m.menu_item_id
WHERE o.item_id IS NOT NULL
  AND o.item_id != 'NULL'
  AND SAFE_CAST(o.item_id AS INT64) IS NOT NULL
GROUP BY m.item_name, m.category
ORDER BY total_orders ASC
LIMIT 10

