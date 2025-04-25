# Use an official Ubuntu base image
FROM ubuntu:20.04

# Install MATE, VNC server, and dependencies
RUN apt update && apt install -y \
    mate-desktop-environment-core \
    tigervnc-standalone-server \
    git wget python3-websockify x11-xserver-utils \
    && rm -rf /var/lib/apt/lists/*

# Download noVNC and websockify
RUN mkdir -p /opt/novnc && \
    wget -qO- https://github.com/novnc/noVNC/archive/refs/heads/master.tar.gz | tar xz -C /opt/novnc && \
    mv /opt/novnc/noVNC-master /opt/novnc/noVNC && \
    git clone https://github.com/novnc/websockify /opt/novnc/websockify
