#!/bin/bash
list() {
openstack rds instance list
main
}

create() {
read -p "DB Type [Postgres, MySQL, MS SQL]: " dbtype
main
}

delete() {
read -p "DB Instance ID: " instid
printf "You are deleting this instance: $instid.\n Are you sure?\n"
read -p "[y/n]" del
if [[ $del == "y" ]]
then
openstack rds instance delete $instid
echo "$instid deleted!"
main
elif [[ $del == "n" ]]
then
echo "We are not deleting the instance."
main
fi
}

main() {
printf "1: List RDS instances\n2: Create RDS instance\n3: Delect RDS instance\n9: Exit\n"
read -p "Select: " choice
if [[ $choice == 1 ]]
then
list
elif [[ $choice == 2 ]]
then
create
elif [[ $choice == 3 ]]
then
delete
elif [[ $choice == 9 ]]
then
echo "Bye!"
else
echo "Wrong number!"
main
fi
}

main