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
disableShare: false
disableHLJS: false
hideSummary: false
#searchHidden: false
ShowReadingTime: true
ShowBreadCrumbs: false
ShowPostNavLinks: true
---
<div style="text-align: justify"> 

# Introducción -
Desde hace tiempo, he estado buscando la mejor manera de crear un entorno de desarrollo reproducible que me evite la tediosa tarea de instalar y configurar mis herramientas de trabajo, te estoy hablando a ti VIM. Sé que existen diferentes formas de manejar los famosos archivos `.dot`, pero quería encontrar una manera de agrupar todo. Fue entonces que me topé con [**Nix**](https://github.com/NixOS/nix), un lenguaje funcional que actúa como gestor de paquetes y facilita la creación de entornos reproducibles; inclusive existe una distribución de Linux que gira en torno a **Nix**, se llama [**NixOs**](https://nixos.org/) y como podrás adivinar, permite configurar tu sistema y paquetes de manera declarativa y reproducible. Volviendo al tema, estuve varios días partiendome la cabeza intentando entender la sintáxis del lenguaje, pero al final logré mi cometido. Aquí te contaré cómo.

# Primeros pasos
## WSL
Primero que nada, hay que habilitar e instalar **Windows Subsystem for Linux** (WSL). Abrimos **PowerShell** como administrador y ejecutamos:

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

Ahora toca elegir una distribución de tu agrado, en mi caso elegí [Alpine](https://github.com/yuk7/AlpineWSL) por ser ligera y no contar con nada adicional, pero la mayoría se siente más cómodo con alguna distribución basada en Debian. Para ver una lista de las distribuciones disponibles para instalar ingresa:

```powershell {linenos=inline}
wsl --list --online
# Una vez hayas seleccionado una de tu agrado, ingresa
wsl --install --distribution <Nombre>
```

En caso de que quieras otra, te recomiendo buscar en línea. Una vez tengas tu distribución y hayas hecho las configuraciones iniciales como crear un usuario, contraseña y actualizar tu sistema (`sudo apt update && xsudo apt upgrade`), entre otras; entonces estás listo para instalar **Nix**.

## Nix
La instalación de **Nix** es sencilla. Basta con abrir tu distribución e ingresar: 

```bash {linenos=inline}
sh <(curl -L https://nixos.org/nix/install) --no-daemon
# Para probar tu instalación, ingresa
nix --version
# Si no tienes respuesta, te recomiendo reiniciar tu distro
```

## Home-Manager
Vale, asumiendo que tienes una instalación de **Nix** funcional, procederemos a instalar **Home-manager**, una herramienta que nos permitirá gestionar nuestro entorno de usuario de tal forma que podremos declarar los paquetes que queramos y sus respectivas configuraciones.

Primero, dado que no estamos usando NixOs, hay que ejecutar el siguiente comando para que lo demás funcione:

```bash
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
```

Luego, agregaremos una fuente a nuestra lista de de paquetes y actualizaremos la lista:
```bash {linenos=inline}
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

Ahora, instalaremos home-manager

```bash
nix-shell '<home-manager>' -A install
```

Listo, lo único que resta es editar el archivo de configuración de home-manager ubicado en `$HOME/.config/nixpkgs/home.nix`.

# Configurando nuestro entorno

Editar `home.nix` puede ser tan difícil como tu desees. Todo depende del nivel de personalización que le quieras dar. El siguiente código puede servirte para empezar:

```nix {linenos=inline}
{ config, pkgs, ... }:

{
  # Home manager necesita información sobre ti y
	# el directorio que manejará
	home.username = "<usuario>";
	home.homeDirectory = "/home/<usuario>";

	# Opcional ** Variables de la sesión
	home.sessionVariables = {
	  EDITOR = "<editorDeTexto>";
    };

	# Paquetes a instalar rápidamente
	home.packages = with pkgs; [
	  /* 
		.
		.
		.
		*/
    ];

	# Paquetes a instalar y configurar
	programs = {
	  /*
		e.g
		git = {
          enable = true;
          usernName = "<usuario>";
          userEmail = "<email>";
        };
		.
		.
		.
		*/
    };


	/* Este valor determina la versión de Home Manager con la que
	tu configuración es compatible. Esto ayuda a evitar errores
	cuando una nueva versión es incompatible con versiones previas.

	Puedes actualizar Home Manager sin cambiar este valor. Vea las
	notas de versión de Home Manager para una lista de los cambios
	de cada lanzamiento.
	*/
	home.stateVersion = "22.05";

	# Permite que Home Manager se instale y configure a si mismo
	programs.home-manager.enable = true;
}
```
Puedes utilizar el [buscador](https://search.nixos.org/packages) y la [wiki de NixOs](https://nixos.wiki/) para encontrar más paquetes y sus respectivas opciones de configuración. Al final, podrías terminar con un archivo como el [mío](https://github.com/Athansya/nixfiles/blob/main/home.nix). Una vez que hayas terminado, hay que activar la configuración con el siguiente comando:

```bash
home-manager switch
```

Y eso es todo, ya tienes un entorno funcional de desarrollo. Te recomiendo crear un repositorio para descargarlo y activarlo cada vez que lo necesites.

# Notas finales
Para concluir, me gustaría hablar sobre el concepto de generación. Cada vez que realizamos un cambio en nuestra configuración, tanto en **Nix** como en **Home Manager**, se produce una nueva generación. En caso de que tengamos algún problema con los nuevos cambios, siempre podemos volver a la versión anterior. Para listar y manipular las generaciones que tenemos respaldadas se utilizan los siguientes comandos:

**Nix**
```bash {linenos=inline}
# Lista las generaciones
nix-env --list-generations

# Regresar a la generación anterior
nix-env --rollback

# Cambia a una generación en específico
nix-env --switch-generation <id-generación>

# Borrar ciertas generaciones
nix-env --delete-generations <id-generaciones separados por espacios>

# Borrar las generaciones excepto las últimas <N>
nix-env --delete-generations +<N>

# Borrar todas las generaciones excepto la actual
nix-env --delete-generations old

# Recolección de basura
nix-collect-garbage
```

**Home Manager**
```bash {linenos=inline}
# Lista las generaciones
home-manager generations

# Borrar ciertas generaciones
home-manager remove-generations <id-generaciones separados por espacios>

# Borrar generaciones anteriores a <timestamp> (e.g. -30 days)
home-manager expire-generations <timestamp>
```

{{% notice info %}}
Aún no es posible realizar cambiar de generación en home-manager con un simple comando, pero la manera de hacerlo es la siguiente:
1. Lista las generaciones e identifica la ID de tu preferencia: `home-manager generations`   
2. Copia la ruta a la que apunta esa ID -> (e.g.`/nix/store/kahm1rxk77mnvd2l8pfvd4jkkffk5ijk-home-manager-generation`)
3. Ejecuta el script `activate` de la ruta: `/nix/store/kahm1rxk77mnvd2l8pfvd4jkkffk5ijk-home-manager-generation/activate`. 
{{% /notice %}}

# Referencias
- NixOs, **"Getting Nix / NixOs"** n.d. [Online]. Available: <https://nixos.org/download.html#nix-install-windows>.
- NixOs Wiki, **"Home Manager"** n.d. [Online]. Available: <https://nixos.wiki/wiki/Home_Manager>.
- Nix Community, **"Home Manager Manual"** n.d. [Online]. Available: <https://nix-community.github.io/home-manager/>.
- F. Mouaffo, **"Nix introduction, Main Concepts and commands"** Adaltas 01-Feb-2022. [Online]. Available: <https://www.adaltas.com/en/2022/02/01/nix-introduction/>.
- C. Bailey, **"A minimal development environment on WSL"** 04-Apr-2021. [Online]. Available: <https://cbailey.co.uk/posts/a_minimal_nix_development_environment_on_wsl>. 
- M. Gheda, **"Tutorial: Getting started with Home Manager for Nix"** 05-April-2021. [Online]. Available: <https://ghedam.at/24353/tutorial-getting-started-with-home-manager-for-nix>
- NixOs Wiki, **"Nix Cookbook: Managing storage"** n.d. [Online]. Available: <https://nixos.wiki/wiki/Nix_Cookbook>.
- A. Pearce, **"Managing dotfiles with Nix"** 27-Jul-2021. [Online]. Available: <https://alexpearce.me/2021/07/managing-dotfiles-with-nix/>.

</div>

