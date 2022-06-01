---
layout: default
title: Computational Thinking
has_children: true
nav_order: 9
---

# From Design to Computational Thinking with Python
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# Introduction

Welcome to this practical introduction to Computational Thinking for designers. As Industrial Design Engineers, you continuously train yourself to master Design Thinking. Through this process, you __empathise__, __define__, __ideate__, __prototype__ and __test__. As digital technology becomes ubiquitous, it impacts your design solutions and design process.

Your products embed or rely on computers to realise some of their functionalities. Your prototype involves computers to test and analyse the feasibility of your solutions. Your data combines qualitative and quantitative material to understand the challenges to address appropriately. For each of these tasks, you need a proper understanding of how computers manipulate information and how you can teach computers what you want them to do.

Along with your Design Thinking, this series of Python programming assignments aims to get you acquainted with another complementary approach: Computational Thinking. Computational Thinking relies on four steps. First, we **decompose the problem** into smaller parts, breaking it down to identify precisely each component of the problem to solve. Then, we **look for patterns**, similarities that we can tackle the same way. Third, it leads us to **elaborate components** for our Design that we can reuse for a whole category of problems (generalisation) that we can reuse without looking inside (abstraction). Finally, we **design an algorithm**, instructions that tell the computer what to do.

By the end of this series of Python programming assignments, you should have the confidence to use the Computational Thinking approach to teach computers simple tasks to perform. In addition, you should be able to break down simple problems into plain English instructions. Finally, you should be able to autonomously search the Internet for the Python syntax that is not yet in your toolbox.

Disclaimer! While we believe that industrial designers should get acquainted with Computational Thinking in a way that fits their discipline, we do not pretend we have the solution yet. We welcome your comments and suggestion for improvement. Reach out to Jacky (J.Bourgeois@tudelft.nl)
{: .fs-5 .ls-10 .code-example .bg-yellow-000}

# Python Programming Assignments

The Python programming assignments are accessible via the left panel under 'Computational Thinking'. You can also access them from the overview further down this page.

Each assignment starts with an introductory video providing some high-level intuitions of essential concepts. Then, refer to the text for a detailed description of each step.

Apart from the first one, each assignment reviews the elements covered in the previous one. Then, it explores new aspects or iterates on some challenging ones already covered. Finally, it offers a series of extra tasks for you to explore if you feel like exploring further. We attributed each assignment a series of labels to indicate the type of element you will learn:

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

We choose Python as a language, an overarching choice of the TU Delft and many other institutions worldwide, because it enables a gradual immersion into software development. Each step of the way, assignments lead you to think about the algorithm and introduce Python syntax when necessary. Then, of course, you are in charge to implement the algorithm in Python. But the solution is just one click away if you get lost.

We expect each assignment to take about four hours. As part of our Bachelor course, we expect you to complete one a week. When something is not working as expected, that you do not understand how to move forward, please look at the [Discourse](https://bsc2021.io.tudelft.nl/){:target="_blank"} for questions related to the Python programming assignment you are working on. Open a new topic for any question that is not yet on Discourse. We encourage you not only to ask questions, but answer the one you feel like, from other students. Please upvote a question that you have as well, and the answer that helped you.

See our template to ask questions that provide enough information for other students and us to help you effectively. It appears automatically whenever you open a new topic in the [Code Assignments](https://bsc2021.io.tudelft.nl/c/iob2-2/programming-assignments/18){:target="_blank"} category. 

### [Development Environment]({{site.baseurl}}/environment)

Before starting, it is important to know the basics of the tool we will use. This initial tutorial gives you a tour of the development environment we use for this series of Python programming assignments.

IDE
{: .label .label-yellow }

Replit
{: .label .label-purple }

### [01 Calculator]({{site.baseurl}}/computational-thinking/01-calculator)

The first Python programming assignment leads you through the Design of your first algorithm to mimic a calculator, adding two numbers provided by the users. Through this example, we introduce the concept of variables and data types along inputs and outputs to receive and send information to the user. We also discuss how to investigate (or debug) the code when the result is not the one you expect.

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

### [02 Vending Machine]({{site.baseurl}}/computational-thinking/02-vending-machine)

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


### [03 eReader]({{site.baseurl}}/computational-thinking/03-ereader)

In the third Python programming assignment, you will build an eReader loading an eBook in the Terminal and enabling the user to 'turn the page'. This exercise will reveal the need for loops to repeat part of the code which you will wrap (or encapsulate) into a reusable function. You will experience the four steps of computational Thinking: decomposition, recognition, generalisation/abstraction and algorithm design.

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

### [04 Generative Art]({{site.baseurl}}/computational-thinking/04-generative-art)

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


### [05 COVID Dashboard]({{site.baseurl}}/computational-thinking/05-covid-dashboard)

In this fifth Python programming assignment, you continue exploring web interfaces. You request data from a web service to collect the latest COVID-19 statistics and process it while exploring time series and data formats. Based on this data, you expose a series of charts on the web, organised into a dashboard.

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

HTML
{: .label .label-red }

CSS
{: .label .label-red }

# What's next?

Enough practicalities and theory, the next step is to get familiar with the development environment. For this, you will only need your favourite web browser, so let's jump in!

[Next Step: Software Development Environment]({{site.baseurl}}/computational-thinking/environment/){: .btn .btn-purple }
