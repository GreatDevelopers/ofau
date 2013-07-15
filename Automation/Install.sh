########################################################################
# Discription: This script checks the internet connectivity and starts #
#               the installation.   		                           #
#                                                                      # 
#                                                                      #
# Please read AutoInstall.txt file before you run this script          #
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

#INSTALLATION

#Install_mysql     	--> Installs mysql server if it is not installed.

#Install_django    	--> Installs django 1.4.2 if it is not installed.

#Other_requirements --> Installs secondary requirements.

#Install            --> Calls other functions

#backup             --> Backs up important files in other_files 
#                               folder(/Automation/other_files/)                    

#media              --> Copies media folder into (~/contrib/admin/)

#restart            --> Restarts apache

#browser            --> Open http://localhost/Automation in firefox

# this script works only for python 2.7
read -p "Please enter password provided in Auto file:" read_pass
if [ $read_pass = 007700 ]; then
	check=0
	dir_path=$(pwd)
	clear
    echo ""
	echo "######################################################"
	echo "#                                                    #"
	echo "#    CHECKING---Internet Connection---               #"
	echo "#                                                    #"
	echo "######################################################"
	echo ""

	packet_loss=$(ping -c 5 -q 74.125.236.52 | \
	grep -oP '\d+(?=% packet loss)')

	if [ $packet_loss -le 50 ]
	then
		echo "::::::::::::INTERNET IS WORKING PROPERLY::::::::::::"
	

Thanks()
	{
		banner "Thanks for"
		banner "Installing"
		banner "Automation Software"
		exit
	}
Media()
	{
    	dir_tar=/usr/local/lib/python2.7/dist-packages/django/contrib/admin/
    	cp -r  other_files/media/ $dir_tar
    	chmod -R 777 $dir_tar/media
	}	
Restart()
	{
		/etc/init.d/apache2 restart
		chmod -R 777 Automation               
	}
Backup()
	{
		cp /etc/apache2/httpd.conf  $dir_path/other_files/
		cp /etc/apache2/sites-available/default  $dir_path/other_files/   
	}

Browser()
	{
		firefox http://localhost/automation/
	    Thanks
	}


