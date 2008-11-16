From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH][v5] Add SWIM floppy support for m68k Macs.
Date: Sun, 16 Nov 2008 19:12:31 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811161910340.17182@anakin>
References: <03320726-C601-4EE0-8337-1821119EF3FF@lvivier.info>
 <Pine.LNX.4.64.0811161140280.5978@anakin> <E74B8270-AED1-40B5-AA6A-948F1443328A@lvivier.info>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from harold.telenet-ops.be ([195.130.133.65]:36521 "EHLO
	harold.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752851AbYKPSMe (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 16 Nov 2008 13:12:34 -0500
In-Reply-To: <E74B8270-AED1-40B5-AA6A-948F1443328A@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <laurent@lvivier.info>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, 16 Nov 2008, Laurent Vivier wrote:
> Le 16 nov. 08 =E0 11:52, Geert Uytterhoeven a =E9crit :
> > On Sat, 15 Nov 2008, Laurent Vivier wrote:
> > > +static inline void set_swim_mode(struct swim *base, int enable)
> > 					       ^ __iomem
> > > +{
> > > +	struct iwm *iwm_base;
> >                 ^ __iomem
> >=20
> > (cfr. sparse warnings, when building with `make C=3D1')
>=20
> I don't have the command sparse on my system (debian stable).

It's available in lenny and sid. I used to compile my own.

> > > +	unsigned long flags;
> > > +
> > > +	if (!enable) {
> > > +		swim_write(base, mode0, 0xf8);
> > > +		return;
> > > +	}
> > > +
> > > +	iwm_base =3D (struct iwm *)base;
> > > +	local_save_flags(flags);
> > > +	local_irq_disable();
> >=20
> > local_save_flags(flags) + local_irq_disable() =3D local_irq_save(fl=
ags)
> >=20
> > However, to make the driver future-save (we don't have SMP nor pree=
mpt
> > support
> > yet), it's better to add a spinlock and use spin_lock_irqsave().
> >=20
> > > +	local_irq_restore(flags);
> >=20
> > ... and spin_unlock_irqrestore().
>=20
> Is it really needed as this driver will only work on mac m68k and all=
 are
> uniprocessor ?

If we ever want to support CONFIG_PREEMPT, we also need it.
But as we currently don't support that, you can ignore me ;-)

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
