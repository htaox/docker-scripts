EWD.js and VistA
================

Based on the fantastic work of Robert Tweed and VistA.
Find out [more](http://robtweed.wordpress.com/2014/03/02/ewd-js-and-vista-lets-get-started/)

####Build the image
<pre>
git clone https://github.com/htaox/docker-scripts.git
cd docker_scripts
cd vista-ewdjs-0.0.1
IMAGE_PREFIX=htaox/
sudo ./build
</pre>

####Deploy with persistence
<pre>
sudo mkdir -p /opt/vista_ewdjs
docker run -d -p 27017:27017 -v /opt/vista_ewdjs:/data/db --name vista_ewdjs htaox/vista_ewdjs-0.0.1
</pre>

####Inspect
<pre>
sudo bash -v "VISTA_EWDJS_IP=$(docker inspect --format {{.NetworkSettings.IPAddress}} vista-ewdjs )
</pre>

####SSH using private key
<pre>
BASEDIR=~/docker-scripts
MASTER_IP=$VISTA_EWDJS_IP
chmod 400 $BASEDIR/vista_ewdjs-0.0.1/files/id_rsa
ssh -i $BASEDIR/vista_ewdjs-0.0.1/files/id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@${MASTER_IP}
</pre>


