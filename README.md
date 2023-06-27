# Custom Bash Scripts
All the required custom bash scripts are defined here.

# Table of Contents

- [Custom Bash Scripts](#custom-bash-scripts)
  - [Setup](#setup)
    - [Create and copy functions](#create-and-copy-functions)
      - [Option 1 (Direct Download)](#option-1-direct-download)
      - [Option 2 (Create Manually)](#option-2-create-manually)
        - [Create `.custom_bash_commands.sh`](#create-custom_bash_commandssh)
        - [Add the functions](#add-the-functions)
    - [Open .zshrc file](#open-zshrc-file)
  - [Setup Finished](#setup-finished)
  - [Shortcuts Available](#shortcuts-available)

## Setup

### Create and copy functions

#### Option 1 (Direct Download)

- Download the .custom_bash_commands and place it in your root directory (i.e., `cd`)

#### Option 2 (Create Manually)

##### Create `.custom_bash_commands.sh`

- Create a new file .custom_bash_commands.sh in the root directory.

OR

- Execute the follow commands:

```bash
$ cd
$ touch .custom_bash_commands.sh
```

##### Add the functions.

- Copy the content from `.custom_bash_commands.sh` (of this repository) and paste into your created .custom_bash_commands.sh


### Open .zshrc file

- If not present, then create a new .zshrc file.

- Add the below into that file

```bash
source $HOME/.custom_bash_commands.sh
```

<br />

## Setup Finished

- Now close your existing terminal and open again and you are ready to use your custom bash commands.

<br />

<div style="background-color: #ffe6e6; color:black; border-left: 4px solid #ff0000; padding: 10px; margin-bottom: 20px;">

<span style="font-size: 20px; margin-right: 10px;"> 📌 </span>

**NOTE:**
In the **nConnect Project Code Shortcuts** section, choose the shortcuts that are relevant to you and your project.

</div>

<br />


## Shortcuts available

| Shortcut    | Description                                                |
|-------------|------------------------------------------------------------|
| **Util Shortcuts:**                               |
| c           | Clears the terminal.                                       |
| q, quit     | Quits the terminal.                                        |
|             |                                                            |
| **nConnect Project Code Shortcuts:**                               |
| parent      | Opens the parent app code in Visual Studio Code.           |
| staff       | Opens the staff app code in Visual Studio Code.            |
| server      | Opens the server app code in Visual Studio Code.           |
| admin       | Opens the admin panel web app code in Visual Studio Code.  |
| disha       | Opens the disha web app code in Visual Studio Code.        |
| dcadmin     | Opens the disha admin panel web app code in Visual Studio Code.  |
|             |                                                            |
| **Flutter shortcuts:**                                            |
| flr         | Runs the Flutter app.                                      |
| flc         | Cleans the Flutter project.                                |
| fcg         | Cleans the Flutter project and installs the packages.      |
| fbr         | Builds Runner for Flutter projects.                        |
| fci         | Cleans Flutter project including iOS and installs all the packages.  |
| ffc         | Cleans the Flutter project and runs the app.               |
| fcl <pkg>   | Opens the package website in pub.dev.                      |
| frr         | Runs the Flutter app in release mode.                      |
| fjavafix    | Fixes the Java issue in Android Studio.                    |
|             |                                                            |
| **Nuxt shortcuts:**                                               |
| nrd         | Runs the Nuxt app using NPM.                               |
| ni          | Installs packages from the package.json file using NPM.    |
| yi          | Installs packages from the package.json file using Yarn.   |
| yc          | Cleans the Nuxt project by removing yarn.lock, .nuxt, and node_modules folders. |
| yci         | Cleans and installs packages for the Nuxt project.         |
| yd          | Runs the Nuxt app using Yarn.                              |
| ycid        | Cleans, installs packages, and runs the Nuxt project.      |
| yu          | Checks for package upgrades using Yarn.                    |
|             |                                                            |
| **ASP.NET shortcuts:**                                            |
| dr          | Runs the ASP.NET app.                                      |
| dre         | Restores packages for the ASP.NET app.                     |
| openapi <url> | Generates TypeScript interfaces from a Swagger API specification. |
