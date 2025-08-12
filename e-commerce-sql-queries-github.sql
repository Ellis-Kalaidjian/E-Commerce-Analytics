-- Temporal Sales Trends
WITH sales_and_orders_per_year AS (
SELECT
	SUBSTRING(created_at,6,2) AS order_month, 
	SUBSTRING(created_at,1,4) AS order_year,	
	COUNT(id) AS total_orders,
	SUM(total_price) AS total_sales
FROM orders_23_pres
WHERE cancel_reason = 'NA' AND current_total_price > 0
GROUP BY 2,1
)

SELECT order_month,
  CASE order_month
    WHEN '01' THEN 'January'
    WHEN '02' THEN 'February'
    WHEN '03' THEN 'March'
    WHEN '04' THEN 'April'
    WHEN '05' THEN 'May'
    WHEN '06' THEN 'June'
    WHEN '07' THEN 'July'
    WHEN '08' THEN 'August'
    WHEN '09' THEN 'September'
    WHEN '10' THEN 'October'
    WHEN '11' THEN 'November'
    WHEN '12' THEN 'December'
  END AS order_month_str,
  order_year,
  total_orders,
  total_sales,
  total_sales / total_orders AS aov
FROM sales_and_orders_per_year
ORDER BY 3 DESC,1 DESC;

--Geographic Analysis
--First, examine unique values of shipping_address.country_code 

SELECT DISTINCT "shipping_address.country_code"
FROM orders_23_pres ; --values are 'NA', Canada, and United States 

--Sales trends within the US
SELECT 
"shipping_address.province_code" AS state,
COUNT(id) AS total_orders,
ROUND(SUM(CAST(total_price AS REAL))) AS total_sales,
ROUND(SUM(CAST(total_price AS REAL)) / COUNT(id),2) AS aov
FROM orders_23_pres
WHERE "shipping_address.country_code" = 'US'
GROUP BY 1
ORDER BY 2 DESC, 3 DESC ;

--Sales trends within the US, by year
SELECT 
"shipping_address.province_code" AS state,
COUNT(id) AS total_orders,
ROUND(SUM(CAST(total_price AS REAL))) AS total_sales,
ROUND(SUM(CAST(total_price AS REAL)) / COUNT(id),2) AS aov,
created_at_year AS year
FROM orders_23_pres
WHERE "shipping_address.country_code" = 'US'
GROUP BY 1,5
ORDER BY 5 DESC, 2 DESC ;

--Sales Attribution Analysis: Analyze Sales by Web Traffic Source
--First, look at unique web traffic sources via referring_site and landing_site 
SELECT DISTINCT referring_site 
FROM orders_23_pres ;

SELECT DISTINCT landing_site 
FROM orders_23_pres ; 

--It seems most prevalent referring sites are facebook, instagram, badfish's website URL, google, and then partner domains.
--We can further distinguish whether advertisements on these different platforms factored in using the keyword "utm"

--Group KPIs by web traffic sources using using keywords in referring_site and landing_site 
SELECT
  CASE
    WHEN referring_site LIKE '%facebook%' AND landing_site LIKE '%utm%=%' THEN 'Facebook Ad'
    WHEN referring_site LIKE '%facebook%' AND landing_site NOT LIKE '%utm%=%' THEN 'Facebook Traffic'
    WHEN referring_site LIKE '%google%' AND landing_site LIKE '%utm%=%' THEN 'Google Ad'
    WHEN ((referring_site LIKE '%google%' OR 
       referring_site LIKE '%duckduckgo.com%' OR 
       referring_site LIKE '%bing.com%' OR 
       referring_site LIKE '%yahoo%')
      AND landing_site NOT LIKE '%utm%=%') THEN 'Search Engine Traffic'
    WHEN referring_site LIKE '%instagram%' AND landing_site LIKE '%utm%=%' THEN 'Instagram Ad'
    WHEN referring_site LIKE '%instagram%' AND landing_site NOT LIKE '%utm%=%' THEN 'Instagram Traffic'
    WHEN referring_site LIKE 'https://brand-domain/%' THEN 'Website Navigation' --Anonymized
    WHEN (landing_site LIKE '%utm_source=Klaviyo%' OR
    	landing_site LIKE '%utm_source=swym%'OR
    	landing_site LIKE '%utm_source=Notify Me_SMS%' OR
    	landing_site LIKE '%utm_medium=email%') THEN 'Email or SMS Marketing'
    WHEN referring_site IS NOT NULL
  		AND TRIM(referring_site) != ''
  		AND referring_site != 'NA'
  		AND (
    	referring_site NOT LIKE '%google%' AND
    	referring_site NOT LIKE '%brand-domain%' AND --Anonymized
    	referring_site NOT LIKE '%instagram%' AND
    	referring_site NOT LIKE '%facebook%' AND
    	referring_site NOT LIKE '%shopify%' AND
    	referring_site NOT LIKE '%duckduckgo.com%' AND
    	referring_site NOT LIKE '%bing.com%' AND
    	referring_site NOT LIKE '%yahoo%'
  		)
  		AND landing_site NOT LIKE '%utm%=%' THEN 'Partner Domains'
    ELSE 'Direct Search'
  END AS traffic_source,
  COUNT(id) AS total_orders,
  SUM(CAST(total_price AS REAL)) AS total_sales
FROM orders_23_pres
GROUP BY traffic_source
ORDER BY total_sales DESC ;

