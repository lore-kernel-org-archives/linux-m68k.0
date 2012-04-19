From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Atari ROM port ISA
Date: Thu, 19 Apr 2012 15:00:51 +0000 (UTC)
Message-ID: <loom.20120419T165359-796@post.gmane.org>
References: <alpine.DEB.2.00.1204151113430.31626@ayla.of.borg> <4F8BCF49.4060109@gmail.com> <20120417050500.GA14387@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:49741 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753907Ab2DSPBJ (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 19 Apr 2012 11:01:09 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1SKsr5-0003d8-EU
	for linux-m68k@vger.kernel.org; Thu, 19 Apr 2012 17:01:07 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Thu, 19 Apr 2012 17:01:07 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Thu, 19 Apr 2012 17:01:07 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Brad Boyer <flar <at> allandria.com> writes:

> On Mon, Apr 16, 2012 at 07:50:33PM +1200, Michael Schmitz wrote:

> > >So ISA memory space accesses (isa_readX()) are implemented the sam=
e as ISA=20
I/O
> > >space accesses? That can't work. Or are they not supported?
> >=20
> > There's no distinct 'IO' or 'memory' space on the ROM port adapter,
> > it's all memory mapped on ROM port addresses. How does access to IS=
A
> > card mem regions work on ix86? Different address range, or differen=
t
> > instructions?
>=20
> The real x86 instruction set has separate instructions to access any
> ports in the IO space (in and out). The instruction also has an acces=
s

This maps to different lines being driven on the ISA side, see:
https://upload.wikimedia.org/wikipedia/commons/3/3d/XT_Bus_pins.png

There are I/O read/write and MEM read/write lines (B11=E2=80=A5B14).
So you need these that are actually wired up in the adapter.

Bascially, =E2=80=9CPC=E2=80=9D I/O ports have a separate 16-bit=C2=B9 =
address space
from the main (originally) 20-bit address space of the main
memory (RAM, ROM) which are addressed with different instructions
and may behave different when accessed as 8-bit vs. 16-bit slots.

=E2=91=A0 IIRC, only 12 bit were originally wired or used before the er=
a
  of the various Local Buses, although according to the 8086 docs
  that seems to not have been a CPU issue but mainboard design.

bye,
//mirabilos
