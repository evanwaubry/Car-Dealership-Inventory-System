# Car-Dealership-Inventory-System

Car Dealership Management System (SQL)
📌 Project Overview
This project is a relational database designed to manage the core operations of a car dealership. It handles inventory tracking, customer relationships, sales transactions, and service scheduling. The primary goal was to create a normalized database structure that ensures data integrity while providing actionable business insights through SQL queries.

🛠️ Key Technical Features
Relational Schema: Designed a 6-table database including Customers, Cars, Sales, Salespersons, Managers, and Service Appointments.

Data Integrity: Implemented Primary Keys, Foreign Keys, and Unique constraints (e.g., VIN and Email) to prevent data duplication and errors.

Complex Querying: Developed advanced queries using JOINs, Subqueries, and Aggregate Functions to extract business intelligence.

Automation (Bonus): Features a Stored Procedure to automate the sales process and a Trigger to enforce business pricing rules.

📊 Business Questions Answered
The included script contains queries that answer critical business questions, such as:

Inventory Status: "How many cars are currently available for sale?"

Revenue Tracking: "What is the total revenue generated from all car sales?"

Performance Metrics: "Which salesperson has sold the most cars?"

Management Structure: "Who are the managers and how many salespeople report to each?"

Customer Loyalty: "Which cars have been brought in for service more than once?"

🚀 How to Run the Project
Ensure you have MySQL Workbench or any SQL client installed.

Download the Car_Dealership_Project.sql file.

Open the file in your SQL client and run the entire script.

The script will automatically create the CarDealershipDB database, build all tables, insert sample data, and output the results of the analytical queries.

📁 Repository Structure
Car_Dealership_Project.sql: The full SQL script containing the schema, data, and queries.

README.md: Project documentation.
