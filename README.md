# ADD FTP USER

This script can be executed inside a <b>linux-server</b> to create an ftp-user.

It will basically:

1. creates an user on linux-server.
2. Adds the user to allowed user's list.
3. Creates the credentials.
4. Allows login via FileZilla.

The <b>code</b>:
```python
# file: NewFTPUser.bashrc

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
```

For acessing this FTP server you will need to have your linux-server configured.

If you are on windows, would be recommended to create a permanent route to the ftp-server.

Creating a permanent route from a pc to the server:

In your Windows, open the command line as <b>administrator</b> and type this:

  `route -P ADD <server-ip> MASK 255.255.255.255 192.168.X.1`
  
Then, go to your Filezilla, insert credentials and login.

Hope that it helps!

Happy coding!
