From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible
 patch)
Date: Sun, 29 Jan 2012 09:24:03 +1300
Message-ID: <4F245963.9070605@gmail.com>
References: <4F1C577D.3040908@sigon.net> <CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com> <CAOmrzkJO8hiMJhN5eanXpjjGnaLYrCDAbekX2=FY394+Vt1UHw@mail.gmail.com> <loom.20120127T184202-114@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:54052 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751761Ab2A1UYN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 28 Jan 2012 15:24:13 -0500
Received: by pbaa10 with SMTP id a10so2616505pba.19
        for <linux-m68k@vger.kernel.org>; Sat, 28 Jan 2012 12:24:13 -0800 (PST)
In-Reply-To: <loom.20120127T184202-114@post.gmane.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@debian.org>
Cc: linux-m68k@vger.kernel.org

Hi Thorsten,

Might be the wrong /dev/rtc device - it should be major 254 minor 0

> Actually, it should be /dev/rtc0 (according to my Debian system)
hwclock attempts to open /dev/rtc which is symlinked to rtc0 if udev is 
used.
> and you can find out the correct major number like this:
>
> root@ara5:~ # ll /dev/rtc*
> crw------- 1 root root 254, 0 Dec 26 16:48 /dev/rtc0
> root@ara5:~ # fgrep rtc /proc/devices
> 254 rtc
>
> This is auto-created from devtmpfs (no udev here), FWIW.
With no helpers at all, the devices need to be static files present in 
/dev. The old makedev scripts
(/dev/MAKEDEV) probably need to be overhauled to create the correct 
files to cover this case.
My copy on the Falcon will still create a misc device for RTC,
> My ARAnyM command line contains devtmpfs.mount=1 coupled
> with a few lines in /etc/rc.local:
>
> (test -e /dev/fd || ln -s /proc/self/fd /dev/fd || :)
> (test -e /dev/stdin || ln -s /proc/self/fd/0 /dev/stdin || :)
> (test -e /dev/stdout || ln -s /proc/self/fd/1 /dev/stdout || :)
> (test -e /dev/stderr || ln -s /proc/self/fd/2 /dev/stderr || :)
rc.local hacks are always possible as a last resort :-) Good one, though.

Cheers,

   Michael
