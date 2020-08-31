#Use Root or use sudo su
#Updates and Essential Packages
cd /root
apt-get update -y
apt-get install build-essential -y
#Downloading Server Daemon
wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.31-9727-beta/softether-vpnserver-v4.31-9727-beta-2019.11.18-linux-x64-64bit.tar.gz
tar zxf softether-vpnserver-v4.31-9727-beta-2019.11.18-linux-x64-64bit.tar.gz
cd vpnserver
#Installing Server Daemon
clear
echo  -e "\033[31;7mNOTE: Answer (1) for all Three Subsections to Continue!!\033[0m"
make
cd /root
mv vpnserver /usr/local
rm -rf softether-vpnserver-v4.31-9727-beta-2019.11.18-linux-x64-64bit.tar.gz
cd /usr/local/vpnserver
chmod 600 *
chmod 700 vpncmd
chmod 700 vpnserver
#Installing Server Auto Run on init.d daemon
wget https://raw.githubusercontent.com/AlexaOVH/SoftetherAutoInstallMultiPlatform/master/Debian%20and%20Ubuntu/vpn-server.sh --no-check-certificate
mv vpn-server.sh /etc/init.d/vpnserver
cd /etc/init.d/
chmod 755 vpnserver
update-rc.d vpnserver defaults
/etc/init.d/vpnserver start
cd /usr/local/vpnserver
chmod -rw /usr/local/vpnserver/server_log/
chmod -rw /usr/local/vpnserver/packet_log/
chmod -rw /usr/local/vpnserver/security_log/
echo ---------------------
echo  -e "\033[32;5mVPN SERVER HAS BEEN INSTALLED!\033[0m"
echo "Softether Server is located in /usr/local/vpnserver"
echo "SoftEther Server auto install by urError - PSN"
echo --Softether Services--
echo service vpnserver start - to start
echo service vpnserver status - to start
echo service vpnserver restart - to restart
echo service vpnserver stop - to stop
echo ----------------------
#End