Database()  # the function
	{
		id=1
		
		echo ""
		echo "######################################################"
		echo "#                                                    #"
		echo "#    INSTALLING---Automation software---             #"
		echo "#                                                    #"
		echo "######################################################"
		echo ""

	

	  #################################################################
	  #
	  #  asking user to input the mysql username
	  #
	  #################################################################

	  a=1

	  while [ $a -ne 2 ]
		  do
		    
	      	# inputs database name from the user
		  	read -p "enter mysql username :" db_user
		  	read -sp "enter mysql password :" db_password
		  	RESULT=`mysql --user="$db_user" --password="$db_password" \
		    --skip-column-names -e "SHOW DATABASES LIKE 'mysql'"` 2> \
		    /dev/null
		  	if [ $RESULT ]; then
		  		echo ""
		  		echo "Username and password match"
	      		echo "u r here"
		  		a=+1
		  		break
		  	else
		 		echo ""
		  		echo "Username and password doesn't match"
		  		echo "re-enter the details"
		  		echo ""

		   fi
		
	     done
	  sed -i "16 s/db_user/$db_user/" settings.py
	  sed -i "17 s/db_password/$db_password/" settings.py
	  

	# this part checks if database name entered is created before or not.
	a=1
	while [ $a -ne 2 ]
		do
			# inputs database name from the user
		    read -p "enter database name you want to create :" db_name
		    #checks the existance of database
		    RESULT=`mysql --user="$db_user" --password="$db_password" \
			--skip-column-names -e "SHOW DATABASES LIKE '$db_name'"`
		    if [ $RESULT ]; then
		   		echo "The Database exist, choose another name for database."
		    else
		        a=2
		        break
		    fi
		done
	sed -i "15 s/db_name/$db_name/" settings.py
	 

	  #################################################################
	  #
	  # Determining the path of the script and making necessary changes
	  #
	  #################################################################

	 cd ../
	 path=$PWD     #this passes PWD value in path
	 echo "Successfully downloading the software at-$path"
	 echo ""
	 sed -i "s#mPath#"$path"#g"  Automation/other_files/hhtp_cont
	 sed -i "s#mPath#"$path"#g"  Automation/apache/django.wsgi
	 sed -i "s#mPath#"$path"#g"  Automation/settings.py



	  #################################################################
	  #
	  # changes in httpd.conf file
	  #
	  #################################################################

	  #this appends the text from the file to the httpd.conf
	 etc_path=/etc/apache2
	 cat  Automation/other_files/hhtp_cont >> $etc_path/httpd.conf
	 cat  Automation/other_files/hhtp_cont >> $etc_path/sites-available/default
	 a2ensite default                 


	  ####################################################################
	  #
	  # creating the database and the further changes required by the user
	  #
	  ####################################################################

	 #mysql path address
	 mysqlbash_path='/usr/bin/mysql'             
	 
	 #declaring a variable
	 mysqlbash="$mysqlbash_path --user=$db_user --password=$db_password -e"  
	 
	 #creates databases with the name defined by the user
	 $mysqlbash "create database $db_name "      

	 # a new database is created
	 echo ""
	 echo ""
	 echo "enter 'Y' for the demo database & 'N' for new database " 
	 read -p "Note:Prefer to use demo database:" db_yesno

	 
	 if [ $db_yesno = y ] || [ $db_yesno = Y ]; then
		 clear
		 echo -e "\v\v\v\v\v\t\t\t\t\t::::::::::WELCOME TO " \
				 "AUTOMATION WORLD:::::::::::"            		 
	 	 # this imports demo.sql to the database defined by the user
		 mysql --user=$db_user --password=$db_password $db_name < \
			Automation/other_files/demo.sql
         
	 	 # this creates a new superuser
		 python Automation/manage.py createsuperuser
 
	 
	 elif [ $db_yesno = n ] || [ $db_yesno = N ]; then
		    echo ""
		    echo "now you get a new database"
		    echo "enjoy your experience"
		   
			#creates a blank database for use, using django commands		    
			python Automation/manage.py syncdb
			clear
			echo -e "\v\v\v\v\v\t\t\t\t\t::::::::::WELCOME TO" \
					"AUTOMATION WORLD:::::::::::"                   
	 		
			# scelect count(*) , counts the number of enteries in the table
		    result1=`mysql --user=$db_user --password=$db_password \
			--skip-column-names -e "use $db_name;" \
			-e "select count(*) from auth_user;"`
		  	if [ $result1 = 0 ]; then							
		       	echo ""
		       	echo "you need to create a superuser"
				#creates a superuser
		        python Automation/manage.py createsuperuser	

		    else
		        echo ""
		    fi

	 # there is a need to enter Organisation details in the database.
		  echo ""
		  echo "Now get ready to ADD Organisation details to your software."
		  echo ""
		  read -p "enter organisation name :" name
		  read -p "enter organisation address :" address
		  read -p "phone/contact number :" phone
		  read -p "Director of the Organisation :" director

	 # this Inserts into the table the input values.
		  mysql  --user=$db_user --password=$db_password $db_name  << EOF
		  Insert into tcc_organisation (id, name, address, phone, director)
		  values( "$id", "$name", "$address", "$phone", '$director');    
EOF


	 # There is a need to enter Department details in the database.
		  echo ""
		  echo "Now get ready to ADD Departmant details to your software."
		  echo ""
		  read -p "enter Department name :" name
		  read -p "enter Department address :" address
		  read -p "phone/contact number :" phone
		  read -p "Dean of the Department:" dean
		  read -p "enter the fax number :" faxno

		  # this inserts values into database
		  mysql  --user=$db_user --password=$db_password $db_name << EOF
		  Insert into tcc_department (id, organisation_id, name, address, 
		  phone, dean, faxno) values( "$id", 1, "$name", "$address", "$phone",
		  '$dean', "$faxno");
EOF
	  fi
	}

Install()
	{
	  echo ""
	  echo "######################################################"
	  echo "#                                                    #"
	  echo "#    DOWNLOADING---Automation software---            #"
	  echo "#                                                    #"
	  echo "######################################################"
	  echo ""


	   Backup       #backs up important files 
	   Media        #copies media folder into (~/contrib/admin/)
	   Database     #runs database function
	   Restart      #restarts apache
	   Browser      #runs browser function
	}

