# Overview
This basic project will compile a basic webapp application using Gradle.

# Execution of Build
```gradle build```

# Execution of Compiled Application
## Running the Application
drop the compiled war file (from ```build/libs/webapp-0.1.war```) into the Tomcat ```webapps``` directory to run, then start Tomcat/Catalina. Access the following URLs:

1. http://localhost:8080/webapp-0.1
2. http://localhost:8080/webapp-0.1/osinfo
3. http://localhost:8080/webapp-0.1/requestinfo

# Outputs
1. A compiled war file named ```webapp-0.1.war```, located in ```build/libs```.
