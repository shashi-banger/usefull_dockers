# [IPERF](https://iperf.fr/) tool docker 


## Docker BUIld command

```
docker build -t shashibanger/iperf:1.0.0 .
```


## Performance tests done on AWS ec2

### Test setup

1. Two AWS ec2 instances c5d.large created in the same availability zone.
2. Run iperf3 server on one instance using following command
```
docker run -it --rm --net host shashibanger/iperf:1.0.0 iperf3 -s
```
3. Run iperf3 client mode on the other instance using following command
```
docker run -it --rm --net host shashibanger/iperf:1.0.0 iperf3 -c 172.31.73.94 -i 2 -l 8960 -u -b 3000000000
```
-l is the udp datagram length which can be varied


### Results
| S.No. | Bitrate | UDP datagram length | Total run Duration(sec) | Error %Lost datagrams  | Comments                                                   |
|-------|---------|---------------------|-------------------------|------------------------|------------------------------------------------------------|
| 1     | 3Gbps   | 8960                | 50                      | 2080/2092610 (0.099%)  |                                                            |
| 2     | 3Gbps   | 1460                | 50                      | 3803386/12842340 (30%) |                                                            |
| 3     | 3Gbps   | 1460                | 50                      | 2372650/12842391 (18%) | net.core.rmem_max=26214400  net.core.rmem_default=26214400 |
| 4     | 3Gbps   | 8960                | 50                      | 0/2092613 (0%)         | net.core.rmem_max=26214400  net.core.rmem_default=26214400 |