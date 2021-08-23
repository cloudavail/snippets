# Overview

This snippet performs a simple "heap dump" of an application.

# Compile the MemoryEater Application

`javac MemoryEater.java`

Note that the following will be returned, but the application will still be compiled:

```
Note: MemoryEater.java uses unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
```

# Run the MemoryEater Application

`java MemoryEater`

This will confirm the application runs properly. The application will exit but will *not* leave a heapdump.

# Run the Memory Eater with Heapdump Enabled

`java -XX:+HeapDumpOnOutOfMemoryError -Xmx128m MemoryEater`

The application will exit with the following error:

```
java.lang.OutOfMemoryError: Java heap space
Dumping heap to java_pid1257.hprof ...
Heap dump file created [68310124 bytes in 0.031 secs]
Exception in thread "main" java.lang.OutOfMemoryError: Java heap space
	at MemoryEater.main(MemoryEater.java:10)
```

# Reference

- https://alvinalexander.com/blog/post/java/java-program-consume-all-memory-ram-on-computer/
