---
layout: default
title: Step 2 Classes and Tests
parent: "06 Landing Page"
---

# Step 2 Classes and Tests (1hr, ⚠️)
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

With a fancy landing page, we need to get ready for receiving pre-orders from potential customers. What is a 'customer'? What is a 'pre-order'? We can use the object-oriented paradigm to define what they are in our programme. If Object-Oriented is unknown to you, we suggest looking at the IO1075 Module on Software Design and specifically the first part of the following video.


#### IO1075 Module 5 - Software Design What are Object-Oriented and Event-Driven Paradigms?

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/s5AFWr_wkMM" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Customers and pre-orders are two critical elements of our program. This is why we propose to structure our program with `Customers` and `PreOrders` objects. Objects have states they can keep in memory and behaviours, actions performed on this object. We create objects out of a `class`. The `class` define the states and behaviour of the objects. The following diagram is a class diagram that represents the classes `Customer` and `PreOrder`.

#### Customer and PreOrder Class Diagram

![Assignment 6 - Step 2.3 Class Diagram]({{site.baseurl}}/assets/images/assignment6-step2-1-class-diagram.svg)

In a class diagram, a rectangle represents a class, divided into three parts:
* the class' name;
* the attributes, variables attached to each object of the class; 
* the methods, functions attached to each object of the class.

For instance, the class `PreOrder` defines a pre-order with a unique `id`, an `orderTime` (when the order was placed), a `number_products`, a `size` and a `colour`. These are the attributes of the PreOrder class. The Customer object can `addPreOrder()` or `listPreOrders()`. These are methods of the Customer class. The class `Customer` has an attribute `preOrderList`, a list of pre-orders (i.e. the object of the class `PreOrder`). It creates a relation between the two classes: A `Customer` `is composed of` zero to many (0..*) `PreOrder`.

#  Task 2.1 Define a PreOrder

Let's see how it looks in the code. In _Replit_, create a folder `model` to write the classes that 'model' our programme's critical entities. Create a file `preorder.py` in this folder and paste the following starting code.

#### PreOrder Class - Python Syntax

```python
# Import the module time for the time of each pre-order
import time
# Import the module uuid to generate a unique id for each pre-order
import uuid


class PreOrder:
    """
    A PreOrder represents a pre-order placed by a Customer.

    Attributes
        id:               Unique identifier of a pre-order in the UUID format 
        number_products:  Number of products ordered
        size:             Size ('s', 'm' or 'l') of the ordered products
        colour:           Colour ('blue', 'red' or 'silver') of the ordered products
        orderTime:        Time of the order in the UNIX timestamp format 
    """
    def __init__(self,
                 number_products,
                 size,
                 colour,
                 id=None,
                 order_time=None):
        """
        Construct a PreOrder object.

        If missing, the id is generated from a random UUID and orderTime takes the current time.

        Parameters:
            number_products:  Number of products ordered
            size:             Size ('s', 'm' or 'l') of the ordered products
            colour:           Colour ('blue', 'red' or 'silver') of the ordered products
            id:               Unique identifier of a pre-order in the UUID format 
            order_time:       Time of the order in the UNIX timestamp format 
        """
        # Generate a UUID4 if None provided
        if (id is not None):
            self.id = id
        else:
            self.id = str(uuid.uuid4())
        # Take the current time if None provided
        if (order_time is not None):
            self.orderTime = order_time
        else:
            self.orderTime = int(time.time())
        self.numberProducts = number_products
        self.size = size
        self.colour = colour

    def toDict(self):
        """
        Convert the PreOrder information into a dict, handy for a convertion into JSON.
        """
        # return all attributes as a key/value pair dictionary
        return {
            "id": self.id,
            "time": self.orderTime,
            "number_products": self.numberProducts,
            "size": self.size,
            "colour": self.colour
        }

```

These 62 lines certainly look intimidating. Let's not be scared and read the comments throughout the code while pointing at the new syntax.

