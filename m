From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: aufs vs. m68k conflict, please advice
Date: Sat, 17 Dec 2011 19:00:00 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1112171856380.856@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1112161437090.856@herc.mirbsd.org>
 <1324054093.2825.282.camel@deadeye> <Pine.BSM.4.64L.1112171426140.856@herc.mirbsd.org>
 <20111217184915.GL24496@pengutronix.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:10015 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752684Ab1LQTMN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 17 Dec 2011 14:12:13 -0500
In-Reply-To: <20111217184915.GL24496@pengutronix.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?utf-8?Q?Uwe_Kleine-K=EF=BF=BDig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-m68k@vger.kernel.org, Debian Kernel Team <debian-kernel@lists.debian.org>

Uwe Kleine-K=EF=BF=BDnig dixit:

>On Sat, Dec 17, 2011 at 02:28:35PM +0000, Thorsten Glaser wrote:

>> Maybe something like this?
[=E2=80=A6]
>> Just an idea of the moment,

Well, it does make the thing compile with minimal effort.

>IMHO the problem is that aufs provides an incomplete definition of
>pr_fmt. Either it should define AUFS_NAME on the commandline, too, or
>should define pr_fmt in an aufs header (or a .c file) #included after
>all other headers and only when AUFS_NAME is defined, too.

My initial thoughts, too.

>The ugly thing about aufs' pr_fmt being already there when ack_bad_irq
>is defined is, that the message printed by the pr_crit suddenly looks
>aufs specific which it clearly isn't. So it should better make sure th=
at
>the definition isn't available to ack_bad_irq.

True, but looking at the actual changes, it doesn=E2=80=99t look too au=
fs
specific to me. (If the function ack_bad_irq is instantiated in
the aufs code at all, which is debatable; a quick fgrep -r doesn=E2=80=99=
t
find anything.)

Anyway, will please someone communicate that to the aufs developers
and include some sort of fix in the next upload? (My build is still
compiling, 132 bogomips is fast; will communicate success or failure
of the kernel in general.)

Thanks,
//mirabilos
--=20
<dileks> ch: good, you corrected yourself. ppl tend to tweet such news
immediately, sth. like "grml devs seem to be buyable"    <ch> dileks: w=
e
_are_. if you throw enough money in our direction, things will happen
<mika> everyone is buyable, it's just a matter of price   <mrud> and no=
w
comes [mira] and uses this as a signature ;0	   -- they asked for it=E2=
=80=A6
