#!/bin/sh
. ./abstracts/sys-info.sh
. ./utils/outputs.sh

pkg_install() {
    pkg=$1
    if [ "$DISTRO" == "arch" ]; then
       if ! pacman -Qi "${pkg}" &> /dev/null; then
            print_before_install "${pkg}"
            sudo pacman -S --noconfirm "${pkg}" |& tee "${pkg}"-installation-log.txt
            print_after_install
        fi
        
    elif [ "$DISTRO" == "debian" ]; then
        if ! dpkg -s curl &> /dev/null; then
            print_before_install "${pkg}"
            sudo apt install "${pkg}" -y |& tee "${pkg}"-installation-log.txt
            print_after_install
        fi
    fi

}