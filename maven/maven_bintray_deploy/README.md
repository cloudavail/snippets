# Create a Basic Maven Project
mvn archetype:generate \
-DgroupId=com.cloudavail \
-DartifactId=artifact \
-DpackageName=com.cloudavail.testproject \
-DinteractiveMode=false

# Compile a Project
`mvn install`

# Run the Project
`java -cp target/artifact-1.0-SNAPSHOT.jar com.cloudavail.App`
