#!/bin/bash

# objective:
# create a simple vertx install that runs a basic web application

# a Java JRE or JDK is required for running vertx
apt-get -y update
apt-get -y install openjdk-7-jdk

wget http://dl.bintray.com/vertx/downloads/vert.x-2.1.2.tar.gz
tar -zxf vert.x-2.1.2.tar.gz
mv vert.x-2.1.2 /usr/local/bin/

cat > /etc/profile.d/vertx.sh <<EOF
export PATH=\$PATH:/usr/local/bin/vert.x-2.1.2/bin
EOF

source /etc/profile.d/vertx.sh

cat > /srv/server.java <<EOF
import org.vertx.java.core.Handler;
import org.vertx.java.core.net.NetSocket;
import org.vertx.java.core.streams.Pump;
import org.vertx.java.platform.Verticle;

public class server extends Verticle {

  public void start() {
    vertx.createNetServer().connectHandler(new Handler<NetSocket>() {
      public void handle(final NetSocket socket) {
        Pump.createPump(socket, socket).start();
      }
    }).listen(8080);
  }
}
EOF

cd /srv/
vertx run server.java &

# once script has run
# from the "host" machine run
# telnet localhost 8080