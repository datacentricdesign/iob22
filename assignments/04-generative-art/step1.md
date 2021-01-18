---
layout: default
title: Step 1 Review
parent: "04 Generative Art"
---

# Step 1 Review
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## What is SVG

In this initial step, we will only use Python syntax we already encountered in the previous assignments. We will particularly reuse `functions`, `loops` and `files`. However, we need to introduce what we will play with: Scalable Vector Graphics (SVG). You might use tools such as Illustrator or Inkscape to draw on your computer. These tools are keeping track of what we draw as a list of objects. SVG is a data format to save all the information related to these objects: colour, size, position, etc.

In this step, we will explore a basic drawing element: the line. The following SVG draws two blue lines, forming a cross as follows:

<div style="text-align: center">
    <svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" style="max-width: 100px; text-align: center">
        <line x1="10" y1="10" x2="90" y2="90" stroke="blue" />
        <line x1="10" y1="90" x2="90" y2="10" stroke="blue" />
    </svg>
</div>

The following text is the SVG representation of this drawing. The data is structured with tags delimited by `<` and `>`. This is an `XML` data structure. In this example, we can see an `svg` tag which shows the start `<svg>` and the end `</svg>` of our drawing. The two lines are specified with the tag `<line>`.

```xml
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <line x1="10" y1="10" x2="90" y2="90" stroke="blue" />
  <line x1="10" y1="90" x2="90" y2="10" stroke="blue" />
</svg>
```

Each tag can have properties, specified in the form `key=value`. With this in mind, we can interpret that both lines are blue (colour of their `stroke`), one starts in the position `10,10` and ends in the position `90,90` (making a diagonal) while the other starts in the position 10,90 and ends in the position `90,10` (making the inverted diagonal).

# Task 1.1 Draw a Line

[TODO Explanation: A function to draw a line]

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step1-1)

# Task 1.3 Draw a Cross

[TODO Explanation: Function with cross]

[TODO Explanation: Save into file, see SVG result]

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step1-2)

# Task 1.4 Draw Radial Lines

[TODO Explanation: Use loops for repeating lines in radials]

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step1-3)

# Task 1.4 Draw any Radial Lines

[TODO Explanation: Generalise the radial function with parameters]

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step1-4)