* line `7`: we use the keyword `class` to start the class's definition, followed by its name: `PreOrder`. Like all compound statement in Python, it ends with a colon `:`, all following lines taking part in the class definitions are indented.
* line `8` to `17`: This is a docString (with triple quotes `"""`) like we use for describing a function. It describes what the class represents and the attributes -- variables it keeps in memory for this object.
* line `18` to `23`: This is the class' `constructor`. The `constructor` is the function that is used to _construct_ an object of the class `PreOrder`. In Python, it is characterised by the name `__init__`. Like a regular function, it starts with the keyword `def`, and it has parameters between parenthesis. The constructor has at least one parameter: `self`. This parameter represents the object itself, so that we can refer to it and access its attributes and methods. Note: the parameters are listed one per line because it would be too many on one line. This is not specific to a constructor.
* line `24` to `35`: This is a docString that describes what happens when constructing an object PreOrder
* line `36` to `48`: This is the code of the constructor. The main task is to take the parameters and keep them as attributes of the object. Note the use of the keyword `self` refering to the object itself to set an attribute.
* line `50` to `60`: This is the definition of a method `toDict`. This method packs all the attribute of the pre-order into a Dictionary (key/value pairs). This will be handy for the webserver to send pre-order data in JSON format. Like a regular function, a method starts with the keyword `def`. It has parameters between parenthesis and can take any name. Like the constructor, it has at least one parameter, `self`, referring to the object itself.

Among these lines, many refer to comments and docStrings explaining and motivating what the class is for, how to construct an object of this class, what attributes and methods are available. This is important to leave no ambiguity for other developers to use this class. Do not forget this includes yourself when looking back at your code after weeks, months or years.

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step2-1)

# Task 2.2 Package the Module preorder.py

At this stage, we have a class `PreOrder` defined in the file `model/preorder.py`. To make it easily accessible to the rest of the code, we can declare the folder `model` as a Python package and make the class `PreOrder` accessible from this package.

In the folder `model`, create a file `__init__.py`. This file tells Python that the folder `model` is a Python package: a folder with Python modules. In this file, add the following lines:

```python
from .preorder import PreOrder

__all__ = ['PreOrder']
```

This code tells Python that the PreOrder class is accessible from the package `model`.

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step2-2)

#  Task 2.3 Test the PreOrder Class

It starts being boring and conceptual, only pasting code and reading explanations. How can we construct objects out of this PreOrder class? We do not have yet a web form in which customers fill in their pre-order information. We do not even have a definition of Customer yet. However, it is critical to test the code as we build it, saving us hours of debugging at the 'end'. Testing is rewarding in the short and long term:

* We get to run the code more often
* We gain confidence that the programme works as expected
* If we break something on the way, our test fails, making us aware of the issue
* It is a specification as it describes what should work
* It complements the documentation as developers can look at the test as examples to start from

At the root of your _Replit_ project, create a file `test.py`. We can start our series of tests with the following code.

#### 🧪 Test Unit PreOrder Class - Python Syntax

```python
# Import the module for testing
import unittest
# Import the classes from the model
from model import PreOrder

class TestModel(unittest.TestCase):

    def testConstructPreOrder(self):
        """
        Construct an object from the class PreOrder and check its attributes. 
        """
        my_pre_order = PreOrder(2, "s", "blue")

# Tell Python to run the tests when we execute this final in the Terminal
if __name__ == '__main__':
    unittest.main()
```

What? The way to test a class is to define another class? Why not? It is the best way to get accustomed to this new syntax. In this code, we import the Python `unittest` module with the testing facilities. Then, we import our class `PreOrder` from the freshly created `model` package. We define a class `TestModel` which takes all the attributes and methods from the class `TestCase` from `unittest`. We define a method `testConstructPreOrder()` which tries to construct an object from the PreOrder class. Note the syntax: we use the name of the class followed by parenthesis, including the argument for the parameters of the constructor. We are missing the `id` and the `orderTime` parameters. Because the constructor as default values for those, we do not have to provide them. The resulting object is store in the variable `my_pre_order`.

