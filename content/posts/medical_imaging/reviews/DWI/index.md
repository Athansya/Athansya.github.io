---
title: "Diffusion Magnetic Resonance"
date: 2021-07-12
# weight: 1
# aliases: ["/first"]
tags: ["DWI", "Medical Imaging"]
series: ["Imaging"]
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

## Introduction

In 1827, the botanist Robert Brown was observing a sample of pollen floating on water, under the microscope. He noticed a random motion, but couldn't determine the cause. This phenomenon would be known as Brownian motion in his honor. It wasn't until 1905, that Albert Einstein would describe this phenomenon and served as indisputable proof of the existence of atoms and molecules. Who would have thought that more than a 100 years later, this same principle would be applied in medicine for the diagnosis of different diseases (DWI) and to obtain information about the brain's connection pathways (tractography). In this post, we'll talk about diffusion magnetic resonance imaging.

## The diffusion phenomenon

Before continuing, we must define the concept of diffusion:

>"It is a physical phenomenon that describes the random motion of molecules or particles from regions of higher to lower concentration in a medium without external help"

>“Es un fenómeno físico que describe el movimiento aleatorio de moléculas o partículas de regiones de mayor a menor concentración en un medio sin ayuda externa”

{{< notice note >}}

I will not discuss in detail the mathematical model and history of difusion. If you are curious about it, I suggest you to read Sham & Vishwamittar (2005) article,[Brownian Motion Problem: Random Walk and Beyond](https://www.fisica.unam.mx/personales/gramirez/Biophysics_cell_signal_transduccion/Random_Walk_and_Beyond.pdf) or some chapters from Edward Nelson's book, [Dynamical Theories of Brownian Motion](https://web.math.princeton.edu/~nelson/books/bmotion.pdf).

{{< /notice >}}

We can observe diffusion happening when dropping of food coloring into a glass of water. At first, coloring will concentrate on one region. Then, it will slowly diffuse across the water without help (Figure 1).

{{< figure src="diffusion.es.png" align="center" title="Figure 1. Diffusion. We can observe the food coloring diffusing across the glass of water [obtained from https://www.science-sparks.com/]." >}}

Now then, ¿how does the concept of diffusion is applied in magnetic resonance imaging?

## Magnetic Resonance + Diffusion
Magnetic resonance is a medical imaging procedure that uses an electromagnetic field to align the precession motion of hydrogen protons in our body to in one direction. Then, different radiofrequency pulses are applied to adjust protons' spin and thus, rotate the magnetization axis of the body; altering the precession and phase of the protons. At last, a signal (echo) is obtained to reconstruct an image (Figure). - There are more steps involved, but for explanatory purposes this summary will do -. But ¿What happens when you add other magnetic fields (gradients) to the pulse sequence? Stejskal and Tanner found out in 1965, magnetic resonance became sensitive to diffusion. This sensitivity could be adjusted with the following equation:

$$ b = \gamma^2 G^2 \delta^2 (\Delta^2 - \frac{\delta}{3}) $$

Where, $b$ is the amount diffusion we want to detect ( $s/mm^2$ ), $\gamma$ is the gyromagnetic relation, $G$ is the gradient scalar, $\delta$ is the time the gradient remains turned on, $\Delta$ is the time between the first and second gradient. Usually, the values of $b = 1000 \pm 100\ s/mm^2$ .

{{< figure src="dwi1.es.png" align="center" title="Figure 2. Simplified MRI pulses diagram and its relation with protons motion. The excitatory pulse (1st yellow bar) causes a dephasing in protons spin that can be corrected (rephased) with the refocusing pulse (2nd yellow bar). The obtained signal when protons rephase is known as spin echo [obtained from Johansen-berg & Behrens 2014]." >}}

Introducing a new gradient alters the spin velocity of the protons relative to their position with respect to the gradient. This action causes a new dephasing that can be corrected with another equal gradient in opposite direction to rephase the protons. This is where the concept of diffusion comes into play. The time between gradient and gradient allows protons to move around and prevents them from aligning correctly after rephasing, which contributes to the emission of a high intensity echo signal. This measure of displacement indicates how much diffusion exists in the tissue. If the displacement is towards every direction, diffusion is free (isotropic); if on the other hand, the displacement is towards a particular direction, diffusion is restricted (anisotropic). This technique is very useful because it allows assigning different shades of color to the pixels in the image depending on diffusion, gray if its isotropic and white if its anisotropic. This way, changes in irrigation (e.g. cerebral ischemia) and in white matter composition (e.g. Alzheimer) can be detected (Figure 3).

{{< figure src="dwi2.es.png" align="center" title="Figure 3. Illustration of the relationship between gradients, spin and diffusion. Applying the first gradient (green bar) dephases protons spin. The second gradient (green bar) is able to correct this dephasement, but given the type of diffusion in the tissue, the protons will align correctly or not. Regions with isotropic diffusion fail to rephase, thus emitting a lower signal (cerebrospinal fluid, blue squares); while regions with anisotropic diffusion rephase better and emit a high intensity signal (stroke zone, yellow squares) [obtained from Johansen-berg & Behrens 2014]." >}}

## Apparent Diffusion Coefficient (ADC)
Many times, the signal obtained with DWI is not perfect and may be intense even though $b = 0$ o $b > 0$ . This is because the sequence pulse used is very similar to the signals obtained with long times of echo and repetition (T2-weighted). This problem is known as T2 effect or T2 shine-through and the solution is to obtain the apparent diffusion coefficient (ADC) for every voxel of the image using the following formula:

$$ ADC = - \frac{ln\frac{S_{b_2}}{S_{b_1}}}{(b_2-b_1) = } - \frac{ln\frac{S_b}{S_0}}{b}$$

Where, $S_{b_1}$ y $S_{b_2}$ are the signal intensities obtained with different values of $b$ , with the condition that $b_1 < b_2$ . Values more common for $b_1$ y $b_2$ are $0$ y $1000\ s/mm^2$ , respectively. Contrary to DWI, ADC reflects isotropic diffusion zones in shades of white and anisotropic diffusion in shades of gray (Figure 4).

{{< figure src="ADC.es.png" align="center" title="Figure 4. DWI vs. ADC. vs. T2. A circular lesion (glioma) that shows anisotropic diffusion can be seen on DWI image (left). The ADC image (center) says otherwise, there is a lesion with an increased diffusion (isotropic). T2 (right) confirms that the white shade gliom in DWI was caused by the shine-through effect [obtained from mriquestions]." >}}

## Artefacts
All imaging modalities have artifacts for x or y reasons. DWI is no exception. Some of the most common are:

- Perfusion effect: derived from vasculature and blood flow. May alter ADC measurement.

- Effects due to movement: derived from the patient's movement.

- Effects due to cerebrospinal fluid (CSF) pulsation: derived from CSF motion related to the systolic phase of the cardiac cycle.

## Conclusion
To finish, I would like to remind you that resonance magnetic diffusion and apparent diffusion coefficient are useful tools in the detection and evaluation of different pathologies. They can be integrated easily into MRI pulse sequences. Its use ranges from oncological applications to pediatric development studies. It is a technique very sensitive to movement, so care must be taken when during the study to avoid artifacts in the signal/image. Below, I left you a list with key ideas from the text:

1.	Diffusion is a phenomenon that describes the random motion ofr particles in a medium without external help

2.	Resonance magnetic diffusion (DWI) allows to detect regions where protons diffusion is free or restricted.

3.	Apparent diffusion coefficient (ADC) allows to measure and quantify the diffusion of water in tissue, as well as confirm DWI results.

4.	It is highly sensitive to movement related artifacts.

{{< notice tip >}}

If you still have doubts, I recommend you to check the videos at the end of the references or, in any case, write a comment below 😎.

{{< /notice >}}

## References

### Articles and Books
[1] Nelson, E. (1967). Dynamical Theories of Brownian Motion. In Dynamical Theories of Brownian Motion (2nd). Princeton University Press

[2] Sharma, S., & Vishwamittar. (2005). Brownian motion problem: Random walk and beyond. Resonance, 10(8), 49–66.

[3] Leite, C. C. & Castillo, M. (2016). Diffusion Weighted and Diffusion Tensor Imaging (1st). Thieme Medical.

[4] Johansen-Berg, H. & Behrens, T. E. J. (2014). Diffusion MRI: From Quantitative Measurement to In vivo Neuroanatomy (2nd). Elsevier.

[5] Baliyan, V., Das, C. J., Sharma, R., & Gupta, A. K. (2016). Diffusion weighted imaging: Technique and applications. World Journal of Radiology, 8(9), 785.

[6] Schaefer, P. W., Grant, P. E., & Gonzalez, R. G. (2000). Diffusion-weighted MR imaging of the brain. Radiology, 217(2), 331–345. 

[7] Ahualli, Jorge. (2010). Aspectos generales de las secuencias de difusión de imagen en resonancia magnética. Revista Argentina de Radiología, 74(3).

### Class notes
[8] Anne Pollacco, D. (2016). Magnetic Resonance Imaging. University of Malta [Notes]

### Videos
[9] Doctor Klioze (2014). Diffusion Weighted Imaging [Video]. Youtube. https://www.youtube.com/watch?v=J_aamnpRJE8

[10] Barton Branstetter (2019). ADC versus DWI [Video]. Youtube. https://www.youtube.com/watch?v=rEG85oOypXU

### Websites
[11] Hammer, M. (2013-2014). XRayPhysics - Interactive Radiology Physics. http://xrayphysics.com/

</div>
