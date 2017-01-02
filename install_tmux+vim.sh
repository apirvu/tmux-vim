#!/usr/bin/env bash

exedir=$(readlink -f $(dirname $0))
usedShell="default"

function usage
{
	echo -e "\nUsage: $0 <options> [OS]
		       - OS: [cygwin|debian]
			   - Options :
			        -s|--shell: Will install provided shell. Can be only [zsh] for now.
				                (default is bash)"

	exit 1
}

function install
{
	if [[ -d "$exedir/$environment" ]];then
	cd $environment  
	    if [[ ${usedShell} = "zsh" ]];then
			echo "Installing zsh"
			./"$environment"_install_zsh.sh
        fi
	./"$environment"_tmux+vim_setup.sh

	else
		echo "You should be in the root of git cloned folder"
	fi


}

function checkArgs
{
   if [[ ${environment} != "debian" && ${environment} != "cygwin" ]];then
	   echo "Wrong parameter.OS can be only debian or cygwin"
	   usage
   fi
        
   if [[ ${usedShell} != "zsh" && ${usedShell} != "default" ]];then 
	   echo "This option can be only zsh for now."
	   usage
   fi 
}

if [[ ( $# -eq 0 ) || ( $# -gt 3 ) ]];then
	echo "Wrong number of parameters"
	usage
fi

while [[ $# > 0 ]]; do
    key="$1"
    shift

    case "$key" in
        -s|--shell)
            usedShell="$1"
            shift
            ;;
        *)
            if [ $# -eq 0 ]; then
                # these is the last argument.Should be OS
                environment="$key"
                shift
            else
                echo "Error. Unknown option [$key]"
                usage
            fi
            ;;
    esac
done

checkArgs

install