Other_requirements()   #this function installs secondary requirements
	{

	echo "-------installing required packages------"

	result1=$(dpkg-query -W -f='${package}\n' "libapache2-mod-wsgi")
	result2=$(dpkg-query -W -f='${package}\n' "apache2")
	if [ $result1 = libapache2-mod-wsgi ] && [ $result2 = apache2 ]
	then 
		echo "***********apache2 libapache2-mod-wsgi" \
			 "already installed*************"
	else 
		echo "apache2 libapache2-mod-wsgi is not installed."
		echo "You want to install it now: (y for yes," \
			 "otherwise aborted):"
		read Y
		if [ $Y = Y ] || [ $Y = y ]
		then
			apt-get install apache2 libapache2-mod-wsgi
			a2enmod wsgi
		else 
			echo "Aborted"
			exit
		fi
	fi

	result=$(dpkg-query -W -f='${package}\n' "sysvbanner")

	if [ $result = sysvbanner ]
	 then
		    echo "***********banner already installed****************"
	else
		echo "sysvbanner is not installed."
		echo "You want to install it now: (y for yes," \
			 "otherwise aborted):"
		read Y
		if [ $Y = Y ] || [ $Y = y ]
		then
			apt-get install sysvbanner
		else 
			echo "Aborted"
			exit
		fi
	fi

	Install

	}

Install_django()
	{

	result=$(python -c "import django; print(django.get_version())")
	if  [ $result = 1.4.2 ]; then
			  echo "Django 1.4.2 is already installed"
			  Other_requirements
	else
			  echo "Django 1.4.2 is currently not installed"
			  echo "You want to install it now: (y for yes, " \
			       "otherwise aborted):"
			  read Y
		      if [ $Y = y ] || [ $Y = Y ]
			  then
					wget http://www.djangoproject.com/m/releases/1.4/\
					Django-1.4.2.tar.gz     
					tar xzvf Django-1.4.2.tar.gz                                            
					cd Django-1.4.2                                                           
					python setup.py install
					pip install django-registration
					pip install django-tagging
					check=+1
					cd ../
					Other_requirements
			 else
					echo "Aborted"
			        exit
		     fi
	fi

	}

Install_python()
	{

	result=$(dpkg-query -W -f='${package}\n' "python2.7")
	if [ $result = python2.7 ]; then
		echo "**********Python2.7 already installed**************"
	else
		echo "Pyhton is not currently installed"
		echo "Do you want to installa it now? (y for yes," \
			"otherwsie aborted):" 
		read Y
		if [ $Y = y ] || [ $Y=Y ]; then
			apt-get install python2.7
		else 
			echo "Aborted"
			exit
		fi
	fi
	result=$(dpkg-query -W -f='${package}\n' "python-pip")
	if [ $result = python-pip ]; then
		echo "********python-pip already installed***********"
	else
		echo "Pip is not installed currently."
		echo "You want to install it now: (y for yes, " \
			 "otherwise aborted):"
		read Y
		if [ $Y = y ] || [ $Y=Y ]; then
			apt-get install python-pip
		else
			echo "Aborted"
			exit
		fi
	fi
	result=$(dpkg-query -W -f='${package}\n' "python-setuptools")
	if [ $result = python-setuptools ]; then
		echo "**********Python-setup tools already installed*********"
	else
		echo "python-setuptools are not currently installed."
		echo "You want to install it now: (y for yes, " \
			 "otherwise aborted):"
		read Y
		if [ $Y = y ] || [ $Y=Y ]; then
			apt-get install python-setuptools
		else
			echo "Aborted"
			exit
		fi
	fi
	result=$(dpkg-query -W -f='${package}\n' "python-mysqldb")
	if [ $result = python-mysqldb ]; then
		echo "************Python-mysqldb already installed***********"
	else
		echo "python-mysqldb is not currently installed."
		echo "You want to install it now: (y for yes, " \
			 "otherwise aborted):"
		read Y
		if [ $Y = y ] || [ $Y=Y ]; then
		   apt-get install python-mysqldb
		else 
			echo "Aborted"
			exit
		fi
	fi
Install_django
	}

# Script starts here
Install_mysql()
	{

	result=$(dpkg-query -W -f='${package}\n' "mysql-server")

	if  [ $result = mysql-server ]; then
		echo "mysql-server already installed"
		Install_python
	else
		echo "mysql-server is not installed in your system"
		echo "You want to install it now: (y for yes, " \
			 "otherwise aborted):"
		read Y
		if [ $Y = y ] || [ $y = Y]; then
			apt-get install mysql-server
			Install_python
		else 
			echo "Aborted" 
			exit
		fi
	fi

	}
Install_mysql
	else
		echo "::::::::::::SLOW or NO INTERNET CONNECTION:::::::::::::"
		echo "Please check your connectivity and try again later."
		exit
	fi
else
banner "Read"
banner "Auto"
banner "File"
fi
