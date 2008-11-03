From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Mon, 3 Nov 2008 11:14:14 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0811031102090.10345@loopy.telegraphics.com.au>
References: <12255325912043-git-send-email-Laurent@lvivier.info>
 <Pine.LNX.4.64.0811020947320.5281@anakin> <AC634DD2-CE12-4975-BB8E-B564C7DFDC06@lvivier.info>
 <20081102212852.GA8162@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="768252030-493049239-1225671254=:10345"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:38596 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753883AbYKCAOQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 2 Nov 2008 19:14:16 -0500
In-Reply-To: <20081102212852.GA8162@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Laurent Vivier <Laurent@lvivier.info>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--768252030-493049239-1225671254=:10345
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE



On Sun, 2 Nov 2008, Brad Boyer wrote:

> On Sun, Nov 02, 2008 at 12:21:23PM +0100, Laurent Vivier wrote:
> > Le 2 nov. 08 =E0 09:54, Geert Uytterhoeven a =E9crit :
> > > The preferred way to do this these days is to create a platform=20
> > > device with a struct resource that points to the SWIMBase.
> >=20
> > Is this what Finn explains also in his answer ? If so, I agree.
>=20
> Not exactly. What Finn suggested is to match the way we handle many of=20
> the other on-board things like ADB and SCSI. What Geert suggests is a=20
> much more recent way to do things that we generally haven't done for=20
> Mac-only drivers. I think Finn used it for the new Sonic ethernet driver=
=20
> because we share it with other systems. The code in macsonic.c also has=
=20
> the extra complexity from having both NuBus and on-board hardware to=20
> support, and NuBus also hasn't been updated to the new driver model.
>=20
> Finn's suggestion of using the macintosh_config entry and data table is=
=20
> the easiest way to get it working, but Geert's method would move to the=
=20
> real device/driver model that most other systems are using now.

I agree with Geert. Ignore my comment about device_initcall -- I was=20
looking at via-cuda.c but that is not a good example.=20
drivers/scsi/mac_esp.c is a better example.=20

esp_mac_probe checks the macintosh_config entry. That and esp_mac_remove=20
are the platform device entry points Geert referred to. The module entry=20
points are mac_esp_init and mac_esp_exit. I think you could use either of=
=20
the platform device probe routine or the module init routine to set the=20
base address.

Finn

> Ideally this would be a macio driver instead of a platform driver in my=
=20
> opinion, but I haven't finished getting the macio bus code working on=20
> m68k.
>=20
> =09Brad Boyer
> =09flar@allandria.com
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
--768252030-493049239-1225671254=:10345--
