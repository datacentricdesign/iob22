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

The code we wrote in the previous step leads to unexpected behaviour. We want the computer to sum up two numbers and we do not get the right answer. This is an opportunity to _debug_ our program, i.e. to investigate what is happening and why it is not working as expected.

You will soon realise that this is a big part of programming and being good at programming as a lot to do with the ability to investigate and fix code. This is why we start _debugging_ now.

Typically, the key questions are: did you tell the computer what to do incorrectly? Or did you tell it to do the wrong thing?

In our situation, the problem seems to revolve around the line that sums the `x` and `y`:

```python
sum = x + y
```

## Task 5.1 Is the `+` sign broken?

Let's create a test program. In _Replit_, on the top-right corner, click on the `+` sign to create a new project. Select the language 'Python' and a name, for example, '01-calculator-test-sum'.

In this empty project, we can try to sum two numbers and output the result.

```mardown
Create a variable called x of type number that starts with the value 2
Create a variable called y of type number that starts with the value 5
Create a variable called sum of type number that receives the result of the sum of x and y
Tell user the value of sum
```

Translate these four lines in Python, then ask the computer to execute your instruction by clicking on the green arrow at the top of the page.

[Check the code on Replit](https://repl.it/@IO1075/01-calculator-step5-1)

What do we get? 7, this is the correct answer. The `+` sign is not broken!

## Task 5.2 Can we add text?

The difference between our two programs (one giving the wrong sum result and one giving the correct one) lie in the input: the second version is not asking for the input, but directly taking two numbers `2` and `5`. Thus, the computer is not understanding our input the way we want. But if `2` and `5` are not numbers, what are they and why is the computer even answering? Hmm.

Let's erase our previous test and try the following:

```python
print("python" + "text")
```

Hmmm. We can add text? Yes, it is called `concatenation`. Could it be that the computer thinks our variable `x` and `y` are text instead of a number?

Let's pause for a moment and expand our understanding of data types. We saw in Step 1 that variables have data types. Numbers such as `2` or `5` can be kept in memory as int (for integer) but also as char (for character). Indeed, `2` is a text character as `A` or `!`. 

So what is Text? Text is a sequence of characters. It is an _object_ (or data structure) which combines one or several values of type `char` in a sequence. This object is commonly called `string`. In Python, we represent a string with double quotes `"` such as `"2"`. We already saw examples with inputs messages such as `"Type in x: "`.

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

If you run this program several times with a number or a word as input, you will notice that in any case, the type of `x` becomes `str`.
In Python, `str` stands for `string`, as we just explained, a chain of characters, or in other words text.

Note: the exact result is `<class 'str'>`. We will introduce what a class is later in the assignments.

It looks like we touch on the problem. We want to sum two numbers but instead, we concatenate (e.g. join together) two strings. This explains why `2 + 5` provide `25` as a result. Here, we highlight the influence of data type on the computer's behaviour.

## Task 5.3 Convert text to numbers

How do we fix this issue? We need an algorithm to convert the input from `string` to an `integer`. We need two elements:


* `old variable` in a non-integer format
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
Ask the user 'Type in x: ' and store the answer in x
Convert x to integer
Ask the user 'Type in y: ' and store the answer in y
Convert y to integer
Put x + y in sum
Tell user "The answer is "
Tell user sum
```

Translate each line into Python. Then, ask the computer to execute your instruction by clicking on the green arrow at the top of the page.

[Check the code on Replit](https://repl.it/@IO1075/01-calculator-step5-2)

[Next: Step 6 - Recap and More]({{site.baseurl}}/computational-thinking/01-calculator/step6){: .btn .btn-purple }