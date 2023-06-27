#!/bin/bash

# Colors
RED="\e[31m"
ENDCOLOR="\e[0m"
YELLOW="\e[33m"
GREEN="\e[32m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"

# General Shortcuts / Utils shortcuts

# Clears the terminal.
function c() {
    clear
}

# Quit the terminal.
function quit() {
    kill $(pgrep -a Terminal)
}
alias q='quit'
alias quit='quit'

# nConnect Project Code Shortcuts

# Open parent app code in vscode
function parent() {
    cd Documents/Office/nconnect_parent
    code .
    quit
}

# Open staff app code in vscode
function staff() {
    cd Documents/Office/nconnect_staff
    code .
    quit
}

# Open server app code in vscode
function server() {
    cd Documents/Office/nconnect_server
    code .
    quit
}

# Open admin panel webapp code in vscode
function admin() {
    cd Documents/Office/nconnect_admin
    code .
    quit
}

# Open disha webapp code in vscode
function disha() {
    cd Documents/Office/reach_disha_web
    code .
    quit
}

# Open disha admin panel webapp code in vscode
function dcadmin() {
    cd Documents/Office/reach-disha-admin
    code .
    quit
}

# Flutter shortcuts

# Run the flutter app.
function flr() {
    flutter run
}

# Clean the flutter project
function flc() {
    flutter clean
}

# Clean the flutter project and install the packages
function fcg() {
    flutter clean
    flutter pub get
    clear
}

# Build Runner for flutter projects
function fbr() {
    flutter pub run build_runner build --delete-conflicting-outputs
}

# Clean flutter project including iOS and install all the packages.
function fci() {
    flutter clean && flutter pub get
    rm ios/Podfile.lock
    cd ios/
    pod cache clean --all
    pod repo update
    pod install
    cd ../
}

