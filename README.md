ASWCP
=====
ASWCP stands for Anzen Solutions Web Control Panel.  It operates in a client-server 
fashion of sorts.  Here's a more detailed explanation.

There are two parts of ASWCP; the [web panel](https://github.com/AnzenSolutions/ASWCP-Web) and the 
[daemon](https://github.com/AnzenSolutions/ASWCP-Daemon).  The web panel only needs 
to be installed once, while the daemon needs to be installed on every machine you wish to 
manage (even the server).

HTTPS is enforced on the server to do its best in ensuring the connection is secure.  
To have the daemon and server connect to each other an API key pair must first be created in the panel, 
then passed as an argument to the daemon.  At this point the server will generate a 
key pair, store it in the database and update the system, and the client will start listening for requests.

When you browse the server listing a request (by default every 5 seconds) will be made to every 
daemon to make sure there's a heartbeat.  If the status changes it will update the appropriate 
row.

Both the web panel and daemon require Python and come with a requirements.txt file that will be 
read by pip (if you use the appropriate install script) and install the needed packages.  Both were 
also created using virtualenv and is highly recommended you use it as well.

Installing Web Panel
--------------------
Run this command:
```
wget -O - -o /dev/null https://raw.github.com/AnzenSolutions/ASWCP/master/web/install.sh | sh -
```

Installing Daemon
------------------
Run this command:
```
wget -O - -o /dev/null https://raw.github.com/AnzenSolutions/ASWCP/master/daemon/install.sh | sh -
```
