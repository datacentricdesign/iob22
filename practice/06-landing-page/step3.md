---
layout: default
title: Step 3  Lists and Dictionaries
parent: "Landing Page"
grand_parent: "Practice"
---

# Step 3 Lists and Dictionaries (2hrs, ⚠️)
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

In this step, we implement methods of the `Customer` class. We introduce a class `Store` to manipulate `Customer` and `PreOrder` objects. Throughout this step, we practice with lists and dictionaries.

![Assignment 6 - Step 3.0 Class Diagram]({{site.baseurl}}/assets/images/assignment6-step3-0-class-diagram.svg)

We need to implement three methods in the class `customer` to add one or a list of pre-orders and count pre-orders. Each method has one line. We provide the _DocString_ and the intuition/function to use. A four method, `toDict()`, converts the `Customer` into a Python Dictionary. 

# Task 3.1 Define Customer Method addPreOrder()

First, the method `.addPreOrder()` would be convenient to add a pre-order to a customer each time we receive one from the landing page.

#### Append Element to a List

![Assignment 6 - Step 3.1 Append Element to a List]({{site.baseurl}}/assets/images/assignment6-step3-1-append-to-list.svg)

To implement this method, we can use the `.append()` method from the attribute `.preOrderList` to add the new PreOrder.

#### addPreOrder Method DocString

```python
        """
        Add one pre-order to the customer's list of pre-orders.

        Parameters:
            new_pre_order: new pre-order to add to the existing customer's list
        """
```

To check that the method works as we expect, we can write a test methods. Read through the following test method to make sure you understand what it does. Add it to the list of test in `test.py` and rerun the tests. If everything ran smoothly, 3 tests ran and ended with 'OK'.

#### 🧪 addPreOrder Test Method

```python
    def testCustomerAddPreOrder(self):
        my_customer = Customer("bob@test.com", 'Bob', 'Tester')
        my_customer.addPreOrder(PreOrder(4, "s", "red"))
        self.assertEqual(len(my_customer.preOrderList), 1,
                         "At this stage, the list should have 1 PreOrder.")
        my_customer.addPreOrder(PreOrder(2, "l", "blue"))
        self.assertEqual(len(my_customer.preOrderList), 2,
                         "At this stage, the list should have 2 PreOrders.")
        
        self.assertEqual(my_customer.preOrderList[0].colour, "red",
                         "The colour of the first PreOrder should be red.")
        self.assertEqual(my_customer.preOrderList[1].size, "l",
                         "The size of the second PreOrder should be l.")
```

# Task 3.2 Define Customer Method addPreOrderList()

Then, the method `addPreOrderList()` would be convenient when we want to add several order at once.

#### Concatenate Two List

![Assignment 6 - Step 3.1 Concatenate two lists]({{site.baseurl}}/assets/images/assignment6-step3-1-concat-list.svg)

To implement this method, we can use the ADD assignment `+=` or the plus sign `+` to add a list of pre-orders to the existing list of pre-order of that customer.

#### addPreOrderList Method DocString

```python
        """
        Add a list of pre-order to the customer's list of pre-orders.

        Parameters:
            new_pre_order_list: List of new pre-orders to add to the existing customer's list
        """
```

To check that the method works as we expect, we can write a test methods. Read through the following test method to make sure you understand what it does. Add it to the list of test in `test.py` and rerun the tests. If everything ran smoothly, 4 tests ran and ended with 'OK'.

#### 🧪 addPreOrderList Test Method

```python
    def testCustomerAddPreOrderList(self):
        my_customer = Customer("bob@test.com", 'Bob', 'Tester')
        my_customer.addPreOrder(PreOrder(4, "s", "red"))

        my_preorder_list = [
            PreOrder(1, "s", "silver"),
            PreOrder(8, "s", "red"),
            PreOrder(3, "s", "blue")
        ]

        my_customer.addPreOrderList(my_preorder_list)

        self.assertEqual(len(my_customer.preOrderList), 4,
                         "At this stage, the list should have 4 PreOrders.")

        self.assertEqual(my_customer.preOrderList[2].colour, "red",
                         "The colour of the first PreOrder should be red.")
```

