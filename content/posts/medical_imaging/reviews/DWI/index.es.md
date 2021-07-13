---
title: "Difusión por Resonancia Magnética"
date: 2021-07-12
# weight: 1
# aliases: ["/first"]
tags: ["DWI", "imagenología"]
series: ["Técnicas de imagen"]
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
math: true
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
En 1827, el botánico Robert Brown estaba observando con su microscopio una muestra de polen que flotaba en agua. Notó que se movía de manera aleatoria, pero no supo cómo determinar la causa. Este fenómeno recibiría el nombre de movimiento browniano, en su honor. No fue hasta 1905, que Albert Einstein describiría este comportamiento y serviría como prueba indiscutible de la existencia de los átomos y moléculas. Quien hubiera pensado que más de 100 años después, este principio sería aplicado en la medicina para diagnosticar enfermedades (DWI) y obtener información acerca de las vías de conexión del cerebro (tractografía). En esta entrada, hablaremos acerca de la difusión por resonancia magnética.

## El fenómeno de la difusión

Antes de seguir, hay que definir el concepto de difusión:

>“Es un fenómeno físico que describe el movimiento aleatorio de moléculas o partículas de regiones de mayor a menor concentración en un medio sin ayuda externa”

{{< notice note >}}

No entraré en mucho detalle al modelo matemático e historia de la difusión. Si tienes curiosidad te recomiendo leer el artículo de Shama & Vishwamittar (2005), [Brownian Motion Problem: Random Walk and Beyond](https://www.fisica.unam.mx/personales/gramirez/Biophysics_cell_signal_transduccion/Random_Walk_and_Beyond.pdf)  o algunos capítulos del libro de Edward Nelson, [Dynamical Theories of Brownian Motion](https://web.math.princeton.edu/~nelson/books/bmotion.pdf) .

{{< /notice >}}

Podemos observar la difusión cuando dejamos caer una gota de colorante en un vaso con agua. Al inicio, el colorante se concentrará en una sola región y lentamente se irá difundiendo a lo largo del agua sin necesidad de moverlo con ayuda de una cuchara (Figura 1).

{{< figure src="diffusion.es.png" align="center" title="Figura 1. Difusión. Se puede observar la difusión del colorante en el agua [obtenido de https://www.science-sparks.com/]." >}}

Ahora bien, ¿cómo se aplica el concepto de difusión en la resonancia magnética?...

## Resonancia magnética + Difusión
La resonancia magnética es una técnica de adquisición de imágenes que utiliza un campo electromagnético para alinear el movimiento de precesión de los protones de hidrógeno del cuerpo en una dirección. Después, se aplican diferentes pulsos de radiofrecuencia para ajustar el espín de los protones y así, rotar el eje de magnetización del cuerpo; alterando la precesión y fase de los protones. Al final, se obtiene una señal (eco) que sirve para reconstruir una imagen (Figura 2). — Hay más pasos involucrados, pero para fines explicativos basta con este resumen —. Pero ¿Qué sucede cuando se añaden otros campos magnéticos (gradientes) a la secuencia de pulsos? Stejskal y Tanner lo averiguaron en 1965, la resonancia magnética se volvía sensible a la difusión. Esta sensibilidad puede ser ajustada utilizando la siguiente ecuación:

$$ b = \gamma^2 G^2 \delta^2 (\Delta^2 - \frac{\delta}{3}) $$

Donde, $b$ es la cantidad difusión que queremos detectar ( $s/mm^2$ ), $\gamma$ es la relación giromagnética, $G$ es la magnitud del gradiente, $\delta$ es el tiempo que permanece encendido el gradiente y, $\Delta$ es el tiempo entre el primer y segundo gradiente. Normalmente se utilizan valores de $b = 1000 \pm 100\ s/mm^2$ .

{{< figure src="dwi1.es.png" align="center" title="Figura 2. Diagrama de pulsos MRI simplificado y su relación con el movimiento de los protones. El pulso de excitación (1ra barra amarilla) genera un desfase en el espín de los protones que será corregido con el pulso de reenfoque (2da barra amarilla). La señal obtenida cuando los protones recuperan su fase se conoce eco del espín [obtenido de Johansen-berg & Behrens 2014]." >}}

Al introducir un nuevo gradiente, se altera la velocidad de espín de los protones en relación a su posición respecto al gradiente. Esta acción provoca un nuevo desfase que se puede corregir con otro gradiente de sentido contrario para “refasar” a los protones. Aquí es donde entra en juego el concepto de difusión. El tiempo entre gradiente y gradiente permite que los protones se desplacen y no puedan volver a alinearse correctamente a su posición inicial con el refasamiento, lo que contribuye a la emisión de una señal eco de alta intensidad. Esta medida de desplazamiento indica que tanta difusión existe en el tejido. Si el desplazamiento es hacia todas las direcciones, la difusión es libre (isotrópica); si por el otro lado, el desplazamiento es hacia una dirección en particular, la difusión es restringida (anisotrópica). Esta técnica es de gran utilidad porque permite asignar diferentes tonalidades a los pixeles dependiendo la difusión, grises si es isotrópica y blancos si es anisotrópica; de esta forma se pueden detectar cambios en la irrigación (e.g. isquemia cerebral) e irregularidades en la materia blanca (e.g. esclerosis múltiple, Alzheimer) (Figura 3).

{{< figure src="dwi2.es.png" align="center" title="Figura 3. Ilustración de la relación entre el gradiente, espín y difusión. Al aplicar el primer gradiente (barra verde) se desfasa el espín de los protones. El segundo gradiente (barra verde) es capaz de eliminar este desfasamiento, pero dada el tipo de difusión del tejido, los protones se desplazarán mucho o poco. Las regiones con difusión isotrópica no alcanzan a refasarse y emiten una señal menor (fluido cerebroespinal, recuadros azules), mientras que regiones con difusión anisotrópica si lo logran y la señal que emiten es mayor (zona de derrame cerebral, recuadros amarillos) [obtenido de Johansen-berg & Behrens 2014]." >}}

## Coeficiente de difusión aparente (ADC)
Muchas veces, la señal obtenida con DWI no es perfecta y puede que sea intensa aun cuando $b = 0$ o $b > 0$ . Esto se debe a que la secuencia de pulsos utilizada es muy similar a la de señales obtenidas con tiempos de eco y repetición largos (T2). Este problema se conoce como efecto T2 o T2 shine-through y la solución es calcular el coeficiente de difusión aparente para cada voxel de la imagen utilizando la siguiente fórmula:

$$ ADC = - \frac{ln\frac{S_{b_2}}{S_{b_1}}}{(b_2-b_1) = } - \frac{ln\frac{S_b}{S_0}}{b}$$

Donde, $S_{b_1}$ y $S_{b_2}$ son las intensidades de la señal obtenida con dos valores diferentes de $b$ , considerando que $b_1 < b_2$ . Los valores de $b_1$ y $b_2$ mas utilizados son $0$ y $1000\ s/mm^2$ , respectivamente. Contrario a DWI, el ADC refleja las zonas de difusión isotrópica en tonos blancos y anisotrópica en tonos grises (Figura 4).

{{< figure src="ADC.es.png" align="center" title="Figura 4. DWI vs ADC vs T2. Se puede ver una lesión circular (glioma) en la imagen DWI (izquierda) que presenta difusión anisotrópica. El mapa ADC (centro) dice lo contrario, existe una lesión, pero tiene un incremento en la difusión (isotrópica). T2 (derecha) confirma que el tono blanco del glioma en DWI fue producido por el efecto shine-through [obtenido de mriquestions]." >}}

## Artefactos
Todas las modalidades de estudios de imagen presentan artefactos por x o y razones. La DWI no es la excepción. Algunos de los más comunes son:

- Efecto de perfusión: derivado de la vasculatura y flujo sanguíneo. Puede alterar la medida de ADC.

- Efectos por movimiento: derivado del movimiento del paciente.

- Efectos por la pulsación del fluido cerebroespinal (CSF): derivado del movimiento de CSF relacionado a la fase sistólica del ciclo cardíaco.

## Conclusión
Para cerrar, quiero recordarles que la difusión por resonancia magnética y el coeficiente de difusión aparente son herramientas de gran utilidad para detectar y evaluar diferentes patologías que pueden ser integrados fácilmente a las secuencias de pulsos de resonancia magnética. Su uso va desde aplicaciones oncológicas hasta en estudios de desarrollo pediátrico. Es una técnica muy sensible al movimiento, por lo que hay que tener cuidado a la hora de realizar el estudio para evitar artefactos en la señal. A continuación, les dejo los puntos importantes de la lectura:

1.	La difusión es un fenómeno que describe el movimiento aleatorio de partículas en un medio sin ayuda externa.

2.	La difusión por resonancia magnética (DWI) permite detectar regiones donde la difusión de los protones de hidrógeno del agua del cuerpo es libre o restringida.

3.	El coeficiente de difusión aparente (ADC) permite cuantificar la difusión del agua en tejido y confirmar la imagen de DWI.

4.	Es una técnica muy sensible a artefactos relacionados al movimiento.

{{< notice tip >}}

Si te quedaste con dudas, te recomiendo checar los videos al final de las referencias o, en todo caso, escribe un comentario en la parte de abajo 😎.

{{< /notice >}}

## Referencias
Estas fueron mis referencias. No tienen orden en específico, sólo las dividí por tipo de material. 

### Artículos y revistas
[1] Nelson, E. (1967). Dynamical Theories of Brownian Motion. In Dynamical Theories of Brownian Motion (2nd). Princeton University Press

[2] Sharma, S., & Vishwamittar. (2005). Brownian motion problem: Random walk and beyond. Resonance, 10(8), 49–66.

[3] Leite, C. C. & Castillo, M. (2016). Diffusion Weighted and Diffusion Tensor Imaging (1st). Thieme Medical.

[4] Johansen-Berg, H. & Behrens, T. E. J. (2014). Diffusion MRI: From Quantitative Measurement to In vivo Neuroanatomy (2nd). Elsevier.

[5] Baliyan, V., Das, C. J., Sharma, R., & Gupta, A. K. (2016). Diffusion weighted imaging: Technique and applications. World Journal of Radiology, 8(9), 785.

[6] Schaefer, P. W., Grant, P. E., & Gonzalez, R. G. (2000). Diffusion-weighted MR imaging of the brain. Radiology, 217(2), 331–345. 

[7] Ahualli, Jorge. (2010). Aspectos generales de las secuencias de difusión de imagen en resonancia magnética. Revista Argentina de Radiología, 74(3).

### Apuntes de clase
[8] Anne Pollacco, D. (2016). Magnetic Resonance Imaging. University of Malta [Notes]

### Videos
[9] Doctor Klioze (2014). Diffusion Weighted Imaging [Video]. Youtube. https://www.youtube.com/watch?v=J_aamnpRJE8

[10] Barton Branstetter (2019). ADC versus DWI [Video]. Youtube. https://www.youtube.com/watch?v=rEG85oOypXU

### Sitios web
[11] Hammer, M. (2013-2014). XRayPhysics - Interactive Radiology Physics. http://xrayphysics.com/

</div>
