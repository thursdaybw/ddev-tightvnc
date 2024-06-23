#!/bin/bash

#ddev-generated

VNC_DIR="${HOME}/.vnc"

export PASSWORD=${VNC_PASSWORD:-password}
export DISPLAY=:1

mkdir -p ${VNC_DIR}
echo $PASSWORD | vncpasswd -f > ${VNC_DIR}/passwd
chmod 600 ${VNC_DIR}/passwd

echo -e "#!/bin/bash\n" > ${HOME}/.xsession

vncserver $DISPLAY -geometry 1280x800 -depth 24

tail -f ${VNC_DIR}/.vnc/*.log

