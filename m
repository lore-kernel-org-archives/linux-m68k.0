From: Patrick Bottelberger <tjelfe@sigon.net>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible patch)
Date: Thu, 26 Jan 2012 18:05:53 +0100
Message-ID: <97e6cf2ca60c81874f6ea82e8b4af158@localhost>
References: <4F1C577D.3040908@sigon.net>	<CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>	<4F1EEBEF.4000400@sigon.net> <CAMuHMdWbQau3kS2-svDS705_PS4-0adCCvLvT=Af6VKKZfr+gA@mail.gmail.com> <4F2053C9.3090201@sigon.net>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from s15429932.onlinehome-server.info ([87.106.248.152]:54527 "EHLO
	ws1.rootfuchs.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751410Ab2AZRQO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 26 Jan 2012 12:16:14 -0500
In-Reply-To: <4F2053C9.3090201@sigon.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org


Hi Geert,

On Wed, 25 Jan 2012 20:11:05 +0100, Patrick Bottelberger
<patrick.bottelberger@sigon.net> wrote:
> After activating CONFIG_RTC_CLASS and CONFIG_RTC_DRV_MSM6242 in the
> kernel and finally being able to get the device nodes created
> automatically by udev, the RTC now works... somewhat. 8 out of 10 reads
> from the RTC (via hctosys inside the kernel at startup, hwclock from
> userspace or cat one of the special files inside /sys/class/rtc) return
> successfully, but the other 2 return an ioctl()-error. I forgot which
> exactly, i'll go upstairs to the Amiga later and write it down.
> 

The error reported by hwclock is:
RTC_RD_TIME: Illegal Argument
ioctl() to /dev/rtc0 to read the time failed.

If reading /sys/class/rtc/rtc0/time with cat, the error is:
cat: /sys/class/rtc/rtc0/time: Invalid Argument

Additional to that, the date seems to be correct every time i read it (for
example with "cat /sys/class/rtc/rtc0/date"), but the time seems to be a
bit strange. Even if the time can be read, i get different times from the
clock. 3 cat's in a row returned:
02:04:16
12:04:18
22:04:19

That seems a bit... odd. Any ideas?

> The PCMCIA-network still doesn't work, i'll recompile the kernel with
> CONFIG_APNE=y (instead of m), maybe that will work.
> 

Still doesn't work, but i don't see anything PCMCIA-related in
/sys/{bus,bus/platform} either. I think that may be the problem, do i need
anything else besides of CONFIG_AMIGA_PCMCIA and CONFIG_APNE?

Maybe it's the debian patches that get everything out of order, i'll try
3.1.10 vanilla, maybe that'll work.


Regards,
Patrick
