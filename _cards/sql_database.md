---
link-assignment: /assignments/06-landing-page/step5/#task-51-define-a-databasestore
---

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