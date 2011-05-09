From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: Debian kernel 2.6.38-5
Date: Mon, 9 May 2011 22:25:59 +0200
Message-ID: <20110509202559.GA27320@chumley.earth.sol>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
 <Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org>
 <20110508165909.GA16281@chumley.earth.sol>
 <Pine.BSM.4.64L.1105081834101.28983@herc.mirbsd.org>
 <20110508200802.GB16281@chumley.earth.sol>
 <alpine.OSX.2.00.1105090909080.194@ibook.intranet>
 <BANLkTim6_gHr_re0bv0eTWCQ7=5AG1HzwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-in-12.arcor-online.net ([151.189.21.52]:34028 "EHLO
	mail-in-12.arcor-online.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754519Ab1EIUYi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 9 May 2011 16:24:38 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTim6_gHr_re0bv0eTWCQ7=5AG1HzwQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@telegraphics.com.au>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Mon, May 09, 2011 at 09:16:16AM +0200, Geert Uytterhoeven wrote:
> On Mon, May 9, 2011 at 01:14, Finn Thain <fthain@telegraphics.com.au>=
 wrote:
> > On Sun, 8 May 2011, Christian T. Steigies wrote:
> >> PS 2.6.28 did not boot: kernel too old. When was TLS introduced? I=
'll try to
> >> apply the patch you mentioned in your other message.
> >
> > I sometimes test network cards with busybox. It can be built withou=
t
> > linking in glibc and doesn't need TLS.
> >
> >
> >> [ =A0130.870000] eth0: trigger_send() called with the transmitter =
busy.
> >> [ =A0132.240000] ------------[ cut here ]------------
> >> [ =A0132.240000] WARNING: at net/sched/sch_generic.c:256 dev_watch=
dog+0x1ac/0x1cc()
> >> [ =A0132.250000] NETDEV WATCHDOG: eth0 (): transmit queue 0 timed =
out
> >
> > Looks a lot like this problem:
> >
> > http://patchwork.ozlabs.org/patch/27774/
>=20
> Yeah, that's a very likely culprit. Thx!

I applied the following patch and it works! apt-get update that is, the=
re is
no sshd on this freshly installed system yet...

I also changed this line to have 4 underscores at the beginning:

	{ 0xec940559, "____alloc_ei_netdev" },

it does not show up in git diff, so I am not sure if this is a leftover=
 from
a previous checkout, or if it is also needed. And if it is needed, if i=
t
should be two underscores or four or none, and if so why or why not...
Looking at the other drivers, there does not seem to be a lot of consis=
tency?

thanks Finn!
Christian

diff --git a/drivers/net/zorro8390.c b/drivers/net/zorro8390.c
index b78a38d9..8c7c522 100644
--- a/drivers/net/zorro8390.c
+++ b/drivers/net/zorro8390.c
@@ -126,7 +126,7 @@ static int __devinit zorro8390_init_one(struct zorr=
o_dev *z,
=20
     board =3D z->resource.start;
     ioaddr =3D board+cards[i].offset;
-    dev =3D alloc_ei_netdev();
+    dev =3D ____alloc_ei_netdev(0);
     if (!dev)
 	return -ENOMEM;
     if (!request_mem_region(ioaddr, NE_IO_EXTENT*2, DRV_NAME)) {
@@ -146,15 +146,15 @@ static int __devinit zorro8390_init_one(struct zo=
rro_dev *z,
 static const struct net_device_ops zorro8390_netdev_ops =3D {
 	.ndo_open		=3D zorro8390_open,
 	.ndo_stop		=3D zorro8390_close,
-	.ndo_start_xmit		=3D ei_start_xmit,
-	.ndo_tx_timeout		=3D ei_tx_timeout,
-	.ndo_get_stats		=3D ei_get_stats,
-	.ndo_set_multicast_list =3D ei_set_multicast_list,
+	.ndo_start_xmit		=3D __ei_start_xmit,
+	.ndo_tx_timeout		=3D __ei_tx_timeout,
+	.ndo_get_stats		=3D __ei_get_stats,
+	.ndo_set_multicast_list =3D __ei_set_multicast_list,
 	.ndo_validate_addr	=3D eth_validate_addr,
 	.ndo_set_mac_address 	=3D eth_mac_addr,
 	.ndo_change_mtu		=3D eth_change_mtu,
 #ifdef CONFIG_NET_POLL_CONTROLLER
-	.ndo_poll_controller	=3D ei_poll,
+	.ndo_poll_controller	=3D __ei_poll,
 #endif
 };
=20
