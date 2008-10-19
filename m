From: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Subject: Re: [PATCH] reinstate mac rtc
Date: Sun, 19 Oct 2008 18:37:17 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.0810191813240.1848@firda.kolla.no>
References: <A4BCBF08-9D05-11DD-9A2B-00050249ADE1@kaffe.org> <alpine.LNX.2.00.0810181928560.1848@firda.kolla.no> <Pine.LNX.4.64.0810191352510.27783@loopy.telegraphics.com.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ufisa.uninett.no ([158.38.152.126]:60564 "EHLO ufisa.uninett.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751452AbYJSQhU (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 19 Oct 2008 12:37:20 -0400
In-Reply-To: <Pine.LNX.4.64.0810191352510.27783@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>, Riccardo <riccardo@kaffe.org>, Brad Boyer <flar@allandria.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, 19 Oct 2008, Finn Thain wrote:

> On Sat, 18 Oct 2008, Kolbj=C3=B8rn Barmen wrote:
>=20
> > On Sat, 18 Oct 2008, Riccardo wrote:
> >=20
> > > I don't know "how", but with 2.2 kernels I always had a correct d=
ate=20
> > > at boot without any tricks. It is true though that with high CPU =
load=20
> > > we had clockskew and that we didn't save back the date and hourti=
me to=20
> > > the clock, thus any clock setting needed to be done from the mac =
side.=20
> > > A compromoise, but better than the current situation.
> >=20
> > The clockproblem is something I stumble upon every now and then on=20
> > various machinees - I really wish there was a kernel parameter wher=
e one=20
> > could set a date string, then the bootloader could pass it on.
>=20
> It isn't a problem if you disable the time-stamp triggered fsck and s=
et=20
> the clock from the network (rdate or ntp).

This is the answer I keep getting, but it isnt really helping.

* SSL/TLS and certificate validation. For example my gumtix uses 802.1X=
 to
get online, when it is running in "1970-01-01", the server and client
certificates are ofcourse not valid and the authentication _will_ fail,
and it wont go online, and therefor no ntp. As .1x is becoming more com=
mon
even on the wire, this problem will grow, at least for me - and .1X is =
not
the only "get online"-method that relies on certificate validation.

* Logs, erronous datestamps all over the place, and files made in 1970 =
or
whatever (my acer laptop always starts in 1988-01-01)

There are so many kernel parameters for the strangest things, all I ask
for is one with a timestamp - then I could tell my gumstick to always b=
oot
on a given time where the .1x certificates would be valid instead of
1970-01-01. And on my laptop, I could just change a value in grub befor=
e
booting. On the mac, penguin could just take system time from macos and
pass it on, maybe even emile could do it.

-- kolla
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
