#!/usr/bin/env python
# coded by: HACKERSPUNK
import urllib2
import urllib
import re
import socket
import random
from BeautifulSoup import BeautifulSoup
socket.setdefaulttimeout(2)
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

# http://www.kuaidaili.com/
# The proxy of this website is easy to use, more than 50% usability, no need to test

url = 'http://www.kuaidaili.com/proxylist/%s/'

def findProxy():
    proxys = []
    print 'Start to find proxy from %s' % url
    for i in range(10):
        tmp = spider_kuaidaili(i)
        proxys += tmp
    writeFile(proxys)
    print 'A total of %s proxies were found' % len(proxys)

def spider_kuaidaili(index):
    headers = ('User-Agent','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11')
    opener = urllib2.build_opener()
    opener.addheaders = [headers]
    try:
        urls = []
        page = opener.open(url % index).read()
        page = BeautifulSoup(page)
        proxys = page.tbody.findAll('tr')
        for p in proxys:
            td = p.findAll('td')
            host, port = td[0].string, td[1].string
            urls.append('http://%s:%s/' % (host, port))
        return urls
    except Exception,e:
        print e
        return []

def writeFile(proxys):
    with open('result.txt', 'w') as f:
        for p in proxys:
            f.write(str(p)+'\n')

def testIP(url):
    pro = urllib2.ProxyHandler({'http':url})
    opener = urllib2.build_opener(pro,urllib2.HTTPHandler)
    urllib2.install_opener(opener)
    try:
        content = urllib2.urlopen('http://www.baidu.com').read()
        return True
    except Exception,e:
        print e
        return False
    return False

def test_spider_kuaidaili():
    spider_kuaidaili(1)

def test_find_proxy():
    findProxy()

if __name__=="__main__":
    #test_spider_kuaidaili()
    test_find_proxy()
© 2021 GitHub, Inc.
