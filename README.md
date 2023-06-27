![image](https://github.com/becisgit/dbtdemo/assets/97150243/21aef1e3-a8d1-4ca6-99ad-3463e572d426)This technical assignment datasets are relatively straightforward. To ensure cleanliness and efficiency throughout the data transformation, I have made the decision to use the following approach:
- DBT(data build tool) is the major tool to do data modeling.
- AWS Redshift Serverless serves as a data warehouse.
- Power BI is used for creating dashboards.

Below is the transfomation process of data model (snapsoht from DBT)
![alt text](https://github.com/becisgit/dbtdemo/blob/main/lineage.JPG)
and report

## PowerBI Embedded report

You can access the embedded website by clicking [here](https://app.powerbi.com/view?r=eyJrIjoiZGJkZTdmYzItNzNhOC00YWM2LWJiMmEtMzg2NTM2OTdhZDRkIiwidCI6ImRmNmUzMDVhLTJkZjItNGYxMy1hYjg1LWU4NTI4ZjViNDk3MSIsImMiOjEwfQ%3D%3D).

### a.	Analyse the provided sample data and identify potential data quality issues or missing information. These data come from external platform, and there is no documentation about it. 
The dataset seems clean and no `null` value. However, it should be noted that certain order details from shopee may be missing due to the presence of `shopee_status` records associated with specific order_id values that do not exist in the `shopee` dataset. This discrepancy could be attributed to incomplete or delayed data availability. (please refer to models/missing_order_details.sql)
There's some different status, to calculate reveune, I filtered only completed orders. (no cancelled no in progress)

### b.	Based on the data analysis, design an appropriate data model to support the following business requirements:
- ##### Calculate total revenue and average order value.
| brand                             | revenue_total | average_revenue | completed_qty | average_qty |
|-----------------------------------|---------------|-----------------|---------------|--------------|
| Pawsitively Pawesome Pet Supplies | 2836.589517   | 70.91473793     | 104           | 2.6          |
| Snickerdoodle Snacks 'n' Wagtails | 2495.677894   | 118.8418045     | 76            | 3.619047619  |
| Glam-O-Rama                       | 2436.331385   | 97.45325541     | 56            | 2.24         |
| Munchie Mania                     | 195.9800072   | 65.32666906     | 6             | 2            |
| Crave-a-Licious                   | 185.5024998   | 46.37562494     | 8             | 2            |
| BeautyBliss                       | 160.5537963   | 80.27689816     | 6             | 3            |


- ##### Identify the top-selling products and categories.
  the top-selling product is Beauty Sleep Miracle Mask and catorgory is Pet Food.
  
| product                         | revenue      |
|---------------------------------|--------------|
| Beauty Sleep Miracle Mask       | 2436.331385  |
| Purrfectly Fishy Feast          | 1157.164995  |
| Whisker Lickin' Chicken Delight | 1037.94221   |
| Meow Mix Meister Meal           | 1000.692704  |
| Tempting Tuna Treats            | 951.2704937  |
| Chewy Cheesy Delights           | 696.4445013  |
| Squeaky Clean Dental Chews      | 292.9602029  |
| Carrot Sticks                   | 195.9800072  |
| Steaks chews                    | 185.5024998  |
| Unicorn Magic Elixir            | 160.5537963  |
| Whacky Wildberry Wafers         | 101.5101017  |
| Crunchy Carrot Cravings         | 94.28220257  |

top-selling catorgory is Pet Food.
| **product category** | **revenue** |
|----------------------|--------------|
| Pet Food             | 5332.26741096495  |
| Beauty               | 2596.88518167495 |
| Groceries            | 381.482506942748  |

- ##### Determine the customer retention rate.
| **brand**                         | **retention_rate** |
|-----------------------------------|--------------------|
| Glam-O-Rama                       | 0.714285714        |
| BeautyBliss                       | 1                  |
| Munchie Mania                     | 0.333333333        |
| Crave-a-Licious                   | 0                  |
| Pawsitively Pawesome Pet Supplies | 1                  |
| Snickerdoodle Snacks 'n' Wagtails | 0.714285714        |

- ##### Calculate the average completion time of an order.
| **brand**                         | **average_complete_time** |
|-----------------------------------|---------------------------|
| Munchie Mania                     | 1 day, 16:51:23.333333    |
| BeautyBliss                       | 5 days, 7:12:38           |
| Glam-O-Rama                       | 2 days, 19:54:49.560000   |
| Crave-a-Licious                   | 1 day, 7:55:48.250000     |
| Pawsitively Pawesome Pet Supplies | 2 days, 18:58:46.125000   |
| Snickerdoodle Snacks 'n' Wagtails | 2 days, 14:12:38.190476   |

### c. Provide a brief explanation of your data modelling decisions and transformation approach.
In the project, there are four files: `lazada`, `products`, `shopee`, and `shopee_status`.
From analyzing the data, it is clear that the "Product" file is a `Dimension Table`. Additionally, there are two files related to Shopee and one file for Lazada.
After a thorough examination of the data, it is evident that the "lazada" file can be transformed into two tables: "lazada" and "lazada_status," similar to the approach followed for Shopee.
And there's `paid price` in lazada, `original price` in shopee, we need to convert paid price to original price then we can append two files together.

### d. Create an SQL script to create the necessary tables and relationships based on your data model.
All SQL query stored in the `Model` folder 

### e.	Propose a data transformation processes to cleanse and enrich the data according to the defined data model
- The purpose here is to transform datasets into a star schema to get a high efficiency data model for analysis.
- To enrich our dataset, we can collect more information from our `Dimension Table` such as product, customers, and brands. This expanded dataset allows for more comprehensive mapping and enables informed decision-making processes.
- To speed up this data pipeline, we need to understand what's the data source format, if it's a JSON with clear schema, then we can land it into dataset directly.

