# Run ab

- Test prefork: `ab -n 10000 -c 1 http://10.0.0.142/index.html`
- Test worker: `ab -n 10000 -c 1 http://10.0.0.133/index.html`
- Test event: `ab -n 10000 -c 1 http://10.0.0.102/index.html`

## Prefork

```
Concurrency Level:      1
Time taken for tests:   4.428 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      111920000 bytes
HTML transferred:       109180000 bytes
Requests per second:    2258.53 [#/sec] (mean)
Time per request:       0.443 [ms] (mean)
Time per request:       0.443 [ms] (mean, across all concurrent requests)
Transfer rate:          24685.04 [Kbytes/sec] received
```

## Worker

```
Concurrency Level:      1
Time taken for tests:   4.243 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      111920000 bytes
HTML transferred:       109180000 bytes
Requests per second:    2356.80 [#/sec] (mean)
Time per request:       0.424 [ms] (mean)
Time per request:       0.424 [ms] (mean, across all concurrent requests)
Transfer rate:          25759.05 [Kbytes/sec] received=
```

## Event

```
Concurrency Level:      1
Time taken for tests:   2.098 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      111920000 bytes
HTML transferred:       109180000 bytes
Requests per second:    4765.69 [#/sec] (mean)
Time per request:       0.210 [ms] (mean)
Time per request:       0.210 [ms] (mean, across all concurrent requests)
Transfer rate:          52087.50 [Kbytes/sec] received
```
# Run ab, 10 Parallel Connections

- Test prefork: `ab -n 100000 -c 10 http://10.0.0.142/index.html`
- Test worker: `ab -n 100000 -c 10 http://10.0.0.133/index.html`
- Test event: `ab -n 100000 -c 10 http://10.0.0.102/index.html`

## Prefork

```
Concurrency Level:      10
Time taken for tests:   8.471 seconds
Complete requests:      100000
Failed requests:        0
Total transferred:      1119200000 bytes
HTML transferred:       1091800000 bytes
Requests per second:    11804.61 [#/sec] (mean)
Time per request:       0.847 [ms] (mean)
Time per request:       0.085 [ms] (mean, across all concurrent requests)
Transfer rate:          129020.68 [Kbytes/sec] received
```

## Worker

```
Concurrency Level:      10
Time taken for tests:   8.372 seconds
Complete requests:      100000
Failed requests:        0
Total transferred:      1119200000 bytes
HTML transferred:       1091800000 bytes
Requests per second:    11944.77 [#/sec] (mean)
Time per request:       0.837 [ms] (mean)
Time per request:       0.084 [ms] (mean, across all concurrent requests)
Transfer rate:          130552.60 [Kbytes/sec] received
```

## Event

```
Concurrency Level:      10
Time taken for tests:   7.938 seconds
Complete requests:      100000
Failed requests:        0
Total transferred:      1119200000 bytes
HTML transferred:       1091800000 bytes
Requests per second:    12597.90 [#/sec] (mean)
Time per request:       0.794 [ms] (mean)
Time per request:       0.079 [ms] (mean, across all concurrent requests)
Transfer rate:          137691.14 [Kbytes/sec] received
```

# Run ab, 100 Parallel Connections

- Test prefork: `ab -n 1000000 -c 100 http://10.0.0.142/index.html`
- Test worker: `ab -n 1000000 -c 100 http://10.0.0.133/index.html`
- Test event: `ab -n 1000000 -c 100 http://10.0.0.102/index.html`

## Prefork

```
Concurrency Level:      100
Time taken for tests:   80.162 seconds
Complete requests:      1000000
Failed requests:        0
Total transferred:      11192000000 bytes
HTML transferred:       10918000000 bytes
Requests per second:    12474.72 [#/sec] (mean)
Time per request:       8.016 [ms] (mean)
Time per request:       0.080 [ms] (mean, across all concurrent requests)
Transfer rate:          136344.83 [Kbytes/sec] received
```

## Worker

```
Concurrency Level:      100
Time taken for tests:   83.109 seconds
Complete requests:      1000000
Failed requests:        0
Total transferred:      11192000000 bytes
HTML transferred:       10918000000 bytes
Requests per second:    12032.33 [#/sec] (mean)
Time per request:       8.311 [ms] (mean)
Time per request:       0.083 [ms] (mean, across all concurrent requests)
Transfer rate:          131509.59 [Kbytes/sec] received
```

## Event

```
Concurrency Level:      100
Time taken for tests:   78.963 seconds
Complete requests:      1000000
Failed requests:        0
Total transferred:      11192000000 bytes
HTML transferred:       10918000000 bytes
Requests per second:    12664.10 [#/sec] (mean)
Time per request:       7.896 [ms] (mean)
Time per request:       0.079 [ms] (mean, across all concurrent requests)
Transfer rate:          138414.64 [Kbytes/sec] received
```
