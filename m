From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [GIT PULL] Core block IO bits for 2.6.39
Date: Sun, 27 Mar 2011 14:21:35 +0100
Message-ID: <20110327142135.376142dd@lxorguk.ukuu.org.uk>
References: <4D8B4A89.80608@fusionio.com>
	<AANLkTi=zJbUpcT+vbLARyxhA34F1se8pYq9No799Zqzh@mail.gmail.com>
	<4D8D87B0.3080107@fusionio.com>
	<AANLkTi=jcm8pLQCTwYPK_Ey1SbMYSqQhYD4fJmCNz7sS@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-14
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:49523 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753324Ab1C0NVw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 27 Mar 2011 09:21:52 -0400
In-Reply-To: <AANLkTi=jcm8pLQCTwYPK_Ey1SbMYSqQhYD4fJmCNz7sS@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jens Axboe <jaxboe@fusionio.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sat, 26 Mar 2011 09:48:37 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Fri, Mar 25, 2011 at 11:29 PM, Jens Axboe <jaxboe@fusionio.com> wr=
ote:
> > +
> > + =A0 =A0 =A0 /* Use 3ms as that was the old plug delay */
> > + =A0 =A0 =A0 blk_delay_queue(q, msecs_to_jiffies(3));
>=20
> That's bogus. blk_delay_queue() already takes msecs, not jiffies.
>=20
> Also, do we really need to delay every unplug like this? It seems sad=
=2E
> A 3ms delay is a long time these days - admittedly most people
> hopefully use ATA these days if they have an SSD or something, but
> still..

The ATA code contains several other bogus delays btw. So out of the box
unless you are using AHCI you are continually running small pointless
delays every command issued.
