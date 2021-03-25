---
link-assignment: /assignments/06-landing-page/step1/#task-11-build-the-foundation-of-the-landing-page
---

# Task 1.1 Build the Foundation of the Landing Page

Let's start with what we already know from the previous assignments. Go to _Replit_ and create a new project for this Python programming assignment. Create a static folder with the file `index.html`. This file defines the structure of our page. Copy and paste the following `HTML` as a starting point:

* the `doctype` tells the web browser that the file is an HTML document;
* `<html>` defines the boundaries of this document;
* `<head>` provides the metadata such as `<title>` appearing at the top of the tab and the `<style>` tag for the `CSS` styling;
* `<body>` contains the structure for the page.

```html
<!DOCTYPE html>
<html>
<head>
    <title>The Revolutionary Product</title>
    <style>

    </style>
</head>
<body>
</body>
</html>
```

In the `<body>`, add a `<header>` with a fancy product name. Feel free to adjust the `<title>` to match your header's name. Add a `<main>` to host the details of the landing page.

At this stage, it is convenient to see how the web page looks like in the web browser. Let's set up our webserver to serve `index.html`. First, go to the package manager and install _Flask_, the Python package we use to make a webserver. Have a look at Task 3.1 of Assignment 4 if you are struggling to find your way with this. Second, in `main.py`, use the following structure to get your webserver to serve `index.html`.

#### Landing Page HTTP Routes

```markdown
Import the object Flask and request from flask module

Create a webserver object called 'Landing Page' and keep track of it in the variable called server

Define an HTTP route / to serve the landing page
Define the function 'serve_index_page()' and connect it to the route /
Return the static file 'index.html'

Start the webserver
```

Run the code and trigger the route `/` to see how your web browser interprets `index.html`. At this stage, we can see the fancy product name.

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step1-1)