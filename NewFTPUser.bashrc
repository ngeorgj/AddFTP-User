function addFTPUser () {
    	echo "Adding user $1 as ftp to <ServerName>"
	command sudo adduser $1
	command sudo mkdir /home/$1/ftp
	command sudo chown nobody:nogroup /home/$1/ftp
	command sudo mkdir /home/$1/ftp/files
	command sudo chown $1:$1 /home/$1/ftp/files
	
	# Checks Permission
	command ls -la /home/$1/ftp
	
	# Creates a text file for testing.
	command echo "vsftpd test file" | sudo tee /home/$1/ftp/files/testfile.txt
	command echo $1 | sudo tee -a /etc/vsftpd.user_list
	
	# Check Allowed Users
	command cat /etc/vsftpd.user_list
	command sudo systemctl restart vsftpd
	
	# Ended
	command echo "user $1 created successfully!"
}


