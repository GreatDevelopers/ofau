TCC Automation Script

-----Files-----

>>The normal script

auto.sh

>>The debconf scripts

config_test
config
script
template
input

-----Introduction-----

-The main purpose of the script is to install the Automation software made by the TCC Automation team comprising of Sandeep Kaur, Sukhdeep Kaur, SatinderPal Singh and Damanpreet Singh under the guidence of mentor-Dr Hardeep Singh Rai, as their 6month industrial training project in TCC(Testing and Consultancy Cell).


-----How to run the script-----

1.  Download the folder containing the automation script(auto.sh). One easy way is to download it from github.com using the following command.

Git clone http://github.com/damanpreet26/test.git/

this will automatically download the folder(test) containing script to the destination where the script was run, example, if I ran the above command in /home/user_name/Desktop/ then the test folder will be downloaded in /home/user_name/Desktop/

2.  Now enter into the folder(test) and run the script( you can run the script anywhere on your system, we are running it here for the ease of the user).

3. Make sure the permissions of the script are executable.

3. Run the script using the following command in the terminal.

 ./auto.sh

The user is prompted to enter in the password of the system.

4. The script starts running in the terminal, checking pre-requirements and requirements of the software, if these requirements are there before in the system, then the script moves on with asking input from the user.
If these requirements are not found, then the script automatically installs the required packages and softwares and then continues with input from the user.

5. Once all the requirements are met, then the script moves on to the second phase, that is asking user for input. This script requires input from user, following are the inputs asked from the user:
	MySQL username
	MySQL password
	email id
	database to be created
	database requirement-whether you need a demo database or a blank database.

6. Once all the inputs are fed into the system, then the script automatically opens the software on the default browser.

7. Then the user can log into the software using the account that he created during the script installation.

8. Once all done, the user can work on the software according to his need and use


-----Backup----

-Since during the installation many system files are changed, which can be dangerous in case some error. So we need to backup that very important files that can lead to corrupting the system. So before any changes are made to that system file, that file is backed up(copied) to the Automation folder that we downloaded in the first step.
-The destination of the syetem file is /etc/apache/httpd.conf
-The above file is saved to the Automation folder at destination  /Automation/other_files/
-The by default permission of this file doesn't allow the user to delete it accidently. The user needs sudo permission to delete this file.


-----Working of the script-----

- It checks whether the basic softwares like Django and Mysql are installed or not, which are very much required by the software(TCC Automation Software)
-It checks whether Mysql is installed or not, If installed it skips and if doesn't then installs Mysql to the system
-It then checks whether Django is installed or not, If installed it skips this steo and if it doesn't then installs Django(latest official release).

-----After these two steps the two main required softwares are installed, rest few other small packages also required for the proper running of the software

-It then installs the following packages:
	apache2 libsapache2mod-wsgi
	python-mysqldb
	python-setuptools
	pip
	django-registrtation
	django-tagging

-It then checks whether the destination folder has a directory named Automation before hand, if any directory exists there with name Automation, then the script changes the name to Automation-date-time., If no folder exists it skips this step.

-It starts cloning the software from Sandeep Kaur's repository at Github.com, https://github.com/sandeepmadaan/Automation.git. 

-Since we need to make changes to the system, which is very risky so we take the backup of the only system file we are to make changes to i.e. /etc/apache2/httpd.conf. We save the copy of the original file to the Automation folder we just downloaded from the repostory(/Automation/other_files/)

------Then we have divided the whle work in different functions set to perform specific task.

>>Run (function)
The main job of this function is making changes to the various settings and configuration files in the downloaded folder 

-----Changes in Automation/settings.py file
-Asks for MySQL username
-Asks for MySQL password

If both match, then the script proceeds if not, it keeps asking corrct username and password

-Asks for email address
-Asks for database name

If database name entered exists before, it gives warning and asks for a new database name

-It then fetches The System Username automatically from the system and displays to the user.
------Changes in django.wsgi file

-Automatically amends and makes changes to the file, adds path to the file 

------Changes to the httpd.conf file

