#!/bin/bash

COMMAND=$1
SCRIPT=`basename "$0"`
declare -a SUPPORTED_COMMANDS=(install run)
command_list=$(printf ", %s" "${SUPPORTED_COMMANDS[@]}")
function log {
    echo "[${SCRIPT}] => ${1}"
}

function command_not_found {
    log "One of the following arguments was expected but not supplied: ${command_list:2}"
    exit 1
}

# guard clause for unexpected commands
if [ -z "${COMMAND}" ] || [[ ! "${SUPPORTED_COMMANDS[@]}" =~ "${COMMAND}" ]]
then
    command_not_found
fi

# set working directory as parent directory of script
cd "$(dirname "$0")"

# define installation and run functions
function install_dependencies {
    if [ ! -f "/conf/installation_complete" ]
    then
        log "Installing application dependencies..."

        # install app dependencies
        pip install -v -r requirements.txt

        # flag installation as complete
        mkdir -p /conf
        touch "/conf/installation_complete"
    else
        log "Installation already complete. Skipping dependency installation."
    fi
}

function run {
    # run application
    python app.py
}

if [ $COMMAND == "install" ]
then
    install_dependencies
elif [ $COMMAND == "run" ]
then
   install_dependencies && run
else
    command_not_found
fi