# Task 3.3 Define Customer Method countPreOrders()

Finally, the method `countPreOrders()` can use the function `len()` to count the element of the attribute `preOrderList`.

#### countPreOrders Method DocString

```python
        """
        Return the number of pre-orders in the customer's list.
        """
```

To check that the method works as we expect, we can write a test methods. Read through the following test method to make sure you understand what it does. Add it to the list of test in `test.py` and rerun the tests. If everything ran smoothly, 5 tests ran and ended with 'OK'.

#### 🧪 countPreOrders Test Method

```python
    def testCustomerCountPreOrders(self):
        my_customer = Customer("bob@test.com", 'Bob', 'Tester')
        my_customer.addPreOrder(PreOrder(4, "s", "red"))

        self.assertEqual(my_customer.countPreOrders(), 1,
                         "At this stage, the count should return 1.")

        my_preorder_list = [
            PreOrder(1, "s", "silver"),
            PreOrder(8, "s", "red"),
            PreOrder(3, "s", "blue")
        ]

        my_customer.addPreOrderList(my_preorder_list)

        self.assertEqual(my_customer.countPreOrders(), 4,
                         "At this stage, the count should return 1.")
```

# Task 3.4 Define Customer Method toDict()

We model objects to ease our mental model while manipulating data. However, exchanging data is easier with standard data structure such as list and dictionaries as they can be converted automatically into JSON. This is the role of the method `toDict`.

#### toDict Method DocString

```python
        """
        Convert the Customer information into a dict, handy for a convertion into JSON.
        """
```

This method involves the declaration of a Dictionary such as the one of the method `toDict` in the class `PreOrder`. Have a look to get started. We need to do a similar declaraction with the four attributes of a `Customer`. The challenge lies on the list of pre-orders: each pre-order need to be converted into a `dict`, using their method `toDict()`.

#### toDict - Plain English

```markdown
Initialise an empty list 'pre_order_list_of_dict'
For each pre_order in the attribute preOrderList
    Call its method toDict() and append the dict to the list
Return all attributes as key/value pair dictionary
```

🧪 To check that the method works as we expect, we can write a test methods. Read through the following test method to make sure you understand what it does. Add it to the list of test in `test.py` and rerun the tests. If everything ran smoothly, 6 tests ran and ended with 'OK'.

#### 🧪 toDict Test Method

```python
    def testCustomerToDict(self):
        my_customer = Customer("bob@test.com", 'Bob', 'Tester')
        my_customer.addPreOrder(PreOrder(4, "s", "red"))

        customer_dict = my_customer.toDict()

        self.assertEqual(
            customer_dict["email"], "bob@test.com",
            "The email must be equal to the one given to the constructor.")
        self.assertEqual(
            customer_dict["first_name"], "Bob",
            "The first_name must be equal to the one given to the constructor."
        )
        self.assertEqual(
            customer_dict["last_name"], "Tester",
            "The last_name must be equal to the one given to the constructor.")
        self.assertEqual(len(customer_dict["pre_order_list"]), "Tester",
                         "The pre_order_list should have 1 element.")
        self.assertEqual(
            customer_dict["pre_order_list"][0]["size"], "s",
            "The first element of the pre_order_list should have a size 's'")
```

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step3-4)

# Task 3.5 Define a Class Store

With PreOrder and Customer classes, we model the critical elements of our landing page. However, we miss a part of the programme which should take care of managing these objects: counting the number of customers, listing the pre-orders, adding customers. Let's extend the class diagram with a class `Store`. A `Store` has an attribute `customers`: a `dict` whose keys are customers' emails (strings) and values are `Customer` objects.

![Assignment 6 - Step 3.3 Class Diagram]({{site.baseurl}}/assets/images/assignment6-step3-3-class-diagram.svg)

In the folder `model`, create a file `store.py`. In this file, define a class `Store` with the following docStrings.

#### Store Class DocString

```python
    """
    Manage incoming customers and pre-orders in memory, based on a Dictionary.

    Attributes
        customers: A Dictionary of Customer
    """
```

#### Store Constructor DocString

```python
        """
        Construct a Store object with an empty Dictionary of customers.
        """
```

