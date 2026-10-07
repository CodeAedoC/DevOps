# Networking Commands — Practical Log & In-Depth Analysis

**Student:** Jatin · 24BCS10118 · Session 04 — Networking  

---

## 🛠️ Setup & Environment
The command suite covers the Linux Networking Cheat Sheet, `iproute2` vs `net-tools` modern alternatives, subnetting analysis (`ip.md`), and essential troubleshooting utilities (`ping`, `traceroute`, `dig`, `nslookup`, `host`, `curl`, `nc`, `arping`, `ethtool`, `ipcalc`).

---

## 1. `ip addr` — Interface IP Configuration
```console
$ ip addr show dev eth0
11: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default 
    link/ether de:73:f7:58:84:8c brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.105/24 brd 192.168.1.255 scope global eth0
       valid_lft forever preferred_lft forever

$ ip -br addr
lo               UNKNOWN        127.0.0.1/8 ::1/128 
eth0             UP             192.168.1.105/24 
docker0          UP             172.17.0.1/16 
```
* **Understanding:** `ip addr` lists active interfaces with IPv4/IPv6 addresses. `/24` represents the 24-bit subnet mask (`255.255.255.0`). `-br` provides a condensed one-line tabular summary.

---

## 2. `ip link` — Layer 2 Data Link State & Counters
```console
$ ip -s link show dev eth0
11: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default 
    link/ether de:73:f7:58:84:8c brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
       9705907    1615      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
         96201    1415      0       0       0       0 
```
* **Understanding:** Displays the hardware MAC address, MTU (Maximum Transmission Unit), link status (`UP`), and RX/TX packet error/drop statistics.

---

## 3. `ip route` — Kernel Routing Table
```console
$ ip route
default via 192.168.1.1 dev eth0 proto dhcp src 192.168.1.105 metric 100 
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 
192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.105 

$ ip route get 8.8.8.8
8.8.8.8 via 192.168.1.1 dev eth0 src 192.168.1.105 uid 1000 
    cache 
```
* **Understanding:** Routes dictate outbound packet paths. `default via 192.168.1.1` defines the default gateway router. `ip route get <ip>` performs dynamic route simulation for diagnostics.

---

## 4. `ip neigh` / `arp` — ARP Resolution Cache (IP to MAC)
```console
$ ip neigh
192.168.1.1 dev eth0 lladdr d2:db:6f:1e:7d:b2 REACHABLE 

$ arp -n
Address                  HWtype  HWaddress           Flags Mask            Iface
192.168.1.1              ether   d2:db:6f:1e:7d:b2   C                     eth0
```
* **Understanding:** Maps Layer 3 IPv4 addresses to Layer 2 MAC addresses inside the broadcast domain. `REACHABLE` and `C` denote validated dynamic entries.

---

## 5. Interface & Route Manipulation Demo (on `dummy0`)
```console
$ sudo ip link add dummy0 type dummy
$ sudo ip addr add 10.50.0.1/24 dev dummy0
$ sudo ip link set dummy0 up
$ sudo ip route add 10.99.0.0/16 via 10.50.0.1 dev dummy0
$ ip route show 10.99.0.0/16
10.99.0.0/16 via 10.50.0.1 dev dummy0 
$ sudo ip link delete dummy0
```

---

## 6. `net-tools` vs `iproute2` Equivalents Matrix

| Legacy (`net-tools`) | Modern (`iproute2`) | Purpose |
| :--- | :--- | :--- |
| `ifconfig -a` | `ip addr` | View IP addresses & interfaces |
| `ifconfig eth0 up/down` | `ip link set eth0 up/down` | Enable/disable NIC |
| `route -n` / `netstat -r` | `ip route` | Routing table inspection |
| `arp -a` | `ip neigh` | ARP table mapping |
| `netstat -tulpn` | `ss -tulpn` | Socket & port monitoring |

---

## 7. `ping` & `traceroute` Diagnostics
```console
$ ping -c 4 google.com
PING google.com (142.250.190.46) 56(84) bytes of data.
64 bytes from del11s02-in-f14.1e100.net (142.250.190.46): icmp_seq=1 ttl=116 time=14.2 ms
4 packets transmitted, 4 received, 0% packet loss

$ traceroute -m 5 8.8.8.8
traceroute to 8.8.8.8 (8.8.8.8), 5 hops max
 1  192.168.1.1 (192.168.1.1)  1.120 ms
 2  10.10.0.1 (10.10.0.1)  4.312 ms
 3  182.79.142.1 (182.79.142.1)  12.450 ms
 4  dns.google (8.8.8.8)  13.850 ms
```

---

## 8. DNS Resolutions: `dig`, `nslookup`, `host`
```console
$ dig +short google.com
142.250.190.46

$ dig MX google.com +short
10 smtp.google.com.

$ nslookup github.com
Server:		127.0.0.53
Address:	127.0.0.53#53

Non-authoritative answer:
Name:	github.com
Address: 20.207.73.82
```

---

## 9. Subnetting Calculations with `ipcalc`

```console
$ ipcalc 120.27.1.0/8
Network:   120.0.0.0/8
HostMin:   120.0.0.1
HostMax:   120.255.255.254
Broadcast: 120.255.255.255
Hosts/Net: 16777214 (Class A)

$ ipcalc 197.23.45.10/24
Network:   197.23.45.0/24
HostMin:   197.23.45.1
HostMax:   197.23.45.254
Broadcast: 197.23.45.255
Hosts/Net: 254 (Class C)

$ ipcalc 192.168.1.130/26
Network:   192.168.1.128/26
HostMin:   192.168.1.129
HostMax:   192.168.1.190
Broadcast: 192.168.1.191
Hosts/Net: 62 (Class C, Private Subnet)
```

---

## 10. Standard Troubleshooting Sequence
1. **Physical / Layer 2:** Check link with `ip link` or `ethtool eth0`.
2. **Layer 3 (IP):** Verify IP with `ip -br addr` and gateway ping with `ping <gateway>`.
3. **Internet Reachability:** Probe public IP with `ping 8.8.8.8`.
4. **DNS Resolution:** Inspect `/etc/resolv.conf` and query with `dig google.com`.
5. **Path Trace:** Identify network drops with `traceroute 8.8.8.8` / `mtr`.
6. **Port & Process State:** Confirm listening daemon with `ss -tulpn`.
7. **Application Layer:** Test TCP handshake & HTTP response with `nc -zv host port` & `curl -I`.
