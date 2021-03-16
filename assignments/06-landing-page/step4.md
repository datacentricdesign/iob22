---
layout: default
title: Step 4 Data Collection
parent: "06 Landing Page"

---

# Step 4 Data Collection (1hr, 🏗)
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

Our data model is ready on the webserver. We can handle customers and pre-orders. In this step, make the link between the web broswer and the webserver by designing a web form and receiving the data on the server.

# Task 4.1 Design a Data Form on the Landing Page

The web form looks as follows:

![Assignment 6 - Step 4.1 Web Form]({{site.baseurl}}/assets/images/assignment6-step4-1.png)

Back in `index.html`, let's add a new `<section>` inside `<main>` to host this web form. We give it the id 'preorder' so that we can refer to it in the `CSS`. We already set all section on absolute position, so we can use `top` to push the section down as much as we need. The `padding` leaves a space between the border and the text of the section. We can also use the `box-shadow` property for the shadow effect as we did for the COVID dashboard.

```css
#preorder {
    top: 400px;
    padding: 5px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}
```

The heading of the section is smaller than the product name, we can use a `<h2>`, to make italic we use the tag `<i>`. If it fit better on two lines, `<br>` forces a new line. Then, we have the `<form>`. This tag has two properties:

* `action`: where to send the form. We send it to the HTTP route `/preorders` which we create in the next step;
* `method`: the HTTP method (e.g. GET, POST). We want to send data rather than getting it from the server, thus we use 'post'.

In the `<form>` we define web form component such as text input, drop-down menu and buttons. These three component are illustrated in the following code.

```html
<form action="/preorders" method="post">
    <input type="text" name="first_name" placeholder="First name" />
    Size: <select name="size">
          <option value="s">Small</option>
          <option value="m">Medium</option>
          <option value="l">Large</option>
        </select>
    <input type="submit" value="PRE-ORDER!" />
<form>
```

This results in the following three web form components:

<input type="text" name="first_name" placeholder="First name" />
Size: <select name="size">
        <option value="s">Small</option>
        <option value="m">Medium</option>
        <option value="l">Large</option>
    </select>
<input type="submit" value="PRE-ORDER!" />

The `<input>` with the type `text` gives the textbox. The property `name` is important. It will be the name attached to the data when reaching the server. The `placeholder` is the text that appear when the textbox is empty.

<input type="text" name="first_name" placeholder="First name" />

The `<select>` represents the drop down menu with a similar property `name`. In this case the value does not come from the user typing in, but from the selection. Each option is defined with `<option>` and a property `value` which is sent (if selected) to the server, attached to the `name` 'size'.

Size: <select name="size">
    <option value="s">Small</option>
    <option value="m">Medium</option>
    <option value="l">Large</option>
</select>

The `input` with the type `submit` represents the button that triggers sending the data to the server.

<input type="submit" value="PRE-ORDER!" />

To complete the form, we still need the following:

* A textbox for the `last_name`;
* A textbox for the `email`. Tip: change the type from 'text' to 'email' so that the web browser automatically check if the user properly typed in an email address;
* A drop-down menu for the `number_products`
* A drop-down menu for the `colour`

Finally, we can add a `<p>` with a note on privacy, because we do care about our customers' privacy.

Run your code to check if it look as you expect.

[Check the code on Replit](https://replit.com/@IO1075/06-landing-page-step4-1)

# Task 4.2 Receive Data on the Webserver

When the visitor click on the 'submit' button, the web browser sends an HTTP request to the webserver on the route `/preorders` via the `POST` method. The data from the form is attached to the request. Thus, we need to define an HTTP route `/preorders` triggered on the `POST` method to receive this data.

In `main.py`, first import the classes `Customer`, `PreOrder` and `Store` from the `model`. Then, construct a `Store`, so that we can keep the data as it arrive from the web broswer.

The function `receive_preorders()` connected to the HTTP route `/preorders` looks as follows:

#### HTTP Route POST /preorders - Algorithm

```markdown
Define an HTTP route /preorder with the HTTP method 'POST' to receive pre-orders
Define the function 'receive_preorders()' and connect it to the route /preorders
    Extract 'first_name' from the form
    Extract 'last_name' from the form
    Extract 'email' from the form
    Construct a Customer with the email, first_name and last_name

    Extract 'number_products' from the form
    Extract 'size' from the form
    Extract 'colour' from the form
    Construct a PreOrder with the number_products, size and colour
    Add the pre_order to the customer

    Add the customer to the store

    Return "Thank you for your pre-order, we'll be in touch soon."
```

In this function we need to specify the HTTP method,

```python
@server.route('/preorders', methods=['POST'])
```

Then, we need to extract data received from the web form. At the top of the file, import the module `request` from the `flask` package. The data is structured as a Dictionary. Thus, to access the 'first_name', we use the key `first_name` from the form, such as:

```python
first_name = request.form['first_name']
```

For the rest, constructing Customer and PreOrder objects and adding them to the Store is something we did many times through testing in the previous step.

#### HTTP Route POST /preorders - Result

![Assignment 6 - Step 4.2 Result]({{site.baseurl}}/assets/images/assignment6-step4-2-result.png)

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step4-2)


# Task 4.3 Serve PreOrder Data

In this third task, we want to double-check if our store keep track of the pre-orders placed via the landing page. It would be also convenient to have an API to check the pre-order list at all time. Thus, in `main.py` we create an HTTP route '/preorders' as follows:

```markdown
Define an HTTP route `/preorders` to serve the list of all pre-orders
Define the function 'serve_preorders()' and connect it to the route /preorders
    Create an empty list 'pre_order_list'
    For each pre_order in the store
        Add the pre_order as a dictionary to pre_order_list
    Return pre_order_list wrapped into a dictionary with the key 'preorders'
```

Remember that to get all the pre-orders from the store, we implemented the method `totalListPreOrders()`. We also implemented the method `toDict()` to make a PreOrder object into a Dictionary.

Note this is the second time we define the HTTP route `/preorders`. This is possible because the first route uses the method `POST` (to send data to the server) and the second route uses the method `GET` (to receive data from the server).

#### HTTP Route GET /preorders

![Assignment 6 - Step 4.3 Result]({{site.baseurl}}/assets/images/assignment6-step4-3-result.png)

Rerun the code and trigger the route `/preorders` to check that the 

[Check the code on Replit](https://repl.it/@IO1075/06-landing-page-step4-3)

Done! We have a working programme, serving a landing page, collecting pre-orders with an API to check their details. The issue with our programme is that everything is kept in a Dictionary, in memory. Each time we restart the programme, we loose all our Customers and PreOrders. We address this issiue with a database in the next step.

[Next: Step 5 - Database]({{site.baseurl}}/assignments/06-landing-page/step5){: .btn .btn-purple }