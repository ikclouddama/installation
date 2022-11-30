#!/bin/bash
# Function to install httpd
# Functions for Linux servers

funct_httpd (){
	 echo "Are sure you want to install httpd Y or N"
         read answer
         if [ $answer == Y ]
         then
             sudo yum update -y
	     sudo yum install httpd -y
	     sudo systemctl enable httpd
	     sudo systemctl start httpd
	     sudo systemctl status httpd
             echo $?
	     if [ $? == 0 ]
	     then
		     echo "httpd installed with success!!"
	     else
		     echo "error try it again"
	     fi
         else
         break
	 fi
	 

}

# Function to install git 
funct_git () {

        echo " Are you sure installing git Y or N"
	read answer 
	if [ $answer == Y ] 
	then
		sudo yum update 
		sudo yum install git -y
	       if [ $? == 0 ]
	       then
	           echo " Git successfully installed"
               fi		   
	else
		break
	fi

 }

 # Function to install ansible 
 
funct_ansible () {

        echo " Are you sure installing ansible Y or N"
        read answer
        if [ $answer == Y ]
        then
                sudo yum install epel-release
		sudo amazon-linux-extras install ansible2 -y
               	sudo yum update -y
		if [ $? == 0 ] 
		then
			echo ansible has been installed successfuly 
		else
			echo error while insllaling ansible
		fi
        else
                break
        fi

 }
# Function to install java

 funct_java () {

        echo " Are you sure installing Java Y or N"
        read answer
        if [ $answer == Y ]
        then
                 sudo yum install java-11-openjdk -y
		
        else
                break
        fi

 }

 # Function for Jenkins
   funct_jenkins () {

        echo " Are you sure installing Jenkins Y or N"
        read answer
        if [ $answer == Y ]
        then
                sudo yum install wget -y
		sudo wget -O /etc/yum.repos.d/jenkins.repo \
                https://pkg.jenkins.io/redhat-stable/jenkins.repo
		sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
		sudo yum upgrade -y
		sudo yum install jenkins -y
		sudo systemctl daemon-reload
		sudo systemctl enable jenkins
		sudo systemctl start jenkins
		sudo systemctl status jenkins
		if [ $? == 0 ]
		then
			echo Jenkins has been installed successfuly
		else
			echo error while installing jenkis 
		fi
        else
                break
        fi

 }

 funct_docker () {

        echo " Are you sure installing Docker Y or N"
        read answer
        if [ $answer == Y ]
        then
                echo " Docker yes tested"
        else
                break
        fi

 }



 #Functions for ubuntu servers
 
 # apache function for a ubuntu server
 funct_apache2 () {

        echo " Are you sure installing apache2 Y or N"
        read answer
        if [ $answer == Y ]
        then
                echo " Git yes tested"
        else
                break
        fi

 }

 #Function to install git on Ubuntu
 funct_gitubuntu () {

        echo " Are you sure installing git Y or N"
        read answer
        if [ $answer == Y ]
        then
                echo " Git on ubuntu yes tested"
        else
                break
        fi

 }

 # Function to install ansible on ubuntu
 

 funct_ansible_ubtu () {

        echo " Are you sure installing ansible Y or N"
        read answer
        if [ $answer == Y ]
        then
                echo " Ansible yes tested"
        else
                break
        fi

 }
 
 # Function to install Java on Ubuntu
  funct_java_ubtu () {

        echo " Are you sure installing Java Y or N"
        read answer
        if [ $answer == Y ]
        then
                echo " Java yes tested"
        else
                break
        fi

 }

# Function for Jenkins on any Ubuntu servers
 funct_jenkins_ubt () {

        echo " Are you sure installing Jenkins Y or N"
        read answer
        if [ $answer == Y ]
        then
                echo " Jenkins yes tested"
        else
                break
        fi

 }

 # Function for Docker
 funct_docker_ubt () {

        echo " Are you sure installing docker Y or N"
        read answer
        if [ $answer == Y ]
        then
                echo " docker yes tested"
        else
                break
        fi

 }

 
 # Let create a slect and swicth statment 

PS3=" Please your operating sytem : " 
select os in Linux Ubuntu ;
do
	case $os in
		Linux)
			PS3="What pragrams do you want to install:"
			select pgm in httpd git ansible java jenkins docker;
			do
				case $pgm in
					java)  funct_java;;
					httpd)
						funct_httpd;;

					git)
						funct_git;;
					ansible)
					        funct_ansible;;
					jenkins)
						funct_jenkins;;
					docker)
						funct_docker;;
					
					*)
						echo errot
					esac
					break
			done
			
			break;;
		 Ubuntu) 
			 PS3="Which software do you want to install : "
			 select pg in  apache2 git ansible java jenkins docker;
			 do
				 case $pg in
					 java)
						  funct_java_ubtu;;

					 apache2)

						 funct_apache2;;
					 git) 
						 funct_gitubuntu;;
					ansible)
						funct_ansible_ubtu ;;
					jenkins)
						 funct_jenkins_ubt;;
					 docker)
						  funct_docker_ubt;;
					
					*)
						echo error;;
					esac
					break
			 done

			break;;
		 *)
			 echo error;;
		esac
done

