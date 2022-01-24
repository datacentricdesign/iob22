---
layout: default
title: Step 5 Debug
parent: "01 Calculator"
grand_parent: "Computational Thinking"
---

# Step 5 Debug
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## What is Debugging?

The code we wrote in the previous step leads to unexpected behaviour. Indeed, we want the computer to sum up two numbers, and we get a wrong answer. It is an opportunity to _debug_ our program, i.e., investigate what is happening and why it is not working as expected.

You will soon realise that it is a big part of programming, and being good at programming has a lot to do with investigating and fixing code. It is why we start _debugging_ now.

Typically, the key questions are: did you tell the computer what to do incorrectly? Or did you tell it to do the wrong thing?

In our situation, the problem seems to revolve around the line that sums the `x` and `y`:

```python
sum = x + y
```

## Task 5.1 Is the `+` sign broken?

Let's create a test program. In _Replit_, click on the `+` sign (top-right corner) to create a new project. Select the language _Python_ and name it, for example, '01-calculator-test-sum'.

We can sum two numbers in this empty project and output the result.

```mardown
Create a variable called x of type number that starts with the value 2
Create a variable called y of type number that starts with the value 5
Create a variable called sum of type number that receives the result of the sum of x and y
Tell user the value of sum
```

Translate these four lines in Python, then ask the computer to execute your instructions by clicking on the green arrow at the top of the page.

[Check the code on Replit](https://replit.com/@dcdlab/calculator-step5-1)

What do we get? 7, this is the correct answer. The `+` sign is not broken!

## Task 5.2 Can we add text?

The difference between our two programs (one giving the wrong sum result and one giving the correct one) lie in the input. Indeed, the second version is not asking for the input, but directly takes two numbers, `2` and `5`. Thus, the computer does not understand our input the way we want. But if `2` and `5` are not numbers, what are they, and why is the computer even answering? Hmm.

Let's erase our previous test and try the following:

```python
print("python" + "text")
```

Hmmm. Can we add text? Yes, it is called `concatenation`. Could it be that the computer thinks our variable `x` and `y` are text instead of a number?

Let's pause for a moment and expand our understanding of data types. We saw in Step 1 that variables have a type. For instance, numbers such as `2` or `5` can be memories as int (for integer) or char (for character). Indeed, `2` is a text character like `A` or `!`. 

So what is Text? Text is a sequence of characters. It is an _object_ (or data structure) which combines one or several values of type `char` in a sequence (or array). This object is commonly called `string`. In Python, we represent a string with double quotes `"` such as `"2"`. We already saw examples with inputs messages such as `"Type in x: "`.

Going back to our debug session, how do we check the type of a variable? If you _Google_ _'Python find out the type of a variable'_, you will find `type`. Note how to search: first the language (Python) and then what you are looking for.

Then, erase our previous test and ask the user for input so that you can check its type.

```python
# Create a variable called x of type number that starts with the value 0
x = 0
# Ask the user ‘Type in x: ’ and store the answer in x
x = input("Type in x: ")
# Tell user the type of x
print(type(x))
```

Ask the computer to execute your instruction by clicking on the green arrow at the top of the page.

If you run this program several times with a number or a word as input, you will notice that in any case, the type of `x` becomes `str`. In Python, `str` stands for `string`, as we just explained, a chain of characters, or in other words: text.

Note: the exact result is `<class 'str'>`. We will introduce what a class is in later assignments.

It looks like we touch on the problem. We want to sum up two numbers, but instead, we concatenate (e.g. join together) two strings. It explains why `2 + 5` provide `25` as a result. Here, we highlight the influence of data type on the computer's behaviour.

## Task 5.3 Convert text to numbers

How do we fix this issue? We need an algorithm to convert the `string` input to an `integer`. We need two elements:


* `old variable` of a non-integer type
* `int variable` integer to hold results

With these, the integer conversion algorithm would look as follows:

#### Integer conversion algorithm

```mardown
Convert [old variable] to integer and store in [int variable]
```

To realise this in Python we can write:

```python
int_variable = int(old_variable)
```

OK, let's start fresh. Create a new `Replit` project and bring back only the comments without code. Note the two new lines `Convert ...`.

```markdown
Create a variable called x of type number that starts with the value 0
Create a variable called y of type number that starts with the value 0
Create a variable called sum of type number that starts with the value 0
Ask the user "Type in x: " and store the answer in x
Convert x to integer
Ask the user "Type in y: " and store the answer in y
Convert y to integer
Put x + y in sum
Tell user "The answer is "
Tell user sum
```

Translate each line in Python. Then, ask the computer to execute your instruction by clicking on the green arrow at the top of the page.

[Check the code on Replit](https://replit.com/@dcdlab/calculator-step5-2)

[Next: Step 6 - Recap and More]({{site.baseurl}}/computational-thinking/01-calculator/step6-recap){: .btn .btn-purple }