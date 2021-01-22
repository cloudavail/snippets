# **Overview**
The objective of these snippets is to quick start a user who wants to use JMX along with Jconsole to monitor and debug a Java application.
### **JMX/Jconsole Overview**
JMX and Jconsole are included with all recent JDK builds. JMX is an agent that attaches to a Java process when it is launched. It can be attached by including the relevant arguments when launching a Java app, or alternatively by adding Mbean Classes to Java code. By adding MBean classes to code the user may get more fine grained control over their application and attach JMX agents to individual processes within the Java code. This snippet will cover how to attach a JMX agent to a Java app at run time so that it can be accessed with Jconsole, without adding Mbeans or refactoring code. Relevant info to add JMX and Mbeans to Java code can be found [Here](https://www.oracle.com/technical-resources/articles/javase/jmx.html) and [Here](https://www.baeldung.com/java-management-extensions)
# **Java Loop**
The Java code included is a simple Forloop Java app that prints a digit in the console (starting at 1) until it reaches 3000. There is a 1 second pause between each printed number which gives the user 50 minutes to connect to the JMX agent and perform tasks with Jconsole. To compile and run this code the user must have a JDK installed. To compile the code from the command line, navigate to the project directory.

Compile: `javac ForLoop.java`
# **Launching App with JMX**
To run the code we would only need to run `java ForLoop`, but we need to include some arguments after the `java` command to attach a JMX client to it. The final command to launch the app with JMX follows
```
java
-Dcom.sun.management.jmxremote
-Dcom.sun.management.jmxremote.port=9010      #Any open port can be used here
-Dcom.sun.management.jmxremote.rmi.port=9010 
-Dcom.sun.management.jmxremote.local.only=false
-Dcom.sun.management.jmxremote.authenticate=false
-Dcom.sun.management.jmxremote.ssl=false
-Djava.rmi.server.hostname=      #Add the IP of the server hosting the app
ForLoop
```
# **JConsole**
The Jconsole app is in the same installation directory as JDK. On Linux the default directory for Jconsole is /usr/lib/java-x.x.x/bin/. Navigate to that directory and run `jconsole` from the command line. In the **Remote Process** field, enter the IP address of the server hosting the app along with the port that was used in the JMX arguments when launching the app. It should be in the format of `12.34.56.78:9010`. Click connect without entering a username or password. When prompted click `insecure connection` since we aren't using SSL.