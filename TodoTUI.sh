#!/bin/bash

new_list () {
    #creates a new to-do list and adds the file name to the first line of the file
    echo "enter a name for the new list"
    read list
    touch list/$list.txt
    echo $list >> list/$list.txt
}

view_names () {
    #shows the names of all the to-do list without the file extention
    echo "all todo list"
    cd list
    ls *.txt | sed -e 's/\.txt$//'
    cd ..
}
clear
echo 'Welcom to to-doTUI'

until [[ $options == exit ]]
do
read -e -p "To-DoTUI>" options
    case $options in
        "new t")
        #add a new task to a specific list
        view_names
        echo "enter a to-do list"
        read list
        if [ -w list/$list.txt ];
        #checks if a writable file with the given name exist 
        then
            echo "enter a item to add to the list"
            read item
            echo "add a due date"
            read date
            echo $item $date >> list/$list.txt          
        else
            touch $list.txt
            echo $list >> list/$list.txt
            echo "enter a item to add to the list"
            read item
            echo "add a due date"
            read date
            echo $item $date >> list/$list.txt
        fi;;

        "view a")
        #view all to-do list
        echo "all todo list"
        cat list/*.txt;;
 
        "new l")
        #add new to-do list
        new_list;;

        "rm l")
        #delete to-do list
        view_names       
        echo "enter the name of the list to be deleted"
        read list
        rm list/$list.txt;;

        "view")
        #view specific to-do list
        view_names
        echo "enter the name of the list to view"
        read list
        less list/$list.txt;;

        "view n")
        #view all to-do list names
        view_names;;
        
        clear)
        clear;;

        help)
        less help.txt;;

        exit)
        ;;

        *)
        echo "invalad inut detected";;
    esac
done