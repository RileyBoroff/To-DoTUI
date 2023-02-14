#!/bin/bash
#Location="PATHTOSCRIPTHERE"
#cd $Location
new_list () {
    #creates a new to-do list and adds the file name to the first line of the file
    echo "enter a name for the new list"
    read -e list
    touch list/$list.txt
    length=${#list}
    ((length++))
    ((length++))
    lengthTwo=$length
    while [ $length -gt 0 ];
        do
          echo -n "#" >> list/$list.txt
          ((length--))
        done
    echo -e "\n#"$list"#::" >> list/$list.txt
        while [ $lengthTwo -gt 0 ];
        do
          echo -n "#" >> list/$list.txt
          ((lengthTwo--))
        done
    echo -e "\n| Task :| Due Date:|" >> list/$list.txt
}

view_names () {
    #shows the names of all the to-do list without the file extention
    echo "all todo list"
    cd list
    ls *.txt | sed -e 's/\.txt$//'
    cd ..
}

new_task () {
    unset item
        until [[ $item == exit ]]
do
    echo "enter a item to add to the list"
    read -e item
    if [[ $item != "exit" ]];
    then    
    echo "add a due date"
    read -e date
    echo "|"$item ":|" $date":|" >> list/$list.txt
    fi
done
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
        read -e list
        if [ -w list/$list.txt ];
        #checks if a writable file with the given name exist 
        then
        new_task         
        else
            echo "not a list name"
        fi;;

        "view a")
        #view all to-do list
        echo "all todo list"
        cat list/*.txt|column --table --separator [:];;
 
        "new l")
        #add new to-do list
        new_list;;

        "rm l")
        #delete to-do list
        view_names       
        echo "enter the name of the list to be deleted"
        read -e list
        rm list/$list.txt;;

        "view")
        #view specific to-do list
        view_names
        echo "enter the name of the list to view"
        read -e list
        cat list/$list.txt|column --table --separator [:];;

        "view n")
        #view all to-do list names
        view_names;;
        
        "rm t")
        view_names
        echo "enter a to-do list"
        read -e list
        cat -n list/$list.txt |column --table --separator [:]
        echo "enter the line number to remove from the list"
        read -e item
        sed -i "$item"d list/$list.txt
        ;;
        
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
