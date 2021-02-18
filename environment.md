---
layout: default
title: Environment
nav_order: 1
---

# Software Development Environment
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

When you start to learn to program, it is important to understand that software development is an _iterative process_. Software developers continuously iterate and evaluate their code in a software development environment providing a set of tools to achieve the desired goal. In comparison, designers will iteratively sketch their design in their (mobile) design studio with different sheets of paper, pencils and colour, refining their work to achieve the desired goal.

In this environment, software Developers will:

- **Write code**, which requires a text editor. It is an intelligent text editor that can understand the fundamentals of different programming languages. So that it can support the developer by highlighting syntax errors or making suggestions in the code they have written. For example, MS Word provides similar support for English by highlighting grammar error or suggesting to auto-complete the date of the day.
- **Organise code into several files**, which requires fast and structured access to files so that the developer can switch from one to another.
- **Test code**, which requires a way to tell the computer to run the code and show the results.

There are many software development environments available, each supporting one or several programming languages and different functionalities, including the three mentioned above. What we need to get started is an **environment that supports the Python language** and does not require any setup or installation on our computer.

Thus, we will use [Replit](https://repl.it), an software development environment that you access directly from your favourite web browser. In the following video, we guide you through the functionalities of _Replit_ that you will use in this series of Python programming assignments. We also describe each functionality in the following sections.

[TODO video hands-on guided tour]

# Sign Up

To use _Replit_, we need to create an account. Open [Replit](https://repl.it) and click on the button **SignUp** (top-right corner). Fill in the username of your choice with email and password. Then, click on the blue button **Sign Up** at the bottom to create your _Replit_ account.

![Replit Signup](assets/images/ide_signup.png)

# Create a New _Replit_ Project

Once you have created your _Replit_ account, you will be presented the _Replit_ dashboard. Now let's explore this online software development environment by creating a project with some example code. You can create as many projects as you want from this page.

Click on the blue button `+` on the top-right corner.

[TODO Screenshot]

Fill in the project name in the pop-up window and click on the blue button at the bottom: 'Create Repl'.

![Name your repl](assets/images/fill_in_repl_name.png)

# Explore the Replit Layout

Once you have created the project, you can see the software development environment, composed of three vertical panels:

* on the left, this is a file explorer listing the file of your project. All our code will fit in the default file 'main.py';
* in the centre, this is a text editor, to edit the code. You can see that there is one tab at the top 'main.py': you are currently editing the file named 'main.py'.
* on the right, this is a `Terminal`: a text-based interface to interact with the computer.

![Explore code editor layout](assets/images/explore_repl_layout.png)

# Execute Code

Now that we have the code editor opened with a new project, let's try to run a code example.

First, on top of the code editor, click on 'examples' marked in blue.

![](assets/images/run_example_1.png)

In the pop-up window, click on the 'Input' example.

![](assets/images/run_example_2.png)

You will see that some Python code has been pasted in the code editor. Let's not try to explain the code, we will go over this code in the first assignment. What does it do? The programme will ask for your name and tell you your name.

![](assets/images/run_example_3.png)

To start the programme (i.e. to execute the code), click on the green button 'Run' from the top.

![](assets/images/run_example_4.png)

In the Terminal, you will see that, it asks for your name. Write it down and press the `ENTER` key. Observe the Terminal output!

![](assets/images/run_example_5.png)

# Edit Code

Software development requires a rigorous syntax. It is easy to make mistakes by misspelling a word or Python syntax. While a reader can tolerate mistakes to a certain degree, the computer does not. The editor is here to help and highlight some of these mistakes. For example, remove a letter from the word `print` on the second line. The editor will signal this error with red lines because this is not a correct Python syntax anymore. If you move your cursor on this red line, it will also show a short description of this error.

[TODO screenshot]

# Organise Files

While writing code, you often need to organise pieces of code in separated files or folders. You can do this by creating a new file/folder from the file explorer in the left panel

![creating new file](assets/images/create_new_file.png)

There are more button and functionalities on _Replit_, but so far this is all we need to know to get started. Let's jump in the first Python programming assignment!

# Embed your code in Discourse

In order to include your Replit directly into your post on Discourse, you can embed it using the 'Copy embed code' button. 

![embed code in discourse](assets/images/embed-snippet.gif.png)

[Next Step: Assignment 1 - Calculator]({{site.baseurl}}/assignments/01-calculator){: .btn .btn-purple }
