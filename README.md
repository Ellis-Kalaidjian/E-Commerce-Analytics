# E-Commerce Analytics
## Project Background
This repository contains a segment of data analytics work I executed for a small fishing tackle and apparel brand as part of my freelancing data analyst work. The brand is followed by 112K on its social media outlets and has seen average annual sales of approximately $350K since 2020, largely through e-commerce and, to a lesser extent, periodic, in-person “pop-up” events around the United States. The scope of work took place over July 2025 and included two core deliverables: the construction of an API pipeline for the brand’s customer and orders data and sales trends analyses. Note that sensitive information, such as customer data, and any information revealing the identity of the company has been removed where necessary.

## Data Compilation: Building API Pipeline, Data Cleaning, and Feature Engineering
The first task of this work was to connect to the client’s Shopify store to automatically download and organize order data. Using R, secure access to the store’s API was set up, then customer records, their associated activity history, and all store orders were retrieved. The R script was designed to handle large datasets by pulling data in batches and continuing until all available records are collected. After gathering the data, a simplified version of the order dataset was exported as a CSV file for further analysis and reporting.

<img width="3121" height="1278" alt="Picture1" src="https://github.com/user-attachments/assets/b2284c6d-000b-44cf-8b61-2eb78228160f" />

The resulting data frame contained 32,005 orders grouped over 197 variables of categorical, numeric, and binary classes, accounting for order records spanning back to 2019. It was requested that all analyses focus on years 2023 to present, so the data was first filtered to only include transactions during the desired time frame. Additional cleaning—which included the removal of orders with sales prices equal to $0, cancelled orders, test orders, and orders with no customer ID—resulted in an 85% reduction to 3,880 transactions.

The R Script used to develop the aforementioned ETL processes can be found here.

## Executive Summary

### Key Insights: Temporal Trends
1.	AOV fell from an above-average peak of ~$85 down to $45 from February 2023 to June 2023, but has since restabilized around $60.

2.	Sales and order counts show steady growth, with a heightened uptick in activity as of February 2025.

<img width="405" height="183" alt="image" src="https://github.com/user-attachments/assets/3dd7676c-9c46-47be-b614-c95f1bd17862" />

Figure 1. Monthly average order value (2023–present)

<img width="405" height="177" alt="image" src="https://github.com/user-attachments/assets/47a58404-f3e2-4df6-b7b7-65775b54115c" />

Figure 2. Monthly order counts (2023–present)

<img width="405" height="183" alt="image" src="https://github.com/user-attachments/assets/138a6725-e8cc-4ea1-849d-dfa1734edd41" />

Figure 3. Monthly sales (2023–present)

### Recommendations

1.	Capitalize on the Recent Surge (Feb 2025–Present)

<ins>Action</ins>: Scale up inventory, marketing campaigns, and fulfillment capacity in anticipation of sustained or increasing order volume.

<ins>Rationale</ins>: The February 2025 spike in orders and sales suggests growing brand momentum—missing out on stock or shipping delays could harm customer trust.

2.	Optimize Product Mix to Stabilize AOV

<ins>Action</ins>: Encourage bundling or upselling of mid-to-high price-point items through targeted promotions.

<ins>Rationale</ins>: AOV has recovered from its mid-2023 dip ($85 to ~$45). Enhancing perceived value without discounting can boost margin per order.

3.	Monitor Price Elasticity

<ins>Action</ins>: Run A/B pricing tests on select SKUs to understand customer sensitivity and identify high-margin opportunities.

<ins>Rationale</ins>: The early 2023 AOV peak suggests customers were once comfortable spending more—there may still be room to recapture this value.
 
### Key Insights: Geographic Trends
1.	Florida has been the highest performing state across all KPIs.

2.	East coast states, particularly those in the mid-Atlantic and Southeast regions, have dominated in sales performance, with the exception of California and Texas (the second and third highest performing states, respectively). 

3.	AOV has been relatively uniform across top performers, ranging from ~$55–$60.

4.	Most active customer locations have been responsible for ~$7,000–$10,000 in sales and 110–200 product orders since 2023 (excluding FL, CA, and TX).

Table 1. Top 10 States for Sales Performance (2023–present)
<img width="619" height="310" alt="Screen Shot 2025-08-12 at 10 55 47 AM" src="https://github.com/user-attachments/assets/8ccf6466-0305-439a-9a07-28eb079a72bc" />

### Recommendations
1.	Double Down on Florida, California, and Texas

<ins>Action</ins>: Launch geo-targeted ad campaigns, loyalty perks, or expedited shipping offers in these top 3 states.

<ins>Rationale</ins>: These states contribute a disproportionate share of sales volume and revenue, and have AOVs near or above average.

2.	Expand Mid-Atlantic and Southeast Penetration

<ins>Action</ins>: Leverage lookalike audiences in adjacent states like Maryland, Pennsylvania, and Tennessee to replicate success seen in NC, SC, GA, and VA.

<ins>Rationale</ins>: Regional cultural similarities may yield similar buyer behavior with lower customer acquisition costs.

3.	Explore Untapped Markets with Similar Demographics
<ins>Action</ins>: Analyze states with similar angling or outdoor recreation profiles (e.g., Michigan, Minnesota, Louisiana) for expansion potential.

<ins>Rationale</ins>: The strong performance of coastal and southern states suggests recreational behavior is a sales driver.




