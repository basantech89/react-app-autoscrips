#!/bin/sh
. ./abstracts/sys-info.sh
. ./utils/outputs.sh

basic_pkgs_install() {    
    if [ "$DISTRO" == "debian" ]; then
        if ! dpkg -s apt > /dev/null; then
            print_before_install "Basic Packages"
            sudo apt-get install apt -y
            print_after_install
        fi
    fi
    
}