In `__init__.py`, import the class `Store` from `store`. Then, add 'Store' in the `__all__` list.

🧪 To test the `Store` class, go to `test.py`, import the class `Store` and create a method `testConstructStore()` that constructs an object from the class `Store`. The only attribute of this class is a `dict` which should be empty. We can test if this attribute is indeed of type `dict` and empty with the following test.

#### 🧪 Store Test

```python
    def testConstructStore(self):
        my_store = Store()
        self.assertEqual(
            type(my_store.customers).__name__, "dict",
            "A Store should have an attribute 'customers' of type 'dict'.")
        self.assertEqual(len(my_store.customers), 0,
                         "A Store should have an empty dict of customers'.")
```

# Task 3.6 Define Store Method addCustomer()

Then, we define a method `addCustomer()` with the following docString:

#### addCustomer Method DocString

```python
        """
        Check if the provided Customer is already existing (based on email). If it exists, add pre-orders to the existing Customer, otherwise add the Customer.

        Parameters:
            customer: Customer to add
        """
```

#### addCustomer - Plain English

```markdown
If the email of the customer exists in the customers' dictionary
    Use the email as key to extract the existing customer from the dictionary in a variable 'existing_customer'
    Use the method .listPreOrders() to get the list of pre-orders from the new customer in a variable 'new_pre_orders'
    Use the .addPreOrderList from the existing customer to add the new pre-orders
Otherwise
    Add the new customer as value of the key customer.email
```

#### 🧪 addCustomer - Test Method

```python
    def testStoreAddCustomer(self):
        my_store = Store()
        my_store.addCustomer(Customer("bob@test.com", "Bob", "Tester"))
        self.assertEqual(len(my_store.customers), 1,
                         "Customer count should be equal to 1.")
        self.assertEqual(
            my_store.customers["bob@test.com"].firstName, "Bob",
            "The name of the Customer with email bob@test.com should be Bob")
```

# Task 3.7 Define Store Method countCustomers()

In this class, we define a method `countCustomers()` with the following docString:

#### countCustomers

```python
        """
        Count the number of Customers in the dictionary.
        """
```

To implement this method, we need the function `len()` which count the element of a list. As customers are stored in a Dictionary, we first need to extract the list of values. This is the role of the method `.values()` of a `dict`.

# Task 3.8 Define Store Method totalListPreOrders()

Finaly, we define a method `listPreOrders()` with the following docString:

#### totalListPreOrders Method DocString

```python
        """
        Extract pre-orders from all customers and return them as a list.
        """
```

Because we store the list of pre-orders in each Customer object, listing all pre-orders requires looking at each Customer to extract the list of PreOrder. The algorithm looks as follows.

#### totalListPreOrders - Plain English

```markdown
Initialise an empty list 'total_pre_orders'
For customer in values of the customers' dictionary
    Get customer's list of pre-orders
    Concatenate the 'pre_orders' with the 
Return the list 'pre_orders'
```

#### 🧪 totalListPreOrders - Test Method

```python
    def testStoreTotalListPreOrders(self):
        my_store = Store()
        customer1 = Customer("bob1@test.com", "Bob1", "Tester")
        customer1.addPreOrderList([
            PreOrder(1, "s", "silver"),
            PreOrder(8, "m", "red"),
            PreOrder(3, "l", "blue")
        ])
        my_store.addCustomer(customer1)
        customer2 = Customer("bob2@test.com", "Bob2", "Tester")
        customer2.addPreOrderList(
            [PreOrder(14, "l", "blue"),
             PreOrder(3, "s", "red")])
        my_store.addCustomer(customer2)
        my_store.totalListPreOrders()
        self.assertEqual(len(my_store.totalListPreOrders()), 5,
                         "The total number of pre-orders should be 5.")
        self.assertEqual(
            my_store.totalListPreOrders()[1].size, "m",
            "The second pre-order of the total list should have a size 'm'.")
        self.assertEqual(
            my_store.totalListPreOrders()[3].numberProducts, 14,
            "The fourth pre-order of the total list should have 14 products.")
```

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step3-7)

[Next: Step 4 - Data Collection]({{site.baseurl}}/assignments/06-landing-page/step4){: .btn .btn-purple }