---
layout: default
title: "04 Generative Art"
has_children: true
parent: "Computational Thinking"
---

# 04 Generative Art

In this fourth Python programming assignment, you move the user interaction from the Terminal to the web browser. You organise the code in several files, and you import `modules` to rely on code from other developers. Finally, you create an algorithm that generates random Scalable Vector Graphics (SVG) that you expose on the web. 

<div style="text-align: center">
    <iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/f4cK9KKObQA" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>


---

Through this assignment, we explore the following concepts:

While-Loop
{: .label .label-green }

For-Loop
{: .label .label-green }

String
{: .label .label-blue }

web endpoint
{: .label .label-red }

SVG
{: .label .label-red }

Modules
{: .label .label-yellow }

Flask
{: .label .label-purple }

---

[Amanda J Hogan](https://2019.pycon-au.org/talks/pretty-vector-graphics--playing-with-svg-in-python)'s talk inspired the first step of this assignment. Thank you! 


## 💨  Brief Refresher

Let's start with a brief refresher of the topics we covered in previous assignments that might be useful to remember.

* **While-Loop** -- a structure that repeats a block of code _while_ a condition is `true`. It involves an `initialisation code`, a `condition` to continue iterating as long as it is `true` and the 
`Change code` which modify the condition.

```python
# initialisation code
while (condition):
    # change code
```

* **For-Loop** -- a structure that makes the boundaries of the loop explicit. In contrast with the while-loop, we recommend for-loop when we know how many iterations are needed. This time we define a variable as part of the structure, often named `i` for 'index', which keeps track of the iteration number. `start`, `finish`, and `change` define the number of iterations.

```python
for i in range(start, finish, change):
    # action
```

* **Function** -- a block of code that performs an `action`, identified by a `name`. A function defines a set of actions that we can call in a single line, everywhere in the code. It receives information through `parameters` and returns a result. We use the name to `call` it, i.e. running the associated code block (e.g. `print()`). When calling a function, we provide the values (or arguments) necessary for each function's parameter. So, functions are handy because it avoids duplicating code, making the development more efficient and robust.

```python
def name(parameter1, parameter2):
    """This is an example of function definition.
    parameter1 -- a first example parameter
    parameter2 -- a second example parameter
    """

    # Action

    return result
```


## ⏰  Time Management and Expectations



[Next: Review]({{site.baseurl}}/computational-thinking/04-generative-art/step1-review){: .btn .btn-purple }