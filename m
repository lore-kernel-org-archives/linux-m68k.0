From: Brad Boyer <flar@allandria.com>
Subject: Re: [PATCH 2/2][v3] Add SWIM floppy support for m68k Macs.
Date: Sun, 9 Nov 2008 17:04:10 -0800
Message-ID: <20081110010409.GA930@cynthia.pants.nu>
References: <12260012691527-git-send-email-laurent@lvivier.info> <Pine.LNX.4.64.0811091716590.19341@anakin> <914807AF-2B1B-4E28-BB75-8E1FAA5463C5@lvivier.info> <Pine.LNX.4.64.0811092041300.19341@anakin> <53A1BB3E-6764-4127-92A0-AA0ADFE0E632@lvivier.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:40919 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1755310AbYKJBFX (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 9 Nov 2008 20:05:23 -0500
Content-Disposition: inline
In-Reply-To: <53A1BB3E-6764-4127-92A0-AA0ADFE0E632@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <laurent@lvivier.info>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Nov 09, 2008 at 10:06:08PM +0100, Laurent Vivier wrote:
> Le 9 nov. 08 =E0 20:42, Geert Uytterhoeven a =E9crit :
> > It prevents the driver from working if you have multiple SWIM devic=
es.
>=20
> If we have multiple SWIM devices the driver is only able to know the =
=20
> base address of the onboard controller.
> So, it manages only one.

There is never a second SWIM chip. However, there is one system
(the unsupported Mac SE) that can have 3 floppy drives attached
to a single SWIM chip. It's unlikely to ever be supported in
Linux due to using a 68000 CPU rather than a 68020 or 68030.

Geert's suggestion would be the ideal thing in my opinion even
though we know there are never multiple chips, but I think it's
a low priority.

> > Didn't I read something about SWIM chips on expansion cards?
>=20
> I think you speak about the expansion card for the MacII allowing to =
=20
> replace the WIM controller by a SWIM one, but what I understood is th=
e =20
> SWIM replaces the WIM at the same base address. Moreover the SWIM has=
 =20
> a WIM compatibility mode: it's why I've added the set_swim_mode() and=
 =20
> get_swim_mode() to detect in which case we are. But there is only one=
 =20
> controller at a time.

I think the discussion in question was the one about adding a nubus ESP
driver for SCSI expansion cards. That was pretty recent.

You are right that there is just a single socket for the floppy control=
ler
on the Mac II and the upgrade replaces the old chip with a new one.

	Brad Boyer
	flar@allandria.com

--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
