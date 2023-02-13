#!/bin/bash
ubuntu() {
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install gcc python3 python3-dev python3-pip libssl-dev -y
    pip3 install otcextensions python-openstackclient --user
}

config() {
    read -p "Username: " uname
    read -p "Tenant: " tenant
    read -p "Password: " passw
    read -p "Region: " region
    read -p "Project name: " proj
    echo "$uname wants to connect to $tenant in $region region. The project is $proj"
    main
}

main() {
    printf "OTC Extensions setup\n1: Ubuntu\n2: Config\n9: Exit\n"
    read -p "Select: " choice
    if [[ $choice == 1 ]]
    then
    ubuntu
    elif [[ $choice == 2 ]]
    then
    config
    elif [[ $choice == 9 ]]
    then
    echo "Bye!"
    else
    echo "Wrong number!"
    main
    fi
}

main