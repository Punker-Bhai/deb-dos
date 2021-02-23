<p align="center">
<a href="https://punkers.business.site"><img title="Made in INDIA" src="https://img.shields.io/badge/MADE%20IN-INDIA-SCRIPT?colorA=%23ff8100&colorB=%23017e40&colorC=%23ff0000&style=for-the-badge"></a>
</p>

# DEB-DOS
*****Under Maintenance*****
*****As a backup I have added a new file on it named `hping3.sh`*****
* Having nothing to do, I briefly studied the following dos attacks. Everyone knows the principle, and how to implement it is the problem. Two scripts were made to weaken the access intensity, and they were used for internal network attacks and external network attacks. Generally, a single server or a relatively small number of servers can deny service by launching an attack with only one host, and the effect of the intranet is more obvious.

## Idea

Mainly solved two problems
* The number of attack links launched by a single host. Multithreading is used here, only requesting data, not receiving data, and writing enough headders to meet various possible advantages. When requesting data, try to find the page with the most content.

* What if there is no broiler? What should I do if the IP is blocked? So using a proxy server, I couldn't block it.

## File description [READ 1ST]

```
├── dos.py single IP attack, often used in intranet
├── list.txt generates intermediate file of proxy server
├── deb-proxy.py
├── proxy.py uses proxy server attacks, often used in external networks
├── README.md
├── event.txt proxy server list
└── tests.sh linux test script
Else (For Backup)
bash hping3.sh for dos attack (Sudo Required)
```

## Instructions

For ddos.py: `python dos.py http://www.xxx.com/ [safe]`, safe is optional, after adding it will ensure that the attack will stop after the server hangs

For proxy-py: `python deb-proxy.py http://www.xxx.com`, the attack will not stop

Want to stop the attack:

kill `pgrep python`

The proxy server needs to be updated, just modify the i loop size in the proxy.py file findIP() directly. Also be aware that the agency website will be blocked at any time

*****For learning and use, the author is not responsible for the results*****
