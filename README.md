# To-DoTUI
Simple To-Do list mangager using a text user interface (TUI) writen in bash.
## Getting started
When you have installed the files you will have to add the execute permission to the script. <br>

first cd into the To-DoTUI directory.<br>
`cd To-DoTUI`<br>
Then add the appropriate permissions to the file. <br>
`chmod +x todo.sh`<br>
Now you can execute it the same way you would any other script. <br>
`./todo.sh`<br>
## optional configuration options
To make the script executable from anywhere add this to your bahsrc <br>
`export PATH="/FULL PATH TO/To-DoTUI:$PATH"`<br>
Next uncommet this line in the TodoTUI.conf<br>
`#Location=#Location=PATHTO/To-DoTUI/<br>
Then uncommet this line in the todo.sh file<br>
`#cd $Location`<br>
The script can now be ran by running 
`todo.sh`

## Commands
`help`<br>
    display this menu<br>
`exit`<br>
    close the program<br>
`new t`<br>
    add a new task to a specific list<br>
    This will prompt for more task until the `exit` option is given<br>
`rm t`<br>
    remove a task from a specific list<br>
`view a`<br>
    view all to-do list<br>
`new l`<br>
    add new to-do list<br>
`rm l`<br>
    delete to-do list<br>
`view`<br>
    view specific to-do list<br>
`view n`<br>
    view all to-do list names<br>
