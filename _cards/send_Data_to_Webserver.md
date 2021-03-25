---
link-assignment: /assignments/06-landing-page/step4/#task-43-serve-preorder-data
---

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