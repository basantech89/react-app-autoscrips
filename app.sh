#!/bin/sh
. ./abstracts/sys-info.sh
. ./abstracts/colors.sh
. ./utils/cra.sh
. ./phases/pre-installation.sh
. ./phases/post-installation/project-deps.sh

echo -e "${HEAD1} ===================  START: React App Installation Script =================== ${NC}"
echo -e "${HEAD1} ===================================  ###  =================================== ${NC}"
echo -e "${HEAD1} ===================================  ###  =================================== ${NC}"

if [ "$OS" == "linux" ]; then

	echo "Press Y|y for yes, n|N for No"
	printf "Do you want to create a new React-App: "
	while read -r react; do
		case "$react" in
			["Yy"]) printf "y"; break ;;
			["Nn"]) printf "n"; break ;;
			*) printf "Incorrect input, Press Y|y for yes, n|N for No: "
		esac
	done

	if [ "$react" == "y" -o "$react" == "Y" ]; then
		pre_installation
		cra
    post_installation
	fi
fi


echo -e "${HEAD1} ===================================  ###  =================================== ${NC}"
echo -e "${HEAD1} ===================================  ###  =================================== ${NC}"
echo -e "${HEAD1} ====================  END: React App Installation Script ==================== ${NC}"