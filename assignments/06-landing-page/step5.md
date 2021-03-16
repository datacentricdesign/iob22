---
layout: default
title: Step 5 Database
parent: '06 Landing Page'
---

# Step 5 Database (3hrs, ⚠️)
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

To store data, we already used files several times in the previous assignments. However, for structured data, this is not ideal for storing and retrieving this information effectively. In this step, we use SQLite, a database that relies on a file. That means we interact with the database through structured queries instead of dealing with the files' reading and writing.

# Task 5.1 Define a DatabaseStore

Let's add a class to our class diagram. The `DatabaseStore` plays the same role as the `Store`, providing the methods `addCustomer()` and `totalListPreOrder()`. It has a method `createDatabase()` to initialise the database. Finally, it has a method `addPreOrder()` to store the pre-orders in a separate table.

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

Before going further, it is time to map the process taking place for each interaction with the database.

To interact with a database, we need four elements:

* `path`: the path to the database
* `connection`: the connection to the database
* `query`: the SQL which specify the interaction with the database
* `values`: the values to include in the query
* `result`: the data coming from the database as a result of the query

With these elements, we compose the following interaction algorithm.

#### Database Interaction Algorithm

```markdown
Connect to the database in [path] and keep the [connection];
Define the SQL [query];
Prepare the [values];
Execute the [query] with the [values] and keep the [result];
Finally, commit (save) the changes and close the [connection]
```

We see that we open a connection to interact with the database. Then, we prepare what we want to ask the database (e.g. getting data out, sending data in). Finally, we ask and receive a response before closing the connection. It Python, it looks as follows:

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

For this code to work, we need to import the module `sqlite3` at the top of the file.

# Task 5.2 Create Database Tables

For a _structured interaction_, we first need to make a structure. With the database interaction algorithm in mind, we can start interacting with the database to create the database structure. To support our landing page programme, we need a table `CUSTOMERS` and a table `PRE_ORDERS`, both fitting the attributes of their respective classes `Customer` and `PreOrder`. The following entity-relationship diagram illustrates the two tables as we want them in the database, along with three examples of rows (e.g. each line of data in the table).

#### Customers and PreOrders Table - Entity-Relationship Diagram

![Assignment 6 - Step 5.2 ER Diagram]({{site.baseurl}}/assets/images/assignment6-step5-2-entity-relationship.svg)

We interact with the database via SQL queries for Structured Query Language. Thus, to create the two tables in the database, we need two queries. `CREATE` is the keyword for creating a new structure in the database. In this case, we create a `table` for the customers. We set the 'email' as the `primary key`, the unique identifier of each row in the table.

#### CREATE a Customers Table - SQL Query

```sql
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    email TEXT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT)
```

The creation of the pre-orders' table is similar with 'id' as the primary key.

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

At this stage, we saw the Python syntax to interact with the database, and we defined the SQL queries for creating the two tables CUSTOMERS and PREORDERS.

Define a method `createDatabase()` that creates a database with tables 'CUSTOMERS' and 'PRE_ORDERS' using the Python syntax and SQL queries above. We recommend using triple quotes `"""` so that it can spread over several lines.

```markdown
Connect to the database in self.database_path and keep the 'connection'
Define the SQL query to CREATE a 'CUSTOMERS' table
Execute the SQL query
Define the SQL query to CREATE a 'PRE_ORDERS' table
Execute the SQL query
Commit (save) the changes
Close the connection
```

Add a call to this method in the DatabaseStore constructor. With this call, the database structure gets created if it does not exist yet.

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step5-2)

# Task 5.3 Insert PreOrders

Once we have a database structure, we can insert data. Let's start with the method `addPreOrder()`, which adds a PreOrder to the database, attached to a customer email.

#### addPreOrder - DocString

```python
        """
        Add a pre-order to the database, attached to a customer email.

        Parameters:
            customer_email:  Customer's email that relate to the pre-order
            pre_order:       PreOrder to save in the database
        """
```

