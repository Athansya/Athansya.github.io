---
title: "Nix + Home-manager para entornos de desarrollo en WSL"
date: 2022-05-10
tags: ["tools", "nix", "wsl"]
author: "@atorizv"
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
---
# Introducción -
Desde hace tiempo, he estado buscando la mejor manera de crear un entorno de desarrollo reproducible que me evite la tediosa tarea de instalar y configurar mis herramientas de trabajo, te estoy hablando a ti VIM. Sé que existen diferentes herramientas para manejar los famosos archivos `.dot`, pero quería encontrar una manera de agrupar todo. Fue entonces que me topé con **Nix**, un lenguaje funcional que actúa como gestor de paquetes y facilita la creación de entornos reproducibles. Después de varios días de partirme la cabeza intentando entender la sintáxis del lenguaje, logré mi cometido. Aquí te contaré cómo.

# Primeros pasos
## WSL
Primero que nada, hay que habilitar e instalar **Windows Subsystem for Linux** (WSL). Hay que abrir **PowerShell** como administrador y ejecutar:

```powershell 
wsl --install
```


{{< notice note >}}
Ojo, si no te lo permite, lo más seguro es que no tengas habilitada la opción. Para hacerlo ejecuta primero:

```powershell 
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

Luego, reinicia tu computadora para que los cambios tengan efecto.

{{< /notice >}}

Ahora toca elegir una distribución de tu agrado, en mi caso elegí Alpine por ser ligera y no contar con nada adicional. Para ver una lista de las distribuciones disponibles para instalar ingresa:

```powershell 
wsl --list --online
```

En caso de que quieras otra, te recomiendo buscar en línea. Una vez tengas tu distribución y hayas hecho las configuraciones iniciales como crear un usuario, contraseña y actualizar tu sistema (`sudo apt update && sudo apt upgrade`), entre otras; entonces estás listo para instalar **Nix**.

