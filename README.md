# E-Commerce Analytics
## Project Background
This repository showcases a portion of data analytics work I completed for a small fishing tackle and apparel brand during a freelance engagement. The brand, with 112K followers across its social media platforms, has maintained average annual sales of roughly $350K since 2020, driven primarily by e-commerce and supplemented by occasional in-person “pop-up” events across the United States. The project, conducted in July 2025, encompassed three main deliverables: building an API pipeline to integrate customer and order data, performing sales trends analyses, and conducting an attribution analysis of the brand’s e-commerce channels. Note that sensitive details, including customer information and any identifiers of the company, have been removed where necessary.

## Data Compilation: Building API Pipeline, Data Cleaning, and Feature Engineering
The first task of this work was to connect to the client’s Shopify store to automatically download and organize order data. Using R, secure access to the store’s API was set up, then customer records, their associated activity history, and all store orders were retrieved. The R script was designed to handle large datasets by pulling data in batches and continuing until all available records are collected. After gathering the data, a simplified version of the order dataset was exported as a CSV file for further analysis and reporting.

<img width="3121" height="1278" alt="Picture1" src="https://github.com/user-attachments/assets/b2284c6d-000b-44cf-8b61-2eb78228160f" />

The resulting data frame contained 32,005 orders grouped over 197 variables of categorical, numeric, and binary classes, accounting for order records spanning back to 2019. It was requested that all analyses focus on years 2023 to present, so the data was first filtered to only include transactions during the desired time frame. Additional cleaning—which included the removal of orders with sales prices equal to $0, cancelled orders, test orders, and orders with no customer ID—resulted in an 85% reduction to 3,880 transactions.

