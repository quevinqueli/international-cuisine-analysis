# International Cuisine Restaurant — Menu & Order Analysis

## Project Overview
SQL analysis of menu performance and customer order behaviour for an international cuisine restaurant dataset. The goal is to identify revenue drivers, peak trading periods, and underperforming items to support data-driven decision making.

**Tools used:** Google BigQuery, Power BI, GitHub

---

## Business Questions

1. Which menu categories generate the most revenue, and how does that split across the week?
2. What are the peak ordering hours and days, and how does order volume fluctuate throughout the week?
3. Which individual menu items sell the most by volume, and which generate the most revenue?
4. What is the average order value per time period (lunch vs dinner), and how does it trend across the year?
5. Which menu items are underperforming? (low volume and low revenue)

---

## Key Findings

- **Italian** is the highest revenue category (€49,462) despite fewer orders than Asian — driven by higher price points
- **Korean Beef Bowl** is the top individual item by revenue (€10,554)
- **Sunday at 1pm** is the single busiest slot across the entire dataset
- **Lunch and dinner average order values are nearly identical** (~€13) — dinner is busier, not more profitable per order
- **Chicken Tacos** is the weakest performer with only 123 orders and €1,469 revenue
- **Mexican category** has the most underperforming items despite being 3rd overall in revenue

---

## Dataset
- Source: Kaggle
- Tables: `menu_items`, `order_details`
- 32 menu items across 4 categories: Italian, Asian, Mexican, American

---

## Dashboard
*Power BI dashboard coming soon*
