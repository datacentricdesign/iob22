---
layout: default
title: "Setting up"
parent: "Prototyping"
has_children: false
nav_order: 3
---

To prototype with Python on our machine, we need to set up several tools. This tutorial walks you through the setup while briefly introducing the tools.

## Task 1: Installing a Version Control System (VCS)

The first tool is Git, a Version Control System (VCS). A VCS facilitates the management of code and collaboration. Its installation (especially on `Windows`) helps us automatically set up a development environment.

Download and install Git from the [official website](https://git-scm.com/download). On Mac OS, you might go for the Binary installer option.

## Task 2: Installing an Integrated Development Environment (IDE)

Editing and executing code is done in an Integrated Development Environment (IDE), which simply is a text editor customised to code editing and execution. For this course, we will choose Visual Studio Code (or VS Code) which brings all the necessary functionalities without being overly complicated.

Download and install Visual Studio Code from the [official website](https://code.visualstudio.com/).

Create a folder on your computer (i.e. Desktop) to store the files for this course. Open VS Code and click the top menu File > Open ... to open your course folder. Let's take a little tour of the IDE.

- The left panel relates to the management of your files from the top: 1. the tree of your project files 2. searching into your project files 3. managing your file with Git.
- The bottom panel relates to the execution of programs. We will especially look at the Terminal tab in the next task.

![Tour to VS Code](/assets/images/prototyping/setting-up/2_2.png)

<iframe width="560" height="400" src="https://youtube.com/embed/Sdg0ef2PpBw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Task 2.3: Get familiar with the Command-line Interpreter (CLI)

A CLI interprets the text you have entered into a command (e.g. create a directory, open an application, ...) - that's it! "What is the point?" you may wonder, as today we have many Graphical User Interfaces (GUI's) available that allow you to achieve many things as well, but without the cumbersome process of typing. Well, when prototyping you are developing technologies and playing with cutting edge ones, many of which simply do not have GUI. Skill in a Command-Line Interpreter (CLI) is therefore not something you acquire just for one project but rather for your entire digital prototyping life!

Several variants exist in software engineering: 'Unix shell', 'Console', 'Terminal' or 'Command Prompt'. All of them refer to this black window complete lines of text. To find it in VS Code, go to `View` > `Terminal`. It opens a tab in the bottom panel. In this tutorial, we use Unix shell as a command-line language, which comes in different flavours, the most common being `bash` and `zsh`. On the top right corner of the Terminal, a dropdown menu gives you several options.

On `Windows`: The installation of Git should have install bash. However, if it won't appear automatically in VS Code, **you must choose 'select the default shell' from the language interpreter dropdown window and then restart the VS Code**

![Introduction to VSCode Terminal](/assets/images/prototyping/setting-up/2_3_0.png)

Each command line starts with your username @ your machine name. Then, the current folder is shown

To execute a command, type it and press the `ENTER` key. Let's create a Directory (Folder) named `test` with the command `mkdir`:

```bash
mkdir test
```

The new folder should appear in your file tree in the left panel. `ls` (Mac OS/Linux) and `dir`(`Windows`) is the command to list files and directories inside the current folder. Type ls or dir followed by `ENTER`:

**Mac OS/Linux:**

```bash
ls
```

**Windows:**

```bash
dir
```

Your test folder should appear as a result of this command, as shown below.

![](/assets/images/prototyping/setting-up/2_3_1.png)

Most commands come with a manual, available with the command `man` (Mac OS/Linux) or `help` (`Windows`). Let's explore the option of the `ls` with `man` or `dir` with `help` command.

**Mac OS/Linux:**

```bash
man ls
```

![](/assets/images/prototyping/setting-up/2_3_2.png)

**Windows:**

```bash
help dir
```

![](/assets/images/prototyping/setting-up/2_3_2_2.png)

You can see a long list of options, starting with a dash `-` in `Mac OS`/`Linux` or start with `/` in `Windows`.

These options can be combined together. For instance, on `Mac OS`/`Linux`, you will note `-G` for colouring the result and `-l` for the long and detailed result. To quit the manual, press `q`.

Now we can try:

**Mac OS/Linux**

```bash
ls -Gl
```

![](/assets/images/prototyping/setting-up/2_3_3.png)

**Note** Similarly, on `Windows` within the available options we identified using `help dir`, we can list all the hidden files in the current directory using:

```bash
dir /A:H
```

![](/assets/images/prototyping/setting-up/2_3_3_2.png)

In the Terminal, everything relates to where you are in the file tree, i.e. in which folder you are in. With the command `cd` you can 'change directory' to navigate this tree. The 'path' is the chain of directories to reach your targeted file or directory.

```bash
cd test
```

![](/assets/images/prototyping/setting-up/2_3_4.png)

You entered the 'test' folder; you can notice the command line is now showing 'test' as the current folder. There are three important path markers: dot `.` for the current directory, dot dot `..` for the parent directory, and tilde `~`(`Mac OS`/`Linux`) or `/`(`Windows`) for the home directory.

Going back to the parent directory:

```bash
cd ..
```

![](/assets/images/prototyping/setting-up/2_3_5.png)

Finally, the tilde `~` (Mac OS/Linux) or `./` (Window) will leads you to your home directory in Mac OS or most parent location in your `Windows` current drive:

**Mac OS/Linux:**

```bash
cd ~
```

![](/assets/images/prototyping/setting-up/2_3_6.png)

**Windows:**

```bash
cd /
```

![](/assets/images/prototyping/setting-up/2_3_6_2.png)

**Tip** To avoid typing the same command again and again, you can press the Arrow-Up key to bring back the previous ones.

Read this [Bash cheat sheet](https://www.educative.io/blog/bash-shell-command-cheat-sheet) for some additional basic commands for `Mac OS`/`Linux`.
and [Windows Command prompt cheat sheet](http://index-of.es/Varios-2/Windows%20Command%20Prompt%20Cheatsheet.pdf) for `Windows`

## Task 2.4: Installing a Python Programming Language

The last tool we need is Python, the programming language for this course.

On `Windows`, download and install from [here](https://www.python.org/downloads/windows/). Then, navigate to 'Latest Python 3 Release' and scroll down to file a `Windows` installer.

On `Mac OS`, download and install from [here](https://www.python.org/downloads/mac-osx/). Navigate to 'Latest Python 3 Release' and scroll down to file a `Windows` installer.

Restart VS Code. Open your course folder and open a Terminal. Check your Python installation with:

```bash
python3 --version
```

This command should return a version number of Python 3.x.x. From now, whenever we want to use Python from the Terminal, we can start the command with `python3`

## Task 2.5: Setting up Virtual Environment to work

A virtual environment is a self-contained directory tree that contains a Python installation for a particular version of Python. It also includes additional packages (modules/libraries) to meet the requirements of each python application we are developing. Different python application can use different virtual environments.

To create a virtual environment, open the Terminal inside VS Code. Type below two commands to install the `virtualenv` and then create a virtual environment called `venv`.

**Mac OS/Linux:**

```bash
pip3 install virtualenv

sudo python3 -m virtualenv venv
```

**Windows:**

```bash
pip3 install virtualenv

python3 -m virtualenv venv
```

This command will create a `venv` directory, inside the `test` folder.

![Virtualenv](/assets/images/prototyping/setting-up/2_5_1_2.png)

Now, to activate this newly created virtual environment, in the Terminal, type the following command (make sure the Terminal is in the same 'test' directory):

**Mac OS/Linux:**

```bash
source ./venv/bin/activate
```

**Windows:**

```bash
.\venv\Scripts\activate
```

Notice the difference: the Terminal statement starts with `(venv)`.

![Virtualenv](/assets/images/prototyping/setting-up/2_5_2.png)

**Note** In some cases, VS Code might recognise the creation of this new environment, and it will ask you through prompt (Bottom right corner of the screen) if you want to switch, click 'Yes'. It will restart the Terminal, and you will see in the Terminal that the virtual environment has been activated.

![Prompt to switch to the virtual environment](/assets/images/prototyping/setting-up/2_5_1.png)

To deactivate the virtual environment, you can simply type:

```bash
deactivate
```

**What did we achieve?**

- We have a machine ready for developing, executing and sharing Python code.