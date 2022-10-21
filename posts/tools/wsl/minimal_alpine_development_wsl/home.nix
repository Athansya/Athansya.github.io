{ config, pkgs, ... }:

{
  # Home Manager necesita información sobre ti y tu dir
  home.username = "atoriz98";
  home.homeDirectory = "/home/atoriz98";

  # Variables de la sesión
  home.sessionVariables = {
    EDITOR = "vim";  # Editor preferido 
  };

  # Paquetes a instalar
  home.packages = with pkgs; [
     # Terminal
     tmux # Terminal multiplexor

     # Herramientas
     bat # Reemplazo de cat
     exa # Mejor ls
     tldr # man con ejemplos y simplificado

     # Syntax linters
     rnix-lsp # linter de nix
   ];

  # Programas para instalar y configurar de alguna forma
  programs = {
     # Sustituto de bash: Fish Shell
     fish = {
       enable = true;

        # Plugins
        plugins = [{
          name="foreign-env";
          src = pkgs.fetchFromGitHub {
            owner = "oh-my-fish";
            repo = "plugin-foreign-env";
            rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
            sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
          };
        }];

        # Aliases de diferentes comandos
        shellAliases = {
           # Prompt confirmación
           rm = "rm -i";
           cp = "cp -i";
           mv = "mv -i";
           # Habilita directorios anidados
           mkdir = "mkdir -p";
           # Abre nix-shell/develop con fish en lugar de bash
           nix-shell = "nix-shell --run fish";
           develop = "nix develop -c fish";
           # Sustituye ls
           ls = "exa -l";
         };

        # Funciones personalizadas
        functions = {
          # Elimina el saludo de Fish
          fish_greeting = {
            description = "Starting Greeting";
            body = ""; # Emtpy
          };

          # Cambia el prompt de Fish dependiendo si estás en nix shell o no
          fish_prompt = {
            description = "Fish prompt";
            body = ''
              set -l nix_shell_info (
                if test -n "$IN_NIX_SHELL"
                  set_color $fish_color_cwd
                  printf '<nix-shell> '
                else
                  set_color $fish_color_cwd
                  printf '%s' $USER
                  set_color normal
                  printf '@%s' $hostname
                  set_color $fish_color_cwd
                  printf '%s' (prompt_pwd)
                  set_color normal
                  printf '%s λ ' (fish_git_prompt)
                end
              )
              echo -n -s "$nix_shell_info"
            '';
          };

          # Crea un directorio y entra en el
          mkdcd = {
            description = "Make a directory and enter it";
            body = "mkdir -p $argv[1]; and cd $argv[1]"; 
          };
        };
      };

     # VIM
     vim = {
       enable = true;
        # Plugins
        plugins = with pkgs.vimPlugins; [
          # Status line
          lightline-vim

          # Tema
          dracula-vim

          # Syntax
          ale
          YouCompleteMe

          # Manejo de archivos
          nerdtree

          # Integra Git
          vim-gitgutter
          nerdtree-git-plugin
          vim-fugitive
        ]; 
        # Configuración adicional
        settings = {
          ignorecase = true;
          relativenumber = true;
          tabstop = 2;
        };

        # Configuración de opciones de vimrc
        extraConfig = ''
          set wrap
          set breakindent
          set linebreak
          set shell=/home/atoriz98/.nix-profile/bin/fish
          colorscheme dracula 
        '';
      };

     # Git
     git = {
       enable = true;
       userName = "Athansya";
       userEmail = "atoriz98@outlook.com";
        # Aliases
        aliases = {
          st = "status"; 
        };
      };
    };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