# Clean and run the flutter project
# Clean and run the flutter project
function ffc() {
    if [[ "$1" == "--help" ]]; then

        echo -e "${GREEN}ffc - Clean and run a Flutter project.${ENDCOLOR}\n\n\
${YELLOW}Description:${ENDCOLOR}\n\
The ${CYAN}ffc${ENDCOLOR} function allows you to conveniently clean and run a Flutter project. It calls the ${CYAN}flc${ENDCOLOR} function to clean the project and the ${CYAN}flr${ENDCOLOR} function to run the project.\n\n\
${YELLOW}Usage:${ENDCOLOR}\n\
${CYAN}ffc${ENDCOLOR}\n\n\
${YELLOW}For help:${ENDCOLOR}\n\
${CYAN}ffc --help${ENDCOLOR}"
        return 1
    fi

    if [ $# -ne 0 ]; then
        echo -e "${RED}Error: 'ffc' does not accept any arguments.${ENDCOLOR}"
        ffc --help
        return 0
    fi

    flc
    flr
}

# Open package website (in pub.dev)
function fcl() {
    if [[ "$1" == "--help" ]]; then
        echo -e "${GREEN}fcl() - Open the URL of a Flutter package on pub.dev.${ENDCOLOR}

${YELLOW}Description:${ENDCOLOR}
The ${CYAN}fcl()${ENDCOLOR} function allows you to quickly open the URL of a Flutter package on the ${CYAN}pub.dev${ENDCOLOR} website. It automatically generates the URL based on the package name provided as an argument and opens it in your default web browser.

${YELLOW}Usage:${ENDCOLOR}
${CYAN}fcl <package-name>${ENDCOLOR}

${YELLOW}Parameters:${ENDCOLOR}
${CYAN}package-name${ENDCOLOR} - The name of the Flutter package.

${YELLOW}Example:${ENDCOLOR}
${CYAN}fcl http${ENDCOLOR}

${YELLOW}Procedure:${ENDCOLOR}
1. Provide the name of the Flutter package when prompted.
2. The function will generate the URL for the package on ${CYAN}pub.dev${ENDCOLOR}.
3. The URL will be opened in your default web browser.
"
        return
    fi
    url="https://pub.dev/packages/$1"
    open $url
}

# Flutter: Run in release mode
function frr() {
    flutter run --release
}

function fjavafix() {
    cd /Applications/Android\ Studio.app/Contents
    ln -s jbr jre
}

# Nuxt Shortcuts

# NPM shortcuts

# NPM: Runs the nuxt app using NPM.
function nrd() {
    npm run dev
}

# NPM: Install packages from package.json in the project.
function ni() {
    npm install
}

# Yarn shortcuts

# Yarn: Install packages from package.json in the project.
function yi() {
    yarn install
}

# Yarn: Clean the nuxt project by removing yarn.lock, .nuxt and node_modules folders.
function yc() {
    yarn clean
}

# Yarn: Clean install the nuxt project.
function yci() {
    yc
    yi
}

# Yarn: Run the nuxt app using yarn.
function yd() {
    yarn dev
}

# Yarn: Clean install and run the nuxt project.
function ycid() {
    yc
    yi
    c
    yd
}

# Yarn: Check for package upgrades.
function yu() {
    yarn upgrade-interactive —latest
}

# ASP.NET shortcuts

function dr() {
    dotnet run
}

function dre() {
    dotnet restore
}

## Generate TS interfaces from swagger hosted in a particular URL.
function openapi() {
    if [[ "$1" == "--help" ]]; then
        echo -e "${GREEN}This generates TypeScript interfaces from a Swagger hosted at a specific URL.${ENDCOLOR}

${YELLOW}Description:${ENDCOLOR}
The ${CYAN}openapi()${ENDCOLOR} function allows you to generate TypeScript interfaces from a Swagger specification hosted at a given URL. It utilizes the ${MAGENTA}'openapi-typescript'${ENDCOLOR} package to perform the conversion. The generated TypeScript interfaces will be saved as ${BLUE}'nconnect.d.ts'${ENDCOLOR} in the ${BLUE}'Downloads'${ENDCOLOR} folder.

${YELLOW}Usage:${ENDCOLOR}
${CYAN}openapi <url>${ENDCOLOR}

${YELLOW}Parameters:${ENDCOLOR}
${CYAN}url${ENDCOLOR} - The URL where the Swagger specification is hosted. By default, port number is ${CYAN}5000${ENDCOLOR}.

${YELLOW}Example:${ENDCOLOR}
${CYAN}openapi 172.40.43.125${ENDCOLOR} - This takes 127.0.0.1 as the URL.
${CYAN}openapi localhost${ENDCOLOR} - This takes 127.0.0.1 as the URL.

${YELLOW}Note:${ENDCOLOR}
Please ensure that you have the ${MAGENTA}'openapi-typescript'${ENDCOLOR} package installed globally or locally before using this function.

${YELLOW}Procedure:${ENDCOLOR}
1. Provide the URL of the Swagger specification when prompted.
2. If the URL is valid, a confirmation message will be displayed.
3. Type ${CYAN}'y'${ENDCOLOR} or ${CYAN}'Y'${ENDCOLOR} to proceed or ${CYAN}'n'${ENDCOLOR} or ${CYAN}'N'${ENDCOLOR} to abort.
4. If confirmed, the function will attempt to generate TypeScript interfaces from the Swagger specification.
5. The generated ${BLUE}'nconnect.d.ts'${ENDCOLOR} file will be saved in the ${BLUE}'Downloads'${ENDCOLOR} folder.
6. Check the ${BLUE}'Downloads'${ENDCOLOR} folder for the generated file.

${YELLOW}Note:${ENDCOLOR}
If there is an error while downloading, use the latest ${CYAN}node version${ENDCOLOR} and update ${CYAN}openapi-typescript${ENDCOLOR} package.
"
    else
        url="$1"

        # Check if the URL is an empty string
        if [ -z "$url" ]; then
            echo "${RED}Error: Empty URL.${ENDCOLOR}"
        else
            echo "${YELLOW}URL: $url.${ENDCOLOR}"

            echo "Do you want to proceed? (y/n)"
            read confirm

            if [[ $confirm =~ ^[Yy]$ ]]; then
                if [[ "$url" == "localhost" ]]; then
                    url="127.0.0.1"
                fi
                cd Downloads
                npx openapi-typescript http://$url:5000/swagger/v1/swagger.json --output nconnect.d.ts
                cd ..
                echo "${YELLOW}If error is not thrown, check in the downloads folder for the generated file - nconnect.d.ts.${ENDCOLOR}"
            else
                echo "Enter the URL again"
                read new_url

                openapi ${new_url}
            fi
        fi
    fi
}

# Git shorcuts

function gc() {
    git checkout $1
}

function ga() {
    git add .
}

function gcb() {
    echo "${YELLOW}$(git branch --show-current)${ENDCOLOR}"
}

function gp() {
    git pull
}

function gpo() {
    echo "${YELLOW}Pulling $(git branch --show-current)...${ENDCOLOR}"
    git pull origin $(git branch --show-current)
}

function gpsh() {
    echo "${YELLOW}Pushing to $(git branch --show-current)...${ENDCOLOR}"
    git push origin $(git branch --show-current)
}

# Help function
function help() {
    # Display all available functions or commands
    if [ -z "$1" ]; then
        echo -e "${YELLOW}General Shortcuts / Utils shortcuts:${ENDCOLOR}"
        echo -e "c              - ${GREEN}Clears the terminal.${ENDCOLOR}"
        echo -e "quit           - ${GREEN}Quits the terminal.${ENDCOLOR}"
        echo -e ""
        echo -e "${YELLOW}nConnect Project Code Shortcuts:${ENDCOLOR}"
        echo -e "parent         - ${GREEN}Opens the parent app code in Visual Studio Code.${ENDCOLOR}"
        echo -e "staff          - ${GREEN}Opens the staff app code in Visual Studio Code.${ENDCOLOR}"
        echo -e "server         - ${GREEN}Opens the server app code in Visual Studio Code.${ENDCOLOR}"
        echo -e "admin          - ${GREEN}Opens the admin panel web app code in Visual Studio Code.${ENDCOLOR}"
        echo -e "disha          - ${GREEN}Opens the disha web app code in Visual Studio Code.${ENDCOLOR}"
        echo -e "dcadmin        - ${GREEN}Opens the disha admin panel web app code in Visual Studio Code.${ENDCOLOR}"
        echo -e ""
        echo -e "${YELLOW}Flutter shortcuts:${ENDCOLOR}"
        echo -e "flr            - ${GREEN}Runs the Flutter app.${ENDCOLOR}"
        echo -e "flc            - ${GREEN}Cleans the Flutter project.${ENDCOLOR}"
        echo -e "fcg            - ${GREEN}Cleans the Flutter project and installs the packages.${ENDCOLOR}"
        echo -e "fbr            - ${GREEN}Builds Runner for Flutter projects.${ENDCOLOR}"
        echo -e "fci            - ${GREEN}Cleans Flutter project including iOS and installs all the packages.${ENDCOLOR}"
        echo -e "ffc            - ${GREEN}Cleans the Flutter project and runs the app.${ENDCOLOR}"
        echo -e "fcl <pkg>      - ${GREEN}Opens the package website in pub.dev.${ENDCOLOR}"
        echo -e "frr            - ${GREEN}Runs the Flutter app in release mode.${ENDCOLOR}"
        echo -e "fjavafix       - ${GREEN}Fixes the Java issue in Android Studio.${ENDCOLOR}"
        echo -e ""
        echo -e "${YELLOW}Nuxt shortcuts:${ENDCOLOR}"
        echo -e "nrd            - ${GREEN}Runs the Nuxt app using NPM.${ENDCOLOR}"
        echo -e "ni             - ${GREEN}Installs packages from the package.json file using NPM.${ENDCOLOR}"
        echo -e "yi             - ${GREEN}Installs packages from the package.json file using Yarn.${ENDCOLOR}"
        echo -e "yc             - ${GREEN}Cleans the Nuxt project by removing yarn.lock, .nuxt, and node_modules folders.${ENDCOLOR}"
        echo -e "yci            - ${GREEN}Cleans and installs packages for the Nuxt project.${ENDCOLOR}"
        echo -e "yd             - ${GREEN}Runs the Nuxt app using Yarn.${ENDCOLOR}"
        echo -e "ycid           - ${GREEN}Cleans, installs packages, and runs the Nuxt project.${ENDCOLOR}"
        echo -e "yu             - ${GREEN}Checks for package upgrades using Yarn.${ENDCOLOR}"
        echo -e ""
        echo -e "${YELLOW}ASP.NET shortcuts:${ENDCOLOR}"
        echo -e "dr             - ${GREEN}Runs the ASP.NET app.${ENDCOLOR}"
        echo -e "dre            - ${GREEN}Restores packages for the ASP.NET app.${ENDCOLOR}"
        echo -e "openapi <url>  - ${GREEN}Generates TypeScript interfaces from a Swagger API specification.${ENDCOLOR}"

    elif [ "$1" = "flutter" ]; then
        # Display Flutter-related functions or commands
        echo -e "${YELLOW}Flutter-related functions or commands:${ENDCOLOR}"
        echo -e "flr            - ${GREEN}Runs the Flutter app.${ENDCOLOR}"
        echo -e "flc            - ${GREEN}Cleans the Flutter project.${ENDCOLOR}"
        echo -e "fcg            - ${GREEN}Cleans the Flutter project and installs the packages.${ENDCOLOR}"
        echo -e "fbr            - ${GREEN}Builds Runner for Flutter projects.${ENDCOLOR}"
        echo -e "fci            - ${GREEN}Cleans Flutter project including iOS and installs all the packages.${ENDCOLOR}"
        echo -e "ffc            - ${GREEN}Cleans the Flutter project and runs the app.${ENDCOLOR}"
        echo -e "fcl <pkg>      - ${GREEN}Opens the package website in pub.dev.${ENDCOLOR}"
        echo -e "frr            - ${GREEN}Runs the Flutter app in release mode.${ENDCOLOR}"
        echo -e "fjavafix       - ${GREEN}Fixes the Java issue in Android Studio.${ENDCOLOR}"
    elif [ "$1" = "utils" ]; then
        # Display utility functions or commands
        echo -e "${YELLOW}Utility functions or commands:${ENDCOLOR}"
        echo -e "c              - ${GREEN}Clears the terminal.${ENDCOLOR}"
        echo -e "quit           - ${GREEN}Quits the terminal.${ENDCOLOR}"
    elif [ "$1" = "office" ]; then
        # Display nConnect project code shortcuts
        echo -e "${YELLOW}nConnect Project Code Shortcuts:${ENDCOLOR}"
        echo -e "parent         - ${GREEN}Opens the parent app code in Visual Studio Code.${ENDCOLOR}"
        echo -e "staff          - ${GREEN}Opens the staff app code in Visual Studio Code.${ENDCOLOR}"
        echo -e "server         - ${GREEN}Opens the server app code in Visual Studio Code.${ENDCOLOR}"
        echo -e "admin          - ${GREEN}Opens the admin panel web app code in Visual Studio Code.${ENDCOLOR}"
        echo -e "disha          - ${GREEN}Opens the disha web app code in Visual Studio Code.${ENDCOLOR}"
        echo -e "dcadmin        - ${GREEN}Opens the disha admin panel web app code in Visual Studio Code.${ENDCOLOR}"
    elif [ "$1" = "nuxt" ]; then
        # Display Nuxt shortcuts
        echo -e "${YELLOW}Nuxt Shortcuts:${ENDCOLOR}"
        echo -e "nrd            - ${GREEN}Runs the Nuxt app using NPM.${ENDCOLOR}"
        echo -e "ni             - ${GREEN}Installs packages from the package.json file using NPM.${ENDCOLOR}"
        echo -e "yi             - ${GREEN}Installs packages from the package.json file using Yarn.${ENDCOLOR}"
        echo -e "yc             - ${GREEN}Cleans the Nuxt project by removing yarn.lock, .nuxt, and node_modules folders.${ENDCOLOR}"
        echo -e "yci            - ${GREEN}Cleans and installs packages for the Nuxt project.${ENDCOLOR}"
        echo -e "yd             - ${GREEN}Runs the Nuxt app using Yarn.${ENDCOLOR}"
        echo -e "ycid           - ${GREEN}Cleans, installs packages, and runs the Nuxt project.${ENDCOLOR}"
        echo -e "yu             - ${GREEN}Checks for package upgrades using Yarn.${ENDCOLOR}"
    elif [ "$1" = "c#" ]; then
        # Display C# shortcuts
        echo -e "${YELLOW}C# Shortcuts:${ENDCOLOR}"
        echo -e "dr             - ${GREEN}Runs the ASP.NET app.${ENDCOLOR}"
        echo -e "dre            - ${GREEN}Restores packages for the ASP.NET app.${ENDCOLOR}"
        echo -e "openapi <url>  - ${GREEN}Generates TypeScript interfaces from a Swagger API specification.${ENDCOLOR}"
    else
        # Invalid or unknown option
        echo -e "${RED}Invalid option. Please use 'help' to see all available functions or commands.${ENDCOLOR}"
    fi
}
