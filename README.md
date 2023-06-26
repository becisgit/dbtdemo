DBT is the major tool to do data model, and AWS redshift serverless as a data warehouse.


### Answers
- ##### Calculate total revenue and average order value.
| **brand**                         | **revenue_total** | **average_revenue** | **completed_qty** | **average_qty** | **average_complete_time ** |
|-----------------------------------|-------------------|---------------------|-------------------|-----------------|----------------------------|
| Munchie Mania                     | 195.9800072       | 65.32666906         | 6                 | 2               | 1 day, 16:51:23.333333     |
| BeautyBliss                       | 164.4199963       | 82.20999813         | 6                 | 3               | 5 days, 7:12:38            |
| Glam-O-Rama                       | 2469.929985       | 98.7971994          | 56                | 2.24            | 2 days, 19:54:49.560000    |
| Crave-a-Licious                   | 189.7399998       | 47.43499994         | 8                 | 2               | 1 day, 7:55:48.250000      |
| Pawsitively Pawesome Pet Supplies | 2946.270018       | 73.65675044         | 104               | 2.6             | 2 days, 18:58:46.125000    |
| Snickerdoodle Snacks 'n' Wagtails | 2561.789993       | 121.9899997         | 76                | 3.619047619     | 2 days, 14:12:38.190476    |


- ##### Identify the top-selling products and categories.
  the top-selling product is Beauty Sleep Miracle Mask and catorgory is Pet Food.
| **product**                     | **revenue ** |
|---------------------------------|--------------|
| Beauty Sleep Miracle Mask       | 2469.929985  |
| Purrfectly Fishy Feast          | 1209.899994  |
| Whisker Lickin' Chicken Delight | 1094.94001   |
| Meow Mix Meister Meal           | 1003.360004  |
| Tempting Tuna Treats            | 955.9699936  |
| Chewy Cheesy Delights           | 743.9800014  |

| **product category** | **revenue ** |
|----------------------|--------------|
| Pet Food             | 5508.060011  |
| Beauty               | 2634.349981  |
| Groceries            | 385.7200069  |

- ##### Determine the customer retention rate. 
- ##### Calculate the average completion time of an order.



### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getbdt.com/) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
