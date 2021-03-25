---
link-assignment: /assignments/06-landing-page/step3/#task-31-define-customer-method-addpreorder
---

# Task 3.1 Define Customer Method addPreOrder()

First, the method `.addPreOrder()` would be convenient to add a pre-order to a customer each time we receive one from the landing page.

#### Append Element to a List

![Assignment 6 - Step 3.1 Append Element to a List]({{site.baseurl}}/assets/images/assignment6-step3-1-append-to-list.svg)

To implement this method, we can use the `.append()` method from the attribute `.preOrderList` to add the new PreOrder.

#### addPreOrder Method DocString

```python
        """
        Add one pre-order to the customer's list of pre-orders.

        Parameters:
            new_pre_order: new pre-order to add to the existing customer's list
        """
```

To check that the method works as we expect, we can write a test methods. Read through the following test method to make sure you understand what it does. Add it to the list of test in `test.py` and rerun the tests. If everything ran smoothly, 3 tests ran and ended with 'OK'.

#### 🧪 addPreOrder Test Method

```python
    def testCustomerAddPreOrder(self):
        my_customer = Customer("bob@test.com", 'Bob', 'Tester')
        my_customer.addPreOrder(PreOrder(4, "s", "red"))
        self.assertEqual(len(my_customer.preOrderList), 1,
                         "At this stage, the list should have 1 PreOrder.")
        my_customer.addPreOrder(PreOrder(2, "l", "blue"))
        self.assertEqual(len(my_customer.preOrderList), 2,
                         "At this stage, the list should have 2 PreOrders.")

        self.assertEqual(my_customer.preOrderList[0].colour, "red",
                         "The colour of the first PreOrder should be red.")
        self.assertEqual(my_customer.preOrderList[1].size, "l",
                         "The size of the second PreOrder should be l.")
```