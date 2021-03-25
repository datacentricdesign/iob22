---
link-assignment: /assignments/04-generative-art/step1/#what-is-svg
---
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