From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k: Fix atarimouse init
Date: Fri, 02 Jan 2009 23:10:18 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0901022257150.738@zirkon.biophys.uni-duesseldorf.de>
References: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
 <Pine.LNX.4.64.0812170915400.29433@anakin>
 <Pine.LNX.4.64.0812211205270.3499@anakin>
 <alpine.DEB.1.00.0812282252230.10733@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0812291151200.20983@anakin>
 <alpine.DEB.1.00.0901020046280.25512@zirkon.biophys.uni-duesseldorf.de>
 <jed4f6gi2l.fsf@sykes.suse.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-apollo.uni-duesseldorf.de ([134.99.128.36]:39370 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751573AbZABWKX (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 2 Jan 2009 17:10:23 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KCV001006X77U00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Fri, 02 Jan 2009 23:10:19 +0100 (MET)
In-reply-to: <jed4f6gi2l.fsf@sykes.suse.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@suse.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Andreas,

> > Weird - the inversion of the y direction increment is taken from the old 
> > busmouse driver code where it used to work OK. The point of reference is set to 
> > be at the top of the 'screen' so moving the mouse down ought to generate 
> > positive increments.
> 
> ARAnyM's emulation of the IKBD does not support changing the y origin.

Bummer - any reason the origin was set to the top initially? I guess we could 
reverse that (at least for ARAnyM). Would make the rest of the code more sane as 
well. How would I go about figuring out the kernel runs on ARAnyM, Petr?
 
> >>   - the left and right mouse button are interchanged
> >
> > The busmouse driver had no annotation as to the semantics of the buttons so O 
> > guessed bit 0 was for the left button. Guessed wrong, it seems.
> 
> Note that the mouse button bits are also inverted, ie. 0 means down.

You're right. I'd been wondering about that part in the old mouse driver...

> > knows what the ikbd format for the third button is (on real hardware) it's easy 
> > to add that in.
> 
> The IKBD does not support more than two buttons.  For a three button
> mouse the middle button was apparently wired to the joystick port.
> 
> See also <http://dev-docs.atariforge.org/files/ikbd_Prot_2-26-1985.pdf>.

Thanks, Andreas. Seems I'll have to revive the old joystick code, then. 

Cheers,

	Michael

