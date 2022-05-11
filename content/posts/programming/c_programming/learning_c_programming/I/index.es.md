---
title: "[I] Programación en C"
date: 2021-07-03
# weight: 1
# aliases: ["/first"]
tags: ["c", "programación"]
series: ["Aprender a Programar en C"]
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

## Introducción
Siempre pensé que aprender a programar en C sería una experiencia complicada y tediosa en comparación a los lenguages de alto nivel (e.g. Python o Matlab) con los que estaba familiarizado. Por lo tanto, hice lo que cualquier estudiante en mi situación haría: procrastinar hasta el último momento posible. Quién hubiera pensado que, para prepararme para mis futuras prácticas profesionales, mi supervisora me pediría aprender C de antemano.

Así fue que esta serie de Aprender a programar en C nació, principalmente para ayudarme a estudiar y practicar nuevos conceptos. Trataré de apegarme lo más posible al [principio KISS](https://en.wikipedia.org/wiki/KISS_principle) y mantendré cada nueva entrada lo más breve y concisa posible. La mayor parte del material estará basado en el libro de Zed Shaw, Aprender a Programar C de la Manera Difícil, aunque añadiré más referencias si es necesario.

## Instalación
### Linux
Tan solo necesitas ingresar los siguientes comandos a tu terminal de preferencia:

**Ubuntu**
```shell
$ sudo apt-get install build-essential
```

**RPM Distros (Fedora, RedHat, CentOS)**
```shell
$ sudo yum groupinstall development-tools
```
Para verificar que el compilador de C esté instalado y su versión:
```shell
$ gcc --version
```

### Windows
Necesitas instalar [Cygwin](https://www.cygwin.com/) o [MinGW](http://mingw-w64.org/doku.php), las instrucciones vienen en sus respectivos sitios. La alternativa sería habilitar [WSL](https://docs.microsoft.com/es-es/windows/wsl/install-win10), un subsistema Linux dentro de Windows donde podrás tener una instalación de Ubuntu u alguna otra distro. En lo personal, yo utilizo WSL porque me gusta más tener un entorno Linux para desarrollo, además que facilita la instalación de varias herramientas/programas.

### Mac Os
Primero se necesita instalar XCode de Apple. Se puede hacer vía línea de comandos:
```shell
$ xcode-select --install
```
Después, ingresa a *XCode -> Preferencias -> Descargas* e instala las herramientas de línea de comando (Command Line Tools). Por último, verifica que el compilador de C esté instalado y su versión:
```shell
$ gcc --version
```

## Recomendaciones

* Utiliza un editor sencillo (e.g. Nano) sin autocompletado habilitado para entrenar tu memoria.
* Escribe código de tu autoría, no solamente copies el material.
* ¡Sé curioso! Si tienes alguna duda añade un comentario en la parte inferior.

## Tu primer código
Como es costumbre al aprender a programar, el primer código que veremos imprimirá en pantalla **"Hola, mundo"**. No te preocupes si no entiendes la sintaxis, sólo es un ejemplo para que te observes cómo se ve un código en C.
```c {linenos=table,hl_lines=[1],linenostart=1}
#include <stdio.h>

int main() 
{
    printf("Hola, mundo");
    return 0;
}
```

Sólo resta compilar el programa y ejecutarlo:
```shell
$ gcc hola_mundo.c  -o hola_mundo && ./hola_mundo
```

```
Hola, mundo
```

¡Enhorabuena! Acabas de programar y ejecutar tu primer programa en C. La siguiente vez, hablaremos un poco acerca qué hace cada línea en tu programa.
</div>
