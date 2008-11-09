From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Sun, 9 Nov 2008 17:16:52 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811091711150.19341@anakin>
References: <12255325912043-git-send-email-Laurent@lvivier.info>
 <Pine.LNX.4.64.0811020947320.5281@anakin> <AC634DD2-CE12-4975-BB8E-B564C7DFDC06@lvivier.info>
 <20081102212852.GA8162@cynthia.pants.nu> <Pine.LNX.4.64.0811031102090.10345@loopy.telegraphics.com.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from edna.telenet-ops.be ([195.130.132.58]:41462 "EHLO
	edna.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755258AbYKIQQ5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 9 Nov 2008 11:16:57 -0500
In-Reply-To: <Pine.LNX.4.64.0811031102090.10345@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Brad Boyer <flar@allandria.com>, Laurent Vivier <Laurent@lvivier.info>, linux-m68k@vger.kernel.org

On Mon, 3 Nov 2008, Finn Thain wrote:
> On Sun, 2 Nov 2008, Brad Boyer wrote:
> > On Sun, Nov 02, 2008 at 12:21:23PM +0100, Laurent Vivier wrote:
> > > Le 2 nov. 08 =E0 09:54, Geert Uytterhoeven a =E9crit :
> > > > The preferred way to do this these days is to create a platform=
=20
> > > > device with a struct resource that points to the SWIMBase.
> > >=20
> > > Is this what Finn explains also in his answer ? If so, I agree.
> >=20
> > Not exactly. What Finn suggested is to match the way we handle many=
 of=20
> > the other on-board things like ADB and SCSI. What Geert suggests is=
 a=20
> > much more recent way to do things that we generally haven't done fo=
r=20
> > Mac-only drivers. I think Finn used it for the new Sonic ethernet d=
river=20
> > because we share it with other systems. The code in macsonic.c also=
 has=20
> > the extra complexity from having both NuBus and on-board hardware t=
o=20
> > support, and NuBus also hasn't been updated to the new driver model=
=2E
> >=20
> > Finn's suggestion of using the macintosh_config entry and data tabl=
e is=20
> > the easiest way to get it working, but Geert's method would move to=
 the=20
> > real device/driver model that most other systems are using now.
>=20
> I agree with Geert. Ignore my comment about device_initcall -- I was=20
> looking at via-cuda.c but that is not a good example.=20
> drivers/scsi/mac_esp.c is a better example.=20
>=20
> esp_mac_probe checks the macintosh_config entry. That and esp_mac_rem=
ove=20
> are the platform device entry points Geert referred to. The module en=
try=20
> points are mac_esp_init and mac_esp_exit. I think you could use eithe=
r of=20
> the platform device probe routine or the module init routine to set t=
he=20
> base address.

Ideally, the _probe() routine should not look at the bits in macintosh_=
config,
but only at the platform device and its resources.

The creation of the platform device should be moved to arch/m68k/mac/co=
nfig,
which would create the platform device, and only if the bits in
macintosh_config indicate that the hardware is present. The actual valu=
e of
swim_base can be stored in a struct resource linked to the platform dev=
ice.

So far the only platform device for m68k (not in mainline) is Michael's
EtherNAT driver, cfr. arch/m68k/atari/config.c. Note that that one regi=
sters
the platform device unconditionally, as there's no magic predictor for =
its
presence in the firmware or machine tables.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
