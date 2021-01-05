---
layout: default
title: Step 5 Debug
parent: "#01 User Interaction"
grand_parent: Code Practice
---

# Step 5 Debug
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

The code we wrote in the previous step leads to an unexpected behaviour. We want the computer to sum up 2 numbers and we do not get the right answer. This is an opportunity to _debug_ our program, i.e. to investigate what is happening and why it is not working as expected.

You will soon realise that this is a big part of programming and being good at programming as a lot to do with the ability to investigate and fix code. This is why we start debugging now.

Typically, the key questions are: did you tell the computer what to do incorrectly? Or did you tell it to do the wrong thing?

In our situation, the problem seems to revolve around the line that sum the `x` and `y`:

```python
sum = x + y
```

## Task 5.1 Is the `+` sign broken?

Let's create a test program. In Repl.it, on the top-right corner, click on the `+` sign to create a new project. Select the language 'Python' and a name, for example, 'test-sum'.

In this empty project, we can try to sum two numbers and output the result.

```python
# Create a variable called x of type number that starts with the value 2
# Create a variable called y of type number that starts with the value 5
# Create a variable called sum of type number that receives the result of the sum of x and y
# Tell user the value of sum
```

The result should look as follows:

```python
# Create a variable called x of type number that starts with the value 2
x = 2
# Create a variable called y of type number that starts with the value 5
y = 5
# Create a variable called sum of type number that receives the result of the sum of x and y
sum = x + y
# Tell user the value of sum
print(sum)
```

Ask the computer to execute your instruction by clicking on the green arrow at the top of the page.

What do we get? 7, this is the correct answer. The `+` sign is not broken!

## Task 5.2 Can we add text?

The difference between our two programs (one giving the wrong sum result and one giving the correct one) lie in the input: the second version is not asking for the input, directly taking two numbers `2` and `5`. Thus, the computer is not understanding our input the way we want, but if `2` and `5` are not numbers, why is the computer even giving an answer? Hmm.

Let's erase our previous test and try the following:

```python
print("python" + "text")
```

Hmmm. We can add text? Yes, it is called `concatenation`. Could it be that the computer thinks our variable x and y are text instead of a number?

If you Google _'python find out the type of a variable'_, you will find `type`. Note how to search: first the language (python) and then what you are looking for.

Then, erase our previous test and ask the user for an input so that you can check its type.

```python
# Create a variable called x of type number that starts with the value 0
x = 0
# Ask the user ‘Type in x: ’ and store the answer in x
x = input("Type in x: ")
# Tell user the type of x
print(type(x))
```

Ask the computer to execute your instruction by clicking on the green arrow at the top of the page.

If you run this program several times with a number or a word as input, you will notice that in any case the type of `x` becomes `str`. It stands for _string_, a chain of characters, in other words 'text'. Note: the exact result is `<class 'str'>`. We will introduce what a class is later in the code practices.

It looks like we touch on the problem. We want to sum two numbers but instead, we concatenate two string.

## Task 5.3 Convert text to numbers

How do we fix our issue? We need an algorithm to convert the input from `string` to an `integer`. We need two elements:


* `oldVariable` in a non-integer format
* `intVariable` integer to hold results

With these, the integer conversion algorithm would look as follows:

_Convert oldVariable to integer and store in intVariable_
{: .fs-5 .ls-10 .code-example }

To realise this in Python we can write:

```python
intVariable = int(oldVariable)
```

OK, let's start fresh. Create a new Repl.it project and bring back only the comments without code. Note the two new lines `Convert ...`.

```python
# Create a variable called x of type number that starts with the value 0

# Create a variable called y of type number that starts with the value 0

# Create a variable called sum of type number that starts with the value 0

# Ask the user ‘Type in x: ’ and store the answer in x

# Convert x to integer

# Ask the user ‘Type in y: ’ and store the answer in y

# Convert y to integer

# Put x + y in sum

# Tell user "The answer is " sum
```

Add the line of code for each comment. Then, ask the computer to execute your instruction by clicking on the green arrow at the top of the page.