We are ready to test. We cannot press the `Run` button as it executes the file `main.py` instead of our test file. In the Terminal, click on the tab 'Shell', type in `python test.py` and press `ENTER`.

![Assignment 6 - Step 2.3 Class Diagram]({{site.baseurl}}/assets/images/assignment6-step2-3-test.png)

Hmm. It tells us that we ran a test in 0 seconds. It looks 'OK', but it does not help much. At least, Python successfully constructs an object of the class PreOrder. Let's show the attributes' value, using the dot `.` such as `my_pre_order.colour`. Add three lines to show the attributes `id`, `orderTime` and `numberProducts`. Rerun the test using `python test.py`.

![Assignment 6 - Step 2.3 Class Diagram]({{site.baseurl}}/assets/images/assignment6-step2-3-test2.png)

The result shows the id (UUID, a string of 32 characters with dashes), the order time in second since Jan 1, 1970 (check [Epoch Converter](https://www.epochconverter.com/) for a translation into a date), and `2`, the number of products we gave as argument of the constructor.

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step2-2)

# Task 2.4 Define a Customer Class

We can reuse the Python syntax covered in this step to define a class `Customer`. In the folder `model`, create a file `customer`. Define a class `Customer` and its constructor with the following docStrings:

#### Customer Class docString

```python
    """
    A Customer represents a person who filled in infomation on the landing page.

    Attributes
        email:        Customer email, unique among all customers
        firstName:    Customer's first name
        lastName:     Customer's last name
        preOrderList: List of pre-orders placed by the customer
    """
```

#### Customer Constructor docString

```python
        """
        Construct a Customer object with an empty pre-order list.

        Parameters:
            email:        Customer email, unique among all customers
            first_name:    Customer's first name
            last_name:     Customer's last name
        """
```

In `__init__.py`, import the class `Customer` from `customer`. Then, add 'Customer' in the `__all__` list.

🧪  To test the Customer class, go to `test.py`, import the class `Customer` and create a method `testConstructCustomer()` that constructs an object from the class `Customer` with the arguments 'bob@test.org', 'Bob', 'Tester' (feel free to change these test values) and show its `email`, `firstName`, `lastName` and `preOrderList`. The result shows the values given as argument of the constructor and the square barckets indicating an empty list of PreOrder.

![Assignment 6 - Step 2.3 Class Diagram]({{site.baseurl}}/assets/images/assignment6-step2-4-test.png)

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step2-4)

# Task 2.5 Improve Test

Before growing the list of tests in the next steps, let's improve them. We do not want to look at the result of each test, each time in details to know whether they succeed. We want the test to check automatically. For this, we use assertions: methods checking whether a condition is true. For example, we want to guaranty that the number of products set as the argument of the PreOrder constructor is set properly. In the test, we replace the print statement by (2 being the value we set as argument):

```python
        self.assertEqual(
            my_pre_order.numberProducts, 2,
            "The number of products must be equal to the one in parameter.")
```

See the list of available assertion in the [Python documentation](https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertEqual) and write an assertion to replace each print() statement.

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step2-5)

Testing is a critical part of software development that ensure software quality. In some company, tests are written before the code by a team focusing on developing test: the so-called test-driven approach. As designers, you do not need to reach that stage. However, the idea that we can use tests to specify a list of requirements connects closely to designers.

At this stage, we defined two classes, Customer and PreOrder, to handle our programme's critical elements. However, we still lack methods to add and count both customers and pre-orders. In the next Step, we use this context to practice the manipulation of lists and dictionaries.

[Next: Step 3 - Lists and Dictionaries]({{site.baseurl}}/assignments/06-landing-page/step3){: .btn .btn-purple }