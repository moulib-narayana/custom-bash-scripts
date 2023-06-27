#!/bin/bash

# Colors
RED="\e[31m"
ENDCOLOR="\e[0m"
YELLOW="\e[33m"
GREEN="\e[32m"


# General Shortcuts / Utils shortcuts

# Clears the terminal.
function c(){
    clear;
}

# Quit the terminal.
function quit(){
    kill $(pgrep -a Terminal)
}


# nConnect Project Code Shortcuts

# Open parent app code in vscode
function parent(){
    cd Documents/Office/nconnect_parent
    code .
    quit
}

# Open staff app code in vscode
function staff(){
    cd Documents/Office/nconnect_staff
    code .
    quit
}

# Open server app code in vscode
function server(){
    cd Documents/Office/nconnect_server
    code .
    quit
}

# Open admin panel webapp code in vscode
function admin(){
    cd Documents/Office/nconnect_admin
    code .
    quit
}

# Open disha webapp code in vscode
function disha(){
    cd Documents/Office/reach_disha_web
    code .
    quit
}

# Open disha admin panel webapp code in vscode
function dcadmin(){
    cd Documents/Office/reach-disha-admin
    code .
    quit
}


# Flutter shortcuts

# Run the flutter app.
function flr(){
    flutter run
}

# Clean the flutter project
function flc(){
    flutter clean
}

# Clean the flutter project and install the packages
function fcg(){
    flutter clean
    flutter pub get
    clear
}

# Build Runner for flutter projects
function fbr(){
    flutter pub run build_runner build --delete-conflicting-outputs
}

# Clean flutter project including iOS and install all the packages.
function fci(){
    flutter clean && flutter pub get
    rm ios/Podfile.lock
    cd ios/
    pod cache clean --all
    pod repo update
    pod install
    cd ../
}

# Clean and run the flutter project
function ffc(){
    flc; flr;
}

# Open package website (in pub.dev)
function fcl(){
    url="https://pub.dev/packages/$1"
    open $url
}

# Flutter: Run in release mode
function frr(){
    flutter run --release
}

function fjavafix(){
    cd /Applications/Android\ Studio.app/Contents
    ln -s jbr jre
}


# Nuxt Shortcuts

# NPM shortcuts

# NPM: Runs the nuxt app using NPM.
function nrd(){
    npm run dev;
}

# NPM: Install packages from package.json in the project.
function ni(){
    npm install
}

# Yarn shortcuts

# Yarn: Install packages from package.json in the project.
function yi(){
    yarn install;
}

# Yarn: Clean the nuxt project by removing yarn.lock, .nuxt and node_modules folders.
function yc(){
    yarn clean;
}

# Yarn: Clean install the nuxt project.
function yci(){
    yc; yi;
}

# Yarn: Run the nuxt app using yarn.
function yd(){
    yarn dev;
}

# Yarn: Clean install and run the nuxt project.
function ycid(){
    yc; yi; c; yd;
}

# Yarn: Check for package upgrades.
function yu(){
    yarn upgrade-interactive —latest;
}

# ASP.NET shortcuts

function dr(){
    dotnet run
}

function dre(){
    dotnet restore
}

## Generate TS interfaces from swagger hosted in a particular URL.
function openapi(){
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
}

# Git shorcuts

function gc(){
    git checkout $1
}

function ga(){
    git add .
}

function gcb(){
    echo "${YELLOW}$(git branch --show-current)${ENDCOLOR}"
}

function gp(){
    git pull
}

function gpo(){
    echo "${YELLOW}Pulling $(git branch --show-current)...${ENDCOLOR}"
    git pull origin $(git branch --show-current)
}

function gpsh(){
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
