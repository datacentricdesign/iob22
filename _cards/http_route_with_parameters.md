---
link-assignment: /assignments/04-generative-art/step3/#task-33-serve-drawing-with-optional-parameters
---

# Task 3.2 Serve Drawing with Parameters

The next step is to make the HTTP route reusable for a larger set of requests. We want to map information from the URL into argumments for the function make_drawing_radial_lines(). Flask has a convenient way to do mapping. We can specify the parameters in the URL, wrapped between lower than `<` and greater than `>` signs. Then, we add these parameters to the connected function.

#### Serving Custom Radial Lines Algorithm

```markdown
Define an HTTP route /radial/<width>/<height> to serve custom radial lines drawings
Define the function 'serve_custom_radial_lines()' and connect it to the route /radial/<width>/<height>
Convert parameters width and height into integers
Make drawing radial lines with width and height, and return the result
```

The 'Custom Radial Lines' algorithm receives the request, for example, on the route `/radial/200/100`. `200` and `100` are are the arguments for the parameters `width` and `height`. Flask atomatically map them to the function `serve_custom_radial_lines(width, height)`.

Write the code for the route `/radial/<width>/<height>` connected to `serve_custom_radial_lines()`.

Execute the code and load the web page with the route, for example, `/radial/100/200`.

![Animation Result Assignment 3 - Step 2]({{site.baseurl}}/assets/images/task-4-3-3-blank.gif)

Oh, white page, nothing happens, no error!

Let's investigate. To make the radial lines drawing, we call the function `make_drawing_radial_lines(width, height)`, using the argument received from URL. However, if we look into the file `drawing.py`, we defined this function as follows:

```python
def make_drawing_radial_lines(colour="black",
                              width=100,
                              height=100,
                              granularity=5):
```

It starts with the parameter `colour`, and then the `width` and `height`. Thus, we currently call this function providing the argumment `width` to the parameter `colour` and the argument `height` to the parameter `width`. Python does not raise an error because all parameters have default values. However, the colour of value `100` does not represent any colour: nothing appears on the screen.

To solve this issue, there are three options:

- add the colour parameter in the URL so that we can provide this argument, i.e. `/radial/<colour>/<width>/<height>`
- add a default colour when we call the function, i.e. `make_drawing_radial_lines("red", width, height)`
- specify arguments with keywords

Keywords arguments? Indeed, we can explicitly specify the parameter to which each arguments refer. This approach remmove the need for a strict position of each argument. The call would look as follows:

```python
make_drawing_radial_lines(width=width, height=height)
```

Note the parameter is on the left (as specified in the function definition) and the argument is on the right (as received from the URL).

Update the code and execute the code. When refreshing the web page, you should see the radial lines drawing with the specified width and height.

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step3-2)

# Task 3.3 Serve Drawing with Optional Parameters

We avoided to specify the colour for each HTTP request. However, it would be convenient to change the colour of the drawing. To provide optional argument in the URL, we can use the following structure:

```
/radial/<width>/<height>?colour=yellow&granularity=10
```

The optional arguments start with a question mark `?`, then additional arguments are separated with an ampersand `&`. Each argument is provided with its `name` and its `value` connected by an equal sign `=`.

In Python, Flask enables to extract these optional arguments with the request module. Let's import request fromm flask at the top of `main.py`.

```python
# Import the object Flask and request from flask module
from flask import Flask, request
```

To extract an optional argument we can call the function `request.args.get()`. For the argument 'colour', the call would look as follows:

```python
# Check for optional parameter colour as string, otherwise set the colour as "black"
colour = request.args.get('colour', default = "black", type = str)
```

Write the code to extract the colour and granularity arguments from the URL and pass them to the function `make_drawing_radial_lines()`.

Execute the code and refresh, add request the web page with the optional arguments.

![Animation Result Assignment 3 - Step 3]({{site.baseurl}}/assets/images/task-4-3-4.gif)

[Check the code on Replit](https://repl.it/@IO1075/04-generative-art-step3-3)