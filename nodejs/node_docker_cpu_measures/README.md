# Overview


# Run Docker Node Container

`docker run --volume $(pwd)/cpu_count.js:/cpu_count.js node cpu_count.js`

Note that this may require the modification of your Docker App's "Sharing" preferences.

# Modifying CPUS Argument

```
docker run --cpus 1 --volume $(pwd)/cpu_count.js:/cpu_count.js node cpu_count.js
CPU Cores: 2
docker run --cpus 2 --volume $(pwd)/cpu_count.js:/cpu_count.js node cpu_count.js
CPU Cores: 2
docker run --cpus 1.5 --volume $(pwd)/cpu_count.js:/cpu_count.js node cpu_count.js
CPU Cores: 2
docker run --cpus 0.5 --volume $(pwd)/cpu_count.js:/cpu_count.js node cpu_count.js
CPU Cores: 2
```

# Modify CPU-Shares Argument

```
docker run --cpu-shares 1024 --volume $(pwd)/cpu_count.js:/cpu_count.js node cpu_count.js
```

# Modifying CPUS Argument



# References:

https://www.npmjs.com/package/physical-cpu-count
