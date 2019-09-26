#!/bin/sh
. ./abstracts/sys-info.sh
. ./abstracts/colors.sh


print_before_install() {
    pkg=$1
    echo -e "${HEAD2} Installing ${pkg} ${NC}"
    echo -e "${HEAD2} ===================================  ###  =================================== ${NC}"
}

print_after_install() {
    echo -e "${HEAD2} ===================================  ###  =================================== ${NC}"
    echo -ne "\n"
    echo -ne "\n"
    echo -ne "\n"
    echo -ne "\n"

}

print_before_update() {
    OS=$1
    echo -e "${HEAD2} [1/3] Updateing and Upgrading ${OS} ${NC}"
    echo -e "${HEAD2} ===================================  ###  =================================== ${NC}"
}