#!/bin/bash
echo "Starting VNC server setup..."

VNC_DIR="/home/bevan/.vnc"
mkdir -p ${VNC_DIR}
echo "Created .vnc directory"

echo "password" | vncpasswd -f > ${VNC_DIR}/passwd
echo "Set VNC password"

chmod 600 ${VNC_DIR}/passwd
echo "Set password permissions"

echo -e "#!/bin/bash\nstartxfce4 &" > ${VNC_DIR}/xstartup
echo "Created xstartup script"

chmod +x ${VNC_DIR}/xstartup
echo "Set xstartup script permissions"

vncserver :1 -geometry 1280x800 -depth 24
echo "Started VNC server"

tail -f ${VNC_DIR}/*.log

