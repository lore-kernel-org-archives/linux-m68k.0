From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k: Fix atarimouse init
Date: Fri, 02 Jan 2009 01:12:55 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0901020046280.25512@zirkon.biophys.uni-duesseldorf.de>
References: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
 <Pine.LNX.4.64.0812170915400.29433@anakin>
 <Pine.LNX.4.64.0812211205270.3499@anakin>
 <alpine.DEB.1.00.0812282252230.10733@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0812291151200.20983@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-venus.uni-duesseldorf.de ([134.99.128.32]:52558 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751536AbZABANA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 1 Jan 2009 19:13:00 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KCT00300HXK4V00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Fri, 02 Jan 2009 01:12:56 +0100 (MET)
In-reply-to: <Pine.LNX.4.64.0812291151200.20983@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

> > I still get no mouse events in either /dev/input/mice or .../mouse0, though. I 
> > suspect the mouse open hook never gets called. Same bug might affect amimouse 
> > (though the open function does do the full hardware setup there).
> 
> Thanks, we're making progress :-)

Sort of ... 
 
> I get events from /dev/input/mouse0 and /dev/input/mice (atari_defconfig).
> 
> The kernel says (ARAnyM, windowed mode):
> | input: Atari mouse as /devices/virtual/input/input1
> | Reseting weird mouse packet: 942, 379, 0
> | Reseting weird mouse packet: 943, 379, 0
> | Reseting weird mouse packet: 945, 378, 0
> | Reseting weird mouse packet: 948, 378, 0
> | Reseting weird mouse packet: 956, 376, 0

That's the broken packets - the real ones shoule be fine (small x and y 
increments in byte 1 and 2, 0x8 in byte 0 unless button pressed).

> 
> When running X under ARAnyM (depth 16), some shortcomings show up:
>   - up and down are interchanged (works fine when rolling the mouse over the
>     bottom surface of the table --- old arabic map style ;-)

Weird - the inversion of the y direction increment is taken from the old 
busmouse driver code where it used to work OK. The point of reference is set to 
be at the top of the 'screen' so moving the mouse down ought to generate 
positive increments. I'll test that. If the point of reference changed between 
busmouse and generic input mouse, just drop the sign inversion on buf[2].

>   - the left and right mouse button are interchanged

The busmouse driver had no annotation as to the semantics of the buttons so O 
guessed bit 0 was for the left button. Guessed wrong, it seems.

>   - the middle mouse button is dead

As is expexcted - the original code was for a two-button mouse only. If Petr 
knows what the ikbd format for the third button is (on real hardware) it's easy 
to add that in. WAG: bit three of the first byte, so make 

buttons = (buf[0] & 1) | ((buf[0] & 2) << 1);

into

buttons = ((buf[0] & 1) << 2) | ((buf[0] & 2) >> 1) | ((buf[0] & 4) >> 1) ;

and give it a whirl!

> 
> Please put a `---' here, so `git am' will strip the signature and the diffstat.

OK, noted.
 
> > Signed-off-by: Michael Schmitz <schmitz@debian.org>
> 
> Please put the SoB just below the changelog, else `git am' will strip it off.

OK; I'll stick that into my commit message and try to get that into the diff. 

Cheers,

	Michael
 
