#! /bin/bash
sudo tcpdump -ni tun0 icmp

# when ping arrives:
# 00:49:28.840352 IP 10.129.3.225 > 10.10.14.61: ICMP echo request, id 5396, seq 1, length 64
# 00:49:28.840382 IP 10.10.14.61 > 10.129.3.225: ICMP echo reply, id 5396, seq 1, length 64

