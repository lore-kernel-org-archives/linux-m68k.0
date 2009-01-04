From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k: Add Eiffel PS/2 support for Atari mouse driver
Date: Sun, 04 Jan 2009 22:50:36 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0901042110230.19921@zirkon.biophys.uni-duesseldorf.de>
References: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
 <Pine.LNX.4.64.0812170915400.29433@anakin>
 <Pine.LNX.4.64.0812211205270.3499@anakin>
 <alpine.DEB.1.00.0812282252230.10733@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0812291151200.20983@anakin>
 <alpine.DEB.1.00.0901020046280.25512@zirkon.biophys.uni-duesseldorf.de>
 <jed4f6gi2l.fsf@sykes.suse.de>
 <alpine.DEB.1.00.0901022257150.738@zirkon.biophys.uni-duesseldorf.de>
 <1230962033.6343.15.camel@joy>
 <alpine.DEB.1.00.0901030758590.17350@zirkon.biophys.uni-duesseldorf.de>
 <1230970564.6343.34.camel@joy>
 <alpine.DEB.1.00.0901040805190.28468@zirkon.biophys.uni-duesseldorf.de>
 <1231054914.6330.15.camel@joy>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-apollo.uni-duesseldorf.de ([134.99.128.36]:56666 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750909AbZADVuk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 4 Jan 2009 16:50:40 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KCY00I00VCDW900@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Sun, 04 Jan 2009 22:50:37 +0100 (MET)
In-reply-to: <1231054914.6330.15.camel@joy>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Petr,

> > I've written the first part of the Eiffel PS/2 mouse support, adding middle 
> > mouse button support based on the scancode you specified. Implementing the 
> > middle mouse button as a toggle is a bit awkward :-(
> 
> Note that I have yet to find out whether _releasing_ the middle mouse
> button on real Eiffel hardware does send the 0x37|0x80 scancode or not.
> This is unclear from the documentation so I am trying to get a
> definitive answer from someone who owns the actual hardware.

Well, if it sends a different scancode that's easy enough to accomodate.
 
> > I've not tested the code beyond making sure the two regular buttons still work - 
> > I do not quite see how to activate Eiffel mouse support in ARAnyM.
> 
> You must be kidding :-) Get to the SETUP somehow ("aranym -G -c
> your_config_file", for example, or use the hotkey) and click the

Actually I'm not. The 'pause' hotkey for setup has never worked (neither has any 
of the various hotkeys for mouse release, BTW). That wasn't a big deal for me so 
far.

> [ Keyboard + Mouse ] button. The rest (click radio button, click OK,
> click Save) should be obvious. Or simply edit the aranym config file you
> use for booting your linux setup, find the [IKBD] section and set the
> "WheelEiffel = Yes".

As you will have guessed, I did edit the config file directly for all my 
customized settings so far. I had done a search for the proper mouse release 
keycode but to no avail (both in /usr/share/doc/aranym and on the wiki). 
Must have been the wrong keyword, or on the old (0.9.4) version or something. 

Anyway, still no luck with the ungrab hotkey. And setting WheelEiffel = Yes did 
not yield an additional mouse event so far. I'll keep trying :-)

	Michael