The R Script used to develop the aforementioned ETL processes can be found [here](https://github.com/Ellis-Kalaidjian/E-Commerce-Analytics/blob/main/order_data_ETL.R).

The SQL queries used for the following analyses can be found [here](https://github.com/Ellis-Kalaidjian/E-Commerce-Analytics/blob/main/e-commerce-sql-queries-github.sql).

## Executive Summary

### Key Insights: Temporal Trends
1.	AOV fell from an above-average peak of ~$85 down to $45 from February 2023 to June 2023, but has since restabilized around $60.

2.	Sales and order counts show steady growth, with a heightened uptick in activity as of February 2025.

<img width="700" height="400" alt="image" src="https://github.com/user-attachments/assets/3dd7676c-9c46-47be-b614-c95f1bd17862" />

**Figure 1. Monthly average order value (2023–present)**

<img width="700" height="400" alt="image" src="https://github.com/user-attachments/assets/47a58404-f3e2-4df6-b7b7-65775b54115c" />

**Figure 2. Monthly order counts (2023–present)**

<img width="700" height="400" alt="image" src="https://github.com/user-attachments/assets/138a6725-e8cc-4ea1-849d-dfa1734edd41" />

**Figure 3. Monthly sales (2023–present)**

### Recommendations

1.	**Capitalize on the Recent Surge (Feb 2025–Present)**: Scale up inventory, marketing campaigns, and fulfillment capacity in anticipation of sustained or increasing order volume. The February 2025 spike in orders and sales suggests growing brand momentum—missing out on stock or shipping delays could harm customer trust.

2.	**Optimize Product Mix to Stabilize AOV**: Encourage bundling or upselling of mid-to-high price-point items through targeted promotions. AOV has recovered from its mid-2023 dip ($85 to ~$45). Enhancing perceived value without discounting can boost margin per order.

3.	**Monitor Price Elasticity**: Run A/B pricing tests on select SKUs to understand customer sensitivity and identify high-margin opportunities. The early 2023 AOV peak suggests customers were once comfortable spending more—there may still be room to recapture this value.
 
### Key Insights: Geographic Trends
1.	Florida has been the highest performing state across all KPIs.

2.	East coast states, particularly those in the mid-Atlantic and Southeast regions, have dominated in sales performance, with the exception of California and Texas (the second and third highest performing states, respectively). 

3.	AOV has been relatively uniform across top performers, ranging from ~$55–$60.

4.	Most active customer locations have been responsible for ~$7,000–$10,000 in sales and 110–200 product orders since 2023 (excluding FL, CA, and TX).

**Table 1. Top 10 States for Sales Performance (2023–present)**
<img width="619" height="310" alt="Screen Shot 2025-08-12 at 10 55 47 AM" src="https://github.com/user-attachments/assets/8ccf6466-0305-439a-9a07-28eb079a72bc" />

### Recommendations
1.	**Double Down on Florida, California, and Texas**: Launch geo-targeted ad campaigns, loyalty perks, or expedited shipping offers in these top 3 states. These states contribute a disproportionate share of sales volume and revenue, and have AOVs near or above average.

2.	**Expand Mid-Atlantic and Southeast Penetration**: Leverage lookalike audiences in adjacent states like Maryland, Pennsylvania, and Tennessee to replicate success seen in NC, SC, GA, and VA. Regional cultural similarities may yield similar buyer behavior with lower customer acquisition costs.

3.	**Explore Untapped Markets with Similar Demographics**: Analyze states with similar angling or outdoor recreation profiles (e.g., Michigan, Minnesota, Louisiana) for expansion potential. The strong performance of coastal and southern states suggests recreational behavior is a sales driver.

### Key Insights: E-Commerce Attribution Analysis

<img width="519" height="450" alt="Screen Shot 2025-08-12 at 11 18 25 AM" src="https://github.com/user-attachments/assets/93d79bcf-f9aa-4855-9b89-9e0c1ecd285f" />

**Figure 4. Sales Volume Breakdown by Traffic Sources**

1. **Direct Search is the Dominant Channel**: The largest sales channel comes from users who already know the brand and are typing it directly into the search bar. This suggests strong brand recognition and loyalty, but also a reliance on existing customers rather than new audience growth.

2. **Search Engine Traffic is a Key Acquisition Driver**: Organic search presence is robust, showing that SEO efforts are paying off. This also means content marketing and keyword targeting are likely performing well.

3. **Social Platforms are Secondary Drivers**: Facebook Traffic is stronger than Instagram Traffic, but both are smaller compared to direct and search sources. Paid ads (Facebook Ads, Instagram Ads, Google Ads) occupy relatively small segments, suggesting limited reach or lower spend.

4. **Owned Channels (Website Navigation & Email/SMS)**: Website navigation is a healthy source of internal traffic, showing users are exploring and buying after landing. Email/SMS Marketing drives some traffic, but its share is relatively small compared to potential.

5. **Partnerships Have Untapped Potential**: Partner domains contribute modestly but represent a growth opportunity if expanded.

### Recommendations
1. **Leverage Direct Search Strength for Loyalty Monetization**: Create loyalty programs, VIP clubs, or exclusive drops for repeat customers. Since direct traffic shows strong brand recall, upselling and cross-selling campaigns could increase AOV.

2. **Double Down on SEO & Content Marketing**: Expand high-performing keyword content and optimize for long-tail queries to capture even more organic search traffic. Produce seasonal or product-focused blog posts to pull in search-driven customers before peak buying periods.

3. **Scale Paid Acquisition Strategically**: Increase budget and targeting for Facebook and Instagram Ads to grow beyond the existing audience. Test more creative formats—video ads, reels, and carousel ads—to improve engagement. Also consider retargeting campaigns aimed at users who visited but did not convert.

4. **Boost Email/SMS Engagement**: Grow the subscriber list through incentives like discounts, early access, or content freebies. Implement segmented drip campaigns to re-engage past customers and drive repeat purchases.

5. **Strengthen Partnerships**: Explore collaborations with complementary brands, influencers, or niche communities in fishing/outdoor sports. Partner placements could be amplified to drive more referral traffic.

6. **Cross-Channel Synergy**: Use social ads to push for newsletter sign-ups, which can then be nurtured via email/SMS marketing. Promote search-optimized blog posts through Facebook/Instagram to blend SEO with paid growth.




