#!/bin/sh
. ./abstracts/sys-info.sh
. ./utils/outputs.sh

cra() {
    print_before_install "project"
    if ! which create-react-app &> /dev/null; then
        npm install -g create-react-app
    fi

    read -p 'Pl type the project name: ' project
    echo "Press Y|y for yes, n|N for No"
    printf "Confirm the project name - %s: " "$project"
    while read -r confirm_pro; do
      case "$confirm_pro" in
        ["Yy"]) break ;;
        ["Nn"])
          read -p 'Pl type the project name again: ' project
          printf "Confirm the project name - %s: " "$project" ;;
        *) printf "Incorrect input, Press Y|y for yes, n|N for No: "
      esac
    done

    read -p 'Pl type the location for the project: ' loc
    echo "Press Y|y for yes, n|N for No"
    printf "Confirm the location - %s: " "$loc"
    while read -r confirm_loc; do
      case "$confirm_loc" in
        ["Yy"])
          [ ! -w "${loc}" ] && {
            read -rp "${loc} is not writable, pl specif a different location: " loc
            printf "Confirm the location - %s: " "$loc"
          } || break
          ;;
        ["Nn"])
          read -p 'Pl type the location again: ' loc
          printf "Confirm the location - %s: " "$loc"  ;;
        *) printf "Incorrect input, Press Y|y for yes, n|N for No "
      esac
    done

    create-react-app "${loc}/${project}"
    print_after_install
    cd "$loc/$project" || exit
}