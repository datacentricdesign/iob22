---
layout: default
title: Step 3 Operators
parent: "02 Vending Machine"
grand_parent: "Computational Thinking"
---

# Step 3 Operators
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

In the first assignment, we used the plus `+`. We can use this arithmetic operator the same way as the mathematic symbol. However, we debugged our programme, realising that we could also 'add' two strings (i.e. two pieces of text, two sequences of characters) together. It is called concatenation. Thus, operators can behave differently depending on the variable type.

In this step, we will explore other types of operators such as assignment, comparison and logical operators to extend the capabilities of the vending machine algorithm. 

You can refer to the W3Schools [list of operators](https://www.w3schools.com/python/python_operators.asp) for a complete list.

# Task 3.1 Count remaining cups

Continuously upgrading our vending machine, we want to keep track of the number of remaining paper cups. Our algorithm will need a variable to keep this information in memory. We will decrease this number (removing one cup) for each served beverage. For the sake of debugging, we can also show the number of remaining cups before and after pouring the drink. 

#### Counting cups algorithm

Counting cups could look as follows:

```markdown
Create a variable called number_remaining_cups of type int with the initial value 10

Tell the user "Welcome to IDE Hot Beverage service!"
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

What is new in this algorithm? Several times we concatenated (i.e. joined together) strings. Here this is a new case as we want to join a `string`, a `number` and another `string`: `"There are " number_remaining_cups "left."`. As we can only concatenate strings, we need to convert the number of cups into a `string`.

```python
string_variable = str(number_variable)
```

The second novelty of this algorithm is _'Decrease'_. Increasing or decreasing a variable is a typical algorithm operation. With the Python syntax we already know, we can do this with the assignment operator `=` in combination with the subtraction operator `-`.

```python
number_remaining_cups = number_remaining_cups - 1
```

As this is a common manipulation, there are assignment operators for increasing `+=` and decreasing `-=`. In our example, it would be `-=`, which leads to the following:

```python
number_remaining_cups -= 1
```

It means that we take the current value of the variable, remove `1` and store the result in the variable.

With these elements, you can add the lines of the Counting Cups Algorithm to your project in _Replit_ as comments. Then, translate each line into Python syntax. Finally, Execute the code to check that it behaves the way you expect.

[Check the code on Replit](https://replit.com/@dcdlab/vending-machine-step3-1)

# Task 3.2 Compose messages

Concatenation of strings is helpful to build messages for the user. Instead of 'telling' each piece of information, we can construct a message and deliver it further in the algorithm. For instance, the choice of beverage with sugar and milk could form a single sentence. Let's create a variable message and replace "Tell" with "Add" in our algorithm. We will only "tell" the message at the end. In Python, you can use the assignment operator `+=` to _add_ (or append) additional text to a string variable.

```python
message += "some additional text"
```

Our algorithm would look as follows:

#### Message concatenation algorithm

```markdown
...

Create a variable called message of type string with the initial value ""

If choice is equal to 1
    Add to message "Here is your coffee"
    Decrease number of cups
Else if choice is equal to 2
    Add to message "Here is your tea"
    Decrease number of cups
Otherwise this is not a known choice
    Add to message "Sorry, I do not know this choice."

Add to message whether the user take their beverage with or without sugar 
Add to message whether they take their beverage with or without milk

Tell the user message

...
```

In your _Replit_ project, you can transform your algorithm to switch from "Tell" to "Add". Do not forget to "Tell" the message at the end. You will need to adjust the punctuation and spaces to make it a proper sentence.

Execute the code to check that it behaves the way you expect.

[Check the code on Replit](https://replit.com/@dcdlab/vending-machine-step3-2)

# Task 3.3 Shame greedy users

Our vending machine could be a bit biased and tune its message to promote healthy habits such as reducing sugar consumption. Of course, the best option would be not to offer sugar. Still, it gives us an excellent opportunity to explore **comparison operators**. We have seen 'equal to' with the double equal `==` earlier, which works with numbers and strings. Additionally, in Python you can use:

* `>` and `<` for _greater than_ and _lower than_, as in mathematics
* `>=` and `<=` for _greater or equal to_ and _lower or equal to_
* `!=` for _not equal to_

For our biased vending machine, we could check whether the user takes three or more sugar units. Then, we would add a sneaky comment to the final message.

#### Two much Sugar algorithm

```markdown
Add to message whether the user take their beverage with or without sugar 

Convert sugar into integer
If sugar greater or equal to 3
    Add to message a 'healthy' comment
```

We now convert the sugar input into an integer to compare numbers. Otherwise, we would compare whether a string is greater or equal to another, leading to different behaviour.

Are you convinced that we should reward good behaviour instead of shaming bad behaviour? Then, tweak the algorithm to make it the way you want: you are the designer!

In your _Replit_ project, you can transform your algorithm to add the biased message. 

Execute the code to check that it behaves the way you expect.

[Check the code on Replit](https://replit.com/@dcdlab/vending-machine-step3-3)

# Task 3.4 Combine Conditions

In this final task on operators, we will tune our vending machine to detect when the user wants a black coffee: no sugar, no milk. We can use **logical operators** to combine multiple conditions in this case. Such a combination could look as follows

```markdown
If choice is coffee without sugar nor milk
    Add to message "Here is your black coffee."
Else if choice is equal to 1

...
```

This algorithm checks three variables: choice, sugar, and milk. In Python, we can use `and` between each condition, enforcing that all conditions much be `True`. We can also use `or`, ensuring that at least one is `True`.

In your _Replit_ project, you can transform your algorithm to add the black coffee branch.

Execute the code to check that it behaves the way you expect.

[Check the code on Replit](https://replit.com/@dcdlab/vending-machine-step3-4)

That's it for our operator exploration. As mentioned in the introduction, there are many more which you can explore on the [W3School website](https://www.w3schools.com/python/python_operators.asp). However, the way to use them is the same. Thus, feel free to explore on your own.


[Next: Step 4 - Exception]({{site.baseurl}}/computational-thinking/02-vending-machine/step4-exception){: .btn .btn-purple }