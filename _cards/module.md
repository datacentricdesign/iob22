---
link-assignment: /assignments/04-generative-art/step2/#what-is-a-module
---

## What is a Module?

In Python, a module is a file (with the extension `.py`) which contains definitions of functions. This allows developers to organise the code in multiple files, making it easier to find our way through the code. To use code from a module (e.g. from a different file), there are two strategies:

You can import a specific function from a module with  `from ... import ...`. This is recommended in most cases. You can call the imported functions as if they were defined in the same file.

```python
from module_name import function_name1, function_name2
```

When the whole module is relevant, you can use the keyword `import` directly.

```python
import module_name
```

In this case, you need to prefix the function call by the module name, such as `module_name.function_name1()`.