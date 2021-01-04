---
layout: default
title: "#04 Box Factory"
parent: Code Practice
has_children: true
---

# #04 Box Factory


In this third code practice we will teach the computer how to .

The challenge we want to address in this code practice is repetition. Computers are particularly good at learning something once and repeating it many times.

[TODO INTRO VIDEO]

---

Through this code practice we will explore the following concepts:

Loop
{: .label .label-green }




Step 1: Make one box

We can start developing our hot beverage algorithm with the elements we used in the first code practice. For example:


Step 3: Make many boxes


For loops
sentry: integer variable that will control loop
Start: integer value of the sentry at the beginning
Finish: integer value of the sentry at the end
Change: integer to add to the sentry at each pass

For algorithm
Begin with the sentry at the start and add change to the sentry on each pass until sentry is larger than or equal to finish

That's not Pythonic, because this traditional for-structure lines up better with other languages and leads to the way we'll teach while loops. Save iterators for when we talk about lists and tuples.

Code 
For I in range(start, finish, change):
    Code


BE VERY CAREFUL ABOUT VARIABLE NAMES
Not word in word but x in words (single letter), so that students can see clearly the difference and see what's Python and what's not


While loops
sentry: integer variable that will control loop
Initialisation code: code that initialises sentry
Condition: loop repeats if the condition is true
Change code: code to change sentry so the condition can be triggered

Algorithm:
Initialise sentry with initialisation code then continue loop as long as the condition is true. Inside the loop, change sentry with change code

Code:
initialisationCode
While (condition):
    changeCode

Note the syntax only requires a condition. Good logic requires much more. This is why while loops can be such notorious problems for beginners.



Multiple exits

Consider a basic password loop
It exits with a positive result if the user chooses the right password
It exits with a negative result if the user is wrong three times.
How will you code this loop?  


Use a compound condition

(Tries >= 3 and guess != correct)
   Wait…

Step Recap

Step Further

Go ahead and tune your box factory as you like: you are the designer! Here are some possible extensions

Share your code and a screenshot of your result on Discourse.
