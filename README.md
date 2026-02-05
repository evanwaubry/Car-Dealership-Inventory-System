# Car-Dealership-Inventory-System

📌 Project Overview
This project is a relational database designed to manage the core operations of a car dealership. It handles inventory tracking, customer relationships, sales transactions, and service scheduling. The primary goal was to create a normalized database structure that ensures data integrity while providing actionable business insights through SQL queries.

🛠️ Key Technical Features
Universal Setup: The script is designed to be portable; it creates the necessary database and tables automatically upon execution.

Relational Schema: Designed a 6-table database including Customers, Cars, Sales, Salespersons, Managers, and Service Appointments.

Data Integrity: Implemented Primary Keys, Foreign Keys, and Unique constraints (e.g., VIN and Email) to ensure data consistency.

Automation: Features a Stored Procedure to handle sales transactions and a Trigger to enforce business pricing rules.

Business Intelligence: Includes custom Views and complex JOINs to simplify management reporting.

📊 Business Questions Answered
The script contains logic to answer critical business questions, such as:

Inventory: Current available car count.

Revenue: Total revenue generated across all sales.

Performance: Top-performing salespersons based on volume and highest individual sale price.

Staffing: Manager-to-employee reporting structure.

Service: Identifying recurring customers in the service department.

🚀 How to Run the Project
This project is contained entirely within a single SQL script for easy deployment and review.

Open the main_script.sql file in MySQL Workbench or any SQL editor.

Run the entire script. It will automatically:

Create the CarDealershipDB database.

Build the relational table structure.

Populate the tables with sample data.

Execute the analytical queries and display the results.

📁 Repository Structure
main_script.sql: The primary SQL file containing the schema, data, and analytical logic.

README.md: Project documentation and instructions.

The script will automatically create the CarDealershipDB database, build all tables, insert sample data, and output the results of the analytical queries.

📁 Repository Structure
Car_Dealership_Project.sql: The full SQL script containing the schema, data, and queries.

README.md: Project documentation.
