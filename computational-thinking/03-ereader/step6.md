---
layout: default
title: Step 6 Assert
parent: "03 eReader"
grand_parent: "Computational Thinking"
---

# Step 6 Assert
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

Now that we know about loops and functions, we imagine that things can get a little complicated when debugging our code.
To help us detect problems in our code we can use the _assert_ statement.

# What is assert?
An assert statement checks whether a condition is true. If a condition evaluates to True, a program will keep running. If a condition is false, the program will return an AssertionError. 
With this statement we can check if conditions in loops and functions are met, and if the results of a function are as we expected. 
Assert used the following syntax:
```python
assert <condition>, <message>
```
Here,`condition` is the condition you want to test, and the optional `message` is the message you want to display if this condition is not met.
This is not only a useful debugging tool, but also a way to write code that is more maintainable. 

# Task 6.1 Assert usage
```python
x = 1
y = 2
z = x+y
assert z == 3
```
Here is a simple example of an assert statement where the assert condition is evaluates to True and code runs and terminates as normal.

```python
x = 1
y = 2
z = x+y
assert z == 4, "Should be 3"
```
Here is the same example but with one change, the condition will not be met. It raises an AssertionError along with the message we provided.
Test assert for yourself on _Replit_ in order to see what assert gives as output.

[Check the code on Replit](https://replit.com/@cvdvalk/UnevenCautiousArray)

# Task 6.2 Assert inside functions
Assert can be used to check if functions work as intended. 
Take the simple Calculator example, we could make a sum function and assert that the input to the function are of the correct type.
In this function if both x and y are of type int, then it should return the sum without a hitch.
It would look something like this:
```python
def sum(x, y):
    # assert that x is an int
    # assert that y is an int
    # return the sum of x and y
```
Write this function in _Replit_ and have it ask for user input just like the Calculator example.

[Check the code on Replit](https://replit.com/@cvdvalk/BestDigitalListeners)

[Next: Step 7 - Recap and More]({{site.baseurl}}/computational-thinking/03-ereader/step7){: .btn .btn-purple }
