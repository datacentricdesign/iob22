---
layout: default
title: Step 1 Review
parent: '04 Generative Art'
---

# Step 1 Review

{: .no_toc }

## Table of contents

{: .no_toc .text-delta }

1. TOC
   {:toc}

---

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/f5zgMrSGkTk" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## What is SVG?

In this initial step, we will only use Python syntax we already encountered in the previous assignments. We will particularly reuse `functions`, `loops` and `files`. However, we need to introduce what we will play with: Scalable Vector Graphics (SVG). You might use tools such as Illustrator or Inkscape to draw on your computer. These tools are keeping track of what we draw as a list of objects. SVG is a data format to save all the information related to these objects: colour, size, position, etc.

In this step, we will explore a basic drawing element: the line. The following SVG draws two blue lines, forming a cross as follows:

<div style="text-align: center">
    <svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" style="max-width: 200px;">
        <line x1="10" y1="10" x2="90" y2="90" stroke="blue" />
        <line x1="10" y1="90" x2="90" y2="10" stroke="blue" />
    </svg>
</div>

The following text is the SVG representation of this drawing. The data is structured with tags delimited by `<` and `>`. This is an `XML` data structure. In this example, we can see an `svg` tag which shows the start `<svg>` and the end `</svg>` of our drawing. The two lines are specified with the tag `<line>`.

```xml
<svg viewBox="0 0 100 100" width="100" height="100"  xmlns="http://www.w3.org/2000/svg">
  <line x1="10" y1="10" x2="90" y2="90" stroke="blue" />
  <line x1="10" y1="90" x2="90" y2="10" stroke="blue" />
</svg>
```

Each tag can have properties, specified in the form `key=value`. With this in mind, we can interpret that both lines are blue (colour of their `stroke`), one starts in the position `10,10` and ends in the position `90,90` (making a diagonal) while the other starts in the position 10,90 and ends in the position `90,10` (making the inverted diagonal).

# Task 1.1 Draw a Line

We learned above how to represent a line in SVG.

Go to _Replit_ and create a new project for this Python programming assignment.

Create a file `main.py` and write a function `draw_line()` with the following parameters.

#### draw_line() Docstring

```python
"""
Format a line for SVG and return it as a string.
x -- Beginning of the line on the x-axis (pixels)
y -- Beginning of the line on the y-axis (pixels)
x2 -- End of the line on the x-axis (pixels)
y2 -- End of the line on the y-axis (pixels)
colour -- hexadecimal or colour name
"""
```

This function can be written in a single line. We recommend using the f-string as introduced in the previous assignment.

Call this function with the arguments of your choice and show its results to the user. Execute the code. The program should display one line of SVG describing the line.

![Animation Result Assignment 3 - Step 3]({{site.baseurl}}/assets/images/assignment4-step1-1.gif)

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step1-1)

# Task 1.2 Make the Drawing of a Cross

We can now rely on the `draw_line()` to create more elaborated drawings such as a cross.

<div style="text-align: center">
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" style="max-width: 200px;">
<line x1="10" y1="10" x2="90" y2="90" stroke="blue" />
<line x1="10" y1="90" x2="90" y2="10" stroke="blue" />
</svg>
</div>

When we make drawings, the SVG structure needs to start with `<svg>` and end with `</svg>` as shown above in the short SVG introduction. Then, we can draw two lines diagonally opposed, which represent a cross. Finally, return the drawing.

#### make_drawing_cross() Docstring

```python
"""
Make the SVG draw of a cross.
colour -- hexadecimal or colour name
"""
```

#### make_drawing_cross() Algorithm

```markdown
Initiate the drawing of size 100x100 with the SVG tag
Draw diagonal Top-left/Bottom-right
Draw diagonal Bottom-left/top-right)
Close the drawing with the SVG tag
Return the drawing
```

Create the function `make_drawing_cross()` and call this function with the colour of your choice. We recommend to create a constant COLOUR at the top of the file to use as argument when calling the function. Show its results to the user.

Execute the code. The program should display four line of SVG describing the cross. At this stage it becomes difficult to check if the function draws the cross properly.

Create a function `save_in_file()` which will write the SVG structure into a file. This will enable us to visualise the SVG.

#### save_in_file() Docstring

```python
"""
Save SVG drawing into a file.
path -- Where to save the file
svg_structure -- String representing the drawing
"""
```

We are familiar with file operation, the algorithm looks as follows:

#### save_in_file() Algorithm

```markdown
Open the file path in 'write' mode and keep it in the 'file' variable
Write content in file
Close the file path
```

Instead of showing the result of the function `make_drawing_cross()` to the user, we can use this result as an argument of the function `save_in_file()`. We recommend to create a constant PATH at the top of the file, containing the path of the SVG file such as `draw.svg`. Then, we can use this constant as argument when calling the function `save_in_file()`.

Execute the code. This time, the program should not display anything as it now write the result the file `draw.svg`. In the left panel, you should see this new file appearing. Click on it to show your drawing.

![Animation Result Assignment 3 - Step 3]({{site.baseurl}}/assets/images/assignment4-step1-2.gif)

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step1-2)

# Task 1.3 Draw the Drawing of Radial Lines

How to move from a cross to radial lines like the following drawing?

