From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] reinstate mac rtc
Date: Mon, 20 Oct 2008 13:03:41 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0810201220540.7550@loopy.telegraphics.com.au>
References: <A4BCBF08-9D05-11DD-9A2B-00050249ADE1@kaffe.org>
 <alpine.LNX.2.00.0810181928560.1848@firda.kolla.no>
 <Pine.LNX.4.64.0810191352510.27783@loopy.telegraphics.com.au>
 <alpine.LNX.2.00.0810191813240.1848@firda.kolla.no>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="768252030-283214524-1224468221=:7550"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:33707 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752005AbYJTCDo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 19 Oct 2008 22:03:44 -0400
In-Reply-To: <alpine.LNX.2.00.0810191813240.1848@firda.kolla.no>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Cc: Riccardo <riccardo@kaffe.org>, Brad Boyer <flar@allandria.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--768252030-283214524-1224468221=:7550
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE



On Sun, 19 Oct 2008, Kolbj=C3=B8rn Barmen wrote:

> On Sun, 19 Oct 2008, Finn Thain wrote:
>=20
> > On Sat, 18 Oct 2008, Kolbj=C3=B8rn Barmen wrote:
> >=20
> > > On Sat, 18 Oct 2008, Riccardo wrote:
> > >=20
> > > > I don't know "how", but with 2.2 kernels I always had a correct=20
> > > > date at boot without any tricks. It is true though that with high=
=20
> > > > CPU load we had clockskew and that we didn't save back the date=20
> > > > and hourtime to the clock, thus any clock setting needed to be=20
> > > > done from the mac side. A compromoise, but better than the current=
=20
> > > > situation.
> > >=20
> > > The clockproblem is something I stumble upon every now and then on=20
> > > various machinees - I really wish there was a kernel parameter where=
=20
> > > one could set a date string, then the bootloader could pass it on.
> >=20
> > It isn't a problem if you disable the time-stamp triggered fsck and=20
> > set the clock from the network (rdate or ntp).
>=20
> This is the answer I keep getting, but it isnt really helping.

Works for me. Especially when I cannot source a clock battery. One must=20
fabricate the 4.5 pack for the LC 630 and similar models (New Old Stock=20
batteries don't last long enough to be worth the cost even if you can find=
=20
them).

In fact, many of the several dozen machines I must test have no clock=20
battery at all since even the 3.6 V 1/2 AA lithium cells cost me=20
AUD$10-$15 each. Replacing the battery in a powerbook is difficult because=
=20
it always means disassembly and, in some models, it means replacing a PCB=
=20
mount cell. (But they need to be removed, I guess, since the old NiCd ones=
=20
in all of my PB 150s were beginning to leak. I don't generally replace=20
them, since that's inviting PMU flakiness when the go flat again).

BTW, I've seen old Li 1/2 AA cells leak too (but not the Li button=20
cells... so far).

> * SSL/TLS and certificate validation. For example my gumtix uses 802.1X=
=20
>   to get online, when it is running in "1970-01-01", the server and=20
>   client certificates are ofcourse not valid and the authentication=20
>   _will_ fail, and it wont go online, and therefor no ntp. As .1x is=20
>   becoming more common even on the wire, this problem will grow, at=20
>   least for me - and .1X is not the only "get online"-method that relies=
=20
>   on certificate validation.
>=20
> * Logs, erronous datestamps all over the place, and files made in 1970=20
>   or whatever (my acer laptop always starts in 1988-01-01)

Right. The RTC is important. Perhaps you can configure eth0 using kernel=20
parameters (like with NFS root) and then use eth0 to set the clock from=20
userspace before filesystems are mounted r/w.

> There are so many kernel parameters for the strangest things, all I ask=
=20
> for is one with a timestamp - then I could tell my gumstick to always=20
> boot on a given time where the .1x certificates would be valid instead=20
> of 1970-01-01. And on my laptop, I could just change a value in grub=20
> before booting. On the mac, penguin could just take system time from=20
> macos and pass it on, maybe even emile could do it.

I'd much prefer to see that effort spent on reverse engineering the VIA1=20
accesses in question. This problem only applies to the Quadra 900/950=20
AFAIK. None of the other several dozen models would see any benefit from=20
changes to the mac bootloaders.

Finn

>=20
> -- kolla
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
--768252030-283214524-1224468221=:7550--
