---
link-assignment: /assignments/02-vending-machine/step3/#task-31-count-remaining-cups
---

# Task 3.1 Count remaining cups

Continuously upgrading our vending machine, we want to keep track of the number of remaining paper cups. Our algorithm will need a variable to keep this information in memory and we will decrease this number (removing one cup) each time we serve a beverage. For the sake of debugging, we can also tell the number of remaining cups to the user at the beginning and the end of the code. This could look as follows:

#### Counting cups algorithm

```markdown
Create a variable called number_remaining_cups of type int with the initial value 10

Tell the user "Welcome to IO1075 Hot Beverage service!"
Tell the user "There are " number_remaining_cups " cups left."

...

If choice is equal to 1
    Then tell the user "Here is your coffee."
    Decrease number of cups
Else if choice is equal to 2
    Then tell the user "Here is your tea."
    Decrease number of cups

...

Tell the user "BTW, there are " number_remaining_cups " cups left!"
```

Note that we initialise the number of cups to 10, but any positive number would work here.

What is new in this algorithm? Several times already we concatenated (i.e. joined together) strings. Here this is a new case, we want to join a string, a number and another string: `"There are " number_remaining_cups "left."`. As we can only concatenate strings, we need to convert the number of cups into a string.

```python
string_variable = str(number_variable)
```

The second novelty of this algorithm is "Decrease". Increasing or decreasing a variable is a common algorithm operation. With the Python syntax that we already know, we can do this with the assignment operator `=` in combination with the subtraction operator `-`.

```python
number_remaining_cups = number_remaining_cups - 1
```

As this is a common manipulation, there are assignment operators for increasing `+=` and decreasing `-=`. In our example, it would be `-=` which leads to the following:

```python
number_remaining_cups -= 1
```

This means that we take the current value of the variable, we remove `1` and store the result in the variable.

We these elements, you can add the lines of the Counting Cups Algorithm to your project in _Replit_ as comments. Then, translate each line in Python.

Execute the code to check that it behaves the way you expect.

[Check the code on Replit](https://repl.it/@IO1075/02-vending-machine-step3-1)