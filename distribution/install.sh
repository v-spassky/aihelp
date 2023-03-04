#!/bin/bash

# a script to automatically install aihelp

# input arguments
WHERE_TO_INSTALL=$1 # e.g. ~/.local/bin/
CONF_FILE=$2        # e.g. ~/.bashrc
COMMAND_ALIAS=$3    # e.g. aihelp

# install a dependency
apt install jq -y

# download the script
wget https://raw.githubusercontent.com/v-spassky/aihelp/main/aihelp.sh -P $WHERE_TO_INSTALL

# make the script executable
chmod +x "${WHERE_TO_INSTALL}aihelp.sh"

# set up an alias fot the script
echo >> $CONF_FILE
echo -n "alias $COMMAND_ALIAS=\"" >> $CONF_FILE
echo -n 'aihelp.sh \"\$(history | cut -c 8- | tail -n 1)\""' >> $CONF_FILE
