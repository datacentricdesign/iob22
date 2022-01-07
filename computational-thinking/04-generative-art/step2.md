---
layout: default
title: Step 2 Refactoring
parent: "04 Generative Art"
grand_parent: "Computational Thinking"

---

# Step 1 Refactoring
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

The project is slowly building up. We structured the code in functions that we can reuse. In this step, we explore two strategies to make the code more reusable: module and refactoring.

## What is a Module?

In Python, a module is a file (with the extension `.py`) which contains definitions of functions. This allows developers to organise the code in multiple files, making it easier to find our way through the code. To use code from a module (e.g. from a different file), there are two strategies:

You can import a specific function from a module with  `from ... import ...`. This is recommended in most cases. You can call the imported functions as if they were defined in the same file.

```python
from module_name import function_name1, function_name2
```

When the whole module is relevant, you can use the keyword `import` directly.

```python
import module_name
```

In this case, you need to prefix the function call by the module name, such as `module_name.function_name1()`.

# Task 2.1 Organise the Code into Modules

Create a file `drawing.py` and add the following Docstring

```python
"""Collection of SVG drawing functions"""
```

**By convention**, a module starts with a Docstring which describe the module.
{: .fs-5 .ls-10 .code-example .bg-green-000}

Then, cut and paste the four functions you defined from `main.py` to `drawing.py`.

`main.py` should be left with only four lines of code

```markdown
Import relevant functions from the module 'drawing'
Create constant COLOUR for the colour of the drawing
Create constant PATH for where to save the SVG drawing
Save radial lines into a file
```
Execute the code. The behaviour should remain exactly the same as we simply reorganised the code.

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step2-1)

## What is Refactoring?

The second strategy to make the code more reuseable is `refactoring`. Now that the code is written, we look back at the code and make a second iteration of `computational thinking`: can some tasks be handled more effectively or with more clarity? can we identify or anticipate patterns? how does it impact the design of the algorithm? This process can be about performances, but most importantly it is about readability and maintainability. To some extent, you might consider that restructuring the code into modules (e.g. Task 2.1) is a form of refactoring.

# Task 2.2 Refactor the Function make_drawing_radial_lines()

Let's look back at the function `make_drawing_radial_lines()`. We created a function for this but it is limited to one possible variant: the colour. We can improve this function to make it works for any size of drawing and any spacing of lines. The specification of the function looks as follows:

```python
"""
Make an SVG draw composed of radial lines.
colour -- hexadecimal or colour name (default=black)
width -- Width of the drawing in pixel (default=100)
height -- Height of the drawing in pixel (default=100)
granularity -- Increment between each line (default=5)
"""
```

The structure of the algorithm remains the same. the only change is the use of the new parameters width, height and granularity in place of the previously static values (e.g. `5` or `95`).

```markdown
Initiate the drawing of size width x height with the SVG tag
Create variables x with initial value granularity (left with margin)
Create variables y with initial value granularity (top with margin)
Create variables x2 with initial value width - granularity (right with margin)
Create variables y2 with initial value height - granularity (bottom with margin)
For the height of the drawing, i with granularity increments
    Draw a line tilting y and y2 with +/- i
For the width of the drawing, i with granularity increments
    Draw a line tilting x and x2 with +/- i
Close the drawing with the SVG tag
Return the drawing
```

At this stage, we need to update the function call to make the code work again. Indeed, before refactoring, we were calling the function with only one parameter. The function now requires four parameters. To avoid this change, we can introduce a `default value` for each parameter. By specifying a default value for a parameter, we make this parameter optional: it is not required to provide an argument for this parameter when calling the function. Giving a default value to each parameter, the definition of `make_drawing_radial_lines()` looks as follows:

```python
def make_drawing_radial_lines(colour="black", width=100, height=100, granularity=5):
```

Execute the code. The behaviour should remain exactly the same as we simply reorganised the code.

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step2-2)

Now that we reorganised the code, we are ready to bring in code from others.

[Next: Step 3 - Web Server]({{site.baseurl}}/computational-thinking/04-generative-art/step3){: .btn .btn-purple }