---
link-assignment: /assignments/06-landing-page/step4/#task-42-receive-data-on-the-webserver
---

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