Create the method with two parameters as described in the DocString. In SQL we use `INSERT INTO` to _insert_ new rows _into_ a table.

#### INSERT a PreOder - SQL Query

```sql
INSERT INTO PRE_ORDERS (id, order_time, customer_email, number_products, size, colour)
VALUES (?,?,?,?,?,?)
```
Note the six question marks `?` which indicate where the six values of pre-orders should be placed. Python does that automatically when provided with a list of six values. It is the recommended way for security reasons. Like the table creation, the insertion of data is an interaction with the database. The algorithm looks alike.

#### addPreOrder - Algorithm

```markdown
Connect to the database in self.database_path and keep the 'connection'
Define the SQL query to INSERT a PreOder
Put the values to insert into a list 'values'
Execute the query with the values
Commit (save) the changes
Close the connection
```

We note a difference on the third line with `put`: we combine all values to be inserted together. The will take the place of the six question marks in the query. The list of six values for a pre-order look as follows. The sequence is important as each value will be match with the properties listed in the query: `id`, `order_time`, `customer_email` and so on.

```python
values = [
    pre_order.id,
    pre_order.time,
    customer_email,
    pre_order.numberProducts,
    pre_order.size,
    pre_order.colour
]
```

# Task 5.4 Insert Customer

The approach to insert a customer is the same. We create a method `addCustomer()` with the following DocString. It has a single parameter: the Customer to insert in the database.

#### addCustomer - DocString

```python
        """
        Add a customer to the database if the email address does not exist yet, then add the pre-orders.

        Parameters:
            customer:  Customer to save in the database
        """
```

We adapt the SQL query to insert the properties of a customer in the table `CUSTOMERS`.

#### INSERT a Customer - SQL Query

```sql
INSERT OR IGNORE INTO CUSTOMERS (email, first_name, last_name)
VALUES (?,?,?)
```

The algorithm looks as follows. The interaction with the database is strictly the same. At the end, we use a for-loop to loop through the list of PreOrders for this Customer. For each PreOrder we call the method `addPreOrder()` implemented in the previous task.


#### addCustomer - Algorithm

```markdown
Connect to the database in self.database_path and keep the 'connection'
Define the SQL query to INSERT a Customer
Put the values to insert into a list
Execute the query with the values
Commit (save) the changes
Close the connection
For each pre_order in customer.preOrderList
    Call the method addPreOrder() with the customer email and the pre_order
```

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step5-3)

# Task 5.5 Select PreOrders

The final task is to extract data from the database. For this, we use the `SQL` keyword `SELECT`.

#### SELECT all rows in PRE_ORDERS table - SQL Query

```sql
SELECT id, order_time, number_products, size, colour
FROM PRE_ORDERS
```

Define a method totalListPreOrders() which returns the list of all PreOrders using the above `SQL` quey. Once again, the interaction with the database remains the same. However, this time we receive data instead of sending data. Thus, we do not prepare values for the query, but we keep the query result in a variable 'result'.

#### totalListPreOrders - Algorithm

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

We can loop through the rows of a database result with a for-loop. Each row is a list of elements in the sequence specified in the `SELECT` query. In this example, `row[0]` contains the value for the 'id', `row[1]` for 'order_time', `row[2]` for 'number_products' and so on.

To construct PreOrder objects, we need to import the class from the `model` at the top of the file.

Note that with a `SELECT`, we do not change the database. Thus there is no need to 'commit'.

Our class `DatabaseStore` is complete. To use it in `main.py`, import it and replace `Store()` by `DatabaseStore('preorders.db')`. 'preorders.db' will be the name of the file storing the database, any name would work. The landing page should behave as before. However, when we restart the programme, the customers and pre-orders are still available, taken from the database.

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step5-4)

[Next: Step 5 - Database]({{site.baseurl}}/assignments/06-landing-page/step5){: .btn .btn-purple }
