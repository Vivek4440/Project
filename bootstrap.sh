#!/bin/bash
sudo apt update -y
sleep 5
sudo apt upgrade -y
sleep 5
sudo apt -y install git docker -y
sleep 3
systemctl enable --now docker
sudo apt autoremove -y
sleep 2
