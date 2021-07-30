---
layout: default
title: Computational Thinking
has_children: true
nav_order: 1
---

# From Design to Computational Thinking with Python
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# Introduction

Welcome to this practical introduction to computational thinking for designers. As Industrial Design Engineers you are trained to master Design Thinking. Through this process, you empathise, define, ideate, prototype and test. As digital technology is becoming ubiquitous, your design solutions and your design process are impacted.

Your products embed or rely on computers to realise some of its functionalities, your prototype involves computers to test and analyse the feasibility of your solutions, your data combines qualitative and quantitative material to properly understand the challenges to address. For each of these tasks, you need the appropriate understanding about how computers manipulate information and how you can teach computers what you want them to do.

Along with your design thinking, this series of Python programming assignments aims to get you acquainted to another, complementary approach: computational thinking. Computational thinking relies on four steps. First, we decompose the problem into smaller parts, breaking it down to specifically identify each component of the problem to solve. Then, we look for patterns, similarities which can be tackled the same way. This leads us to elaborate components for our design that we can reuse for a whole category of problems (generalisation), that we can reuse without looking inside (abstraction). Finally, we design an algorithm, a set of instructions that tells the computer what to do.

By the end of this series of Python programming assignments, you should have the confidence to use the computational thinking approach to teach computers simple tasks to perform. You should be able to break down simple problems into plain English instructions so that you can autonomously look them up on the Internet for the Python syntax that is not yet in your toolbox.

Disclaimer! While we are convinced that designers should get acquainted to computational thinking in a way that fits their discipline, we do not pretend we have the solution yet. We welcome your comments and suggestion for improvement. Reach out to Jacky (j.bourgeois@tudelft.nl)
{: .fs-5 .ls-10 .code-example .bg-yellow-000}

# Python Programming Assignments

The Python programming assignments are accessible on this website, via the left panel or from the overview further down this page. They have an introductory video discussing and demonstrating the whole assignment. Each step is described in the text.

Apart from the first one, each assignment starts with a review of the elements covered in the previous assignment. Then, it explores new elements or iterates on some challenging elements already covered. Finally, it offers a series of extra tasks for you to explore if you feel like exploring further. We attributed each assignment a series of labels to indicate the type of element you will learn:

Concepts
{: .label .label-green }

Data Types
{: .label .label-blue }

Technology
{: .label .label-yellow }

Input/Output
{: .label .label-red }

Package
{: .label .label-purple }

We choose Python as a language, an overarching choice of TU Delft and many other institutions around the world as it enables a gradual immersion into software development. Each step of the way, assignments lead you to think about the algorithm and introduce Python syntax when necessary. You are in charge to implement the algorithm in Python, but the solution is just one click away if you get lost.

