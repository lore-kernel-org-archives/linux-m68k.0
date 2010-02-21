From: Lanttor <lanttor.guo@freescale.com>
Subject: One issue during kernel porting on coldfire m5441x: dl_main: Assertion
 `_rtld_local._dl_rtld_map.l_libname' failed!
Date: Sun, 21 Feb 2010 17:02:08 +0800
Message-ID: <4B80F690.9000907@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from az33egw02.freescale.net ([192.88.158.103]:56806 "EHLO
	az33egw02.freescale.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752947Ab0BUJAN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 21 Feb 2010 04:00:13 -0500
Received: from de01smr02.am.mot.com (de01smr02.freescale.net [10.208.0.151])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id o1L90BJc023720
	for <linux-m68k@vger.kernel.org>; Sun, 21 Feb 2010 02:00:12 -0700 (MST)
Received: from zmy16exf40.fsl.freescale.net (zmy16exf40.ap.freescale.net [10.211.3.4])
	by de01smr02.am.mot.com (8.13.1/8.13.0) with ESMTP id o1L97sOo027001
	for <linux-m68k@vger.kernel.org>; Sun, 21 Feb 2010 03:07:55 -0600 (CST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>, linux-m68k@vger.kernel.org

Hi,

I met one interesting issue during I porting 2.6.29 kernel on ColdFire
paltform (v4 core, mcf5441x).

I could boot up the kernel with initramfs, but the kernel message below
displays some error information,
which line I colored red. initramfs image only includes busybox static
binary.

*starting pid 371, tty '': '/etc/rc.d/rcS'
Mounting /proc and /sys
Starting the hotplug events dispatcher udevd
Inconsistency detected by ld.so: rtld.c: 1215: dl_main: Assertion
`_rtld_local._dl_rtld_map.l_libname' failed!
Synthesizing initial hotplug events
Inconsistency detected by ld.so: rtld.c: 1215: dl_main: Assertion
`_rtld_local._dl_rtld_map.l_libname' failed!
Inconsistency detected by ld.so: rtld.c: 1215: dl_main: Assertion
`_rtld_local._dl_rtld_map.l_libname' failed!
Setting the hostname to freescale
Mounting filesystems
mount: mounting usbfs on /proc/bus/usb failed: No such file or directory
Starting syslogd and klogd
Running sysctl
Setting up networking on loopback device:
Setting up networking on eth0:
Adding static route for default gateway to 10.192.208.254:
route: SIOCADDRT: File exists
Setting nameserver to 10.192.208.1 in /etc/resolv.conf:
Starting inetd:
starting pid 434, tty '': '-/bin/sh'*

This error message shows that I can't load dynamical binary: if I build
initramfs with busybox dynamical binary,
it's can't boot up and just prints above error information.

Anybody met the issue like-same?  Some suggestion is appreciated.

-- 
Best Regards,
Lanttor
