---
title: "[II] Programación en C"
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

## Tu primer código 
La vez [pasada]({{< ref "/posts/c_programming/I/index.md" >}} "[I] Programación en C"), aprendimos cómo instalar C en diferentes sistemas operativos. Luego, escribimos, compilamos y ejecutamos tu primer código. Hoy revisaremos línea por línea ese código y te platicaré acerca de algunos conceptos importantes.

```c {linenos=table,linenostart=1}
#include <stdio.h>

int main() 
{
    printf("Hola, mundo");
    return 0;
}
```
Si recuerdas bien, lo único que hace el código al ejecutarlo es imprimir la frase **Hola, mundo** en la consola. Pero ¿cómo es que logra hacer eso?...


### ¿Cómo funciona?
La línea 1, ` #include <stdio.h>`, es una línea que verás en todos lo programas de C y se divide en dos partes fundamentales. La primera, `#include`, permite importar los contenidos de un archivo al nuestro; mientras que la segunda, `<>`, contendrá el nombre del archivo que queramos importar, en este caso `stdio.h`. La  extensión `.h` se utiliza para archivos tipo *header* o encabezado que contienen una lista de funciones.

La línea 3, `int main()`, es la declaración de nuestra función principal. Dentro, entre corchetes `{ }`, irá la lista de instrucciones que se ejecutarán cada vez que corramos el código. Siempre verás esta función en todos los códigos de C. Su sintaxis es la siguiente:

```c
int main(){
    // instrucción 1
    // instrucción 2
    // instrucción 3
}
```
{{< notice note>}}

A C no le importan los espacios en blanco, así que técnicamente puedes declarar la función principal de las siguientes formas:

```c
// Alternativa 1
int 
main(){

}

// Alternativa 2
int main()
{

}
```
Peeeeero, la forma que elijas dificultará o no la lectura, así que tenlo en mente.

{{< /notice >}}

La línea 5 y 6 son instrucciones dentro de main. La línea 5, `printf`, es una función que recibe como argumento una cadena de caracteres (string) y la imprime en consola, en este caso el argumento fue `Hola, mundo`. No te preocupes si no sabes que son cadenas de caracteres o argumentos, más adelante lo explicaré.

{{< notice tip >}}

Cada vez que tengas dudas acerca de alguna función, prueba a escribir el siguiente comando en la terminal:

``` shell
$ man nombre_de_la_función
$ man printf
```

{{< /notice >}}

Por último, la línea 6, `return 0`, es una instrucción que le indica al sistema operativo que el código funcionó correctamente. En caso de no haber funcionado, lo más probable es que te vaya a salir un error. Podemos compararlo a un estudiante que esta realizando sus deberes en clase, al terminar va con su maestr@ para que lo cheque; si esta bien puede descansar, pero si no, recibirá una retroalimentación y tendrá que corregir sus errores.

Algo que no mencioné y probablemente notaste es que la línea 5 y 6 termina con `;`. Esta es la forma de C de terminar la declaración de una instrucción. Olvidarlos es un error muy común, así que no desesperes y verifica que los hayas puesto; con el tiempo y la práctica lo harás sin pensarlo.

## Trabajo propio
De ahora en adelante, tal como en el libro de Zed Shaw, cada sesión contará con un apartado llamado **trabajo propio**, dónde te dejaré algunas instrucciones que podrás realizar por tu cuenta para mejorar tu comprensión del tema y generar curiosidad. Las instrucciones de la semana son las siguientes:

- Intenta borrar alguna parte del código y luego compílalo de la misma forma que la vez pasada: `$ gcc hello_world.c  -o hello_world && ./hello_world`. Seguramente saldrá un error, intenta leerlo y comprender lo que dice. Recuerda que Google es tu amigo 😉. Repítelo con diferentes partes: borra un `;` o `{}`, da rienda suelta a tu creatividad.

- Reemplaza el argumento de `printf` con alguna frase. Recuerda que debe ir entre comillas.

- Lee la documentación de la función `printf` con `$ man printf`. Nuevamente, no te preocupes si no la entiendes del todo. Sólo es para crear el hábito de buscar en la documentación. Luego te explicaré mas a fondo lo que puedes hacer con `printf`.

- Por último, apártate de la pantalla un rato y, si puedes, muévete de habitación e intenta recordar lo que aprendiste hoy. Puede que suena raro, pero funciona bastante bien para reforzar tus conocimientos. Puntos extras si intentas recordarlo otro día; el punto es no dejar de practicar.

## Próxima sesión
En la siguente sesión, hablaremos acerca de dos cosas que te harán la vida mas fácil a la hora de programar: los archivos MAKEFILE y el depurador (debugger) GDB. ¡Hasta la próxima!


</div>
