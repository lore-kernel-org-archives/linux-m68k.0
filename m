From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k: Fix atarimouse init
Date: Sat, 03 Jan 2009 08:23:20 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0901030758590.17350@zirkon.biophys.uni-duesseldorf.de>
References: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
 <Pine.LNX.4.64.0812170915400.29433@anakin>
 <Pine.LNX.4.64.0812211205270.3499@anakin>
 <alpine.DEB.1.00.0812282252230.10733@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0812291151200.20983@anakin>
 <alpine.DEB.1.00.0901020046280.25512@zirkon.biophys.uni-duesseldorf.de>
 <jed4f6gi2l.fsf@sykes.suse.de>
 <alpine.DEB.1.00.0901022257150.738@zirkon.biophys.uni-duesseldorf.de>
 <1230962033.6343.15.camel@joy>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-apollo.uni-duesseldorf.de ([134.99.128.36]:35660 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750759AbZACHXY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 3 Jan 2009 02:23:24 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KCV00400WIXT400@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Sat, 03 Jan 2009 08:23:21 +0100 (MET)
In-reply-to: <1230962033.6343.15.camel@joy>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: Andreas Schwab <schwab@suse.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi,

> > > ARAnyM's emulation of the IKBD does not support changing the y origin.
> > 
> > Bummer - any reason the origin was set to the top initially?
> 
> Isn't it sane to have the origin at top so the mouse increments are
> logically in sync with video coordinates?

That may have been the reason, perhaps before the mouse driver was written to 
the busmouse interface (not sure I have kernel sources dating that far back).
 
> > I guess we could reverse that (at least for ARAnyM).
> 
> I am against changing generic Atari related things just for ARAnyM. I
> said earlier (about 12 hours before you posted this mail) that I would
> fix anything in ARAnyM to make it more linux-m68k compatible.

Yep, I do recall that - my intention was to reverse the logic in order to give 
Geert (and myself) something to test while you add the necessary bits to ARAnyM. 
Such a hack would definitely be removed as soon as possible.
 
> I am just not sure what's wrong here - does the linux-m68k indeed
> switches the point of origin to bottom of screen and relies on that? Why
> if you say that the old busmouse code used the "normal" top-screen
> origin?

The original (and current) mouse driver explicitly set the top screen origin - 
either at keyboard init (old) or at mouse device open (now). I do assume that is 
not the default, power-up state of the hardware.
 
> > How would I go about figuring out the kernel runs on ARAnyM, Petr?
> 
> Using the NatFeats, of course. But see above - I am against such hacks
> and I'll add the code for reversing Y-axis real quick if its really
> necessary.

Point taken - I'll not complexify things further by attempting to detect ARAnyM 
at runtime, then. I have a patch that should work on both current ARAnyM and 
real hardware for Geert to test, and the hack is easily removed later on.

> > Thanks, Andreas. Seems I'll have to revive the old joystick code, then. 
> 
> Michael, I don't think there is anybody out there using such hardware
> joystick-mouse modification. But there is number of people using the
> Eiffel PS/2 adapter so if supporting anything then I'd go for that.

How does that one work? 

The only reason for reviving the joystick hack would have been to have a 
'standard' way of passing a third mouse button. If the PS/2 adapter is that 
standard way now, that's fine. I'll just need to know what interrupt/device this 
is hooked up to, and what the data format is. 
 
> BTW, is it just my feeling that you kind of didn't take my mail
> (Thursday 11:20) into account when replying to Andreas?

I was mainly looking for a quick way to accomodate current ARAnyM users like 
Geert and me while a fix is being worked on. I did read your mail, and take 
notice of your offer to incorporate a fix for ARAnyM, even though I did not 
refer to your mail in my reply.

I'd still have to get a working X server before testing any of this, so it 
probably won't matter either way. 

	Michael

