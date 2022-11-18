# Visual Studio Code Config

Configuration I generally apply to a fresh-install of [VSCode](https://github.com/Microsoft/vscode/).

## Prerequisites

Make sure to install these first, restart your VSCode, and then apply the config.

1. [IBM Plex](https://github.com/IBM/plex) font. Specifically make sure you install
`IBM Plex Mono Medium`.
2. [One Monokai Theme](https://marketplace.visualstudio.com/items?itemName=azemoh.one-monokai)

On some systems, you need to tweak how the font is set in `user-settings.json`:

```
  "editor.fontFamily": "'IBM Plex Mono Medium'",
  
  //or 
  
  "editor.fontFamily": "IBM Plex Mono",
```

3. Some packages require `GNU global` to be installed. On Debian-like systems get it with:

```
sudo apt-get install global
```

## VSCode plugins

What I install right away:

1. [TSLint](https://marketplace.visualstudio.com/items?itemName=eg2.tslint)
2. [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
3. [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
4. [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
5. [Docker](https://marketplace.visualstudio.com/items?itemName=PeterJausovec.vscode-docker)
6. [language-stylus](https://marketplace.visualstudio.com/items?itemName=sysoev.language-stylus)
7. [Sass](https://marketplace.visualstudio.com/items?itemName=robinbentley.sass-indented)
8. [Beautify css/sass/scss/less](https://marketplace.visualstudio.com/items?itemName=michelemelluso.code-beautifier)

Extra things:

1. [Pascal](https://marketplace.visualstudio.com/items?itemName=alefragnani.pascal)
2. [Pascal Formatter](https://marketplace.visualstudio.com/items?itemName=alefragnani.pascal-formatter)
3. [TSLint Vue](https://marketplace.visualstudio.com/items?itemName=prograhammer.tslint-vue)
4. [Vetur](https://marketplace.visualstudio.com/items?itemName=octref.vetur)
