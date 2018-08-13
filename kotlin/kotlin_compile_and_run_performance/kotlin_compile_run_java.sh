#!/bin/bash

java_version="11"
open_jdk_package="openjdk-$java_version-jdk-headless"
open_jre_package="openjdk-$java_version-jre-headless"

apt -y update
apt -y install $open_jdk_package
apt -y install $open_jre_package

snap install --classic kotlin

cat > /var/tmp/hello_py.kt <<EOF
fun main(args: Array<String>) {
  println("Hello, Py!")
  println("You're running Kotlin!")
}
EOF

time kotlinc /var/tmp/hello_py.kt -include-runtime -d /var/tmp/hello_py.jar
time java -jar /var/tmp/hello_py.jar
