From: Brad Boyer <flar@allandria.com>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Sun, 2 Nov 2008 13:28:52 -0800
Message-ID: <20081102212852.GA8162@cynthia.pants.nu>
References: <12255325912043-git-send-email-Laurent@lvivier.info> <Pine.LNX.4.64.0811020947320.5281@anakin> <AC634DD2-CE12-4975-BB8E-B564C7DFDC06@lvivier.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:49825 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1754208AbYKBV3Z (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 2 Nov 2008 16:29:25 -0500
Content-Disposition: inline
In-Reply-To: <AC634DD2-CE12-4975-BB8E-B564C7DFDC06@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <Laurent@lvivier.info>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

On Sun, Nov 02, 2008 at 12:21:23PM +0100, Laurent Vivier wrote:
> Le 2 nov. 08 =E0 09:54, Geert Uytterhoeven a =E9crit :
> > The preferred way to do this these days is to create a platform =20
> > device with a
> > struct resource that points to the SWIMBase.
>=20
> Is this what Finn explains also in his answer ?
> If so, I agree.

Not exactly. What Finn suggested is to match the way we handle
many of the other on-board things like ADB and SCSI. What Geert
suggests is a much more recent way to do things that we generally
haven't done for Mac-only drivers. I think Finn used it for the
new Sonic ethernet driver because we share it with other systems.
The code in macsonic.c also has the extra complexity from having
both NuBus and on-board hardware to support, and NuBus also hasn't
been updated to the new driver model.

=46inn's suggestion of using the macintosh_config entry and data
table is the easiest way to get it working, but Geert's method
would move to the real device/driver model that most other
systems are using now. Ideally this would be a macio driver
instead of a platform driver in my opinion, but I haven't finished
getting the macio bus code working on m68k.

	Brad Boyer
	flar@allandria.com

--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