-This is a system file, hence very carefully dealt with .
-It's backed up in the Automation/other_files/, before hand so that if any wrong changes are made to it, we can recover using the backed up file.
-Firstly, A file containing data is appended to this file(existing)
-After the data is appended to it, then changes are made to the new added part of data, i.e. Path of the file are added to it.


------Creating a Database

-Since tha MySQL username and password are checked before, for the authenticity of the user, we can create a database of the required name.
-And the existance of the database is checked before so , always a unique input name is asked from the user 
-A database is created


------Knowing the need of the user

-The user is asked for a choice, whether he wants a demo database( that is the database used by the TCC Automation), or a blank new database

-All the affirmative options like yes/y/YES/Y and all the negative options like no/n/NO/N are valid and can choose any according to his need
-affirmative for demo database
-negetive for new blank database


------If user says affirmative(yes/y/YES/Y)

-A demo database is imported to the database of the database name the user entered before from the authenticated Username and Password
-After that the user is made to create a superuser for the Automation software
-He is made to input :
	usernam for software
	password
	re-password
	email
-After all these a new superuser is created, and then opens the installed software in the default browser


------If user says negative(no/n/NO/N)

-In case of a negative input, A new database is created and required tables are automatically created to the database name
-Then the user is prompted whether he wants to create a super user or not.
-if user says yes
------the user is prompted to input
	username
	password
	re-password
	email

-----If the user says no

-Then after the tables are created .
-The user is prompted to create a super user, where has to make a super user .( Creating a super user is mandatory)
-Similar inputs are asked :
	username
	password
	re-password
	email
Hence in the end he has to create a superuser even if he says yes/no to the above question

-Since the user wanted a new blank database, All the tables are blank except the username
-User is prompted to create :
	--Organidation
		organisation id
		organisation name
		organisation address
		phone
		director name
-After Organisation, then User has to create Department as well as the Organisation.
-User is prompted 
		department id
		department name
		department address
		phone/contact no.
		Dean
		fax no
-After these inputs are fed into respective tables from the database

----Apache()
-It restarts apache

----Browser()
-It opens the default broeser 
-  http://localhost/automation/


----Future Scope of the Script-----

-The script daily gets updated, with big and small changes.
-Many new changes have been introduced to the script since it started being developed.
-Making a debian package of the Automation software.


-----Debconf-----

-Debconf is a backend database, with a frontend that talks to it and presents an interface to the user. There can be many different types of frontends, from plain text to a web frontend. The frontend also talks to a special config script in the control section of a debian package, and it can talk to postinst scripts and other scripts as well, all using a special protocol. These scripts tell the frontend what values they need from the database, and the frontend asks the user questions to get those values if they aren't set. 


--Template 

It contains all the notes, different questions you want to ask the user, be it boolean(true/false), multiple answer, string inputs, displaying notes, everything you want to display or ask the user. 
P.S. :make sure you leave a space in the begining of the Long Description, check the file in case you have any doubt. 


--Config 

Next, decide what order the questions should be asked and the messages to the user should be displayed from the template file we talked about earlier. 
Config script does all this, it has no other job than to display notes and questions from template file and take input from the user in the form of answers to the question it asked. 

--Script 

The job of this script is to use the input stored in debconf database. It all depends how you want to use the inputs, I jave just printed the inputs stored. 



--Where to find the Debconf database ? 
-this includes normal questions

/var/cache/debconf/config.dat 

-this includes  the passwords input by the user

/var/cache/debconf/passwords.dat

config.dat stores all the template questions, notes everything you stored in the template file once you have run the config script. 
passwords.dat file stores all the passwords input by the user.


--How to run the scripts ? 

1. Change the permssion of the scripts to executable. 
2. run the first script "sudo ./config" .You need to use sudo inorder to make changes to the debconf database. 
3. run the second script "sudo ./script". 

P.S. : The first script would run for only one time as after running if on the first time the flag in the debconf database gets set or "seen", but you can run the second script(script) any number of time. 
If you want to run the first script(config) again, do the following: 

 $ sudo gedit /var/cache/debconf/config.dat 

and search the template you created and remove "seen" from all the flags of your templates, once you have deleted seen, you can run the config script again. 




