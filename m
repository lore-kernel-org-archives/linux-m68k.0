From: Thorsten Glaser <tg@debian.org>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible patch)
Date: Fri, 27 Jan 2012 17:44:01 +0000 (UTC)
Message-ID: <loom.20120127T184202-114@post.gmane.org>
References: <4F1C577D.3040908@sigon.net> <CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com> <CAOmrzkJO8hiMJhN5eanXpjjGnaLYrCDAbekX2=FY394+Vt1UHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:46428 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751923Ab2A0RoQ (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Fri, 27 Jan 2012 12:44:16 -0500
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1RqpqR-0007ue-SH
	for linux-m68k@vger.kernel.org; Fri, 27 Jan 2012 18:44:15 +0100
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Fri, 27 Jan 2012 18:44:15 +0100
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Fri, 27 Jan 2012 18:44:15 +0100
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Michael Schmitz <schmitzmic <at> googlemail.com> writes:

> Might be the wrong /dev/rtc device - it should be major 254 minor 0

Actually, it should be /dev/rtc0 (according to my Debian system)
and you can find out the correct major number like this:

root@ara5:~ # ll /dev/rtc*
crw------- 1 root root 254, 0 Dec 26 16:48 /dev/rtc0
root@ara5:~ # fgrep rtc /proc/devices
254 rtc

This is auto-created from devtmpfs (no udev here), FWIW.
My ARAnyM command line contains devtmpfs.mount=1 coupled
with a few lines in /etc/rc.local:

(test -e /dev/fd || ln -s /proc/self/fd /dev/fd || :)
(test -e /dev/stdin || ln -s /proc/self/fd/0 /dev/stdin || :)
(test -e /dev/stdout || ln -s /proc/self/fd/1 /dev/stdout || :)
(test -e /dev/stderr || ln -s /proc/self/fd/2 /dev/stderr || :)

bye,
//mirabilos
