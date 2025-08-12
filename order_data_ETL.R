library(lubridate)
library(dplyr)
library(tidyr)
library(httr)
library(jsonlite)

setwd("working/directory/path")

# Retrieving Order Data from Shopify Admin API ----------------------------
token <- "[proprietary-access-token]"
URL <- "[domain-name].myshopify.com"

# Base URL for Shopify Admin API
base_url <- paste0("https://", URL, "/admin/api/2024-01")

# Make a GET request to fetch orders
response <- GET(
  url = paste0(base_url, "/orders.json?limit=250"),
  add_headers("X-Shopify-Access-Token" = token)
)

# Parse response
orders_res <- content(response, "text") %>%
  fromJSON(flatten = TRUE)

#Handle pagination
get_all_orders <- function() {
  all_orders <- list()
  next_url <- paste0(base_url, "/orders.json?limit=250&status=any")
  
  repeat {
    res <- GET(next_url, add_headers("X-Shopify-Access-Token" = token))
    dat <- fromJSON(content(res, "text"), flatten = TRUE)
    
    if (length(dat$orders_res) == 0) break
    all_orders <- append(all_orders, list(dat$orders_res))
    
    links <- headers(res)$link
    if (is.null(links) || !grepl("rel=\"next\"", links)) break
    
    # Extract next page URL
    next_url <- sub(".*<", "", sub(">; rel=\"next\".*", "", links))
  }
  
  return(bind_rows(all_orders))
}

orders <- get_all_orders()

# Data Cleaning and Exploratory Data Analysis -----------------------------------------------
# Convert to proper datetime and cast price variable as numeric
orders <- orders %>%
  mutate(created_at = ymd_hms(created_at),
         closed_at = ymd_hms(closed_at),
         current_total_price = as.numeric(current_total_price),
         created_at_year = substr(created_at,1,4) %>% as.numeric())

#Create data frame for order records spanning back to 2023
orders_23_pres <- orders %>% filter(created_at_year >= 2023)

# Filter out test orders, refunds, zero-value orders, etc.
orders_23_pres <- orders_23_pres %>%
  filter(current_total_price > 0, is.na(cancelled_at), test == "FALSE", customer.id != "NA",
         !is.na(email), billing_address.address1 != "NA", customer.email != "NA")

write.csv(orders_23_pres, "orders_23_pres.csv")