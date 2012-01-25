From: Patrick Bottelberger <patrick.bottelberger@sigon.net>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible
 patch)
Date: Wed, 25 Jan 2012 20:11:05 +0100
Message-ID: <4F2053C9.3090201@sigon.net>
References: <4F1C577D.3040908@sigon.net>	<CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>	<4F1EEBEF.4000400@sigon.net> <CAMuHMdWbQau3kS2-svDS705_PS4-0adCCvLvT=Af6VKKZfr+gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from s15429932.onlinehome-server.info ([87.106.248.152]:48321 "EHLO
	ws1.rootfuchs.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751690Ab2AYTLH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 Jan 2012 14:11:07 -0500
In-Reply-To: <CAMuHMdWbQau3kS2-svDS705_PS4-0adCCvLvT=Af6VKKZfr+gA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Hi Geert,

Geert Uytterhoeven schrieb:
>> Without supplying the '-p' parameter amiboot didn't output anything =
at
>> all, it just froze the amiga directly after entering the command.
>>    =20
>
> Even with '-d'?
>  =20
Yes, even with "-d", no output is printed, after entering the command
("amiboot -d root=3D/dev/hda5" for example) and pressing "enter" the
system freezes immediately.

> I can't reproduce it on ARAnyM with 3.1.4.
>
>  =20
>> Call Trace: [<0000ffff>] mm_release+0xa1/0xa4
>>  [<002b84fa>] topology_sysfs_init+0x0/0x1e
>>
>> Seems to prove that, do you think
>>    =20
>
> But this indeed looks like the same problem. Are you using a Debianiz=
ed 3.1.4
> source tree?
>  =20
I just checked again, yes, you're right, i totally forgot i patched my
source tree with the Debian patches, sorry :-(

>> http://www.spinics.net/lists/linux-m68k/msg04709.html would solve th=
e issue?
>>    =20
>
> Yes, that should fix this problem.
>  =20
It really did! Thank you for pointing me in the right direction, now i
got sysfs and udev again.
> You cannot rely on that message. It just assumes A2000/A500/A600 etc.
> have an A2000-style clock chip. But on all but A2000 the RTC is optio=
nal.
> BTW, I also asked Jens Sch=C3=B6nfeld.
>  =20
After activating CONFIG_RTC_CLASS and CONFIG_RTC_DRV_MSM6242 in the
kernel and finally being able to get the device nodes created
automatically by udev, the RTC now works... somewhat. 8 out of 10 reads
from the RTC (via hctosys inside the kernel at startup, hwclock from
userspace or cat one of the special files inside /sys/class/rtc) return
successfully, but the other 2 return an ioctl()-error. I forgot which
exactly, i'll go upstairs to the Amiga later and write it down.

The PCMCIA-network still doesn't work, i'll recompile the kernel with
CONFIG_APNE=3Dy (instead of m), maybe that will work.


Regards,
Patrick
