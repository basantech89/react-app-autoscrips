#!/bin/sh
. ./abstracts/sys-info.sh
. ./abstracts/colors.sh
. ./abstracts/variables.sh
. ./utils/cra.sh
. ./phases/pre-installation.sh
. ./phases/post-installation/post-installation.sh

echo -e "${HEAD1} ===================  START: React App Installation Script =================== ${NC}"
echo -e "${HEAD1} ===================================  ###  =================================== ${NC}"
echo -e "${HEAD1} ===================================  ###  =================================== ${NC}"

project_exists() {
    echo "Press Y|y for yes, n|N for No"
    printf "Do you want to add assets to your existing project: "
    while read -r assets; do
      case "$assets" in
        ["Yy"])
          set_project_root_dir
          post_installation
          break ;;
        ["Nn"])
          break ;;
        *) printf "Incorrect input, Press Y|y for yes, n|N for No: "
      esac
    done
}

if [ "$OS" == "linux" ]; then
	echo "Press Y|y for yes, n|N for No"
	printf "Do you want to create a new React-App: "
	while read -r react; do
		case "$react" in
			["Yy"])
			  pre_installation
  	  	cra
        post_installation
			  break ;;
			["Nn"])
        project_exists
			  break ;;
			*) printf "Incorrect input, Press Y|y for yes, n|N for No: "
		esac
	done
fi

echo -e "${HEAD1} ===================================  ###  =================================== ${NC}"
echo -e "${HEAD1} ===================================  ###  =================================== ${NC}"
echo -e "${HEAD1} ====================  END: React App Installation Script ==================== ${NC}"