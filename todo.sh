#!/bin/bash
source TodoTUI.conf
cd $Location
cd list
ToDoList="$(ls *.txt | sed -e 's/\.txt$//')"
cd ..
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
          echo -n $box >> list/$list.txt
          ((length--))
        done
    echo -e "\n${box}${list}${box}::" >> list/$list.txt
        while [ $lengthTwo -gt 0 ];
        do
          echo -n $box >> list/$list.txt
          ((lengthTwo--))
        done
    echo -e "\n${column} Task :${column} Due Date:${column}" >> list/$list.txt
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
    echo "${column}${item} :${column} ${date}:${column}" >> list/$list.txt
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
        select option in ${ToDoList}
        do
            list=$option
            echo $list
            break
        done
        if [ -w list/$list.txt ];
        #checks if a writable file with the given name exist 
        then
            unset item
        until [[ $item == exit ]]
        do
        echo "enter a item to add to the list"
        read -e item
        if [[ $item != "exit" ]];
        then
            echo "add a due date"
            read -e date
            echo "${column}${item} :${column} ${date}:${column}" >> list/$list.txt
        fi
        done
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
        select option in ${ToDoList}
            do
                list=$option
                echo $list
                break
            done
        rm list/$list.txt;;

        "view")
        #view specific to-do list
        select option in ${ToDoList}
        do
            list=$option
            echo $list
            break
        done
        cat list/$list.txt|column --table --separator [:];;

        "view n")
        #view all to-do list names
        echo "all todo list"
        cd list
        ls *.txt | sed -e 's/\.txt$//'
        cd ..;;
        
        "rm t")
        select option in ${ToDoList}
        do
            list=$option
            echo $list
            break
        done
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
