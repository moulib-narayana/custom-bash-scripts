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
- 

