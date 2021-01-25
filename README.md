# TerminalProgressBar

This is a simple script, made using bash, that adds a progress bar and updates it as commands are completed sequentially in an array. Any output from the commands are redirected to a file called progressbar.log, which can be found in the folder where the script was executed from.

## Usage
Simply modify the `commands` array at the top of the file. An example has been included and any meaningful work to be done using the script should remove the example commands. After configuring the script, provide the necessary permissions to the script file, and execute using a terminal of your choice (I have personally only tested it using gnome-terminal with zsh but it should work with everything). 

The available options are as follows:

- The `-i` flag to make the script continue regardless of any errors from the execution of any of the commands. Unless passed, commands will keep on executing until an error occurs (specifically until a command has a non-zero exit code) in which case the script will stop, thus the commands in the array trailing after the culprit command will not be executed.

- The `-t` option followed by a number which will be used as the time in seconds that the command waits between executing commands in the array. This serves to mainly smooth the progression of the progressbar and has very little practical purpose. The default is set to 0 seconds.

- The `-l` option followed by the file where all command outputs should be redirected to.

#### Example Usage

The following sets the interval/smoothing time to 0.3 seconds and instructs the script to ignore errors while redirecting output to the file /tmp/output.log.

`./ProgressBar.sh -t 0.3 -i -l /tmp/output.log`

## Installation
No special packages are required to use this except maybe `bc` the basic calculator package.
