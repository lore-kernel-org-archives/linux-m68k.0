From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: aufs vs. m68k conflict, please advice
Date: Sat, 17 Dec 2011 19:49:15 +0100
Message-ID: <20111217184915.GL24496@pengutronix.de>
References: <Pine.BSM.4.64L.1112161437090.856@herc.mirbsd.org>
 <1324054093.2825.282.camel@deadeye>
 <Pine.BSM.4.64L.1112171426140.856@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:45281 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782Ab1LQStS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 17 Dec 2011 13:49:18 -0500
Content-Disposition: inline
In-Reply-To: <Pine.BSM.4.64L.1112171426140.856@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org, Debian Kernel Team <debian-kernel@lists.debian.org>

On Sat, Dec 17, 2011 at 02:28:35PM +0000, Thorsten Glaser wrote:
> Ben Hutchings dixit:
>=20
> >why other architectures get away with it.  Maybe they just don't use
> >pr_*() in headers.
>=20
> Maybe something like this?
>=20
> #define ack_bad_irq(irq) do {					\
> 	pr_crit("unexpected IRQ trap at vector %02x\n",		\
> 	    (unsigned int)(irq));				\
> } while (/* CONSTCOND */ 0)
>=20
> This would defer pr_crit expansion to when the static inline
> function was actually used.
>=20
> Just an idea of the moment,
IMHO the problem is that aufs provides an incomplete definition of
pr_fmt. Either it should define AUFS_NAME on the commandline, too, or
should define pr_fmt in an aufs header (or a .c file) #included after
all other headers and only when AUFS_NAME is defined, too.

The ugly thing about aufs' pr_fmt being already there when ack_bad_irq
is defined is, that the message printed by the pr_crit suddenly looks
aufs specific which it clearly isn't. So it should better make sure tha=
t
the definition isn't available to ack_bad_irq.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
