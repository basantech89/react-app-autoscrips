#!/bin/sh
. ./abstracts/colors.sh
. ./deps/basic.sh
. ./utils/upgrade.sh
. ./utils/pkg.sh

pre_installation() {
    upgrade
    basic_pkgs_install
    pkg_install curl
    pkg_install git
    pkg_install nodejs
    pkg_install npm
    pkg_install yarn
}