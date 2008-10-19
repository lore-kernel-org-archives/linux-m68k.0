From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] reinstate mac rtc
Date: Sun, 19 Oct 2008 13:53:44 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0810191352510.27783@loopy.telegraphics.com.au>
References: <A4BCBF08-9D05-11DD-9A2B-00050249ADE1@kaffe.org>
 <alpine.LNX.2.00.0810181928560.1848@firda.kolla.no>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="768252030-1183611892-1224384824=:27783"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:43590 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752276AbYJSCxr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 18 Oct 2008 22:53:47 -0400
In-Reply-To: <alpine.LNX.2.00.0810181928560.1848@firda.kolla.no>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Cc: Riccardo <riccardo@kaffe.org>, Brad Boyer <flar@allandria.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--768252030-1183611892-1224384824=:27783
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN
Content-Transfer-Encoding: QUOTED-PRINTABLE



On Sat, 18 Oct 2008, Kolbj=C3=B8rn Barmen wrote:

> On Sat, 18 Oct 2008, Riccardo wrote:
>=20
> > I don't know "how", but with 2.2 kernels I always had a correct date=20
> > at boot without any tricks. It is true though that with high CPU load=
=20
> > we had clockskew and that we didn't save back the date and hourtime to=
=20
> > the clock, thus any clock setting needed to be done from the mac side.=
=20
> > A compromoise, but better than the current situation.
>=20
> The clockproblem is something I stumble upon every now and then on=20
> various machinees - I really wish there was a kernel parameter where one=
=20
> could set a date string, then the bootloader could pass it on.

It isn't a problem if you disable the time-stamp triggered fsck and set=20
the clock from the network (rdate or ntp).

Finn

> Currently i use a /.timestamp file that I read from init=3D/sbin/init.noc=
lock;
>=20
> ---
> firda ~ # cat  /sbin/init.noclock
> #! /bin/bash
> if test $(/bin/date +%Y) -lt 2008 ; then
>         /bin/date -s "1970-01-01 + $(($(/bin/stat -c %X /.timestamp) +360=
0)) seconds"
> fi
> exec /sbin/init
> ---
>=20
> I make sure the .timestamp is touched regularly and on shutdown.
>=20
>=20
> This trick I now use on quadra910, an old acer laptop, gumstix ... :P
>=20
> -- kolla
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
--768252030-1183611892-1224384824=:27783--
