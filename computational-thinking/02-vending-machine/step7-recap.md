---
layout: default
title: Step 7 Recap and More
parent: "02 Vending Machine"
grand_parent: "Computational Thinking"
---

# Step 7 Recap and More
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## What did we cover?

We covered a lot of ground through the construction of this vending machine algorithm. The branches provide different alternatives to your algorithms. You can save and retrieve information from files. With this ability and the endless combination of operators and conditions, you can now design and implement your Vending Machine algorithm. Here are four tasks you can explore to expand your algorithm


# Extra Task 7.1 Add More Beverages

Add additional beverages and the related conditions, such as hot chocolates, cappuccinos and decaf coffee.

[Check the code on Replit](https://replit.com/@dcdlab/vending-machine-step7-1)

# Extra Task 7.2 Prevent Serving Beverage

Check the number of remaining cups and define behaviour when there is nothing left.

[Check the code on Replit](https://replit.com/@dcdlab/vending-machine-step7-2)

# Extra Task 7.3 No unnecessary question

Do not ask for sugar or milk if the choice of beverage is unknown or has milk by default (e.g. cappuccino).

[Check the code on Replit](https://replit.com/@dcdlab/vending-machine-step7-3)

# Extra Task 7.4 Manage Sugar and Milk

Keep track of sugar consumption (like the number of cups), save it, and retrieve it from files.

[Check the code on Replit](https://replit.com/@dcdlab/vending-machine-step7-4)

Go ahead and share your Vending Machine algorithm on Discourse! Make sure to provide a title and a short description that capture what makes it YOUR algorithm.

# Extra Task 7.5 Debug this code

The following code does not always serve the right beverage. This vending machine is supposed to serve coffee, tea, hot chocolate, cappuccino, and decaf coffee. But for some reason, it only serves coffee.

Look through the code to locate the origin of this unexpected behaviour. Use the logging module to help debug this code.

```python
# Import and configure the logger
# this logs to file and prints logs in a format that shows the line number, logging level, and the logging message
import logging
logging.basicConfig(filename='example.log', format='%(lineno)d %(levelname)s:%(message)s', level=logging.DEBUG)
# Try to do something
try:
    # Open the file cups.txt in 'read' mode and keep it in the 'cup_file' variable
    cup_file = open("cup.txt", "r")
    # Read the number of remaining cup from cup_file as text
    file_text = cup_file.read()
    # Convert number_remaining_cups into a number
    number_remaining_cups = int(file_text)
    # Close the file cup.txt
    cup_file.close()
    logging.info("Read the cup file")
# If it fails
except:
    # Create a variable called number_remaining_cups of type int with the initial value 10
    logging.warning("There was no cup file")
    number_remaining_cups = 10

# Tell the user "Welcome to IDE Hot Beverage service!"
print("Welcome to IDE Hot Beverage service!")

if number_remaining_cups == 0:
    # Tell the user "There is no cup left."
    print("Sorry, there is no cup left.")
else:
    # Tell the user "Here is what we offer:"
    print("Here is what we offer:")
    # Tell the user "1) Coffee"
    print("1) Coffee")
    # Tell the user "2) Tea"
    print("2) Tea")
    # Tell the user "3) Hot Chocolate"
    print("3) Hot Chocolate")
    # Tell the user "4) Cappuccino"
    print("4) Cappuccino")
    # Tell the user "4) Decaf Coffee"
    print("5) Decaf Coffee")

    # Create a variable called choice of type number with the initial value 0
    choice = 0
    # Ask the user "Type in your choice: " and store the answer in choice
    choice = input("Type in your choice: ")

    # Try to do something
    try:
        # Convert choice to integer and store in choice
        choice = int(choice)
        logging.info("The choice was: %s", choice)
    # If it fails for a ValueError
    except ValueError as error:
        # Tell the developer what happenned
        print(error)
        # Tell the user what happenned
        print("I could not understand your answer :(")
        # Put a 0 in choice, an option the is not available but valid
        choice = 0
    # In any case
    finally:
        # Tell both users and developer what was done
        print("Selected: " + str(choice))

    # Ask the user "Sugar (0-5): " and store the answer in sugar
    sugar = input("Sugar (0-5): ")
    # Ask the user "Milk (y/n): " and store the answer in sugar
    milk = input("Milk (y/n): ")

    # Create a variable called message of type string with the initial value ""
    message = "Here is your "

    # If choice is coffee without sugar nor milk
    if choice == 1 and sugar == "0" and milk == "n":
        # Add to message "Here is your black coffee."
        message += "black coffee"
        # Decrease number of cups
        number_remaining_cups -= 1
        logging.debug("Serving black coffee")
    # Else if choice is equal to 1
    elif choice >= 1:
        # Add to message "Here is your coffee."
        message += "coffee"
        # Decrease number of cups
        number_remaining_cups -= 1
        logging.debug("Serving coffee")
    # Else if choice is equal to 2
    elif choice == 2:
        # Add to message "Here is your tea."
        message += "tea"
        # Decrease number of cups
        number_remaining_cups -= 1
        logging.debug("Serving tea")
    # Else if choice is equal to 2
    elif choice == 3:
        # Add to message "Here is your tea."
        message += "hot chocolate"
        # Decrease number of cups
        number_remaining_cups -= 1
        logging.debug("Serving hot coffee")
    # Else if choice is equal to 2
    elif choice == 4:
        # Add to message "Here is your hot."
        message += "cappuccino"
        # Decrease number of cups
        number_remaining_cups -= 1
        logging.debug("Serving cappuccino")
    # Else if choice is equal to 2
    elif choice == 5:
        # Add to message "Here is your decaf coffee."
        message += "decaf coffee"
        # Decrease number of cups
        number_remaining_cups -= 1
        logging.debug("Serving decaf coffee")
    # Otherwise this is not a known choice
    else:
        # Add to message "Sorry, I do not know this choice."
        message += "Sorry, I do not know this choice."
        logging.debug("choice not recognise")

    # Add to message whether the user take their beverage with or without sugar
    if sugar == "0":
        message += ", without sugar"
    else:
        message += ", with sugar"
        # Convert sugar into integer
        sugar = int(sugar)
        # If sugar greater than 3
        if sugar >= 3:
            # Add to message a healthy comment
            message += " (Wow! that's sweat!)"

    # Add to message whether they take their beverage with or without milk
    if milk == "y":
        message += " and with milk."
    else:
        message += " and without milk."

    # Tell the user message
    print(message)

    # Open the file cups.txt in 'write' mode and keep it in the 'cup_file' variable
    cup_file = open("cup.txt", "w")
    # Convert number_remaining_cups into string
    file_text = str(number_remaining_cups)
    # Write the number of remaining cup in cup_file
    cup_file.write(file_text)
    # Close the file cup.txt
    cup_file.close()

    # Tell the user "Have a great day!"
    print("Have a great day!")

    # Tell the user "BTW, there are " number_remaining_cups "  cups left!"
    print("BTW, there are " + str(number_remaining_cups) + " cups left!")
```

[Check the code on Replit](https://replit.com/@dcdlab/vending-machine-step7-5)
