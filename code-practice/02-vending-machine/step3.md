---
layout: default
title: Step 3 Operators
parent: "#02 Vending Machine"
grand_parent: Code Practice
---

# Step 3 Operators
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

In the first code practice, we used the `+`, an arithmetic operator that can be used the same way as the mathematic symbol. However, we debugged our programme, realising that we can also 'add' two String (i.e. text, a sequence of characters) together, the so-called concatenation. Thus, operators can behave differently depending on the type of variables.

In this step, we will explore other types of operators such as comparison, logical and assignment to extend the capabilities of the vending machine algorithm. 

For a complete list, you can refer to the W3Schools for a complete [list of operators](https://www.w3schools.com/python/python_operators.asp)

# Task 3.1 Shame greedy users

Exploration of **comparison operators**, if more sugar than 2/5, show a nasty message to the user.

# Task 3.2 Customise Prices

Exploration of **logical operators**, combining students/staff and beverage choice to calculate the price

In the previous step, we used the `==` operator to check if the user input is equal to a specific choice of hot beverage.

There are several other operators `>=` `<=`, `!=`


# Task 3.3 Count remaining cups

Exploration of **assignment operators** to decrease the number of remaining cups and increased the number of served / money cashed.

We encountered the assignment operator `=` in the first code practice with the variable. We use `=` to 'assign' a value to a variable.

In an algorithm, a common operation is the update of a variable based on its current state. For example, the vending machine as a variable number_remaining_cups which tracks the number of paper cups still available in the machine. Every time we serve a beverage, we want to decrease this number by one. Thus, we want to do the following:

```python
number_remaining_cups = number_remaining_cups - 1
```

As this is a common manipulation, there are assignment operator for this. In our example, it would be `-=` which leads to the following:

```python
number_remaining_cups -= 1
```

This means that we take the current value of the variable, we remove `1` and store the result in the variable.
