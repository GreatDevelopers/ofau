########################################################################
# Discription: This script installs the exim server on your system	   #
#                					   		                           #
#                                                                      # 
#      Author   :  Jasvir Singh Grewal, jasvirsingh.grewal91@gmail.com #
#      License  :  GNU General Public License                          #
#      Copyright:  Copyright (c) 2013, Great Developers                #
#                                                                      #
#      created : 11-July-2013                                          #
#      last update : 12-July-2013                                      #
#      VERSION=1.4.2                                                   #
#                                                                      #
########################################################################
#INSTALLATION OF EXIM SERVER


Get_values() #this function ask user to enter configurations of exim
	{
		read -p "Enter hostname (for example gmail):" host
		read -p "Enter Username (Username@hostname.com):" user
		read -p "Enter password of Username@hostname.com:" password
		sed -i "s#user#"$user"#g" ofau/other_files/passwd.client
		sed -i "s#host#"$host"#g" ofau/other_files/passwd.client
		sed -i "s#password#"$password"#g" ofau/other_files/passwd.client
		sed -i "37 s/user/$user/" ofau/settings.py
		sed -i "37 s/host/$host/" ofau/settings.py
		sed -i "38 s/host/$host/" ofau/settings.py
		sed -i "39 s/user/$user/" ofau/settings.py
		sed -i "39 s/host/$host/" ofau/settings.py
		sed -i "40 s/password/$password/" ofau/settings.py
		cat ofau/other_files/passwd.client >> /etc/exim4/passwd.client
	}


Configure() #Function to configure exim server 
	{
		echo -e "\v\v Get ready to configure Exim server, for configuration "\
			 "help, please read 'eximconfig' file."
		sleep 5s
		dpkg-reconfigure exim4-config
		Option						#Calling of Option function
	} 

Option() #Using this function user can reconfigure exim server
	{
		echo "Now you have to specify configuration of exim server:"
		echo "You want to configure it again? (Y for yes, continue "\
			 "otherwise)"
		read Y
		if [ $Y = y ] || [ $Y = Y ]
		then
			Configure				#Calling of Configure function
		else
			Get_values				#Calling of Get_values function
		fi	
	}
 
clear
echo -e "\v\v\v\v\v\t\t\t\t\t::::::::::Installation " \
		"of Exim server:::::::::::"

		apt-get install exim4	#installation of exim server
		Configure				#calling of Configure function
