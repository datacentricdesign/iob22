---
layout: default
title: "Generate Public/Private keys"
parent: "Tools"
grand_parent: "Prototyping"
has_children: false
---

On Mac, this tool is already installed. On Windows, you can download and install openssl [here](https://slproweb.com/products/Win32OpenSSL.html)

In the terminal, type in the following command to generate a private key. The private
key is saved saved in file 'private.pem'. You should keep this file secret on your computer and never share it.

```bash
openssl genrsa -out private.pem 4096
```

Then, extract the attached public key with the following command. The public key
is saved in the file 'public.pem'

```bash
openssl rsa -in private.pem -outform PEM -pubout -out public.pem
```