We expect each assignment to take about eight hours. As part of our Bachelor course, we expect you to complete one a week. When something is not working as expected, that you do not understand how to move forward, please look at the [Discourse](https://discourse.datacentricdesign.org) for questions related to the Python programming assignment you are working on. Open a new topic for any question that is not yet on Discourse. We encourage you not only to ask questions, but answer the one you feel like, from other students. Please upvote a question that you have as well, and the answer that helped you.

See our template to ask questions that provide enough information for us and other students to help you effectively. It appears automatically whenever you open a new topic in the [Code Assignments](https://discourse.datacentricdesign.org/c/code-assignments/) category. 

### [Development Environment]({{site.baseurl}}/environment)

Before starting, it is important to know the basics of the tool we will use. This initial tutorial gives you a tour of the development environment we use for this series of Python programming assignments.

IDE
{: .label .label-yellow }

Replit
{: .label .label-purple }

### [01 Calculator]({{site.baseurl}}/assignments/01-calculator)

The first Python programming assignment leads you through the design of your first algorithm to mimic a calculator, adding two numbers provided by the users. Through this example, we introduce the concept of variables and data types along inputs and outputs to receive and send information to the user. We also discuss how to investigate (or debug) the code when the result is not the one you expect.

Variable
{: .label .label-green }

Input
{: .label .label-green }

Output
{: .label .label-green }

Algorithm
{: .label .label-green }

Data Type
{: .label .label-green }

Assignment
{: .label .label-green }

Number
{: .label .label-blue }

String
{: .label .label-blue }

Terminal
{: .label .label-red }

Debug
{: .label .label-yellow }

### [02 Vending Machine]({{site.baseurl}}/assignments/02-vending-machine)

How would you shape the behaviour of your favourite vending machine? In the second Python programming assignment, you will prototype some logics with operators and conditions to drive through alternative paths in your program. This will shape the behaviour of a hot beverage vending machine depending on the user choices. You will also use files to store and retrieve available supply such as the number of remaining cups or the amount of sugar.

Branch
{: .label .label-green }

Compound statement
{: .label .label-green }

Operator
{: .label .label-green }

Boolean
{: .label .label-blue }

Object
{: .label .label-blue }

File
{: .label .label-red }

Flow chart
{: .label .label-yellow }


### [03 eReader]({{site.baseurl}}/assignments/ereader)

In the third Python programming assignment, you will build an eReader loading an eBook in the Terminal and enabling the user to 'turn the page'. This exercise will reveal the need for loops to repeat part of the code which you will wrap (or encapsulate) into a reusable function. You will experience the four steps of computational thinking: decomposition, recognition, generalisation/abstraction and algorithm design.

Function
{: .label .label-green }

Encapsulation
{: .label .label-green }

While-Loop
{: .label .label-green }

For-Loop
{: .label .label-green }

String
{: .label .label-blue }

Object
{: .label .label-blue }

File
{: .label .label-red }

Flow chart
{: .label .label-yellow }

### 04 Generative Art

In the fourth Python programming assignment, you will move the user interaction from the Terminal to the web browser. You will organise the code in several files and rely on code from other developers by importing modules. You will create an algorithm that generates random Scalable Vector Graphics (SVG) that you can expose on the web. 

While-Loop
{: .label .label-green }

For-Loop
{: .label .label-green }

String
{: .label .label-blue }

web endpoint
{: .label .label-red }

SVG
{: .label .label-red }

import
{: .label .label-yellow }

Flask
{: .label .label-purple }

### 05 COVID-19 Dashboard

In the fifth Python programming assignment, you will continue exploring web interfaces. You will request data from a web service to collect the latest COVID-19 statistics. You will process this information, exploring time series and data format. Based on this data, you will expose a series of charts on the web.

Data
{: .label .label-green }

Dictionary
{: .label .label-blue }

List
{: .label .label-blue }

JSON
{: .label .label-red }

Chart
{: .label .label-yellow }

Web Service
{: .label .label-yellow }

Vega
{: .label .label-purple }

### 06 Landing page

In this sixth Python programming assignment, you catch potential customers via a landing page. You expose a product concept on the web and invite potential customers to sign up for a pre-order. You structure your software with objects and store data in a database. You visualise pre-orders on a dashboard.

Class
{: .label .label-green }

Property
{: .label .label-green }

Methods
{: .label .label-green }

Object
{: .label .label-blue }

Dictionary
{: .label .label-blue }

List
{: .label .label-blue }

Database
{: .label .label-yellow }

### 07 Shared Pomodoro

In the seventh Python programming assignment, you develop the state-machine algorithm of a Pomodoro time-tracker. You make your web application more dynamic with the use of web sockets and let your Python programme runs several processes in parallel using `threads`.  

Thread
{: .label .label-green }

Web Socket
{: .label .label-red }

State Machine
{: .label .label-yellow }


### 08 Connected Home

At this stage, you used different Objects and their methods such as a File or a List. In the sixth Python programming assignment, you will look behind the Object and what they are into the paradigm of Object-Oriented Programming. Modelling a Home Hub and its appliances, you will explore this paradigm as a powerful abstraction mechanism.

Abstraction
{: .label .label-green }

Inheritance
{: .label .label-green }



# What's next?

Enough practicalities and theory, the next step is to get familiar with the development environment. For this, you will only need your favourite web browser, so let's jump in!

[Next Step: Software Development Environment]({{site.baseurl}}/environment){: .btn .btn-purple }
