---
layout: default
title: Step 1 Review
parent: "Landing Page"
grand_parent: "Practice"
---

# Step 1 Review (1hr, ✅)
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---


In this review step, we reuse the `HTML` (structure) and `CSS` (style) elements from the previous assignment. We develop the layout of the landing page.

**Disclaimer** Do not take the style of these web pages as a good design! As designers, we grant you to do better. However, keep in mind that Step 2 (`Class`) and Step 4 (`Databases`) are the most important steps.
{: .fs-5 .ls-10 .code-example .bg-yellow-000}

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

# Task 1.2 Hook Potential Customer

The role of this page is to hook some potential customer. For this, we can use headings to emphasise key messages and create a section 'teaser' with a strong message. In `<header>`, place your fancy product name into `<h1>`. In `<main>`, add a `<section>` with the id `teaser`, add a `<h2>` with a short message such as _Some awesome features_ and add two or three `<p>` (for paragraph) with fancy keywords _Awesomeness_, _Crazyness_ and _And more!_.

Effective landing pages rely on strong visual. Thus, we start styling our web page with a background image. You can pick one of your own. We found one on [Pexel](https://www.pexels.com), which we can use without restriction [White Blank Notebook by Tirachard Kumtanom](https://www.pexels.com/photo/white-blank-notebook-733857/). Once you have the image file, create a folder `static/assets/images` in your _Replit_ project and upload it to this folder. In this step, we refer to this file as `background.jpg`.

In `index.html`, inside `<body>`, we add a `<footer>` with a link to the source of our background image using `<a>` as follows:


#### <footer> and <a> HTML Tags

```html
<footer>
    <a href="https://www.pexels.com/photo/white-blank-notebook-733857/">
        Background Photo by Tirachard Kumtanom from Pexels
    </a>
</footer>
```

We can use the image as a background of the body element to cover the whole page. We define the `CSS` property at the top of `index.html`, inside `<style>`. We touch on the margin, set the image and select a font for the text of the page:

#### <body> CSS properties

```css
body {
    margin: 0; /* remove the margin to avoid a white border around the page */
    background-image: url('/assets/images/background.jpg'); /* set the path to the background image */
    background-size: cover; /* extend the image so that it cover the whole page */
    height: 100%; /* ensure the body take the full page's height */
    font-family: Arial; /* set a font for the whole page */
}
```

Refreshing the page, we can notice the change of font, but the image does not appear. We did not tell the webserver to serve the page. In `main.py`, we need to add a route to serve any file we have in the folder `static/assets`. Import the function `send_from_directory` from the module `flask` and define the following route:

#### Assets HTTP Routes

```python
# Define an HTTP route /assets/<path:path> to serve asset files such as the background image
@server.route('/assets/<path:path>')
# Define the function 'serve_asset_files()' with the parameter 'path' and connect it to the route /assets/<path:path>
def serve_asset_files(path):
    # Return the static file 'path' from the folder '/assets/'
    return send_from_directory(server.static_folder + '/assets/', path)
```

The end of the route is dynamic. Anything coming after `/assets/` is part of the string argument `path` for the function `serve_asset_files()`. This function uses `send_from_directory` to look for a file a the specified path.

Rerun the code and trigger the route `/` to check the background.

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step1-2)

# Task 1.3 Fine-tune the Style

We want to position the text based on the image's position. It is entirely related to the image you choose. In this example, there is more room on the right side of the image to see the text. We propose the following `CSS` adjustments.

#### Position CSS properties

```css
header,
section {
    position: absolute;
    right: 100px;
    text-align: center;
    width: 400px;
}

header {
    top: 100px;
    font-size: 20px;
}

footer {
    position: absolute;
    bottom: 20px
}

#teaser {
    top: 220px;
}
```

Note the first block, which applies styling property to both `<header>` and `<section>` tags. With the `absolute` position, elements are not constraint by the sequence, so we can place them to the `top`, `right`, `left` and `bottom` of their container (in this case, the `<body>` element).

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step1-2)

![Assignment 6 - Step 1.3]({{site.baseurl}}/assets/images/assignment6-step1-3-result.png)

At this stage, we have a landing page to tease customers. In the next step we implement the data model for the webserver to manage the data from this web page.

[Next: Step 2 - Classes and Tests]({{site.baseurl}}/assignments/06-landing-page/step2){: .btn .btn-purple }