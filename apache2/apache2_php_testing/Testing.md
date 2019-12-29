# Run ab

- Test mod_php: `ab -n 10000 -c 1 http://10.0.0.70/index.php`
- Test prefork: `ab -n 10000 -c 1 http://10.0.0.29/index.php`
- Test worker: `ab -n 10000 -c 1 http://10.0.0.168/index.php`
- Test event: `ab -n 10000 -c 1 http://10.0.0.134/index.php`

## mod PHP

```
Concurrency Level:      1
Time taken for tests:   2.420 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      3050000 bytes
HTML transferred:       1140000 bytes
Requests per second:    4132.30 [#/sec] (mean)
Time per request:       0.242 [ms] (mean)
Time per request:       0.242 [ms] (mean, across all concurrent requests)
Transfer rate:          1230.81 [Kbytes/sec] received
```

## Prefork

```
Concurrency Level:      1
Time taken for tests:   3.139 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      2840000 bytes
HTML transferred:       1140000 bytes
Requests per second:    3185.61 [#/sec] (mean)
Time per request:       0.314 [ms] (mean)
Time per request:       0.314 [ms] (mean, across all concurrent requests)
Transfer rate:          883.51 [Kbytes/sec] received
```

## Worker

```
Concurrency Level:      1
Time taken for tests:   3.609 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      2840000 bytes
HTML transferred:       1140000 bytes
Requests per second:    2771.23 [#/sec] (mean)
Time per request:       0.361 [ms] (mean)
Time per request:       0.361 [ms] (mean, across all concurrent requests)
Transfer rate:          768.58 [Kbytes/sec] received
```

## Event

```
Concurrency Level:      1
Time taken for tests:   3.685 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      2840000 bytes
HTML transferred:       1140000 bytes
Requests per second:    2713.81 [#/sec] (mean)
Time per request:       0.368 [ms] (mean)
Time per request:       0.368 [ms] (mean, across all concurrent requests)
Transfer rate:          752.66 [Kbytes/sec] received
```
# Run ab, 10 Parallel Connections

- Test mod_php: `ab -n 100000 -c 10 http://10.0.0.70/index.php`
- Test prefork: `ab -n 100000 -c 10 http://10.0.0.29/index.php`
- Test worker: `ab -n 100000 -c 10 http://10.0.0.168/index.php`
- Test event: `ab -n 100000 -c 10 http://10.0.0.134/index.php`

## mod_php

```
Concurrency Level:      10
Time taken for tests:   9.421 seconds
Complete requests:      100000
Failed requests:        0
Total transferred:      30500000 bytes
HTML transferred:       11400000 bytes
Requests per second:    10614.33 [#/sec] (mean)
Time per request:       0.942 [ms] (mean)
Time per request:       0.094 [ms] (mean, across all concurrent requests)
Transfer rate:          3161.49 [Kbytes/sec] received
```


## Prefork

```
Concurrency Level:      10
Time taken for tests:   15.778 seconds
Complete requests:      100000
Failed requests:        0
Total transferred:      28400000 bytes
HTML transferred:       11400000 bytes
Requests per second:    6338.11 [#/sec] (mean)
Time per request:       1.578 [ms] (mean)
Time per request:       0.158 [ms] (mean, across all concurrent requests)
Transfer rate:          1757.83 [Kbytes/sec] received
```

## Worker

```
Concurrency Level:      10
Time taken for tests:   16.936 seconds
Complete requests:      100000
Failed requests:        0
Total transferred:      28400000 bytes
HTML transferred:       11400000 bytes
Requests per second:    5904.68 [#/sec] (mean)
Time per request:       1.694 [ms] (mean)
Time per request:       0.169 [ms] (mean, across all concurrent requests)
Transfer rate:          1637.63 [Kbytes/sec] received
```

## Event

```
Concurrency Level:      10
Time taken for tests:   17.260 seconds
Complete requests:      100000
Failed requests:        0
Total transferred:      28400000 bytes
HTML transferred:       11400000 bytes
Requests per second:    5793.81 [#/sec] (mean)
Time per request:       1.726 [ms] (mean)
Time per request:       0.173 [ms] (mean, across all concurrent requests)
Transfer rate:          1606.88 [Kbytes/sec] received
```

# Run ab, 100 Parallel Connections

- Test mod_php: `ab -n 1000000 -c 100 http://10.0.0.70/index.php`
- Test prefork: `ab -n 1000000 -c 100 http://10.0.0.29/index.php`
- Test worker: `ab -n 1000000 -c 100 http://10.0.0.168/index.php`
- Test event: `ab -n 1000000 -c 100 http://10.0.0.134/index.php`

## mod PHP

```
Concurrency Level:      100
Time taken for tests:   103.116 seconds
Complete requests:      1000000
Failed requests:        0
Total transferred:      305000000 bytes
HTML transferred:       114000000 bytes
Requests per second:    9697.83 [#/sec] (mean)
Time per request:       10.312 [ms] (mean)
Time per request:       0.103 [ms] (mean, across all concurrent requests)
Transfer rate:          2888.51 [Kbytes/sec] received
```

## Prefork

```
Concurrency Level:      100
Time taken for tests:   169.928 seconds
Complete requests:      1000000
Failed requests:        0
Total transferred:      284000000 bytes
HTML transferred:       114000000 bytes
Requests per second:    5884.85 [#/sec] (mean)
Time per request:       16.993 [ms] (mean)
Time per request:       0.170 [ms] (mean, across all concurrent requests)
Transfer rate:          1632.13 [Kbytes/sec] received
```

## Worker

```
Concurrency Level:      100
Time taken for tests:   162.133 seconds
Complete requests:      1000000
Failed requests:        0
Total transferred:      284000000 bytes
HTML transferred:       114000000 bytes
Requests per second:    6167.79 [#/sec] (mean)
Time per request:       16.213 [ms] (mean)
Time per request:       0.162 [ms] (mean, across all concurrent requests)
Transfer rate:          1710.60 [Kbytes/sec] received
```

## Event

```
Concurrency Level:      100
Time taken for tests:   173.586 seconds
Complete requests:      1000000
Failed requests:        0
Total transferred:      284000000 bytes
HTML transferred:       114000000 bytes
Requests per second:    5760.85 [#/sec] (mean)
Time per request:       17.359 [ms] (mean)
Time per request:       0.174 [ms] (mean, across all concurrent requests)
Transfer rate:          1597.73 [Kbytes/sec] received
```
