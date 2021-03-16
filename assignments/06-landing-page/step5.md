---
layout: default
title: Step 5 Database
parent: '06 Landing Page.'
---

# Step 5 Database (3hrs, ⚠️)

{: .no_toc }

## Table of contents

{: .no_toc .text-delta }

1. TOC
{:toc}

---

To store data, we already used files several times in the previous assignments. However, for structured data, this is not ideal to store and retrieve this information effectively. In this step, we use a SQLite, a database that relies on a file. That means we interact with the database through structured queries instead of dealing with the details of reading from and writing into the file.

# Task 5.1 Define a DatabaseStore

Let's add a class to our class diagram. The `DatabaseStore` plays the same role as the `Store`, providing the methods `addCustomer()` and `totalListPreOrder()`. It has a method `createDatabase()` to initialise the database. Finally, there is an extra method `addPreOrder()` to store the pre-orders in a separate table as we will see in the next task with the Entity-Relationaship diagram.

![Assignment 6 - Step 5.1 Class Diagram]({{site.baseurl}}/assets/images/assignment6-step5-1-class-diagram.svg)

Create a file `model/database_store.py` and define a class `DatabaseStore`.

#### Class DatabaseStore - DocString

```python
    """
    Manage incoming customers and pre-orders in permanent storage, based on an SQLite database.

    Attributes
        database_path: Path to the file storing the database
    """
```

#### Constructor DatabaseStore - DocString

```python
        """
        Construct a DatabaseStore object.

        Keep the database's path as attribute and try to create the database.

        Parameters:
            database_path: Path to the file storing the database
        """
```

Note that the 'try to create the database' takes place with the method `createDatabase()` in the next task.

In `__init__.py`, import the class `DatabaseStore` from `database_store`. Then, add 'DatabaseStore' in the `__all__` list.

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step5-1)

# Database Interaction

Before going further, it is time to map the process that takes place for each interaction with the database.

To interact with a database, we need four elements:

- `path`: the path to the database
- `connection`: the connection to the database
- `query`: the SQL which specify the interaction with the database
- `values`: the values to include in the query
- `result`: the data coming from the database as a result of the query

#### Database Interaction Algorithm

```markdown
Connect to the database in [path] and keep the [connection];
Define the SQL [query];
Prepare the [values];
Execute the [query] with the [values] and keep the [result];
Finaly, commit (save) the changes and close the [connection]
```

#### Database Interaction - Python Syntax

```python
# Connect to the database in path and keep the 'connection'
connection = sqlite3.connect(path)
# Define the SQL query
query = "AN SQL QUERY"
# Put the values into a list
values = [value1, value2, value3]
# Execute the SQL query with the values and keep the 'result'
result = connection.execute(query, values)
# Commit (save) the changes
connection.commit()
# Close the connection
connection.close()
```

This code requires to import the module `sqlite3` at the top of the file.

# Task 5.2 Create Database Tables

For a _structured interaction_, we first need to make a structure. With the database interaction algorithm in mind, we can start interacting with the database to create the structure of the database. To support our landing page programme, we need a table `CUSTOMERS` and a table `PRE_ORDERS`, both fitting the attributes of their respective classes `Customer` and `PreOrder`

#### Customers and PreOrders Table - Entity-Relationship Diagram

![Assignment 6 - Step 5.2 ER Diagram]({{site.baseurl}}/assets/images/assignment6-step5-2-entity-relationship.svg)

#### CREATE a Customers Table - SQL Query

```sql
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    email TEXT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT)
```

#### CREATE a PreOders Table - SQL Query

```sql
CREATE TABLE IF NOT EXISTS PRE_ORDERS (
    id              TEXT      PRIMARY KEY,
    order_time      INTEGER,
    customer_email  TEXT,
    number_products INTEGER,
    size            TEXT,
    colour          TEXT)
```

Define a method `createDatabase()` that creates a database with tables 'CUSTOMERS' and 'PRE_ORDERS' if they do not exist yet.

```markdown
Connect to the database in self.database_path and keep the 'connection'
Define the SQL query to CREATE a 'CUSTOMERS' table
Execute the SQL query
Define the SQL query to CREATE a 'PRE_ORDERS' table
Execute the SQL query
Commit (save) the changes
Close the connection
```

For the SQL queries, use the ones defined above. We recommend using triple quotes `"""` so that it can spread over several lines.

We add a call to this method in the DatabaseStore constructor so that the database structure gets created if it does not exists yet.

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step5-2)

# Task 5.3 Insert Customers and PreOrders

Once we have a database structure, we can insert data. Let's start with the method `addPreOrder()` which add pre-order to the database, attached to a customer email.

#### INSERT a PreOder - SQL Query

```sql
INSERT INTO PRE_ORDERS (id, order_time, customer_email, number_products, size, colour)
VALUES (?,?,?,?,?,?)
```

Note the six question marks `?` which indicate where the six values of a pre-orders should be placed. Python does that automatically while provided with a list of six values. This is the recommended way for security reasons.

#### addPreOrder - DocString

```python
        """
        Add a pre-order to the database, attached to a customer email.

        Parameters:
            customer_email:  Customer's email that relate to the pre-order
            pre_order:       PreOrder to save in the database
        """
```

#### addPreOrder - Algorithm

```markdown
Connect to the database in self.database_path and keep the 'connection'
Define the SQL query to INSERT a PreOder
Put the values to insert into a list
Execute the query with the values
Commit (save) the changes
Close the connection
```

#### INSERT a Customer - SQL Query

```sql
INSERT OR IGNORE INTO customers (email, first_name, last_name)
VALUES (?,?,?)
```

#### addCustomer - DocString

```python
        """
        Add customer to the database if the email address does not exist yet, then add the pre-orders.

        Parameters:
            customer:  Customer to save in the database
        """
```

#### addCustomer - Algorithm

```markdown
Connect to the database in self.database_path and keep the 'connection'
Define the SQL query to INSERT a Customer
Put the values to insert into a list
Execute the query with the values
Commit (save) the changes
Close the connection
For each pre_order in customer.preOrderList
    Call the method addPreOrder with the customer email and the pre_order
```

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step5-3)

# Task 5.4 Select PreOrders

#### SELECT all rows in PRE_ORDERS table - SQL Query

```sql
SELECT id, order_time, number_products, size, colour
FROM pre_orders
```

#### totalListPreOrders - Algorithm

Define a method totalListPreOrders() which returns the list of all PreOrders.

```markdown
Connect to the database in path and keep the 'connection'
Define the SQL query to SELECT all rows in PRE_ORDERS table
Create an empty pre_order_list
Execute the query and keep the 'result'
For each row in result
    Construct a PreOrder object with the values from the row
    Add pre_order to the pre_order_list
Close the connection
Return the pre_order_list
```

To construct PreOrder objects, we need to import the class from the `model` at the top of the file.

Note that with a select, we do not change the database. Thus there is no need to 'commit'.

To use the class DatabaseStore in `main.py`, import it and replace `Store()` by `DatabaseStore('preorders.db')`. 'preorders.db' will be the name of the file storing the database, any name would work. The landing page should behave as before. However, when we restart the programme, the customers and pre-orders are still available, taken from the database.

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step5-4)

[Next: Step 5 - Database]({{site.baseurl}}/assignments/06-landing-page/step5){: .btn .btn-purple }
