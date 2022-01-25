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

The project is slowly building up. We structured the code in functions that we could reuse. This step explores two strategies to make the code more reusable: module and refactoring.

## What is a Module?

In Python, a module is a file (with the extension `.py`) containing definitions of functions. It allows developers to organise the code in multiple files, making it easier to find our way through the code. There are two strategies to use code from a module (e.g. from a different file).

1. You can import a specific function from a module with  `from ... import ...`. We recommend it in most cases. You can call the imported functions as if they were defined in the same file.

```python
from module_name import function_name1, function_name2
```

2. When the whole module is relevant, you can use the keyword `import` directly.

```python
import module_name
```

In this case, you need to prefix the function call by the module name, such as `module_name.function_name1()`.

# Task 2.1 Organise the Code into Modules

Create a file `drawing.py` and add the following Docstring.

```python
"""Collection of SVG drawing functions"""
```

**By convention**, a module starts with a Docstring which describes what it is about.
{: .fs-5 .ls-10 .code-example .bg-green-000}

Then, cut and paste the four functions you defined from `main.py` to `drawing.py`.

Only four lines should remain in `main.py`.

```markdown
Import relevant functions from the module 'drawing'
Create constant COLOUR for the colour of the drawing
Create constant PATH for where to save the SVG drawing
Save radial lines into a file
```
Execute the code. The behaviour should remain the same as we only reorganised the code.

[Check the code on Replit](https://replit.com/@dcdlab/generative-art-step2-1)

## What is Refactoring?

The second strategy to make the code more reusable is `refactoring`. Coding is an iterative process. Thus, it is critical to look back at the code and make a second iteration of `computational thinking`:

* Can some tasks be handled more effectively or with more clarity?
* Can we identify or anticipate patterns?
* How does it impact the design of the algorithm?

This process includes performance, but most importantly, readability and maintainability. To some extent, you might consider that restructuring the code into modules (e.g. Task 2.1) is a form of refactoring.

# Task 2.2 Refactor the Function make_drawing_radial_lines()

Let's look back at the function `make_drawing_radial_lines()`. We created a function for this. But it is limited to one possible variant: the colour. We can improve this function to make it work for any drawing size and any spacing of lines. The specification of the function looks as follows:

```python
"""
Make an SVG draw composed of radial lines.
colour -- hexadecimal or colour name (default=black)
width -- Width of the drawing in pixel (default=100)
height -- Height of the drawing in pixel (default=100)
granularity -- Increment between each line (default=5)
"""
```

The structure of the algorithm remains the same. The only change is the new parameters `width`, `height` and `granularity` in place of the previously static values (e.g. `5` or `95`).

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

At this stage, we need to update the function call to make the code work again. Indeed, before refactoring, we called the function with only one parameter. It now requires four parameters. To avoid this change, we can introduce a `default value` for each parameter. By specifying a default value for a parameter, we make this parameter optional: it is not required to provide an argument for this parameter when calling the function. With a default value for each parameter, the definition of `make_drawing_radial_lines()` looks as follows:

```python
def make_drawing_radial_lines(colour="black", width=100, height=100, granularity=5):
```

Execute the code. The behaviour should remain the same as we only reorganised the code.

[Check the code on Replit](https://replit.com/@dcdlab/generative-art-step2-2)

Now that we reorganised the code, we are ready to bring in code from others and move from the Terminal to the Web.

[Next: Step 3 - Web Server]({{site.baseurl}}/computational-thinking/04-generative-art/step3-server){: .btn .btn-purple }