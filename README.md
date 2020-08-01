# TerminalProgressBar

This is a simple script, made using bash, that adds a progress bar and updates it as commands are completed sequentially in an array. Any output from the commands are redirected to a file called progressbar.log, which can be found in the folder where the script was executed from.

## Usage
Simply modify the `commands` array at the top of the file. An example has been included and any meaningful work to be done using the script should remove the example commands. After configuring the script, provide the necessary permissions to the script file, and execute using a terminal of your choice (I have personally only tested it using gnome-terminal with zsh but it should work with everything). An optional `-i` flag can be passed to make the script continue regardless of any errors from the execution of any of the commands.

## Installation
No special packages are required to use this.
