sudo mv /etc/X11/xorg.conf /etc/X11/xorg.temp
sudo mv /etc/X11/xorg.bak /etc/X11/xorg.conf
sudo mv /etc/X11/xorg.temp /etc/X11/xorg.bak
echo "Switching Graphics" 
check_current=$(cat /etc/X11/xorg.conf | grep "Card1")
echo "$check_current"
if [[ "$check_current" == "" ]]
    then 
        echo "Switching to Intel Integrated GPU... Please wait"
        sleep 1
        sudo systemctl stop gdm
        sleep 2
        sudo modprobe -r nvidia_drm
        sudo modprobe -r nvidia
        sudo systemctl start gdm
else
    	echo "Switching to NVIDIA GPU... Please wait"
    	sleep 1
        sudo systemctl stop gdm
        sleep 2
        sudo modprobe nvidia
        sudo modprobe nvidia_drm
        sudo systemctl start gdm
fi
#sudo systemctl restart gdm
