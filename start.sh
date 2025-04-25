#!/bin/bash

# Fix missing USER environment variable
export USER=root

# Set up VNC password
mkdir -p ~/.vnc
echo "colab123" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

# Set up MATE startup script for VNC
echo "#!/bin/sh" > ~/.vnc/xstartup
echo "export XDG_SESSION_TYPE=x11" >> ~/.vnc/xstartup
echo "export XDG_CURRENT_DESKTOP=MATE" >> ~/.vnc/xstartup
echo "mate-session &" >> ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup

# Start the VNC server
vncserver :1 -geometry 1280x720 -depth 24

# Start noVNC via websockify
cd /opt/novnc
nohup python3 /opt/novnc/websockify/websockify.py 6080 localhost:5901 --web /opt/novnc/noVNC &

echo "🟢 MATE Desktop is now running at: http://localhost:6080"
