From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2][v3] Add SWIM floppy support for m68k Macs.
Date: Sun, 9 Nov 2008 20:42:33 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811092041300.19341@anakin>
References: <12260012691527-git-send-email-laurent@lvivier.info>
 <Pine.LNX.4.64.0811091716590.19341@anakin> <914807AF-2B1B-4E28-BB75-8E1FAA5463C5@lvivier.info>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from winston.telenet-ops.be ([195.130.137.75]:52290 "EHLO
	winston.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750730AbYKITmh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 9 Nov 2008 14:42:37 -0500
In-Reply-To: <914807AF-2B1B-4E28-BB75-8E1FAA5463C5@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <laurent@lvivier.info>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, 9 Nov 2008, Laurent Vivier wrote:
> Le 9 nov. 08 =E0 17:19, Geert Uytterhoeven a =E9crit :
> > On Thu, 6 Nov 2008, Laurent Vivier wrote:
> > > --- /dev/null
> > > +++ b/drivers/block/swim.c
> >=20
> > > +static struct platform_device *swim_device;
> >=20
> > One global instance?
>=20
> Yes, why not ? Could you explain ?

It prevents the driver from working if you have multiple SWIM devices.

Didn't I read something about SWIM chips on expansion cards?

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