<div style="text-align: center">
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" style="max-width: 200px;">
<line x1="5" y1="5" x2="95" y2="95" stroke="blue" />
<line x1="5" y1="10" x2="95" y2="90" stroke="blue" />
<line x1="5" y1="15" x2="95" y2="85" stroke="blue" />
<line x1="5" y1="20" x2="95" y2="80" stroke="blue" />
<line x1="5" y1="25" x2="95" y2="75" stroke="blue" />
<line x1="5" y1="30" x2="95" y2="70" stroke="blue" />
<line x1="5" y1="35" x2="95" y2="65" stroke="blue" />
<line x1="5" y1="40" x2="95" y2="60" stroke="blue" />
<line x1="5" y1="45" x2="95" y2="55" stroke="blue" />
<line x1="5" y1="50" x2="95" y2="50" stroke="blue" />
<line x1="5" y1="55" x2="95" y2="45" stroke="blue" />
<line x1="5" y1="60" x2="95" y2="40" stroke="blue" />
<line x1="5" y1="65" x2="95" y2="35" stroke="blue" />
<line x1="5" y1="70" x2="95" y2="30" stroke="blue" />
<line x1="5" y1="75" x2="95" y2="25" stroke="blue" />
<line x1="5" y1="80" x2="95" y2="20" stroke="blue" />
<line x1="5" y1="85" x2="95" y2="15" stroke="blue" />
<line x1="5" y1="90" x2="95" y2="10" stroke="blue" />
<line x1="5" y1="95" x2="95" y2="5" stroke="blue" />
<line x1="5" y1="5" x2="95" y2="95" stroke="blue" />
<line x1="10" y1="5" x2="90" y2="95" stroke="blue" />
<line x1="15" y1="5" x2="85" y2="95" stroke="blue" />
<line x1="20" y1="5" x2="80" y2="95" stroke="blue" />
<line x1="25" y1="5" x2="75" y2="95" stroke="blue" />
<line x1="30" y1="5" x2="70" y2="95" stroke="blue" />
<line x1="35" y1="5" x2="65" y2="95" stroke="blue" />
<line x1="40" y1="5" x2="60" y2="95" stroke="blue" />
<line x1="45" y1="5" x2="55" y2="95" stroke="blue" />
<line x1="50" y1="5" x2="50" y2="95" stroke="blue" />
<line x1="55" y1="5" x2="45" y2="95" stroke="blue" />
<line x1="60" y1="5" x2="40" y2="95" stroke="blue" />
<line x1="65" y1="5" x2="35" y2="95" stroke="blue" />
<line x1="70" y1="5" x2="30" y2="95" stroke="blue" />
<line x1="75" y1="5" x2="25" y2="95" stroke="blue" />
<line x1="80" y1="5" x2="20" y2="95" stroke="blue" />
<line x1="85" y1="5" x2="15" y2="95" stroke="blue" />
<line x1="90" y1="5" x2="10" y2="95" stroke="blue" />
<line x1="95" y1="5" x2="5" y2="95" stroke="blue" />
</svg>
</div>

We can reuse the loop construct that we learned in the previous assignment. If we start from a top-left/bottom-right diagonal, we can increase `y` and decrease `y` till we reach the bottom. This would draw half the lines we need.

<div style="text-align: center">
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" style="max-width: 200px;">
<line x1="5" y1="5" x2="95" y2="95" stroke="blue" />
<line x1="5" y1="10" x2="95" y2="90" stroke="blue" />
<line x1="5" y1="15" x2="95" y2="85" stroke="blue" />
<line x1="5" y1="20" x2="95" y2="80" stroke="blue" />
<line x1="5" y1="25" x2="95" y2="75" stroke="blue" />
<line x1="5" y1="30" x2="95" y2="70" stroke="blue" />
<line x1="5" y1="35" x2="95" y2="65" stroke="blue" />
<line x1="5" y1="40" x2="95" y2="60" stroke="blue" />
<line x1="5" y1="45" x2="95" y2="55" stroke="blue" />
<line x1="5" y1="50" x2="95" y2="50" stroke="blue" />
<line x1="5" y1="55" x2="95" y2="45" stroke="blue" />
<line x1="5" y1="60" x2="95" y2="40" stroke="blue" />
<line x1="5" y1="65" x2="95" y2="35" stroke="blue" />
<line x1="5" y1="70" x2="95" y2="30" stroke="blue" />
<line x1="5" y1="75" x2="95" y2="25" stroke="blue" />
<line x1="5" y1="80" x2="95" y2="20" stroke="blue" />
<line x1="5" y1="85" x2="95" y2="15" stroke="blue" />
<line x1="5" y1="90" x2="95" y2="10" stroke="blue" />
<line x1="5" y1="95" x2="95" y2="5" stroke="blue" />
</svg>
</div>

Following the same principle, we can increase `x` and decrease `x2` to navigate the x-axis and complete the figure.

Define a function `make_drawing_radial_lines()`.

#### make_drawing_radial_lines() Docstring

```python
"""
Make an SVG draw composed of radial lines.
colour -- hexadecimal or colour name
"""
```

Write the Python code of `make_drawing_radial_lines()` to implement the following algorithm

#### make_drawing_radial_lines() Algorithm

```markdown
Initiate the drawing of size 100x100 with the SVG tag
Create variables x and y with initial value 5 (top-left)
Create variables x2 and y2 with initial value 95 (top-left)
For the height of the drawing, i with 5-pixel increments
Draw a line tilting y and y2 with +/- i
For the width of the drawing, i with 5-pixel increments
Draw a line tilting x and x2 with +/- i
Close the drawing with the SVG tag
Return the drawing
```

Execute the code and click on the `draw.svg` file to check the result.

While exploring SVG, we reviewed the important concepts from the previous assignments: loops and functions. In the next step, we take a step back to improve the reusability of the code.

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step1-3)

This step was inspired by the work of [Amanda J Hogan](https://2019.pycon-au.org/talks/pretty-vector-graphics--playing-with-svg-in-python)

[Next: Step 2 - Refactoring]({{site.baseurl}}/assignments/04-generative-art/step2){: .btn .btn-purple }
