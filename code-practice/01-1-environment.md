---
layout: default
title: Environment
parent: 01# User Interaction
---

# User Interaction
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

Concepts: algorithm, variables, input, output, comment, error

In this first code practice we will teach the computer how to interact with us to sum two numbers. That is what programming is about: telling the computer what to do.

For this we need to know what it should do. This is the algorithm, a sequence of well-defined instructions. Throughout the code practices we will write algorithms in plain English, to make sure that we know what we want the computer to do. Then, writing the code is a matter of syntax, be it Python or any other language.


# Step 1 Environment 
Let’s open the Repl.it. Repl.it is an environment to write code, directly in your web browser. It certainly has some limitations, but in this way we can get started right away, without installing any additional software on our laptop.

Here is the link:

When you open Repl.it, you can see three vertical panels:
* on the left, this is a file explorer listing the file of your project. All our code will fit in the default file ‘main.py’;
* in the center, this is a text editor, to edit the code. You can see that there is one tab at the top ‘main.py’: you are currently editing this file.
* on the right, this is a Terminal: a text based interface to interact with the computer.

We will use both the text editor and the Terminal in the following steps.

# Step 2 Variable

For the computer to learn, it needs the ability to memorise information. This is the role of the variables. In programming, a variable is a storage location in the computer memory, paired with a name. This name will enable us to retrieve the information to use in our programme.

To create a new variable, we need three elements:
* name: what do we call this thing that we want the computer to remember?
* type: what type of data does it contain?
* initVal: What is it's starting value?

So here is our first algorithm that teach the computer how to remember information:
‘Create a variable called name of type type that starts with the value initVal’

Now that we know what we want to do, it is a matter of finding the Python syntax. It looks like this:

name = initVal

> Note: unlike in mathematics in which the equal sign ‘=’ means that the expressions on both sides are equal, in programming ‘=’ means that the right part is ‘assigned’ to the left part.

# Task 2.2: Write the algorithm. In the text editor, we can thus type in the following two lines for our algorithm:

# Create a variable called x of type number that starters with the value 0
# Create a variable called y of type number that starters with the value 0
# Create a variable called sum of type number that starters with the value 0

The hash tag ‘#’ at the start of the line means that it is a comment: plain English explanation of what you want to do.

# Task 2.3: Write the code. In the text editor, for each comment, type in the Python code which explains the comments to the computer.

You should obtain something like this:

# Create a variable called x of type number that starters with the value 0
x = 0
# Create a variable called y of type number that starters with the value 0
y = 0
# Create a variable called sum of type number that starters with the value 0
sum = 0

# Task 2.4: Execute the code. Ask the computer to execute your instruction by clicking on the green arrow at the top of the page.

Nothing happens. Indeed, we are storing zeros in three variables, without asking the computer to show anything.


# Step 3 Input
With variables we provide memory to our programme. We can now start thinking about what we want to teach to the computer. Our goal is to interact with the user to sum two numbers. We want the computer to ask the user for two numbers, add them up and show the answer to the user.

Thus, we need to introduce the concept of input. An input is an information received by the computer. In our case, it will receive numbers from the user. It has two elements:

* variable: where answer from user will be stored
* message: question being asked of the user

Our input algorithm looks like this: ‘Ask the user message and store the answer in variable’

In Python, this would look like this:

variable = input("message")

# Task 3.1: Write the two comments and two Python lines to let the user enter the numbers to sum up.

You should obtain something like this:

# Create a variable called x of type number that starters with the value 0
x = 0
# Create a variable called y of type number that starters with the value 0
y = 0
# Create a variable called sum of type number that starters with the value 0
sum = 0
# Ask the user ‘Type in x: ’ and store the answer in x
x = input("Type in x: ")
# Ask the user ‘Type in y: ’ and store the answer in y
y = input("Type in y: ")

Task 3.2: Execute the code. Ask the computer to execute your instruction by clicking on the green arrow at the top of the page.

This time ‘Type in x:’ should appear in the Terminal window (black one on the right). Type a number and press ENTER. A second message should appear for the value of y. Once again, enter a value and press enter. The programme ends, as we do not do anything else.
Step 4 Output
In combination with variables and input, the final concept we need is output. An output is information coming out of our programme. It has one element:
* message: text to write to the user

The algorithm for the output looks like this: ‘Output the text message’

To realise this in Python we can write:

print("message")

Task 4.1: To complete the user interaction, write the two Python lines for the following comments.

Note: Put -- assigning a value to an existing variable -- is the same in pYthon as creating a variable.

# Put x + y in sum
# Tell user "The answer is " sum

You should obtain something like this:

# Create a variable called x of type number that starters with the value 0
x = 0
# Create a variable called y of type number that starters with the value 0
y = 0
# Create a variable called sum of type number that starters with the value 0
sum = 0
# Ask the user ‘Type in x: ’ and store the answer in x
x = input("Type in x: ")
# Ask the user ‘Type in y: ’ and store the answer in y
y = input("Type in y: ")
# Put x + y in sum
sum = x + y
# Tell user "The answer is " sum
print("The answer is ")
print(sum)

Task 4.2: Execute the code. Ask the computer to execute your instruction by clicking on the green arrow at the top of the page.

What happened? Did you get the correct answer? Something is wrong?

Step 5 Debug

Failure is wonderful
This is a normal part of programming
Begin debugging now
Did you tell it what to do incorrectly?
Or did you tell it to do the wrong thing?


How to debug


Easy to assume the + sign is broken
That's not really the problem

Try print("python" + "meetup")


Hmmm. We can add text?

Yes, it's called concatenation

I wonder if it thinks "2" and "3" are text?

We look up a tool to find out, type function does this!


Convert to integer
oldVariable: in a non-integer format
intVariable: integer to hold results


Convert to integer algorithm
Convert oldVariable to integer and store in intVariable
intVariable = int(oldVariable)

OK, let's start fresh, bring back only the comments without code
Add convert x to integer
Add convert y to integer


Step Recap

Step Further
