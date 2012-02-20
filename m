From: Patrick Bottelberger <patrick.bottelberger@sigon.net>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible
 patch)
Date: Mon, 20 Feb 2012 22:38:06 +0100
Message-ID: <4F42BD3E.3060901@sigon.net>
References: <4F1C577D.3040908@sigon.net>	<CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>	<4F1EEBEF.4000400@sigon.net> <CAMuHMdWbQau3kS2-svDS705_PS4-0adCCvLvT=Af6VKKZfr+gA@mail.gmail.com> <4F2053C9.3090201@sigon.net> <97e6cf2ca60c81874f6ea82e8b4af158@localhost> <4F3181C6.8080805@sigon.net> <loom.20120207T231019-351@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from s15429932.onlinehome-server.info ([87.106.248.152]:50588 "EHLO
	ws1.rootfuchs.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753313Ab2BTViL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 20 Feb 2012 16:38:11 -0500
In-Reply-To: <loom.20120207T231019-351@post.gmane.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@debian.org>
Cc: linux-m68k@vger.kernel.org

Hi Thorsten,

using your kernel, i got the same errors as with my own (flaky RTC and
non-working PCMCIA), but no other errors, especially no illegal
instruction errors. So, you're right, it wasn't the Debian patches afte=
r
all, sorry for accusing you  :-)  Maybe my toolchain is doing something
wicked, i don't know :-/

Back to my current problems, i don't think the read errors for the RTC
may be connected to the fact, that i don't have a battery on my A603
board, or could it?
=46or using the apne driver, am i maybe missing something to get the
PCMCIA bus up and running?

Is there any A1200 user around here that could tell me which files
relating to PCMCIA should be visible in /sys{,/bus,/class} at system
start, if any? Maybe it's the id's of my card that don't get recognised
by the apne driver, but how can i read the id without having access to
the bus itself? pccardctl doesn't find anything, and the corresponding
init-script complains about no existing bridge module, because it can't
find /sys/class/pcmcia_socket

I'm a bit lost at the moment :-/


Regards,
Tjelfe


Thorsten Glaser schrieb:
> Patrick Bottelberger <patrick.bottelberger <at> sigon.net> writes:
>
>  =20
>> Patrick Bottelberger schrieb:
>>    =20
>>> Maybe it's the debian patches that get everything out of order, i'l=
l try
>>> 3.1.10 vanilla, maybe that'll work.
>>>  =20
>>>      =20
>> I compiled a vanilla 3.2.2 kernel tree without Debian patches and
>> without adding -msoft-float and it runs. It seems one of the
>> Debian-patches adds some floating-point-operations.
>>    =20
>
> I don=E2=80=99t think so. 3.2.2 from Debian is looking good (3.2.4 bu=
ilding),
> but you MUST compile with -ffreestanding.
>
> Can you try the 3.2.2 image from debian-ports or my repo
> https://www.freewrt.org/~tg/debs68k/dists/sid/main/Upload/unstable/li=
nux-2.6/
> and check whether that=E2=80=99s more buggy than vanilla? If so,
> you=E2=80=99ve got bugs to report =E2=98=BA
>
> Thanks,
> //mirabilos
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  =20
