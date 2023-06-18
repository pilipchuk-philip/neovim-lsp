#! /bin/bash
RED="\033[31m"
GREEN="\033[32m"
ENDCOLOR="\033[0m"

sudo npm install -g vscode-langservers-extracted &&
    echo -e "${GREEN} -------------- ✓ OK Markup -------------- ${ENDCOLOR}"||
    echo -e "${RED}-------------- ✘ Failed Markup --------------${ENDCOLOR}"

sudo npm install -g dockerfile-language-server-nodejs &&
    echo -e "${GREEN}-------------- ✓ OK Docker --------------${ENDCOLOR}"||
    echo -e "${RED}-------------- ✘ Failed Docker --------------${ENDCOLOR}"

sudo npm install -g pyright &&
    echo -e "${GREEN}-------------- ✓ OK Pyright --------------${ENDCOLOR}"||
    echo -e "${RED}-------------- ✘ Failed Pyright --------------${ENDCOLOR}"

sudo npm install -g typescript typescript-language-server &&
    echo -e "${GREEN}-------------- ✓ OK Typescript --------------${ENDCOLOR}"||
    echo -e "${RED}-------------- ✘ Failed Typescript --------------${ENDCOLOR}"

sudo npm install -g bash-language-server &&
    echo -e "${GREEN}-------------- ✓ OK Bash --------------${ENDCOLOR}"||
    echo -e "${RED}-------------- ✘ Failed Bash --------------${ENDCOLOR}"

sudo npm install -g sql-language-server &&
    echo -e "${GREEN}-------------- ✓ OK SQL --------------${ENDCOLOR}"||
    echo -e "${RED}-------------- ✘ Failed SQL --------------${ENDCOLOR}"

sudo npm install -g emmet-ls &&
    echo -e "${GREEN}-------------- ✓ OK Emmet --------------${ENDCOLOR}"||
    echo -e "${RED}-------------- ✘ Failed Emmet --------------${ENDCOLOR}"

sudo npm install -g yaml-language-server &&
    echo -e "${GREEN}-------------- ✓ OK Yaml --------------${ENDCOLOR}"||
    echo -e "${RED}-------------- ✘ Failed Yaml --------------${ENDCOLOR}"

echo -e "${GREEN}-------------------------------------------${ENDCOLOR}"
echo -e "${GREEN}                 RUST                      ${ENDCOLOR}"
echo -e "${GREEN}-------------------------------------------${ENDCOLOR}"
echo -e "${RED}       RUST NEED BE INSTALLED MANUALY      ${ENDCOLOR}"
echo -e "${RED}
https://github.com/rust-analyzer/rust-analyzer
${ENDCOLOR}"
echo -e "${GREEN}-------------------------------------------${ENDCOLOR}"

echo -e "${GREEN}-------------------------------------------${ENDCOLOR}"
echo -e "${GREEN}                 CLANG                      ${ENDCOLOR}"
echo -e "${GREEN}-------------------------------------------${ENDCOLOR}"
echo -e "${RED}       C Lang NEED BE INSTALLED MANUALY      ${ENDCOLOR}"
echo -e "${RED}
https://clangd.llvm.org/installation.html
${ENDCOLOR}"
echo -e "${GREEN}-------------------------------------------${ENDCOLOR}"

