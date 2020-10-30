# Cumulative-Task-Gateway
School Linux project 
This repository contains per-configured files for a ubuntu based server to act as a dns server, dhcp server, firewall, and a proxy server using squid. The server will also be able to perform IP Masquerading. 

Requirements 

To use these files you will need an up to date install of ubuntu server with two network cards. The first one will be on your public interface using a 192.168.0.x address, your private network will be a 10.0.0.x network. Altho it's not required, having ssh installed during the install will allow you to access your linux terminal remotely and will save time if you end up needing to install it. All other steps during the install will be set to their defaults. After all these steps are done, use the command “ip a” and record the network interfaces. In the static IP folder I included the 00-installer-config.yaml file. Move it to the etc/netplan folder and edit the file(change the network interfaces) to match your system. 

Dns
Our first task is to install dns, to accomplish this use the command “sudo apt-get install bind9” then move all files in the dns folder to their respective location following the file path as a map. As long as the same address is used all you should have to do is edit one file, the hosts folder in the etc folder contains the line 127.0.1.1 denverserver. Keep the address the same but change the name to your server name. After this run the command “sudo service bind9 restart” this will reload the service with your new configuration files.    

DHCP
DHCP is the easiest of our four tasks today, first install it by using the command “sudo apt install isc-dhcp-server” then move the files to the correct file path following the file structure just like dns. Reusing the information you recorded during the prep stage about the interfaces, open the “isc-dhcp-server” file and edit the line “INTERFACESv4="enp0s8"”  to reflect your system configuration. Remember to use the interface that's on your internal 10 network. Once finished use the command “sudo systemctl restart isc-dhcp-server.service” to restart the service with your new confederation files. 

Firewall 
Setting up the firewall is no problem and in fact it comes preinstalled, all you have to do is enable it using the command sudo ufw enable. Where it can get complicated is when you try to forward packets from your 10 network to the 192 using metasploit. First you need to move all files to their correct locations then open the before.rules file stored at “etc/ufw”, you must change one line “-A POSTROUTING -s 10.0.0.0/24 -o enp0s3 -j MASQUERADE” make sure that the interface listed is the 192 network, the address can stay the same. Once finished use these two commands “sudo ufw disable” and “sudo ufw enable”. This will reload the service with your new configuration.  

Squid
As we start and finish our last task these steps should be starting to look familiar, first we must install squid by using the command “sudo apt install squid” then we move all the required files to their respective locations using the file paths as a map. We now must edit the file “squid” stored in the “etc/squid” folder. As default the hostname is denverserver, we will change it to your hostname. The line in question is “visible_hostname denverserver”. We then use the command “sudo systemctl restart squid.service” to restart our service.    
