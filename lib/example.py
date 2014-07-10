# -*- coding: utf-8 -*-

import urllib2, antizapret

urllib2.install_opener(urllib2.build_opener(antizapret.AntizapretProxyHandler()))

req = urllib2.Request("http://blockedsite.ru")
data = response.read()
