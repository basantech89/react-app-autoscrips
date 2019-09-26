#!/bin/sh

lowercase(){
    echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}

OS=`lowercase \`uname\``	# SunOS -- solaris, windowsnt -- windows, darwin -- mac, linux
KERNEL=`uname -r`
ARCH=$(uname -m)

getSysInfo() {

	if [ "${OS}" == "windowsnt" ]; then
		OS=windows
	
	elif [ "${OS}" == "darwin" ]; then
		OS=mac
	
	else
		if [ "${OS}" = "linux" ] ; then
			
			if [ -f /etc/arch-release ]; then
				DISTRO='arch'

			elif [ -f /etc/redhat-release ] ; then
				DISTRO='redhat'
				DIST=`cat /etc/redhat-release |sed s/\ release.*//`
				PSUEDONAME=`cat /etc/redhat-release | sed s/.*\(// | sed s/\)//`
				REV=`cat /etc/redhat-release | sed s/.*release\ // | sed s/\ .*//`
			
			elif [ -f /etc/SuSE-release ] ; then
				DISTRO='suse'
				PSUEDONAME=`cat /etc/SuSE-release | tr "\n" ' '| sed s/VERSION.*//`
				REV=`cat /etc/SuSE-release | tr "\n" ' ' | sed s/.*=\ //`
			
			elif [ -f /etc/mandrake-release ] ; then
				DISTRO='mandrake'
				PSUEDONAME=`cat /etc/mandrake-release | sed s/.*\(// | sed s/\)//`
				REV=`cat /etc/mandrake-release | sed s/.*release\ // | sed s/\ .*//`
			
			elif [ -f /etc/debian_version ] ; then
				DISTRO='debian'
				if [ -f /etc/lsb-release ] ; then
			        	DIST=`cat /etc/lsb-release | grep '^DISTRIB_ID' | awk -F=  '{ print $2 }'`
						PSUEDONAME=`cat /etc/lsb-release | grep '^DISTRIB_CODENAME' | awk -F=  '{ print $2 }'`
						REV=`cat /etc/lsb-release | grep '^DISTRIB_RELEASE' | awk -F=  '{ print $2 }'`
				fi
			fi

			if [ -f /etc/UnitedLinux-release ] ; then
			  DIST="${DIST}[`cat /etc/UnitedLinux-release | tr "\n" ' ' | sed s/VERSION.*//`]"
			fi
		fi

	fi
}

getSysInfo