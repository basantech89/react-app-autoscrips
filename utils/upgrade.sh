#!/bin/sh
. ./abstracts/sys-info.sh
. ./utils/outputs.sh


upgrade() {
    if [ "$DISTRO" == "arch" ]; then
        print_before_update ARCH_LINUX
        sudo pacman -Syu
        print_after_install

    elif [ "$DISTRO" == "debian" ]; then
        print_before_update DEBIAN
        sudo apt-get update
        sudo apt-get upgrade -y
        print_after_install
    fi

}
