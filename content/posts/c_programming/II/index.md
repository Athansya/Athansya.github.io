---
title: "[II] Learn C Programming"
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
draft: true
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

## Your first code
Last [time]({{< ref "/posts/c_programming/I/index.md" >}} "[I] Learn C Programming"), we learn how to setup C in different operating systems. Then, we wrote, compiled and ran your first code. Today, we'll review it line by line and I'll explain you some key concepts.

```c {linenos=table,linenostart=1}
#include <stdio.h>

int main() 
{
    printf("Hello, world");
    return 0;
}
```

If you remember correctly, running this code will display **Hello, world** on the console. But, how does it achieve that?...

## How it works?
Line 1, `#include <stdio.h>`, is something you'll see in every C program and its divided into two main parts. The first, `#include`, allows to import the content of other file into ours; while the seconde, `<>`, contains the name of the file we want to import, in this case `stdio.h`. The extension `.h` is used for *header* files, i.e. files that contain a list of functions.

Line 3, `int main()`, is our main function declaration. Inside, between brackets `{ }`, you'll found the list of instructions that will be executed each time we run the code. You'll always see this function in every C code. Its syntax is as follows:

```c
int main(){
    // instruction 1
    // instruction 2
    // instruction 3
}
```

{{< notice note>}}

C doesn't care about whitespaces, so technically you can declare the main function in the following ways:  

```c
// Alternative 1
int 
main(){

}

// Alternative 2
int main()
{

}
```
Buuuuut, keep in mind that the way you choose will or will not make it difficult to read.
{{< /notice >}}

Line 5 and 6 are instructions inside the main function. Line 5, `printf`, is a function that receives as argument a string of characters and displays it on the console, in this particular case, the argument was `Hello, world`. Don't worry if you don't know what are strings of characters or arguments, I'll explain it later on.

{{< notice tip >}}

Each time you have doubts about a function, try using the following command on the terminal:

``` shell
$ man nombre_de_la_función
$ man printf
```

{{< /notice >}}

At last, line 6, `return 0`, is an instruction that indicates the operating system that the code worked as intended. Otherwise, you'll probably get an error. We can compare it with an student doing his classwork, when he finishes he'll approach his teacher to receive feedback; if it is okay he may rest, but if not, he will have correct his mistakes.

Something I didn't mention and you probably noticed is that line 5 and 6 ends with `;`. This is the C way of ending an instruction declaration. Forgetting `;` is a common error, don't worry about it and verify that you have put them, with a bit of time and practice you'll do it without thinking.

## Homework
From now and then, as in Zed Shaw's book, each session will include a section called **Homework**, where I'll leave you some instructions for you to work on your own to get a better grasp of the concepts and fuel your curiosity. This week instructions are:

- Try to erase some of the code and compile it the same way as we did last session: `$ gcc hello_world.c -o hello_world && ./hello_world`. Surely, you'll get an error, try to read and comprehend what it says. Remember, Google is your friend 😉. Try again with different sections: erase a `;` or `{ }`, let loose your creativity.

- Replace `printf` argument with other phrase. Remember, it must go inside quotation marks.

- Read the documentation of `printf` function with `$ man printf`. Again, don't worry if you don't understand it all. Its just an exercise to create the habit of looking at the documentation if you have doubts. I'll explain more about what you can do with `printf` later.

- Lastly, take a break. Get off the computer and, if you can, go to another room and try to remember what you learn today. It may sound strange, but its a great technique to reinforce your knowledge. Extra points if you try to remember it another day; the purpose is to not stop practicing.

## Next session
Next session, we'll talk about two things that'll make your life easier when programming: MAKEFILEs and GDB debugger. See you next time!


</div>
