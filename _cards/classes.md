---
link-assignment: /assignments/06-landing-page/step2/
---

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

**By convention**, class names are noun with each element starting with an upper case (e.g. `Customer`, `PreOrder`). Attributes and methods start with a lower case with an upper case  `_` at the start of each element (e.g. `toDict`, `orderTime`).
{: .fs-5 .ls-10 .code-example .bg-green-000}

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step2-1)