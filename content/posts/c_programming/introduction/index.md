---
title: "Learn C Programming -> Introduction"
date: 2021-07-03
# weight: 1
# aliases: ["/first"]
tags: ["c", "programming"]
series: ["Learn C Programming"]
author: "@atorizv"
# author: ["Me", "You"] # multiple authors
showToc: true
TocOpen: false
draft: false
hidemeta: false
comments: true
description: ""
canonicalURL: "https://canonical.url/to/page"
disableHLJS: true # to disable highlightjs
disableShare: false
disableHLJS: false
hideSummary: false
#searchHidden: false
ShowReadingTime: true
ShowBreadCrumbs: false
ShowPostNavLinks: true
#cover:
#    image: "C.jpg" # image path/url
    #alt: "<alt text>" # alt text
    #caption: "<text>" # display caption under cover
#    relative: false # when using page bundles set this to true
#    hidden: true # only hide on current single page
#editPost:
#    URL: "https://github.com/<path_to_repo>/content"
#    Text: "Suggest Changes" # edit text
#    appendFilePath: true # to append file path to Edit link
---
<div style="text-align: justify"> 

## Introduction
I always thought that learning to code in C would be a difficult and rather tedious experience compared to the high-level languages (e.g Python or Matlab) I was familiar with. Hence, I did what every student in my situation would do: procrastinate until the very last moment. Who would have though that, in order to prepare myself for my future internship position, my supervisor would asked me to learn C beforehand...

Thus, this Learning C programming series was born, to help me study and practice new concepts. I'll try to follow the [KISS principle](https://en.wikipedia.org/wiki/KISS_principle) and keep each new entry as brief and concise as possible. Most of the material will be based on Zed Shaw's Learning C Programming the Hard Way, although I'll be adding more references if needed.

## Installation
### Linux
You just need to type the following commands in your terminal:

**Ubuntu**️
```shell
$ sudo apt-get install build-essential
```
**RPM Distro (Fedora, RedHat, CentOS)**
```shell
$ sudo yum groupinstall development-tools
```

To verify the installation and check gcc version type:
```shell
$ gcc --version
```

### Windows
You need to install [Cygwin](https://www.cygwin.com/) or [MinGW](http://mingw-w64.org/doku.php), instructions can be found on their respective websites. The alternative would be to enable [WSL](https://docs.microsoft.com/es-es/windows/wsl/install-win10), Windows Subsystem for Linux, which allows you to have an Ubuntu or other distro installation within your Windows system. Personally, I prefer WSL since I enjoy working on a Linux development environment, plus it makes easier the installation of other tools/software.

### Mac Os
First, you need to install XCode from Apple. You can do it via terminal:
```shell
$ xcode-select --install
```
Next, open *XCode -> Preferences -> Downloads* and install Command Line Tools. Lastly, verify the gcc installation check its version:
 ```shell
$ gcc --version
```

## Recommendations
* Use a simple editor (e.g. Nano) without autocompletion enabled to train your memory.
* Write your own code, don't just copy over the material.
* Be curious! If you have a doubt add a comment below.

## Your first code
As usual when learning a new programming language, the first code we'll look at will print on screen: **"Hello, world"**. Don't worry if you don´t understand the syntax, it is just an example for you to observe how does C code looks like.
```c {linenos=table,hl_lines=[1],linenostart=1}
#include <stdio.h>

int main() 
{
    printf("Hello, world");
    return 0;
}
```

We just have to compile the program and run it:
```shell
$ gcc hello_world.c  -o hello_world && ./hello_world
```

```
Hello, world
```

Congrats! You just code and ran your first C program. Next time, we'll talk what does each line do.
</div>